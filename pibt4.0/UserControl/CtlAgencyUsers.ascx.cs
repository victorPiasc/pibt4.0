using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.UserControl
{
    public partial class CtlAgencyUsers : BaseUserControl
    {
        public string BrokerId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            //dateRange.MaximumValue = DateTime.Today.ToShortDateString();
            //dateRange.MinimumValue = DateTime.Today.AddYears(-50).ToShortDateString();
        }

        protected void users_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            users.DataSource = BLL.Broker.brokerAgents(BrokerId, 0);
        }

        public void rebind()
        {
            users.Rebind();
            ListItem li = managersList.Items[0];
            managersList.Items.Clear();
            managersList.Items.Add(li);
            managersList.DataSource = BLL.Broker.brokerAgents(BrokerId, 1);
            managersList.DataValueField = "pk";
            managersList.DataTextField = "fullName";
            managersList.DataBind();
        }

        protected void users_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            GridDataItem item = (GridDataItem)e.Item;
            switch (e.CommandName)
            {
                case "editA":
                    pk.Value = item["pk"].Text;
                    lName.Text = item["lastName"].Text;
                    fName.Text = item["firstName"].Text;
                    licenseNo.Text = item["license"].Text;
                    issue.SelectedDate = DateTime.Parse(item["licenseIssued"].Text);
                    officeNo.Text = item["officePhone"].Text;
                    cellNo.Text = item["cell"].Text;
                    email.Text = item["email"].Text;
                    roles.SelectedIndex = item["status"].Text.Contains("M")? 1:2;
                    addUpdate.Text = "Update";
                    cancel.Text = "Cancel Update";
                    break;
                case "delete":
                    BLL.Broker.deleteBrokerAgent(item["pk"].Text);
                    break;
            }
            rebind();
        }

        protected void addUpdate_Click(object sender, EventArgs e)
        {
            string manager = managersList.SelectedIndex == 0 || roles.SelectedIndex==1  ? "" : managersList.SelectedValue;
            BLL.Broker.updateBrokerAgent(pk.Value, BrokerId, lName.Text, fName.Text, "" /*mi*/,  licenseNo.Text,  issue.SelectedDate, officeNo.Text, cellNo.Text, email.Text, manager, Page.User.Identity.Name);
            rebind();
            clearAddUpdate();
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            clearAddUpdate();
        }

        public void clearAddUpdate()
        {
            pk.Value = lName.Text = fName.Text = licenseNo.Text =
                officeNo.Text = cellNo.Text = email.Text = "";
            issue.Clear();
            roles.SelectedValue = "0";
            addUpdate.Text = "Add";
            cancel.Text = "Cancel Add";
        }
    }
}