using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Pibt.Broker
{
    public partial class BrokerCalendar : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            page1.BrokerId = BrokerId;
        }
    }
}