using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Pibt.BLL;
using Pibt.Model;

namespace Pibt.UserControl
{
    public partial class CtlEditRKDetails : System.Web.UI.UserControl
    {
        public string UserId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                RKDetails rkDetails = RK.GetRKDetails(UserId);
                if (rkDetails == null)
                {
                    HttpContext.Current.ClearError();
                    Response.Redirect("/Oooops.aspx", false);
                    return;
                }

                if (string.IsNullOrEmpty(rkDetails.LoginName))
                {
                    lblLoginName.Text = "[<i>Unassigned</i>]";
                    chkLockUser.Visible = false;
                }
                else
                {
                    lblLoginName.Text = rkDetails.LoginName;
                    chkLockUser.Checked = rkDetails.IsLockout;
                    chkLockUser.Visible = (rkDetails.LoginName.ToUpper() != Page.User.Identity.Name.ToUpper());
                }
                lblRKID.Text = rkDetails.RKId;
                lblCobrarep.Text = rkDetails.Cobrarep;
                lblRKFullName.Text = rkDetails.RKName;
                lblLeaderName.Text = rkDetails.LeaderName;
                txtEmailAddress.Text = rkDetails.EmailAddress;
                txtUserName.Text = rkDetails.UserName;
            }
            lblMessage.Text = "";
        }

        protected void btnUpdateUser_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                bool success = BLL.User.UpdateUser(UserId, txtUserName.Text, txtEmailAddress.Text, Page.User.Identity.Name);
                if (success)
                {
                    MembershipUser user = Membership.GetUser(UserId);
                    if (user != null)
                    {
                        user.Email = txtEmailAddress.Text;
                        Membership.UpdateUser(user);
                    }
                    Logger.WriteAuditLog(string.Format("{0} updated RK {1} #{2}", Page.User.Identity.Name, lblLoginName.Text, UserId), EventCode.UpdateRK);
                    lblMessage.Text = Common.Utilities.FormatAlertInfo("Update successful.");
                }
                else
                {
                    lblMessage.Text = Common.Utilities.FormatError("Update failed! Try again or call Tech Support!");
                }
            }
        }

        protected void chkLockUser_CheckedChanged(object sender, EventArgs e)
        {
            if (BLL.User.UpdateWebUserStatus(lblLoginName.Text, chkLockUser.Checked))
            {
                Logger.WriteAuditLog(string.Format("{0} {3}locked RK {1} #{2}", Page.User.Identity.Name, lblLoginName.Text, UserId,
                    chkLockUser.Checked ? "" : "un"), EventCode.UpdateRK);
            }
        }
    }
}