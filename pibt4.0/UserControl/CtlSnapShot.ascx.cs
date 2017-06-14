using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.UserControl
{
    public partial class CtlSnapShot : BaseUserControl
    {
        public string BrokerId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void snapshot_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            snapshot.DataSource = BLL.Broker.invoiceSnapShot(BrokerId, tbSearch.Text);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            snapshot.Rebind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            tbSearch.Text = "";
            snapshot.Rebind();
        }

        public void refresh()
        {
            snapshot.Rebind();
        }
    }
}