using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Pibt.Model;
using Pibt.BLL;
using Pibt.Common;

namespace Pibt.UserControl
{
    public partial class CtlChangePassword : System.Web.UI.UserControl
    {
        public string AspnetUserName
        {
            get
            {
                return lblLoginName.Text;
            }
            set
            {
                lblLoginName.Text = value;
            }
        }
        public UserRoles Role { get; set; }
        public string UserId { get; set; }
        public string userName { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            AspnetUserName = BLL.User.GetWebUserLoginname(UserId, Role);

            if (!string.IsNullOrEmpty(AspnetUserName))
            {
                MembershipUser tmpUser = Membership.GetUser(AspnetUserName);
            }

            Page.ClientScript.RegisterClientScriptInclude("verify", "/js/verify.js");
            txtNewPassword.Attributes.Add("onkeyup", "passwordcheck('" + txtNewPassword.ClientID + "');");

            if (!Page.IsPostBack && Visible)
            {
                CheckBox chkLockUser = LoginViewLockWebUser.FindControl("chkLockUser") as CheckBox;
                if (chkLockUser != null)
                {
                    MembershipUser user = Membership.GetUser(AspnetUserName);
                    if (user != null)
                    {
                        chkLockUser.Checked = user.IsLockedOut;
                    }
                }
            }
            lblChangePasswordErrorMessage.Text = "";
        }

        protected void BtnChangePassword_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    string oldPassword = txtOldPassword.Text.Trim();
                    string password = txtNewPassword.Text.Trim();
                    string confirmPassword = txtConfirmPassword.Text.Trim();
                    if (password != confirmPassword)
                        lblChangePasswordErrorMessage.Text = Utilities.FormatError("Entered passwords don't match!");
                    else
                    {
                        MembershipUser user = Membership.GetUser(AspnetUserName);
                        bool success = user.ChangePassword(oldPassword, password);

                        if (success)
                        {
                            Logger.WriteAuditLog(string.Format("{0} changed {1}'s password.", Page.User.Identity.Name, AspnetUserName), EventCode.ChangePassword);
                            lblChangePasswordErrorMessage.Text = Utilities.FormatNote("A notification will be sent to Web Contact E-mail after the password is changed successfully.");

                            string body = BasePage.disclaimer;
                            Utilities.SendMail(ApplicationConfiguration.SystemMailSender, user.Email, "Your password has been changed.",
                                string.Format("<p>This email confirms that your {0} web portal password was changed successfully.</p><br/><p>Sign in now: {1}/login.aspx </p><p>If you have any questions or encounter any problems, please contact {0} at (323) 728-9500 Ext. 259. </p><br/>{2}", Utilities.Us(), Utilities.OurURL(), body));

                        }
                        else
                            lblChangePasswordErrorMessage.Text = Utilities.FormatError("Update Password Failed! Old Password is Wrong!");
                    }
                    txtOldPassword.Text = string.Empty;
                    txtNewPassword.Text = string.Empty;
                    txtConfirmPassword.Text = string.Empty;

                    lblChangePasswordErrorMessage.Text = Utilities.FormatAlertInfo("Password updated successfully.");
                }
            }
            catch (Exception exc)
            {
                lblChangePasswordErrorMessage.Text = Utilities.FormatError(Server.HtmlEncode(exc.Message));
            }
        }

        protected void chkLockUser_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox chkLockUser = sender as CheckBox;
            string loginName = lblLoginName.Text;

            if (BLL.User.UpdateWebUserStatus(loginName, chkLockUser.Checked))
                BLL.Logger.WriteAuditLog(string.Format("{0} {3}locked the member: {1} #{2}", Page.User.Identity.Name, loginName, UserId,
                    chkLockUser.Checked ? "" : "un"), EventCode.UpdateEmployer);
        }

        protected void bt_changeLoginName_Click(object sender, EventArgs e)
        {
            string newLoginName = tb_newLoginName.Text.Trim();
            // Check if this new login name exists.
            MembershipUser newUser = Membership.GetUser(newLoginName);
            if (newUser != null)
            {
                lblChangeLoginErrorMessage.Text = Utilities.FormatError("The username already exists, please try other username.");
                return;
            }
            //Update user LoginName
            try
            {
                MembershipUser user = Membership.GetUser(AspnetUserName);
                string oldName = user.UserName;
                bool success = BLL.User.ChangeLoginName(Membership.ApplicationName, AspnetUserName, newLoginName);

                if (success)
                {
                    Logger.WriteAuditLog(string.Format("{0} changed {1}'s username to {2}.", Page.User.Identity.Name, AspnetUserName, newLoginName),
                        EventCode.ChangeLoginName);
                    string body = BasePage.disclaimer;
                    Utilities.SendMail(ApplicationConfiguration.SystemMailSender, user.Email, "Your " + Utilities.Us() + " username has been changed.",
                        string.Format("<p>This email confirms that your {2} web portal username was changed successfully. " +
                                      "Please print and keep this information in a safe place for future reference.</p>" +
                                      "<p>Username: {0}</p>" +
                                      "<p>Sign in now: {3}/login.aspx </p>" +
                                      "<p>If you have any questions or encounter any problems, please contact {2} at (323) 728-9500 Ext. 259.</p><br/>{1}",
                                      newLoginName, body, Utilities.Us(), Utilities.OurURL()));
                    tb_newLoginName.Text = "";

                    lblChangeLoginErrorMessage.Text = Utilities.FormatAlertInfo("Updated username successfully");

                    // Sign in user using new username & send them back to homepage 
                    if (userName.Equals(oldName))
                        FormsAuthentication.SetAuthCookie(newLoginName, false);

                    lblLoginName.Text = newLoginName;
                }
                else
                {
                    lblChangeLoginErrorMessage.Text = Utilities.FormatError("System error, Updating username failed!");
                }
            }
            catch (Exception exc)
            {
                Logger.InsertLog(new WebSiteLog
                {
                    LogType = LogType.Error,
                    EventCode = EventCode.AppError,
                    EventDetails = exc.Message,
                    UserName = Page.User.Identity.Name,
                    FromIP = HttpContext.Current.Request.UserHostAddress
                });
            }
        }
    }
}