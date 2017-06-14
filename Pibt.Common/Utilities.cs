using System;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web;
using System.Text;
using Pibt.Model;
using System.Security.Cryptography;

/// <summary>
/// Class contains miscellaneous functionality
/// </summary>
namespace Pibt.Common
{
    public static class Utilities
    {
        private static string ourName;
        private static string ourURL;
        private static string ourStyle;

        public static string Us()
        {
            if (ourName == null)
            {
                ourName = HttpContext.Current.Request.Url.ToString().Contains("private") ? "Private Choice" : "PIBT";
            }
            return ourName;
        }

        public static string OurURL()
        {
            if (ourURL == null)
            {
                ourURL = HttpContext.Current.Request.Url.ToString().Contains("private") 
                    ? "privatechoice.com" 
                    : "pibt.org";
            }
            return ourURL;
        }

        public static string LogoPicker() {
            if (ourStyle==null) {
                ourStyle = HttpContext.Current.Request.Url.ToString().Contains("private") ? "pcLogo" : "logo";
            }
            return ourStyle;
        }

        #region Data Parser
        public static int ToInt(object o)
        {
            int returnValue = -1;
            if (o == null || o == DBNull.Value)
                return -1;
            int.TryParse(o.ToString(), out returnValue);
            return returnValue;
        }

        public static string ToString(object o)
        {
            if (o == null || o == DBNull.Value)
                return string.Empty;
            else
                return o.ToString();
        }

        public static DateTime toDateTime(object o)
        {
            return (o == null || o == DBNull.Value) ? DateTime.MinValue : DateTime.Parse(o.ToString());
        }

        public static bool ToBool(object o)
        {
            if (o == null || o == DBNull.Value)
            {
                return false;
            }
            if (o.ToString() == "1")
            {
                return true;
            }
            if (o.ToString().ToUpper() == "TRUE")
            {
                return true;
            }
            if (o.ToString().ToUpper() == "Y")
            {
                return true;
            }

            bool val = false;
            bool.TryParse(o.ToString(), out val);
            return val;
        }
        #endregion

        public static void SendMail(string from, string to, string subject, string body)
        {
            SendMail(from, to, "","", subject, body, null);
        }

        public static void SendMail(string from, string to, string to2, string subject, string body)
        {
            SendMail(from, to, to2,"", subject, body, null);
        }

        public static void SendMail(string from, string to, string to2, string cc, string subject, string body)
        {
            SendMail(from, to, to2, cc, subject, body, null);
        }

        // Generic method for sending emails
        public static void SendMail(string from, string to, string to2, string cc, string subject, string body, Attachment[] attachFile)
        {
            MailMessage objEmail = new MailMessage();
            objEmail.To.Add(string.IsNullOrEmpty(to)?to2:to);
            objEmail.From = new MailAddress(from);
            objEmail.Subject = subject + (ApplicationConfiguration.IsTestServer? " TEST EMAIL" : "");
            objEmail.Body = body;
            objEmail.Bcc.Add("webMaster@piasc.org");
            objEmail.IsBodyHtml = true;
            if (!string.IsNullOrEmpty(cc))
                objEmail.CC.Add(cc);

            if (attachFile != null && attachFile.Length>0)
                foreach (Attachment at in attachFile)
                    objEmail.Attachments.Add(at);

            objEmail.Priority = MailPriority.High;
            SmtpClient smtp = new SmtpClient(ApplicationConfiguration.MailServer, 587);
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential("webmaster", "pibt$5800");
            smtp.EnableSsl = false;

            try
            {
                smtp.Send(objEmail);
            }
            catch (Exception exc)
            {
                //throw exc;
               string msg = exc.Message;
            }
        }

        // Send error log mail
        public static void LogError(Exception ex)
        {
            // get the current date and time
            string dateTime = DateTime.Now.ToLongDateString() + ", at "
            + DateTime.Now.ToShortTimeString();
            // stores the error message
            string errorMessage = "Exception generated on " + dateTime;
            // obtain the page that generated the error
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            errorMessage += "\n\n Page location: " + context.Request.RawUrl;
            // build the error message
            errorMessage += "\n\n Message: " + ex.Message;
            errorMessage += "\n\n Source: " + ex.Source;
            errorMessage += "\n\n Method: " + ex.TargetSite;
            errorMessage += "\n\n Stack Trace: \n\n" + ex.StackTrace;
            // send error email in case the option is activated in Web.Config
            if (ApplicationConfiguration.EnableErrorLogEmail)
            {
                string from = "webmaster@piasc.org";
                string to = ApplicationConfiguration.ErrorLogEmail;
                string subject = ApplicationConfiguration.SiteName + " error report";
                string body = errorMessage;
                SendMail(from, to, to, "", subject, body, null);
            }

        }

