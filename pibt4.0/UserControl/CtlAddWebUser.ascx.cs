using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using Pibt.Common;
namespace Pibt.UserControl
{
    public partial class CtlAddWebUser : System.Web.UI.UserControl
    {
        public UserRoles Role { get; set; }
        public event EventHandler OnAdded;

        protected void Page_Load(object sender, EventArgs e)
        {
            Utilities.TieButton(this.Page, txtUserId, btnAdd);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string msg = "";
            bool success = BLL.User.ValidateNewWebUserAccount(txtUserId.Text, ((int)Role).ToString(), "", out msg);
            if (success)
            {

                if (BLL.User.InsertWebUser("", Role, txtUserId.Text, "", "", "", "", Page.User.Identity.Name))
                {
                    EventCode eCode = EventCode.AddAdmin;
                    if (Role == UserRoles.Administrator)
                        eCode = EventCode.AddAdmin;
                    else if (Role == UserRoles.Agent)
                        eCode = EventCode.AddAgent;
                    else if (Role == UserRoles.RK)
                        eCode = EventCode.AddRK;
                    else if (Role == UserRoles.Broker)
                        eCode = EventCode.AddBroker;
                    BLL.Logger.WriteAuditLog(string.Format("{0} added a new {2} without web account: #{1}", Page.User.Identity.Name, txtUserId.Text,
                        Role.ToString()), eCode);
                    lblCheckResult.Text = "The account was created successfully.";
                    if (Role == UserRoles.Administrator)
                        Page.Response.Redirect("/Admin/AdminEdit.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.Url.PathAndQuery));
                    else if (Role == UserRoles.Agent)
                        Page.Response.Redirect("/Admin/AgentDetails.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.Url.PathAndQuery));
                    else if (Role == UserRoles.RK)
                        Page.Response.Redirect("/Admin/RKDetails.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.Url.PathAndQuery));
                    else if (Role == UserRoles.Broker)
                        Page.Response.Redirect("/Broker/BrokerDetails.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.Url.PathAndQuery));
                }
            }
            else
            {
                lblCheckResult.Text = msg;
            }
            if (OnAdded != null)
            {
                OnAdded(sender, e);
            }
        }
    }
}