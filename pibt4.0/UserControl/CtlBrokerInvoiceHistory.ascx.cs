using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.UserControl
{
    public partial class CtlBrokerInvoiceHistory : BaseUserControl
    {
        public string BrokerId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void invoiceHist_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            invoiceHist.DataSource = BLL.Broker.invoiceHist(BrokerId, tbSearch.Text);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            invoiceHist.Rebind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            tbSearch.Text = "";
            invoiceHist.Rebind();
        }

        public void refresh()
        {
            invoiceHist.Rebind();
        }
    }
}