using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.userfiles
{
    public partial class EmployerRegistration : SortaBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitForAccountNum_Click(object sender, EventArgs e)
        {
            BizInfoDetails details = BLL.Employer.GetBizInfoDetails(accountNumber.Text.Trim());
            if (details != null)
            {
                if (!string.IsNullOrEmpty(BLL.User.GetWebUserLoginname(accountNumber.Text.Trim(), UserRoles.Employer)))
                {
                    message.Text = Common.Utilities.FormatError("The account is already registerd. <a href='/Login.aspx'>Click here</a> to log in.");
                    return;
                }
                Session["details"] = details;
                contactName.Text = details.MailingContact;
                companyName.Text = details.CompanyName;
                view1.Visible = false;
                view2.Visible = true;
            }
            else
            {
                message.Text = Common.Utilities.FormatError("The Account number entered does not match our files. ");
            }
        }

        protected void submitForEmail_Click(object sender, EventArgs e)
        {
            Session["code"] = generateCode();
            BizInfoDetails details = (BizInfoDetails)Session["details"];
            if (details != null)
            {
                string body = string.Format("<table ><tr><td>Contact: {0}</td></tr><tr><td>Employer: {1}</td></tr><tr><td>Employer Id:{2}</td></tr><tr><td>Validation code: {3}</td></tr><tr><td>This email has been sent in order to validate your account. If you did not start registration or feel as if you may have received this email by accident then please contact PIBT's customer service at (800) 449-4898 ext. 259 or email us at <a href=\"mailto:OnlineHelpDesk@piasc.org\">OnlineHelpDesk@piasc.org</a>.</td></tr><tr><td>{4}</td></tr></table>", details.MailingContact, details.CompanyName, details.EmployerId, Session["code"].ToString(), BasePage.disclaimer);
                Utilities.SendMail(ApplicationConfiguration.SystemMailSender, details.PhsicalEmail , details.MailingEmail, "PIBT web account validation", body);
                Response.Redirect("/ErRegistrationContinued.aspx");
            }
            oops();
        }
    }
}