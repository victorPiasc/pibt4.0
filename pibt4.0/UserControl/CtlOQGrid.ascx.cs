using Pibt.Common;
using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.UserControl
{
    public partial class CtlOQGrid : System.Web.UI.UserControl
    {
        public UserCacheInfo user { get; set; } 
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void tbNew_Click(object sender, EventArgs e)
        {
            int cartid = BLL.OnlineQuote.ForceNewCartId();
            Response.Redirect("~/OnlineQuoteEmployer.aspx");

        }

        protected void trQuotesGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {              
            trQuotesGrid.DataSource = BLL.OnlineQuote.getQQSavedQuotes(user.LoginName);
        }

        protected void tbSearch_Click(object sender, EventArgs e)
        {
            
            trQuotesGrid.DataSource = BLL.OnlineQuote.searchSavedQuotes(tbQuoteName.Text);
            trQuotesGrid.DataBind();
        }

        protected void tbClear_Click(object sender, EventArgs e)
        {
            tbQuoteName.Text = "";
            trQuotesGrid.Rebind();
        }

        protected void trQuotesGrid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
                int cartID = int.Parse(dataItem.GetDataKeyValue("CARTID").ToString());
                BLL.OnlineQuote.SetCookie(cartID);
                HttpContext.Current.Session["QQ_CartID"] = dataItem.GetDataKeyValue("CARTID").ToString();
                Response.Redirect("~/OnlineQuoteEmployee.aspx");
            }
        }

        
      
    }
}