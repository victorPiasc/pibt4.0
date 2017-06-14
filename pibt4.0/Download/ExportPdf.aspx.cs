using Pibt.BLL;
using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Download
{
    public partial class ExportPdf1 : ExportGeneric
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext context = HttpContext.Current;
            if (context.User.Identity.IsAuthenticated)
            {
                try
                {

                    string oeId = context.Request.QueryString["oeId"];
                    string employerId = ErId(context);
                    string eeId = EeId(context);
                    if (!string.IsNullOrEmpty(oeId) && !string.IsNullOrEmpty(employerId) && !string.IsNullOrEmpty(eeId))
                    {
                        Start();
                        Reporting.EnrollmentFormPreview report1 = new Reporting.EnrollmentFormPreview();
                        report1.ReportParameters["oeId"].Value = oeId;
                        report1.ReportParameters["employerId"].Value = employerId;
                        report1.ReportParameters["memberId"].Value = eeId;
                        report1.BindControls(oeId);
                        instanceReportSource.ReportDocument = report1;
                        Finish(context, "attachment;filename=EnrollmentFormView.pdf");
                    }
                }
                catch (Exception ex)
                {
                    Logger.InsertLog(new WebSiteLog
                    {
                        LogType = LogType.Error,
                        EventCode = EventCode.AppError,
                        EventDetails = ex.Message,
                        UserName = context.User.Identity.Name,
                        FromIP = HttpContext.Current.Request.UserHostAddress
                    });
                }
            }
        }

    }
}