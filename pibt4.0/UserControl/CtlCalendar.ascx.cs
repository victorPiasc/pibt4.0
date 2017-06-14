using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.UserControl
{
    public partial class CtlCalendar : System.Web.UI.UserControl
    {
        public string BrokerId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                setDates();
        }

        protected void search_Click(object sender, EventArgs e)
        {
            events.Rebind();
        }

        protected void ddlTime_SelectedIndexChanged(object sender, EventArgs e)
        {
            events.Rebind();
        }

        public void setDates()
        {
            start.SelectedDate = DateTime.Today;
            end.SelectedDate = DateTime.Today.AddMonths(1);
        }

        protected void clear_Click(object sender, EventArgs e)
        {
            tbSearch.Text = "";
            setDates();
        }

        protected void events_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            events.DataSource = BLL.Broker.futureRenewals(BrokerId, int.Parse(ddlType.SelectedValue), tbSearch.Text, start.SelectedDate, end.SelectedDate);
        }
    }
}