using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pibt.Download
{
    /// <summary>
    /// Summary description for ExportQuotePdf
    /// </summary>
    public class ExportQuotePdf: ExportGeneric
    {
        public override void ProcessRequest(HttpContext context)
        {
            string zip = context.Request.QueryString["zip"];
            string count = context.Request.QueryString["count"];
            string ma = context.Request.QueryString["ma"];
            string ep = context.Request.QueryString["ep"];
            string ea = context.Request.QueryString["ea"];
            string dp = context.Request.QueryString["dp"];
            string da = context.Request.QueryString["da"];
            string plantypeId = context.Request.QueryString["ptid"];
            string date = context.Request.QueryString["date"];
            string formtype = context.Request.QueryString["formtype"];
            string isPdf = context.Request.QueryString["isPDF"];

            if (!string.IsNullOrEmpty(zip) && !string.IsNullOrEmpty(count) && !string.IsNullOrEmpty(ma) && !string.IsNullOrEmpty(ep) &&
                !string.IsNullOrEmpty(ea) && !string.IsNullOrEmpty(dp) && !string.IsNullOrEmpty(da) && !string.IsNullOrEmpty(plantypeId) &&
                !string.IsNullOrEmpty(date) && !string.IsNullOrEmpty(formtype) && !string.IsNullOrEmpty(isPdf))
            {
                string cartid = context.Request.QueryString["cartid"];
                string pdfName = null;

                Start();

                if (formtype.Equals("1"))
                {
                    Reporting.OnlineQuotes onlineReport = new Reporting.OnlineQuotes();

                    if (!string.IsNullOrEmpty(context.Request.QueryString["rowid"]))
                    {                           
                        onlineReport.ReportParameters["rowid"].Value = context.Request.QueryString["rowid"];                            
                    }

                    onlineReport.ReportParameters["cartId"].Value = cartid;
                    onlineReport.ReportParameters["depAmount"].Value = da;
                    onlineReport.ReportParameters["depPercent"].Value = dp;
                    onlineReport.ReportParameters["eeAmount"].Value = ea;
                    onlineReport.ReportParameters["eePercent"].Value = ep;
                    onlineReport.ReportParameters["employerCount"].Value = count;
                    onlineReport.ReportParameters["employerZip"].Value = zip;
                    onlineReport.ReportParameters["monthsAhead"].Value = ma;
                    onlineReport.ReportParameters["planTypeId"].Value = plantypeId;
                    onlineReport.ReportParameters["PHIREDATE"].Value = date;
                    onlineReport.ReportParameters["isPdf"].Value = isPdf;

                    pdfName = "attachment;filename=OnlineQuote_Employee.pdf";

                    instanceReportSource.ReportDocument = onlineReport;
                }
                else
                {
                    Reporting.OnlineQuote onlineReport = new Reporting.OnlineQuote();

                    onlineReport.ReportParameters["cartId"].Value = cartid;
                    onlineReport.ReportParameters["depAmount"].Value = da;
                    onlineReport.ReportParameters["depPercent"].Value = dp;
                    onlineReport.ReportParameters["eeAmount"].Value = ea;
                    onlineReport.ReportParameters["eePercent"].Value = ep;
                    onlineReport.ReportParameters["employerCount"].Value = count;
                    onlineReport.ReportParameters["employerZip"].Value = zip;
                    onlineReport.ReportParameters["monthsAhead"].Value = ma;
                    onlineReport.ReportParameters["planTypeId"].Value = plantypeId;
                    onlineReport.ReportParameters["PHIREDATE"].Value = date;
                    onlineReport.ReportParameters["isPdf"].Value = isPdf;
                    onlineReport.ReportParameters["rowid"].Value = null;

                    pdfName = "attachment;filename=OnlineQuote_All.pdf";

                    instanceReportSource.ReportDocument = onlineReport;
                }

                Finish(context, pdfName);
            }            
        }
    }
}