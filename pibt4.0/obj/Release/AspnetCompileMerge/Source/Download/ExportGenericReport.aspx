<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExportGenericReport.aspx.cs" Inherits="Pibt.Download.ExportGenericReport" %>
<%--using CrystalDecisions.CrystalReports.Engine;
using Pibt.Common;
using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Download
{
    public partial class ExportGenericReport : ExportGeneric
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContext context = HttpContext.Current;
            try
            {
                if (context.User.Identity.IsAuthenticated)
                {
                    string reportNum = Request.QueryString["num"];
                    string date = Request.QueryString["date"];
                    DateTime paramDate;
                    if (!DateTime.TryParse(date, out paramDate))
                        paramDate = DateTime.Today;
                    if (!string.IsNullOrEmpty(EmployerId) && !string.IsNullOrEmpty(reportNum))
                    {
                        string cartId = BLL.OnlineQuote.QQCartId;
                        string reportName="null";
                        Renewal tmp;
                        ReportDocument cr = new ReportDocument();
                        //using switch so that i can just add cases for different reports
                        switch (reportNum)
                        {
                            case "1":
                                string type = Request.QueryString["type"];
                                BLL.EnrollmentForm.prepEnrollmentForm(cartId, paramDate, EmployerId, string.IsNullOrEmpty(type) ? "2" : type);
                                cr.Load("\\\\PIASC-FS\\ldrive\\bms5\\REPORTS\\enrollmentForm.rpt");
                                cr.SetParameterValue("CartID", cartId);
                                reportName = EmployerId + "_CustomEnrollmentForm";
                                break;
                            case "2":
                                BLL.EnrollmentForm.prepPaForm(cartId, EmployerId, paramDate);
                                cr.Load("\\\\PIASC-FS\\ldrive\\bms5\\REPORTS\\paForm.rpt");
                                //cr.Load("\\\\PIASC-FS\\ldrive\\bms5\\REPORTS\\testPaForm.rpt");
                                cr.SetParameterValue("CartID", cartId);
                                reportName = EmployerId + "_PaForm";
                                break;
                            case "3":
                                tmp = BLL.Employer.getUnfinishedRenewalId(EmployerId);
                                BLL.EnrollmentForm.prepRenewalOverview(tmp.cartId);
                                cr.Load("\\\\PIASC-FS\\ldrive\\bms5\\REPORTS\\renewalOverview.rpt");
                                cr.SetParameterValue("CartID", tmp.cartId);
                                reportName = EmployerId + "_RenewalOverview";
                                break;
                            default:
                                tmp = BLL.Employer.getUnfinishedRenewalId(EmployerId);
                                BLL.EnrollmentForm.prepRenewalAtoA(tmp.cartId, EmployerId);
                                cr.Load("\\\\PIASC-FS\\ldrive\\bms5\\REPORTS\\renewalAToA.rpt");
                                cr.SetParameterValue("pCartId", tmp.cartId);
                                reportName = EmployerId + "_RenewalComparison";
                                break;
                        }
                        if (ApplicationConfiguration.IsTestServer)
                            cr.DataSourceConnections[0].SetConnection("VMTEST9_ODBC.WORLD", "VMTEST9_ODBC.WORLD", "pia_admin", "poster");
                        else
                            cr.DataSourceConnections[0].SetConnection("WEBORACLELIVE.WORLD", "WEBORACLELIVE.WORLD", "pia_admin", "poster");
                        cr.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, reportName);
                    }
                    else
                        oops();
                }
            }
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
}--%>