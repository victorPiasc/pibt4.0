using Pibt.Common;
using System;
using System.Net.Mail;
using Telerik.Web.UI;

namespace Pibt
{
    public partial class OnlineQuoteTenPlus: SortaBasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Send_Click(object sender, EventArgs e)
        {
            string filename = string.Empty;

            //checks for a file in the RadUpload
            //uploads the file 
            //attaches file to email and sends email to specified recipient 
            try
            {
                if (ASupload.UploadedFiles.Count > 0)
                {
                    foreach (UploadedFile file in ASupload.UploadedFiles)
                    {
                        filename = System.IO.Path.GetFileName(file.FileName);
                        Attachment att = new Attachment(file.InputStream, filename);
                        string subject = contactName.Text + " has requested rates for more than 10 employees";
                        string body = "Hello, <br/> I, " + contactName.Text + ", am requesting rates for more than 10 employees.  You can contact me at " + contactEmail.Text;
                        //Utilities.SendMail(ApplicationConfiguration.SystemMailSender, "victor@piasc.org", "victor@piasc.org" , subject, body, att);                        
                        //files cannot be deleted here because the server still has a hold of them                          
                    }
                    lblCreationMessage.Text = Common.Utilities.FormatAlertInfo("Success");
                    lblCreationMessage.Visible = true;
                }
                else
                {
                    lblCreationMessage.Text = Common.Utilities.FormatError("File not Uploaded. Please select a file.");
                    lblCreationMessage.Visible = true;
                }
            }
            catch (Exception exc)
            {
                lblCreationMessage.Text = Common.Utilities.FormatError(string.Format("Failed to finish process: {0}", exc.ToString()));
                lblCreationMessage.Visible = true;
            }
        }       
    }
}