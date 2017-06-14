using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Download
{
    public partial class ExportQuotePdf1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            //TODO update this to account for new Online quote. 
            int months;
            HttpContext context = HttpContext.Current;
            string ma = context.Request.QueryString["ma"];            
            string cartid = context.Request.QueryString["cartid"];
            DateTime dt = DateTime.Today;

            if (!int.TryParse(ma, out months))
            {
                months = 0;
            }

            if (!string.IsNullOrEmpty(ma) && months != 0 && !string.IsNullOrEmpty(cartid))
            {                
                ExportGeneric.Start(new Telerik.Reporting.Processing.ReportProcessor(), new Telerik.Reporting.InstanceReportSource());               

                Reporting.OnlineQuote onlineReport = new Reporting.OnlineQuote();

                onlineReport.ReportParameters["cartId"].Value = cartid;
                onlineReport.ReportParameters["monthsAhead"].Value = ma;
                onlineReport.ReportParameters["PHIREDATE"].Value = (new DateTime(dt.AddMonths(months).Year, dt.AddMonths(months).Month, 1).ToShortDateString());
                onlineReport.ReportParameters["isPdf"].Value = "Y";

                ExportGeneric.instanceReportSource.ReportDocument = onlineReport;

                ExportGeneric.Finish(context, "attachment;filename=OnlineQuote_All.pdf");
            } 
        }
    }
}