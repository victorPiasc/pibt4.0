using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Pibt.BLL;
using Pibt.Model;
using System.Data;


namespace Pibt.UserControl
{
    public partial class CtlBeneficiary : System.Web.UI.UserControl
    {
        public string EmployerId;
        public string EmployeeId;
        public string oeId;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Text = "";
        }

        //Create new record
        protected void RadGrid1_ItemCommand(object source, GridCommandEventArgs e)
        {
            GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGrid1.MasterTableView.GetColumn("EditCommandColumn");
            if (e.CommandName == RadGrid.InitInsertCommandName) //"Add new" button clicked
                editColumn.Visible = false;
            else if (e.CommandName == RadGrid.RebindGridCommandName && e.Item.OwnerTableView.IsItemInserted)
                e.Canceled = true;
            else
                editColumn.Visible = !editColumn.Visible;
        }

        private bool PercentageValid(int val, string id, string coverageType)
        {
            int amount = 0;
            foreach (GridDataItem item in RadGrid1.Items)
            {
                if (item.GetDataKeyValue("ID").ToString() == id)
                    continue;
                if (item["plantypeName"].Text == coverageType)
                    amount = Convert.ToInt32(item["PERCENTAGE"].Text) + amount;
            }
            return val + amount >= 100;
        }

        protected void RadGrid1_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
            if (e.Exception != null)
                e.ExceptionHandled = true;
            else
                lblMsg.Text = Common.Utilities.FormatAlertInfo("Delete successful.");
        }

        protected void RadGrid1_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInInsertMode = true;
                e.ExceptionHandled = true;
                lblMsg.Text = Common.Utilities.FormatError("Can't update beneficiary; contact web administrator!");
            }
            else
            {
                Logger.WriteAuditLog(string.Format("{0} inserted a beneficiary to OE #{1}.", Page.User.Identity.Name, oeId), EventCode.ModifyEnrollment);
                lblMsg.Text = Common.Utilities.FormatAlertInfo("Saved successfully.");
            }
        }

        protected void RadGrid1_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                Logger.InsertLog(new WebSiteLog
                {
                    LogType = LogType.Error,
                    EventCode = EventCode.AppError,
                    EventDetails = e.Exception.Message,
                    UserName = Page.User.Identity.Name,
                    FromIP = HttpContext.Current.Request.UserHostAddress
                });
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                lblMsg.Text = Common.Utilities.FormatError("Can't update beneficiary; contact web administrator!");
            }
            else
            {
                Logger.WriteAuditLog(string.Format("{0} updated the beneficiary to the OE#{1}.", Page.User.Identity.Name, oeId), EventCode.ModifyEnrollment);
                lblMsg.Text = Common.Utilities.FormatAlertInfo("Beneficiary saved successfully!");
            }
        }

        protected void odsBeneficiary_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["updatedBy"] = HttpContext.Current.User.Identity.Name;
        }

        protected void odsBeneficiary_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["updatedBy"] = HttpContext.Current.User.Identity.Name;
            e.InputParameters["memberId"] = EmployeeId;
        }

        protected void RadGrid1_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            GridEditFormItem gde = (GridEditFormItem)e.Item;
            TextBox tbId = gde.FindControl("tbId") as TextBox;
            TextBox tbPercentage = gde.FindControl("tbPercentage") as TextBox;
            RadMaskedTextBox tbSSN = gde.FindControl("tbSSN") as RadMaskedTextBox;
            HiddenField hideSSN = gde.FindControl("hideSSN") as HiddenField;
            DropDownList ddlPlanType = gde.FindControl("ddlPlanType") as DropDownList;
            HiddenField hidePlanTypeId = gde.FindControl("hidePlanTypeId") as HiddenField;
            DropDownList ddlRelationship = gde.FindControl("ddlRelationship") as DropDownList;
            HiddenField hiddenRelationship = gde.FindControl("hiddenRelationship") as HiddenField;

            if (!PercentageValid(Convert.ToInt32(tbPercentage.Text), tbId.Text, ddlPlanType.SelectedItem.Text))
            {
               lblMsg.Text = Common.Utilities.FormatError("Please select a different benefit type.");
               e.Canceled = true;
            }
            if (!string.IsNullOrEmpty(tbSSN.Text))
                odsBeneficiary.UpdateParameters["Socsecnbr"].DefaultValue = tbSSN.Text;
            else 
            { 
               odsBeneficiary.UpdateParameters["Socsecnbr"].DefaultValue = hideSSN.Value;
               hidePlanTypeId.Value = ddlPlanType.SelectedValue;
               hiddenRelationship.Value = ddlRelationship.SelectedValue;
               odsBeneficiary.UpdateParameters["planTypeId"].DefaultValue = ddlPlanType.SelectedValue;
               odsBeneficiary.UpdateParameters["relationshipId"].DefaultValue = ddlRelationship.SelectedValue;
            }
        }

        protected void ddlPlanType_OnDataBound(object sender, EventArgs e)
        {
            DropDownList ddlPlanType = sender as DropDownList;
            HiddenField hidePlanTypeId = ddlPlanType.Parent.FindControl("hidePlanTypeId") as HiddenField;
            if (hidePlanTypeId != null && ddlPlanType.Items.FindByValue(hidePlanTypeId.Value) != null)
            {
                ddlPlanType.SelectedValue = hidePlanTypeId.Value;
            }
        }

        protected void ddlRelationship_OnDataBound(object sender, EventArgs e)
        {
            DropDownList ddlRelationship = sender as DropDownList;
            HiddenField hiddenRelationship = ddlRelationship.Parent.FindControl("HiddenRelationship") as HiddenField;
            if (hiddenRelationship != null && ddlRelationship.Items.FindByValue(hiddenRelationship.Value) != null)
            {
                ddlRelationship.SelectedValue = hiddenRelationship.Value;
            }
        }

        protected void RadGrid1_InsertCommand(object sender, GridCommandEventArgs e)
        {
            GridEditFormItem gde = (GridEditFormItem)e.Item;
            TextBox tbId = gde.FindControl("tbId") as TextBox;
            RadMaskedTextBox tbSSN = gde.FindControl("tbSSN") as RadMaskedTextBox;
            HiddenField hideSSN = gde.FindControl("hideSSN") as HiddenField;
            TextBox tbPercentage = gde.FindControl("tbPercentage") as TextBox;
            DropDownList ddlPlanType = gde.FindControl("ddlPlanType") as DropDownList;
            HiddenField hidePlanTypeId = gde.FindControl("hidePlanTypeId") as HiddenField;
            DropDownList ddlRelationship = gde.FindControl("ddlRelationship") as DropDownList;
            HiddenField hiddenRelationship = gde.FindControl("hiddenRelationship") as HiddenField;

            odsBeneficiary.InsertParameters["Socsecnbr"].DefaultValue = !string.IsNullOrEmpty(tbSSN.Text)
                ? tbSSN.Text
                : hideSSN.Value;

            if (!PercentageValid(Convert.ToInt32(tbPercentage.Text), tbId.Text, ddlPlanType.SelectedItem.Text))
            {
                lblMsg.Text = Common.Utilities.FormatError("Please select a different benefit type.");
                e.Canceled = true;
            }
            hidePlanTypeId.Value = ddlPlanType.SelectedValue;
            hiddenRelationship.Value = ddlRelationship.SelectedValue;
            odsBeneficiary.InsertParameters["planTypeId"].DefaultValue = ddlPlanType.SelectedValue;
            odsBeneficiary.UpdateParameters["relationshipId"].DefaultValue = ddlRelationship.SelectedValue;
        }

        protected void odsBeneficiary_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (Convert.ToBoolean(e.ReturnValue) == false)
                throw new Exception();
        }

        protected void odsBeneficiary_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (Convert.ToBoolean(e.ReturnValue) == false)
                throw new Exception();
        }

        public bool PrecheckBeneficiary()
        {
            if (EnrollmentForm.CheckUnavliableBeneficiary(oeId, EmployeeId))
            {
                DataTable dt = BLL.EnrollmentForm.GetOELifeCoverages(oeId);
                foreach (DataRow dr in dt.Rows)
                {
                    int amount = 0;
                    foreach (GridDataItem item in RadGrid1.Items)
                        if (item["plantypeName"].Text == dr["DESCRIPTION"].ToString())
                            amount = Convert.ToInt32(item["PERCENTAGE"].Text) + amount;
                    if (amount != 100)
                    {
                        lblMsg.Text = Common.Utilities.FormatError("Please edit percentage amount for beneficiary to total 100");
                        return false;
                    }
                }
            }
            else
            {
                lblMsg.Text = Common.Utilities.FormatError("Before continuing, a beneficiary record must be added and saved.");
                return false;
            }
            return true;
        }
    }
}