using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.BLL;
using Pibt.Model;
using Telerik.Web.UI;

namespace Pibt.UserControl
{
    public partial class CtlAgentLookup : System.Web.UI.UserControl
    {
        public Model.UserRoles Role { get; set; }
        public string AgentId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //UserCacheInfo userInfo = CurrentUserInfo;
                if (Role == Model.UserRoles.Administrator)
                {
                    AgentComboBox.DataSource = BLL.Agent.GetAgentList();
                    AgentComboBox.DataTextField = "NAME";
                    AgentComboBox.DataValueField = "NAME";
                    AgentComboBox.DataBind();

                    AgentIdComboBox.DataSource = BLL.Agent.GetAgentIdByAgentName(AgentComboBox.SelectedItem.Value);
                    AgentIdComboBox.DataTextField = "EnrollerId";
                    AgentIdComboBox.DataValueField = "EnrollerId";
                    AgentIdComboBox.DataBind();
                }

                else if (Role == Model.UserRoles.Agent)
                {
                    AgentComboBox.Enabled = false;
                    AgentIdComboBox.DataSource = BLL.Agent.GetEnrollerIdbyWebName(Page.User.Identity.Name);
                    AgentIdComboBox.DataTextField = "EnrollerId";
                    AgentIdComboBox.DataValueField = "EnrollerId";
                    AgentIdComboBox.DataBind();
                }
            }
        }

        protected void AgentComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            AgentIdComboBox.DataSource = BLL.Agent.GetAgentIdByAgentName(AgentComboBox.SelectedValue);
            AgentIdComboBox.DataBind();

        }

        protected void AgentIdComboBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            //CurrentEmployeesByEnrollerGrid.DataSource = BLL.Agent.GetEmployeesByEnrollerId(AgentIdComboBox.SelectedItem.Value);
            CurrentEmployeesByEnrollerGrid.DataBind();
        }
    }
}