        // Configures what button to be clicked when the uses presses Enter in a 
        // textbox. The text box doesn't have to be a TextBox control, but it must 
        // be derived from either HtmlControl or WebControl, and the HTML control it 
        // generates should accept an 'onkeydown' attribute. The HTML generated by 
        // the button must support the 'Click' event
        public static void TieButton(Page page, Control TextBoxToTie, Control ButtonToTie)
        {
            // Init jscript
            string jsString = "";

            // Check button type and get required jscript
            if ((ButtonToTie is LinkButton) || (ButtonToTie is ImageButton) || (ButtonToTie is Button))
            {
                jsString = "if ((event.which && event.which == 13) || (event.keyCode && event.keyCode == 13)) {"
                    + page.ClientScript.GetPostBackEventReference(ButtonToTie, "").Replace(":", "$") + ";return false;} else return true;";
            }
            else
            {
                jsString = "if ((event.which && event.which == 13) || (event.keyCode && event.keyCode == 13)) {document."
                    + "forms[0].elements['" + ButtonToTie.UniqueID.Replace(":", "_") + "'].click();return false;} else return true; ";
            }

            // Attach jscript to the onkeydown attribute - we have to cater for HtmlControl or WebControl
            if (TextBoxToTie is HtmlControl)
            {
                ((HtmlControl)TextBoxToTie).Attributes.Add("onkeydown", jsString);
            }
            else if (TextBoxToTie is WebControl)
            {
                ((WebControl)TextBoxToTie).Attributes.Add("onkeydown", jsString);
            }
        }

        #region Encryption64

        public static string Decrypt(string strToDecrypt)
        {
            return Decrypt(strToDecrypt, ApplicationConfiguration.Get("EncriptKey"));
        }

        public static string Decrypt(string strToDecrypt, string encryptionKey)
        {
            byte[] inputByteArray = Convert.FromBase64String(strToDecrypt);
            using (TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider())
            {
                using (MD5CryptoServiceProvider hashMD5 = new MD5CryptoServiceProvider())
                {
                    des.Mode = CipherMode.ECB;
                    des.Key = hashMD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(encryptionKey));
                    return ASCIIEncoding.ASCII.GetString(des.CreateDecryptor().TransformFinalBlock(inputByteArray, 0, inputByteArray.Length));
                }
            }
        }

        public static string Encrypt(string strToEncrypt)
        {
            return Encrypt(strToEncrypt, ApplicationConfiguration.Get("EncriptKey"));
        }

        public static string Encrypt(string strToEncrypt, string encryptionKey)
        {
            byte[] inputByteArray = ASCIIEncoding.ASCII.GetBytes(strToEncrypt);
            using (TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider())
            {
                using (MD5CryptoServiceProvider hashMD5 = new MD5CryptoServiceProvider())
                {
                    des.Mode = CipherMode.ECB;
                    des.Key = hashMD5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(encryptionKey));
                    return Convert.ToBase64String(des.CreateEncryptor().TransformFinalBlock(inputByteArray, 0, inputByteArray.Length));
                }
            }
        }
        #endregion

        #region Format HTML Content

        public static string FormatNote(string text)
        {
            return string.Format("<div class=\"note-list\">{0}</div>", text);
        }

        public static string FormatNoteList(string[] items)
        {
            StringBuilder list = new StringBuilder();
            list.Append("<div class=\"note-list\"><ul class=\"items\">");
            foreach (string item in items)
            {
                list.Append("<li>" + item + "</li>");
            }
            list.Append("</ul></div>");
            return list.ToString();
        }

        public static string FormatError(string text)
        {
            return string.Format("<div class=\"error-list\"><div class=\"inside\"><ul class=\"ImgError\"><li><div class=\"msg-title\">Error</div><div class=\"msg-body\">{0}</div></li></ul></div></div>", text);
        }

        public static string FormatAlertInfo(string text)
        {
            return string.Format("<div class=\"alert-list\"><div class=\"inside\"><ul class=\"ImgOK\"><li><div class=\"msg-body\">{0}</div></li></ul></div></div>", text);            
        }

        #endregion


    }
}