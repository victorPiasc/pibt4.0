using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pibt.Download
{
    /// <summary>
    /// Summary description for ExportBenefitsPdf
    /// </summary>
    public class ExportBenefitsPdf: ExportGeneric
    {
        // TODO(Victor) not ready - was checked in by accident - this code cannot be tested as there are some issues retreiving the plan comparisons
        public override void ProcessRequest(HttpContext context) 
        {
            string cartid = context.Request.QueryString["cartid"];
            string date = context.Request.QueryString["date"];

            if (!string.IsNullOrEmpty(cartid) && !string.IsNullOrEmpty(date))
            {
                Start();

                // TODO(Victor) Reporting.BenefitsDescReport benefitsReport = new Reporting.BenefitsDescReport();
                // TODO(Victor) benefitsReport.ReportParameters["cartid"].Value = cartid;
                // TODO(Victor) benefitsReport.ReportParameters["date"].Value = date;

                // TODO(Victor) instanceReportSource.ReportDocument = benefitsReport;

                Finish(context, "attachment;filename=BenefitComparison.pdf");
            }
        }
    }
}