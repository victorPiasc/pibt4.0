using CrystalDecisions.CrystalReports.Engine;
using Pibt.Common;
using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Download
{
    public partial class ExportCustomEnrollment : ExportGeneric
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext context = HttpContext.Current;
            try
            {
                if (context.User.Identity.IsAuthenticated)
                {
                    string type = Request.QueryString["type"];
                    if (!string.IsNullOrEmpty(EmployerId) && !string.IsNullOrEmpty(type))
                    {
                        int cartId = BLL.OnlineQuote.QQCartId;
                        BLL.EnrollmentForm.prepEnrollmentForm(cartId, BLL.OnlineQuote.oeEnddate(EmployerId) , EmployerId,type);
                        ReportDocument cr = new ReportDocument();
                        cr.Load("\\\\PIASC-FS\\ldrive\\bms5\\REPORTS\\enrollmentForm.rpt");
                        cr.SetParameterValue("CartID", cartId);
                        if (ApplicationConfiguration.IsTestServer)
                            cr.DataSourceConnections[0].SetConnection("VMTEST9_ODBC.WORLD", "VMTEST9_ODBC.WORLD", "pia_admin", "poster");
                        else
                            cr.DataSourceConnections[0].SetConnection("WEBORACLELIVE.WORLD", "WEBORACLELIVE.WORLD", "pia_admin", "poster");
                        cr.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "EnrollmentFormCustom");
                    }
                    else
                        oops();
                }
            }
            //TODO unknown exception caught. C# cannot evaluate error. Happens after download has occured. 
            catch (Exception ex)
            {
                BLL.Logger.InsertLog(new WebSiteLog
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