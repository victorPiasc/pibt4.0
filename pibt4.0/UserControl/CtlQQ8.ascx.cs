using Pibt.Common;
using Pibt.Model;
using System;
using System.Web;

namespace Pibt.UserControl
{
    public partial class CtlQQ8 : System.Web.UI.UserControl
    {
        public BizInfoDetails pUser { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void pageSetup( BizInfoDetails employer)
        {
            pUser = employer;
        }

        public void validatePage()
        {
            System.Web.Security.MembershipUser user = System.Web.Security.Membership.GetUser(tbUserName.Text.Trim());
            string msg="";
            if (user != null)
            {
                message2.Text = Utilities.FormatError("Username already exists; try another username");
                return;
            }
            if (BLL.User.CreateAspnetUser(tbUserName.Text.Trim(), pUser.PhsicalEmail, pUser.PhsicalEmail, UserRoles.Employer, tbPassWordOne.Text.Trim(), false, out msg) && BLL.User.InsertWebUser(tbUserName.Text.Trim(), UserRoles.Employer, null, pUser.EmployerId, null, null, null, "ER"+pUser.EmployerId))
            {
                Utilities.SendMail(
                    ApplicationConfiguration.SystemMailSender, //sender
                    pUser.PhsicalEmail, //email 
                    pUser.MailingEmail, //back up email
                    "A " + Utilities.Us() + " web account has been created", //subject
                    string.Format("<table><tr><td>{0}</td></tr><tr><td>{1}</td></tr><tr><td>Congratulations, you have successfully registered an account with {2} web portal.</td></tr><tr><td><a href=\"https://www.{3}/login.aspx\">Click here</a> to sign in</td></tr><tr><td>If you have difficulties signing in, please call Customer Service at (323) 728-9500 ext. 259. or email us at <a href=\"mailto:OnlineHelpDesk@piasc.org\">OnlineHelpDesk@piasc.org</a>. We want to make the enrollment process as simple and easy as possible</td></tr></table><br>{4}", pUser.CompanyName, pUser.EmployerId, Utilities.Us(), Utilities.OurURL(), BasePage.disclaimer) //body
                    );
                BLL.Logger.WriteAuditLog(string.Format("User {0} created by email registration.", tbUserName.Text.Trim()), EventCode.CreateWebAccount);
                SortaBasePage.login(tbUserName.Text.Trim(), tbPassWordOne.Text.Trim(), HttpContext.Current, Page);
            }
        }
    }
}