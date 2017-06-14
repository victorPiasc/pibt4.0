using Pibt.Common;
using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt
{
    public partial class ErRegistrationContinued : SortaBasePage
    {
        public int attempts
        {
            get
            {
                if (ViewState["attempts"] == null)
                    ViewState["attempts"] = 0;
                return int.Parse(ViewState["attempts"].ToString());
            }
            set
            {
                ViewState["attempts"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["code"] == null)
                oops();
            Page.ClientScript.RegisterClientScriptInclude("verify", "/js/verify.js");
            tbPassWordOne.Attributes.Add("onkeyup", "passwordcheck('" + tbPassWordOne.ClientID + "');");
        }

        protected void validate_Click(object sender, EventArgs e)
        {
            if (validationInput.Text.Equals(Session["code"].ToString()))
            {
                view1.Visible = false;
                view2.Visible = true;
            }
            else
            {
                attempts += 1;
                validationInput.Text = "";
                if(attempts == 2)
                    message1.Text = Utilities.FormatError("You have one more attempt.");
                if (attempts == 3)
                {
                    Session["code"] = null;
                    Session["details"] = null;
                    view1.Visible = false;
                    view3.Visible = true;
                }
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(tbUserName.Text.Trim());
            BizInfoDetails details = (BizInfoDetails)Session["details"];
            string msg="";
            if (user != null)
            {
                message2.Text = Utilities.FormatError("Username already exist, try another username");
                return;
            }
            if(BLL.User.CreateAspnetUser(tbUserName.Text.Trim(), details.PhsicalEmail, details.PhsicalEmail, UserRoles.Employer, tbPassWordOne.Text.Trim(), false, out msg) &&
                BLL.User.InsertWebUser(tbUserName.Text.Trim(), UserRoles.Employer, null, details.EmployerId, null, null, null, "ER"+details.EmployerId))
            {
                Utilities.SendMail(ApplicationConfiguration.SystemMailSender, details.PhsicalEmail, details.MailingEmail, "A " + Utilities.Us() + " web account has been created", string.Format("<table><tr><td>{0}</td></tr><tr><td>{1}</td></tr><tr><td>Congratulations, you have successfully registered an account with {2} web portal.</td></tr><tr><td><a href=\"https://www.{3}/login.aspx\">Click here</a> to sign in</td></tr><tr><td>If you have difficulties signing in, please call Customer Service at (323) 728-9500 ext. 259. or email us at <a href=\"mailto:OnlineHelpDesk@piasc.org\">OnlineHelpDesk@piasc.org</a>. We want to make the enrollment process as simple and easy as possible</td></tr></table><br>{4}",details.CompanyName, details.EmployerId, Utilities.Us(), Utilities.OurURL(), BasePage.disclaimer));
                BLL.Logger.WriteAuditLog(string.Format("User {0} created by email registration.", tbUserName.Text.Trim()), EventCode.CreateWebAccount);
                Session["code"] = null;
                Session["details"] = null;
                view2.Visible = false;
                login(tbUserName.Text.Trim(), tbPassWordOne.Text.Trim());
                //NOTREACHED
                //view4.Visible = true;
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Session["code"] = null;
            Session["details"] = null;
            Response.Redirect("/Login.aspx");
        }
    }
}