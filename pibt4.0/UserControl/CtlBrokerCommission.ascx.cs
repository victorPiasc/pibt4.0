using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.UserControl
{
    public partial class CtlBrokerCommission : BaseUserControl
    {
        public string BrokerId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void commHist_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            commHist.DataSource = BLL.Broker.commHist(BrokerId, tbSearch.Text);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            commHist.Rebind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            tbSearch.Text = "";
            commHist.Rebind();
        }

        public void refresh()
        {
            commHist.Rebind();
        }
    }
}