using System;
using System.Web;
using System.Web.Security;
using Pibt.BLL;
using Pibt.Model;

namespace Pibt.UserControl
{
    public partial class CtlEditBrokerDetails: System.Web.UI.UserControl 
    {
        public string BrokerId { get; set; }

        protected void Page_Load(object sender, EventArgs e) 
        {
            if (!Page.IsPostBack) 
            {
                BrokerDetails details = BLL.Broker.GetBrokerDetails(BrokerId);
                if (details == null)
                    BasePage.oops(HttpContext.Current);
                if (string.IsNullOrEmpty(details.LoginName))
                {
                    lblLoginName.Text = "[<i>Unassigned</i>]";
                    chkLockUser.Visible = false;
                }
                else 
                {
                    lblLoginName.Text = details.LoginName;
                    chkLockUser.Checked = details.IsLockout;
                    chkLockUser.Visible = details.LoginName.ToUpper()!=Page.User.Identity.Name.ToUpper();
                }
                lblBrokerID.Text = details.BrokerId;
                txtEmailAddress.Text = details.EmailAddress;
                txtUserName.Text = details.BrokerName;
            }
            lblMessage.Text = "";
        }

        protected void btnUpdateUser_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) 
            {
                MembershipUser user = Membership.GetUser(lblLoginName.Text); 
                if (user!= null && BLL.Broker.updateBroker(BrokerId, txtUserName.Text, txtEmailAddress.Text))
                {
                    user.Email = txtEmailAddress.Text;
                    Membership.UpdateUser(user);
                    Logger.WriteAuditLog(string.Format("{0} updated Broker {1} #{2}", Page.User.Identity.Name, lblLoginName.Text, BrokerId), EventCode.UpdateBroker);
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
                Logger.WriteAuditLog(string.Format("{0} {3}locked Broker {1} #{2}", Page.User.Identity.Name, lblLoginName.Text, BrokerId,
                    chkLockUser.Checked ? "" : "un"), EventCode.UpdateBroker);
            }
        }
    }
}