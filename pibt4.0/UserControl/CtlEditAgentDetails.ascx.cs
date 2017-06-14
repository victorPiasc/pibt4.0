using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using Pibt.BLL;
using System.Web.Security;
using Pibt.Common;

namespace Pibt.UserControl
{
    public partial class CtlEditAgentDetails : System.Web.UI.UserControl
    {
        public string UserId { get; set; }
        public UserRoles Role { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                AgentDetails agent = Agent.GetEnrollerDetails(UserId, Role==UserRoles.Agent );

                if (agent == null)
                {
                    HttpContext.Current.ClearError();
                    Response.Redirect("/Oooops.aspx", false);
                    return;
                }

                String showAs = BLL.User.GetWebUserLoginname(UserId, UserRoles.Agent);
                if (string.IsNullOrEmpty(showAs))
                {
                    lblLoginName.Text = "[<i>Unassigned</i>]";
                    chkLockUser.Visible = false;
                }
                else
                {
                    lblLoginName.Text = showAs;
                    chkLockUser.Checked = agent.IsLockout;
                    chkLockUser.Visible = (agent.LoginName.ToUpper() != Page.User.Identity.Name.ToUpper());
                }
                lblAgentID.Text = agent.AgentId;
                txtUserName.Text = agent.UserName;
                txtEmailAddress.Text = agent.EmailAddress;
            }

        }

        protected void btnUpdateUser_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if ( BLL.User.UpdateUser(UserId, txtUserName.Text, txtEmailAddress.Text, Page.User.Identity.Name))
                {
                    MembershipUser user = Membership.GetUser(lblLoginName.Text);
                    if (user != null)
                    {
                        user.Email = txtEmailAddress.Text;
                        Membership.UpdateUser(user);
                    }
                    Logger.WriteAuditLog(string.Format("{0} updated the agent: {1} #{2}", Page.User.Identity.Name, lblLoginName.Text, UserId),
                        EventCode.UpdateAgent);
                    lblMessage.Text = "Update successful";
                }
                else
                {
                    lblMessage.Text = "Update failed!";
                    Logger.InsertLog(new WebSiteLog
                    {
                        LogType = LogType.Error,
                        EventCode = EventCode.AppError,
                        EventDetails = "Error updating user at line 53 on CtlEditAgentDetails.ascx.cs",
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
                Logger.WriteAuditLog(string.Format("{0} {3}locked the Agent: {1}#{2}", Page.User.Identity.Name, lblLoginName.Text, UserId,
                    chkLockUser.Checked ? "" : "un"), EventCode.UpdateAgent);
            }
        }
    }
}