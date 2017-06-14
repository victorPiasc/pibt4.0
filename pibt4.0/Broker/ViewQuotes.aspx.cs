using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.Broker
{
    public partial class ViewQuotes : BasePage
    {
        int cartTmp
        {
            get
            {
                object cartTmp = ViewState["cart"];
                return cartTmp == null ? 0 : int.Parse(cartTmp.ToString());
            }
            set { ViewState["cart"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            setCart();
        }

        public void setCart()
        {
            ctlDashBoard1.cartId = cartTmp;
            ctlDashBoard1.display = true;
        }


        protected void quotes_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            quotes.DataSource = BLL.Broker.savedQuotes(BrokerId);
        }

        protected void quotes_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            GridDataItem gdi = (GridDataItem)e.Item;
            switch (e.CommandName)
            {
                case "view":
                    cartTmp = int.Parse(gdi["cart"].Text);
                    setCart();
                    ctlDashBoard1.pageSetup(gdi["zip"].Text);
                    break;
                case "accept":
                    quotes.Rebind();
                    break;
                case "reject":
                    quotes.Rebind();
                    break;
            }
        }
    }
}