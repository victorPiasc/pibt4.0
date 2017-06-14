using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Pibt.BLL;
using Pibt.Model;

namespace Pibt.Download {
    public abstract class ExportGeneric: BasePage {
        public static Telerik.Reporting.Processing.ReportProcessor reportProcessor;
        public static Telerik.Reporting.InstanceReportSource instanceReportSource;
        public UserCacheInfo userInfo;

        public void Start() {
            Start(new Telerik.Reporting.Processing.ReportProcessor(), new Telerik.Reporting.InstanceReportSource());
        }

        public static void Start(Telerik.Reporting.Processing.ReportProcessor rp, Telerik.Reporting.InstanceReportSource irs)
        {
            reportProcessor = rp;
            instanceReportSource = irs;
        }
        public void Finish( string where) {
            Finish(HttpContext.Current, where);
        }

        public static void Finish(HttpContext context, string where)
        {
            //TODO this try catched an error that it cannot evaluate. Check inner messages for error
            try
            {
                Telerik.Reporting.Processing.RenderingResult result = reportProcessor.RenderReport("PDF", instanceReportSource, null);
                context.Response.Clear();
                context.Response.Buffer = true;
                context.Response.Charset = "utf-8";
                context.Response.AddHeader("Content-Disposition", where);
                context.Response.ContentEncoding = System.Text.Encoding.GetEncoding("utf-8");
                context.Response.ContentType = result.MimeType;
                context.Response.BinaryWrite(result.DocumentBytes);
                context.Response.End();
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
        public string ErId(HttpContext context) {
            userInfo = (UserCacheInfo)context.Session["UserCacheInfo"];
            return (userInfo.UserRole==UserRoles.Administrator || userInfo.UserRole==UserRoles.Agent || userInfo.UserRole==UserRoles.Broker ||
                userInfo.UserRole==UserRoles.RK) ? context.Request.QueryString["erId"] : userInfo.EmployerId;
        }

        // Can only be called after a cakk to ErId
        public string EeId(HttpContext context) {
            userInfo = (UserCacheInfo)context.Session["UserCacheInfo"];
            return (userInfo.UserRole==UserRoles.Administrator || userInfo.UserRole==UserRoles.Agent || userInfo.UserRole==UserRoles.Broker ||
                userInfo.UserRole==UserRoles.RK || userInfo.UserRole==UserRoles.Employer) ? context.Request.QueryString["eeId"] : userInfo.EmployeeId;
        }

    }
}