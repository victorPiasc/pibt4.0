using Pibt.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.Employer
{
    public partial class Rates : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {           
            if (string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(EmployeeId) )
            {
                oops();
                return;
            }

            if (!IsPostBack)
            {                              
                plansList.DataSource = BLL.OnlineQuote.Web_QuickQuote(BLL.OnlineQuote.QQCartId, 1, 'N');
                plansList.DataBind();
            }
        }        

        protected void plansList_ItemDataBound(object sender, GridItemEventArgs e)
        {           
            if (e.Item is GridGroupHeaderItem)
            {
                GridGroupHeaderItem ght = (GridGroupHeaderItem)e.Item;
                DataRowView drv = (DataRowView)e.Item.DataItem;
                ght.DataCell.Text = drv.Row.ItemArray[0].ToString();

            }
            else if (e.Item is GridGroupFooterItem)
            { 
                GridGroupFooterItem gft = (GridGroupFooterItem)e.Item;
                if (!gft.GroupIndex.Contains("_"))
                    gft.Display = false;
            }
        }
        protected void planComparison_Click(object sender, EventArgs e)
        {
            TableCell planid;
            DateTime date = new DateTime(DateTime.Now.AddMonths(1).Year, DateTime.Now.AddMonths(1).Month,1);
            if (BLL.OnlineQuote.DeleteAllCompareCart(BLL.OnlineQuote.QQCartId) && plansList.SelectedItems.Count > 0)
            {
                foreach (GridDataItem gdi in plansList.SelectedItems)
                {
                    planid = gdi["PLANID"];
                    if (gdi.Selected && !BLL.OnlineQuote.InsertCompareCart(BLL.OnlineQuote.QQCartId, planid.Text))
                    {
                        message.Text = Common.Utilities.FormatError("Could not add plan");
                        message.Visible = true;
                        return;
                    }
                }
                Response.Redirect("/PlanDescription.aspx?date=" + date.ToShortDateString());               
            }
            message.Text = Common.Utilities.FormatError("You have not selected any plans");
            message.Visible = true;
        }

        protected void currentPlans_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            currentPlans.DataSource = BLL.Plan.GetAllCurrentPlans(EmployeeId);
        }
    }
}