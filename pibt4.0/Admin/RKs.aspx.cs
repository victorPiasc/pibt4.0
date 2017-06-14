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

namespace Pibt.Admin
{
    public partial class RKs : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utilities.TieButton(Page, txtClue, btnSearch);
            BLL.RK.SynRKToWebUsersTable(Page.User.Identity.Name);
        }

        protected void binder(object sender, GridItemEventArgs e) {
            binderLow(e, RadGridRKs, "View this RK");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblGridHeader.Text = "Search Results:";
                RadGridRKs.Rebind();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtClue.Text = "";
            lblGridHeader.Text = "";
            RadGridRKs.Rebind();
        }

        protected void RadGridRKs_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            RadGridRKs.DataSource = BLL.RK.SearchRKs(txtClue.Text);
        }

        protected void RadGridRKs_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
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
                    BLL.Logger.WriteAuditLog(string.Format("{0} deleted the web RK: {1} #{2}", Page.User.Identity.Name, loginName, userId), EventCode.DeleteRK);
                }
            }
        }
    }
}