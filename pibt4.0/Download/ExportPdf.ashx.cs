using Pibt.BLL;
using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace Pibt.Download
{
    /// <summary>
    /// Summary description for ExportPdf
    /// </summary>
    public class ExportPdf : ExportGeneric
    {
        public override void ProcessRequest(HttpContext context)
        {
            try
            {
                if (context.User.Identity.IsAuthenticated)
                {
                    string oeId = context.Request.QueryString["oeId"];
                    string employerId = ErId(context);
                    string eeId = EeId(context);
                    string oeTypeId = context.Request.QueryString["oeTypeId"];
                    if (!string.IsNullOrEmpty(oeId) && !string.IsNullOrEmpty(employerId) && !string.IsNullOrEmpty(eeId))
                    {
                        Start();
                        if (oeTypeId == "3")
                        {
                            Reporting.EnrollmentFormTerminatePreview reportForTerminate = new Reporting.EnrollmentFormTerminatePreview();
                            reportForTerminate.ReportParameters["oeId"].Value = oeId;
                            reportForTerminate.ReportParameters["employerId"].Value = employerId;
                            reportForTerminate.ReportParameters["memberId"].Value = eeId;
                            reportForTerminate.BindControls(oeId);
                            instanceReportSource.ReportDocument = reportForTerminate;
                        }
                        else
                        {
                            Reporting.EnrollmentFormPreview report1 = new Reporting.EnrollmentFormPreview();
                            report1.ReportParameters["oeId"].Value = oeId;
                            report1.ReportParameters["employerId"].Value = employerId;
                            report1.ReportParameters["memberId"].Value = eeId;
                            report1.BindControls(oeId);
                            instanceReportSource.ReportDocument = report1;
                        }

                        Finish(context, "attachment;filename=EnrollmentFormView.pdf");
                    }
                }
            }
            catch (Exception e)
            {
                Logger.InsertLog(new WebSiteLog
                {
                    LogType = LogType.Error,
                    EventCode = EventCode.AppError,
                    EventDetails = e.Message,
                    UserName = context.User.Identity.Name,
                    FromIP = HttpContext.Current.Request.UserHostAddress
                });
            }
        }
    }
}