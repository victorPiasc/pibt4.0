using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Employer
{
    public partial class InvoiceReportChart : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ReportViewer1_Load(object sender, EventArgs e)
        {
            Telerik.Reporting.InstanceReportSource instanceReportSource1 = new Telerik.Reporting.InstanceReportSource();
            Reporting.InvoiceReportChart report1 = new Reporting.InvoiceReportChart();
            report1.ReportParameters["EmployerId"].Value = EmployerId;
            instanceReportSource1.ReportDocument = report1;

            ReportViewer1.ReportSource = instanceReportSource1;

        }
    }
}