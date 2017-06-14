using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Download
{
    public partial class ExportInvoiceHistory1 : ExportGeneric
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext context = HttpContext.Current;
            if (context.User.Identity.IsAuthenticated)
            {
                string employerId = ErId(context);
                string invoiceNbr = context.Request.QueryString["invoiceNbr"];
                int nInvoice, nEmployer;

                if (!string.IsNullOrEmpty(employerId) && !string.IsNullOrEmpty(invoiceNbr) && int.TryParse(employerId, out nEmployer) &&
                    int.TryParse(invoiceNbr, out nInvoice) && Pibt.BLL.Employer.ValidateInvoiceId(nEmployer, nInvoice))
                {
                    Start();

                    Reporting.InvoiceHistReport report = new Reporting.InvoiceHistReport();
                    report.ReportParameters["pEmployerId"].Value = employerId;
                    report.ReportParameters["pInvoiceNbr"].Value = invoiceNbr;
                    instanceReportSource.ReportDocument = report;

                    Finish(context, "attachment;filename=InvoiceHistory_" + employerId + ".pdf");
                }
            }
        }
    }
}