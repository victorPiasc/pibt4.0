using System;
using System.Web;
using System.Web.Security;
using Pibt.Model;
using Pibt.BLL;
using Pibt.Common;

namespace Pibt.UserControl
{
   public partial class CtlPasswordRecovery : System.Web.UI.UserControl
   {
      protected void Page_Load(object sender, EventArgs e)
      {
      }

      protected void btn_PWRecovery_Click(object sender, EventArgs e)
      {
          string fault;
          string loginName = txtLoginName.Text.Trim();
          txtLoginName.Text = "";
         
          if (string.IsNullOrEmpty(loginName))
          {
              lbl_Message.Text = Utilities.FormatError("Please enter a username");
              return;
          }
          if (!Page.IsValid)
              return;

          MembershipUser user = Membership.GetUser(loginName);

          if (user == null)
          {
             lbl_ErrorMessage.Text = Utilities.FormatError("Your password can’t be reset online.<br/>" +
             "For security reasons, you need to contact your relationship keeper to help you reset your password.");
             return;
          }

          // do recovery here.
          Model.Password pw = BLL.Password.GetDetails(loginName);
          if (pw!=null)
          {
              lbl_ErrorMessage.Text = Utilities.FormatAlertInfo("We've sent information about your password to your recovery email address.");
              lbl_Message.Text = "EMail sent to " + pw.emailAddress;
                    
              //send out email
              try
              {
                  Utilities.SendMail(ApplicationConfiguration.SystemMailSender, user.Email, "Your " + Utilities.Us() + " login password.",
                     string.Format("<p>Welcome! We see that you have requested your password online.<br/>" +
                                   "Please print and keep this information in a safe place for future reference.</p>" +
                                   "<p>your {2} login password is: {0}</p>" +
                                   "<p>You may log in at: {3}/login.aspx</p>" +
                                   "<p>If you require additional assistance with logging into the portal, please contact your {2} Relationship Keeper.</p><br/> {1}", pw.password, BasePage.disclaimer, Utilities.Us(), Utilities.OurURL()));
                  return;
              }
              catch (Exception exc)
              {
                 lbl_ErrorMessage.Text = Utilities.FormatError("System error: Send email failed!");
                 fault = exc.Message;
              }
          }
          else
          {
             lbl_ErrorMessage.Text = Utilities.FormatError("System error, Password recovery failed!");
             fault = "System error, Password recovery failed";
          }
          Logger.InsertLog(new WebSiteLog
          {
              LogType = LogType.Error,
              EventCode = EventCode.AppError,
              EventDetails = fault,
              UserName = Page.User.Identity.Name,
              FromIP = HttpContext.Current.Request.UserHostAddress
          });
      }
   }
}