using System;
using Telerik.Web.UI;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.Broker
{
    public partial class Brokers: BasePage 
    {
        protected void Page_Load(object sender, EventArgs e) 
        {

            Utilities.TieButton(Page, txtClue, btnSearch);
            BLL.Broker.SynBrokerToWebUsersTable(Page.User.Identity.Name);
        }

        protected void binder(object sender, GridItemEventArgs e) 
        {
            binderLow(e, RadGridBrokers, "View this broker");
        }

        protected void btnSearch_Click(object sender, EventArgs e) 
        {
            if (Page.IsValid) {
                lblGridHeader.Text = "Search Results:";
                RadGridBrokers.Rebind();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e) 
        {
            txtClue.Text = "";
            lblGridHeader.Text = "";
            RadGridBrokers.Rebind();
        }

        protected void RadGridBrokers_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e) 
        {
            RadGridBrokers.DataSource = BLL.Broker.SearchBrokers(txtClue.Text);
        }

        protected void RadGridBrokers_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e) 
        {
            if (e.CommandName=="Delete") {
                GridDataItem dataItem = (GridDataItem)e.Item;
                string id = dataItem.GetDataKeyValue("Id").ToString();
                string loginName = dataItem.GetDataKeyValue("Loginname").ToString();
                string userId = dataItem.GetDataKeyValue("UserId").ToString();
                if (BLL.User.DeleteWebUserAndMembershipUser(id, loginName, Page.User.Identity.Name))
                    BLL.Logger.WriteAuditLog(string.Format("{0} deleted the web broker: {1} #{2}", Page.User.Identity.Name, loginName, userId),
                        EventCode.DeleteBroker);
            }
        }
    }
}