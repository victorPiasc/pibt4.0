using System;
using System.Web;
using System.Web.Security;
using Pibt.Model;
using Pibt.BLL;
using Pibt.Common;

namespace Pibt.UserControl
{
    public class CreateWebUserEventArgs : EventArgs
    {
        public CreateWebUserEventArgs(string userName)
        {
            NewUserName = userName;
        }
        public string NewUserName;
    }

    public delegate void CreateFinished(object sender, CreateWebUserEventArgs e);

    public partial class CtlCreateWebUser : System.Web.UI.UserControl
    {
        public event CreateFinished OnCreateFinished;
        public UserRoles Role { get; set; }
        public string UserId { get; set; }
        public bool HideCreateButton { get; set; }
        public bool AutoGeneratePWD { get; set; }
        public bool successBMSuser { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnCreateUser.Visible = !HideCreateButton;
                chkAutoGeneratePwd.Attributes.Add("onclick", "$telerik.$('#" + txtPassword.ClientID + "').val('12345678');");
                Page.ClientScript.RegisterClientScriptInclude("verify", "/js/verify.js");
            }
            txtPassword.Attributes.Add("onkeyup", "passwordcheck('" + txtPassword.ClientID + "');");
            lblMessage.Text = "";
        }

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            int num = 0;

            //Inital successBMSuser values;
            if (int.TryParse(txtLoginName.Text.Trim(), out num))
            {
                lblMessage.Text = Common.Utilities.FormatError("The web username must include at least one character.");
                return;
            }
            if (Page.IsValid)
            {
                MembershipUser user = Membership.GetUser(txtLoginName.Text.Trim().Trim());
                if (user != null)
                {
                    lblMessage.Text = Common.Utilities.FormatError("This username already exists; please try another username.");
                    return;
                }

                string loginName = txtLoginName.Text.Trim().Trim();
                string uid = "";
                string email = "";
                string employerId = "";
                string employeeId = "";
                string memberId = "";
                string brokerId = "";
                string updatedBy = Page.User.Identity.Name;
                switch (Role)
                {
                    case UserRoles.Administrator:
                        WebUser admin = BLL.User.GetAdminDetails(UserId);
                        email = admin.EmailAddress;
                        uid = UserId;
                        break;
                    case UserRoles.Enroller:
                        AgentDetails eDetails = Agent.GetEnrollerDetails(UserId, false);
                        email = eDetails.EmailAddress;
                        uid = UserId;
                        break;
                    case UserRoles.Agent:
                        AgentDetails aDetails = Agent.GetEnrollerDetails(UserId, true);
                        email = aDetails.EmailAddress;
                        uid = UserId;
                        break;
                    case UserRoles.RK:
                        RKDetails rkDetails = BLL.RK.GetRKDetails(UserId);
                        email = rkDetails.EmailAddress;
                        uid = UserId;
                        break;
                    case UserRoles.Broker:
                        BrokerDetails bDetails = BLL.Broker.GetBrokerDetails(UserId);
                        email = bDetails.EmailAddress;
                        brokerId = UserId;
                        break;
                    case UserRoles.Employer:
                        BizInfoDetails employer = BLL.Employer.GetBizInfoDetails(UserId);
                        email = employer.MailingEmail;
                        employerId = UserId;
                        break;
                    case UserRoles.Employee:
                        MemberDetails employee = BLL.Employee.GetMemberDetails(UserId);
                        email = employee.EmailAddress;
                        employeeId = UserId;
                        memberId = UserId;
                        break;
                    case UserRoles.Dependent:
                        MemberDetails dependent = BLL.Employee.GetMemberDetails(UserId);
                        email = dependent.EmailAddress;
                        memberId = UserId;
                        break;
                }

                if (string.IsNullOrEmpty(email))
                {
                    lblMessage.Text = Common.Utilities.FormatError("EMail is missing. Please add an eMail to this user.");
                    return;
                }
                string returnMsg = "";

                if (BLL.User.CreateAspnetUser(txtLoginName.Text.Trim(), email, email, Role, txtPassword.Text, chkAutoGeneratePwd.Checked, out returnMsg) &&
                    BLL.User.InsertWebUser(txtLoginName.Text.Trim(), Role, uid, employerId, employeeId, memberId, brokerId, updatedBy))
                {
                    Utilities.SendMail(ApplicationConfiguration.SystemMailSender, email, "A " + Utilities.Us() + " web portal account has been created", string.Format("<p>Welcome,</p>" + "<p>Thank you for registering to the {0} web portal.  A temporary password has been generated. For security purposes, your username " + "has been provided to you by the account creator.</p>" + "<p>To access our website, you will need both your username and password.</p>" + "<p>When accessing the {0} web portal for the first time, we strongly recommend you change your temporary password.</p>" + "<p>If you have difficulties signing in, please call Customer Service at (323) 728-9500 ext. 259.</p>" + "<p>Temporary Password: {1}</p>" + "<p><a href=\"https://www.{2}/login.aspx\">Click here</a> to sign in.</p>", Utilities.Us(), txtPassword.Text, Utilities.OurURL()));
                    Logger.WriteAuditLog(string.Format("{0} created new web user {1}.", Page.User.Identity.Name, txtLoginName.Text.Trim()), EventCode.CreateWebAccount);
                    lblMessage.Text = Common.Utilities.FormatAlertInfo(
                        (HideCreateButton
                            ? ""
                            : "You have successfully created a " + Pibt.Common.Utilities.Us() +
                              " web portal account. An eMail account confirmation has been sent. ") +
                        "Please notify the account holder that the new account username is " + txtLoginName.Text); ;
                    if (OnCreateFinished != null)
                    {
                        OnCreateFinished(this, new CreateWebUserEventArgs(txtLoginName.Text.Trim()));
                    }
                }
                else
                {
                    if (HideCreateButton)
                    {
                        string urlStr = "<a href=\"/EditMemberDetails.aspx" + BasePage.UrlBuilder(HttpContext.Current.Request, null)
                                        + "\"><u><font size=\"3\" color=\"red\">Here</font></u></a> ";
                        lblMessage.Text = Common.Utilities.FormatError("Create web accout failed! Click " + urlStr + " to create web account again.");
                    }
                    else
                    {
                        lblMessage.Text = Common.Utilities.FormatError("Create web account failed! Try again.");
                    }
                }
            }
        }

        public bool Create()
        {
            btnCreateUser_Click(null, null);
            if (string.IsNullOrEmpty(lblMessage.Text))
            {
                txtLoginName.Text = "";
                return true;
            }
            return false;
        }
    }
}