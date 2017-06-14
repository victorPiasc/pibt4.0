using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.BLL;
using Telerik.Web.UI;
using Pibt.Model;

namespace Pibt.OE
{
    public partial class TerminateForm : BasePage
    {
        public string oeId { get { return sessionVal("oeId"); } }
        public int oeType { get { return sessionValInt("OETypeId"); } } 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(oeId) || string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(EmployeeId))
                oops();

            if (!IsPostBack)
            {
                dtExpiryDate.Items.Add(new RadComboBoxItem("--Select--", "0"));
                dtExpiryDate.Items.Add(new RadComboBoxItem(DateTime.Parse(DateTime.Now.Date.AddMonths(1).ToString("MM/01/yyyy")).AddDays(-1).ToString("MM/dd/yyyy"), "1"));
                dtExpiryDate.Items.Add(new RadComboBoxItem(DateTime.Parse(DateTime.Now.Date.AddMonths(2).ToString("MM/01/yyyy")).AddDays(-1).ToString("MM/dd/yyyy"), "2"));
            }

            //set user controls
            CtlEnrollmentFormTitle1.EmployeeId = EmployeeId;
            CtlEnrollmentFormTitle1.EmployerId = EmployerId;
            CtlEnrollmentFormTitle1.oeId = oeId;
            lblMsg.Text = "";
        }

        protected void RadGridPlans_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            //if it is a "Plan Termination" form
            RadGridPlans.DataSource = oeType == 3 && !string.IsNullOrEmpty(Request["planId"]) && Session["tmpMemberId"] != null
                ? Plan.GetEEActivePlansByPlanId(Session["tmpMemberId"].ToString(), Request["planId"].ToString())
                : Plan.GetEEActivePlans(EmployeeId);
        }

        protected void BtBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Employer/EmployeeInfo.aspx" + UrlBuilder(null));
        }

        protected void BtNext_Click(object sender, EventArgs e)
        {
            if (dpReason.SelectedValue == "0" || dpReason.SelectedValue == "")
            {
                lblMsg.Text = Common.Utilities.FormatError("Please select a termination reason.");
                return;
            }

            if (dtExpiryDate.SelectedValue.Equals("0"))
            {
                lblMsg.Text = Common.Utilities.FormatError("Please select a termination date.");
                return;
            }

            EnrollmentForm.DeleteOETerminatePlans(oeId);

            foreach (GridDataItem Item in RadGridPlans.Items)
            {
                if (!Plan.CopyMemberPlansToOEPlans(oeId, Item.GetDataKeyValue("Memberplanid").ToString(), Convert.ToDateTime(dtExpiryDate.SelectedItem.Text), dpReason.SelectedValue, HttpContext.Current.User.Identity.Name))
                {
                    lblMsg.Text = Common.Utilities.FormatError("Operation failed for " + Item["planname"].Text + ". Please contact administrator.");
                    return;
                }
            }

            Response.Redirect("/OE/LegalDocs.aspx" + UrlBuilder(null));
        }

        protected void dpReason_DataBound(object sender, EventArgs e)
        {
            OeDetails oe = BLL.EnrollmentForm.GetOEDetails(oeId);
            if (oe != null && dpReason.Items.FindItemByValue(oe.TreasonId) != null)
            {
                dpReason.SelectedValue = oe.TreasonId;
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            if (BLL.EnrollmentForm.UpdateOEStatus(oeId, OEStatus.Cancel, Page.User.Identity.Name, Request.UserHostAddress))
            {
                Session["OEId"] = null;
                Session["OETypeId"] = null;
                BLL.Logger.WriteAuditLog(string.Format("{0} canceled enrollment #{1}", Page.User.Identity.Name, oeId), EventCode.CancelEnrollment);
                Response.Redirect("/default.aspx");
            }
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            StartOver(oeId, User.Identity.Name, Request.UserHostAddress);
        }
    }
}