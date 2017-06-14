using System;
using System.Web.Security;
using Pibt.Common;
using Pibt.Model;
using System.Net.Mail;

namespace Pibt
{
    public partial class EELogin: SortaBasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_failureText.Text = "";
            if (Page.User.Identity.IsAuthenticated)
               Page.Response.Redirect("/Default.aspx"); 
        }

        protected override void OnInit(EventArgs e)
        {
           if (!Request.IsSecureConnection && !ApplicationConfiguration.IsTestServer)
           {
              Response.Redirect(Request.Url.AbsoluteUri.ToLower().Replace("http://", "https://"), true);
           }
           base.OnInit(e);
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            lbl_failureText.Text = "";
            if (!string.IsNullOrEmpty(UserName.Text) && !string.IsNullOrEmpty(Password.Text))
            {
                MembershipUser userInfo = Membership.GetUser(UserName.Text);
                if (!(userInfo == null))
                {
                    if (userInfo.IsLockedOut)
                    {
                        lbl_failureText.Text = "Your account has been locked out because of too many invalid login attempts. Please contact " + Utilities.Us() +
                            "to have your account unlocked.";
                        return;
                    }
                }

                if (Membership.ValidateUser(UserName.Text.Trim(), Password.Text))
                {
                    if (Page.User.Identity.IsAuthenticated || Session != null)
                        Session.Clear();
                    UserCacheInfo tmp = BLL.User.RefreshUserCacheInfo(UserName.Text);
                    if (BLL.User.hasValidTime((int)tmp.UserRole, UserName.Text))
                    {
                        BLL.User.UpdateWebUserLoginInfo(UserName.Text, Request.UserHostAddress);
                        string redirectUrl = FormsAuthentication.GetRedirectUrl(UserName.Text, RememberMe.Checked);
                        FormsAuthentication.SetAuthCookie(UserName.Text, RememberMe.Checked);
                        BLL.Logger.WriteAuditLog(UserName.Text + " logged in", EventCode.Login);
                        Page.Response.Redirect(redirectUrl);
                        //NOTREACHED
                    }
                }
                lbl_failureText.Text = "Username or Password is invalid. Please try again.";
            }
        }

        protected void sendEmail_Click(object sender, EventArgs e)
        {
            Attachment[] att = new Attachment[] { 
                new Attachment(Server.MapPath(@"/Documents/Terms_and_Conditions.pdf")), 
                new Attachment(Server.MapPath(@"/Documents/Privacy _Statement.pdf")) };
            string body = "Hello,<br />As you requested, attached are the following documents:<br /><ol type=\"A\" style=\"list-style:initial; padding-left:40px;\"><li>Terms and Conditions – This document describes the terms and conditions pursuant to which you accept when you using our portal.  If you do not accept these conditions, please do not use our website.</li><li>Privacy Statement – This document describes how we collect and use personal information that you may provide.</li></ol><br />If you should have any questions, please do not hesitate to contact us at (800) 449-4898.<br /><br />"+BasePage.disclaimer;
            Utilities.SendMail("OnlineHelpDesk@piasc.org", email.Text, email.Text,"", "Terms & Conditions", body, att);
            sent.Text = "Email has been sent.";
        }
    }
}
