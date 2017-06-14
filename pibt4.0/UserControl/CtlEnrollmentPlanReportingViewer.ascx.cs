using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;

namespace Pibt.UserControl
{
    public partial class CtlEnrollmentPlanReportingViewer : System.Web.UI.UserControl
    {
        public UserRoles Role { get; set; }
        public string OEId { get; set; }
        public string EmployerId { get; set; }
        public string EmployeeId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ReportViewer1_Load(object sender, EventArgs e)
        {
            Telerik.Reporting.InstanceReportSource instanceReportSource1 = new Telerik.Reporting.InstanceReportSource();
            if (Role == UserRoles.Administrator)
            {
                Reporting.EnrollmentFormPreviewForAdmin report1 = new Reporting.EnrollmentFormPreviewForAdmin();
                report1.ReportParameters["oeId"].Value = OEId;
                report1.ReportParameters["employerId"].Value = EmployerId;
                report1.ReportParameters["memberId"].Value = EmployeeId;
                instanceReportSource1.ReportDocument = report1;
            }
            else
            {
                Reporting.EnrollmentFormPreview report2 = new Reporting.EnrollmentFormPreview();
                report2.ReportParameters["oeId"].Value = OEId;
                report2.ReportParameters["employerId"].Value = EmployerId;
                report2.ReportParameters["memberId"].Value = EmployeeId;
                instanceReportSource1.ReportDocument = report2;
            }
            ReportViewer1.ReportSource = instanceReportSource1;

        }

    }
}