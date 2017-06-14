using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using System.Web.Security;
using Pibt.Common;
namespace Pibt.Employer
{
    public partial class EnrollmentFromPlanPreview : BasePage
    {
        string oeId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request["oeId"] != null)
                oeId = Request["oeId"].ToString();
            if (string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(EmployeeId) || string.IsNullOrEmpty(oeId))
                oops();
                //NOT REACHED

            if (!IsPostBack)
            {
                OeDetails oe = BLL.EnrollmentForm.GetOEDetails(oeId);
                if (oe == null)
                    oops();
                    //NOT REACHED

                ViewState["OETypeId"] = oe.TypeId;
                btnTerminate.Visible = oe.Status == OEStatus.Draft || oe.Status == OEStatus.Pending;
            }

            CtlEnrollmentFormPreview1.OEId = oeId;
            CtlEnrollmentFormPreview1.EmployeeId = EmployeeId;
            CtlEnrollmentFormPreview1.EmployerId = EmployerId;
        }

        protected void btnTerminate_Click(object sender, EventArgs e)
        {
            if (BLL.EnrollmentForm.UpdateOEStatus(oeId, OEStatus.Cancel, Page.User.Identity.Name, Request.UserHostAddress))
            {
                if (Session["OEId"] != null && Session["OEId"].ToString() == oeId)
                {
                    Session["OEId"] = null;
                    Session["OETypeId"] = null;
                }
                lblMessage.Text = "This enrollement is canceled.";
                BLL.Logger.WriteAuditLog(string.Format("{0} terminated enrollment #{1}", Page.User.Identity.Name, oeId), EventCode.CancelEnrollment);
                btnTerminate.Visible = false;
            }
        }
    }
}