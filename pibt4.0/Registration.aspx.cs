using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using System.Web.Security;
using Pibt.BLL;
using Pibt.Common;

namespace Pibt
{
    public partial class Registration : SortaBasePage
    {
        public int viewNum
        {
            get
            {
                if (ViewState["viewNum"] == null)
                {
                    return 1;
                }
                return int.Parse(ViewState["viewNum"].ToString());
            }
            set
            {
                ViewState["viewNum"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string uniqueLink = Request["uId"];
            if (string.IsNullOrEmpty(uniqueLink) && !BLL.Employer.checkHasLink(uniqueLink))//check for link in url and that it exist in database
                oops();
            if(BLL.Employee.checkHasWebAccount(uniqueLink) || Session["UserCacheInfo"] != null)//if user logged in or user with uniqueId has webaccount already  
                Response.Redirect("/default.aspx");
            setViews();
            MemberDetails md = BLL.Employee.getMemberWithLink(uniqueLink);
            regName.Text = md.FirstName + " " + md.LastName;
            Page.ClientScript.RegisterClientScriptInclude("verify", "/js/verify.js");
            tbPassWordOne.Attributes.Add("onkeyup", "passwordcheck('" + tbPassWordOne.ClientID + "');");
            errorMessage.Text = "";
        }

        public void setViews()
        {
            firstView.Visible = viewNum == 1;
            secondView.Visible = viewNum == 2;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            string uniqueLink = Request["uId"];
            MemberDetails md = BLL.Employee.getMemberWithLink(uniqueLink);
            string msg;
            MembershipUser user = Membership.GetUser(tbUserName.Text.Trim());
            if (user != null)//check username does not exist
            {
                errorMessage.Text = "Username already exist, try another username";
                return;
            }
            if (BLL.User.CreateAspnetUser(tbUserName.Text.Trim(), md.EmailAddress, md.EmailAddress, UserRoles.Employee, tbPassWordOne.Text, false, out msg) &&
                BLL.User.InsertWebUser(tbUserName.Text.Trim(), UserRoles.Employee, null, md.EmployerId, md.EmployeeId, md.EmployeeId, null, "emailReg" ))
            {
                Utilities.SendMail(ApplicationConfiguration.SystemMailSender, md.EmailAddress,  "A " + Utilities.Us() + " web portal account has been created", string.Format("<p>Welcome,</p>" + "<p>Thank you for registering to the {0} web portal.<p>If you have difficulties signing in, please call Customer Service at (323) 728-9500 ext. 259.</p><p><a href=\"https://www.{1}/login.aspx\">Click here</a> to sign in.</p>", Utilities.Us(), Utilities.OurURL()));
                Logger.WriteAuditLog(string.Format("User {0} created by email registration.", tbUserName.Text.Trim()), EventCode.CreateWebAccount);
                //viewNum = 3;
                //setViews();
                login(tbUserName.Text.Trim(), tbPassWordOne.Text.Trim());
                //NOT REACHED
            }
            errorMessage.Text = Utilities.FormatError(msg);

        }

        protected void btnSSN_Click(object sender, EventArgs e)
        {
            string uniqueLink = Request["uId"];
            MemberDetails md = BLL.Employee.getMemberWithLink(uniqueLink);
            string lastFour = md.SocsecNbr.Substring(md.SocsecNbr.Length - 4);
            if (!lastFour.Equals(tbSSN.Text))//check SSN matches
            {
                errorMessage.Text = "The number you entered does not match what is in our system.";
                return;
            }
            viewNum = 2;
            setViews();
        }
    }
}