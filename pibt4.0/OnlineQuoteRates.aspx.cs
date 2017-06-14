using System;
using System.Data;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Pibt.Model;
using Pibt.BLL;
using System.Timers;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Drawing;

namespace Pibt
{
    public partial class OnlineQuoteRates : SortaBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int zip = BLL.OnlineQuote.GetEmployerZip(BLL.OnlineQuote.QQCartId);
            if (zip == 0)
                Response.Redirect("/OnlineQuoteEmployer.aspx");
            if (!IsPostBack)
                dashBoard.pageSetup(zip.ToString());
            dashBoard.cartId = BLL.OnlineQuote.QQCartId;
            dashBoard.display = false;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (dashBoard.validatePage())
                Response.Redirect("/OnlineQuoteOverview.aspx");

        }
    }
}