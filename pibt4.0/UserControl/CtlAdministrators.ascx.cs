using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using Pibt.Model;
using Pibt.Common;


namespace Pibt.UserControl
{
    public partial class CtlAdministrators : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utilities.TieButton(Page, txtClue, btnSearch);
        }

        protected void binder(object sender, GridItemEventArgs e) {
            Pibt.BasePage.binderLow(e, AdministratorsGrid, "View this administrator");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblGridHeader.Text = "Search Results:";
            AdministratorsGrid.Rebind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtClue.Text = "";
            lblGridHeader.Text = "";
            AdministratorsGrid.Rebind();
        }

        protected void AdministratorsGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            AdministratorsGrid.DataSource = BLL.User.SearchAdministrators(txtClue.Text);
        }

        protected void AdministratorsGrid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
                string id = dataItem.GetDataKeyValue("Id").ToString();
                string loginName = dataItem.GetDataKeyValue("Loginname").ToString();
                string userId = dataItem.GetDataKeyValue("UserId").ToString();
                bool success = false;
                success = BLL.User.DeleteWebUserAndMembershipUser(id, loginName, Page.User.Identity.Name);
                if (success)
                {
                    BLL.Logger.WriteAuditLog(string.Format("{0} deleted the web administrator: {1}#{2}", Page.User.Identity.Name, loginName, userId),
                        EventCode.DeleteAdmin);
                }
            }
        }
    }
}