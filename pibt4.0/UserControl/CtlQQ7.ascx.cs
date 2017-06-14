using System;
using System.Web;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.UserControl
{
    public partial class CtlQQ7 : System.Web.UI.UserControl
    {
        public int cartId { get { return BLL.OnlineQuote.QQCartId; } }
        public BizInfoDetails pUser { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void pageSetup(BizInfoDetails employer)
        {
            pUser = employer;
            if (Session["effectiveDate"] == null)
                SortaBasePage.oops(HttpContext.Current);
            date.Text = DateTime.Now.ToShortDateString();
        }

        public bool validatePage()
        {
            DateTime effective = DateTime.Parse(Session["effectiveDate"].ToString());
            
            if (InsertSignature() && BLL.OnlineQuote.completeNewEmployer(pUser.EmployerId, cartId, effective, fullName.Text, title.Text))
            {
                BizAdditionalInfo addl = BLL.Employer.GetBizInfoDetails2(pUser.EmployerId);
                RKDetails rk = BLL.RK.GetRKDetailsById(addl.RKId);
                RKDetails tl = BLL.RK.GetRKDetailsById(rk.LeaderId);

                string body = "<style>ul {list-style-type: none;}</style><div style=\"display:block; padding:10px\">" + pUser.CompanyName + ",</div><div style=\"display:block; padding:10px\">Welcome to PIBT Insurance Services! Thank you for successfully finalizing your quote with us. At this time your account is Pending approval we look forward to personally taking care of your account. Below is a list of the assigned team that will be handling your account.</div><div  style=\"display:block; padding:10px\">Requested Coverage Effective Date: " + effective.ToShortDateString() + "</div><div  style=\"display:block; padding:10px\"><ul><li>Your assigned Relationship Keeper is: " + rk.RKName + "</li><li>Email: " + rk.EmailAddress + "</li><li>Phone:  323-728-9500 Ext. " + rk.Extension + "</li></ul></div><div  style=\"display:block; padding:10px\"><ul><li>The Team Lead for your account is: " + tl.RKName + "</li><li>Email: " + tl.EmailAddress + "</li><li>Phone:  323-728-9500 Ext. " + tl.Extension + "</li></ul></div><div  style=\"display:block; padding:10px\"><ul><li>Portal Questions Contact: Stephanie Hernandez</li><li>Email: Stepahnie@piasc.org</li><li>Phone:  323-728-9500 Ext.259</li></ul></div><div style=\"display:block; padding:10px\"><a href=\" " + (ApplicationConfiguration.IsTestServer ? "test.pibt.org" : "https://pibt.org") + "/login.aspx\" >https://www.pibt.org/login.aspx</a></div><div style=\"display:block; padding:10px\">While on the site, you're also able to:<ul style=\"list-style-type:circle;\"><li>View your plan information</li><li>Add Employees and their coverages</li><li>Update Company Information</li><li>View Detailed Invoice Information </li></ul></div><div style=\"display:block; padding:10px\">Thank you for your membership, </div><div style=\"display:block; padding:10px\"><!-- PIBT/ PC info goes here  --></div>";
                Utilities.SendMail(
                    ApplicationConfiguration.SystemMailSender,
                    pUser.MailingEmail,
                    "Account Setup Submitted For " + pUser.CompanyName,
                    body);
                BLL.Logger.WriteAuditLog(string.Format("User {0} created by email registration.", "ER"+pUser.EmployerId), EventCode.AddEmployer);
                return true;
            }
            return false;
        }

        public bool InsertSignature()
        {
            System.Drawing.Bitmap bmp = ctlSignature.SaveSignature("");
            byte[] imageData;
            using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
            {
                bmp.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                stream.Position = 0;
                imageData = new byte[stream.Length];
                stream.Read(imageData, 0, imageData.Length);
                stream.Close();
            }
            int signatureId = BLL.Employer.getSigntureId(cartId.ToString(), 2, Request["vId"].ToString());
            if (signatureId == 0)
                signatureId = BLL.Employer.newSignatureId();
            bool result = BLL.Employer.updateSignature(signatureId, imageData) && BLL.Employer.updateSignatureId(cartId.ToString(), 2, fullName.Text, title.Text, signatureId);
            return result;
        }
    }
}