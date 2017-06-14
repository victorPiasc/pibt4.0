using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.BLL;
using System.Web.Security;
using Pibt.Model;

namespace Pibt.UserControl
{
    public partial class CtlEditAdministrator : System.Web.UI.UserControl
    {
        public string UserId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                WebUser user = BLL.User.GetAdminDetails(UserId);

                if (user == null)
                {
                    HttpContext.Current.ClearError();
                    Response.Redirect("/Oooops.aspx", false);
                    return;
                }

                if (string.IsNullOrEmpty(user.LoginName))
                {
                    lblLoginName.Text = "[<i>Unassigned</i>]";
                    chkLockUser.Visible = false;
                }
                else
                {
                    lblLoginName.Text = user.LoginName;
                    chkLockUser.Checked = user.IsLockout;
                    chkLockUser.Visible = (user.LoginName.ToUpper() != Page.User.Identity.Name.ToUpper());
                }
                txtUserName.Text = user.UserName;
                txtEmailAddress.Text = user.EmailAddress;
            }
        }

        protected void btnUpdateUser_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                bool success = BLL.User.UpdateUser(UserId, txtUserName.Text, txtEmailAddress.Text, Page.User.Identity.Name);
                if (success)
                {
                    MembershipUser user = Membership.GetUser(lblLoginName.Text);
                    if (user != null)
                    {
                        user.Email = txtEmailAddress.Text;
                        Membership.UpdateUser(user);
                    }
                    Logger.WriteAuditLog(string.Format("{0} updated the administrator: {1} #{2}", Page.User.Identity.Name, lblLoginName.Text, UserId),
                        EventCode.UpdateAdmin);
                    lblMessage.Text = "Update successful";
                }
                else
                {
                    lblMessage.Text = "Update failed!";
                    Logger.InsertLog(new WebSiteLog
                    {
                        LogType = LogType.Error,
                        EventCode = EventCode.AppError,
                        EventDetails = "Error updating user at btnUpdateUser_Click, on CtlEditAdministrator.ascx.cs",
                        UserName = Page.User.Identity.Name,
                        FromIP = HttpContext.Current.Request.UserHostAddress
                    });
                }
            }
        }

        protected void chkLockUser_CheckedChanged(object sender, EventArgs e)
        {
            if (BLL.User.UpdateWebUserStatus(lblLoginName.Text, chkLockUser.Checked))
            {
                Logger.WriteAuditLog(string.Format("{0} {3}locked the administrator: {1} #{2}", Page.User.Identity.Name, lblLoginName.Text, UserId,
                    chkLockUser.Checked ? "" : "un"), EventCode.UpdateAdmin);
            }
        }
    }
}