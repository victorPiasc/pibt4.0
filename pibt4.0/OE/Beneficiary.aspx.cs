using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


namespace Pibt.OE
{
    public partial class Beneficiary : BasePage
    {
        public string oeId { get { return sessionVal("oeId"); } }
        public int planType { get { return int.Parse(Session["life"].ToString()); } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployeeId) || string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(oeId))
                oops();
                //NOT REACHED
            CtlEnrollmentFormTitle1.EmployeeId = EmployeeId;
            CtlEnrollmentFormTitle1.EmployerId = EmployerId;
            CtlEnrollmentFormTitle1.oeId = oeId;
            if (!IsPostBack)
                lifeType.Text = planType == 6 ? "Voluntary " : "Medical ";
        }

        protected void BtNext_Click(object sender, EventArgs e)
        {
            double percent=0;
            foreach (GridDataItem item in beneficiaries.Items)
                percent += double.Parse(item["percentage"].Text);
            if (percent != 100)
            {
                lbNoCoverage.Text = Common.Utilities.FormatError("The total percent of all the beneficiaries for " + (planType == 6 ? "Voluntary " : "Medical ") + " Life must be 100%");
                return;
            }
            Response.Redirect("/OE/LifeCoverage.aspx" + UrlBuilder(null));
        }

        protected void BtBack_Click(object sender, EventArgs e)
        {
            BLL.EnrollmentForm.updateBenTable(oeId, EmployeeId, planType, true);
            Response.Redirect("/OE/LifeCoverage.aspx" + UrlBuilder(null));
        }

        protected void beneficiaries_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            beneficiaries.DataSource = BLL.EnrollmentForm.GetOEBeneficiary(EmployeeId, planType);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(benId.Value))
                BLL.EnrollmentForm.InsertOEBeneficiary(EmployeeId, tbLastName.Text, tbFirstName.Text, tbMiddle.Text, tbSSN.Text, tbAddress1.Text, tbCity.Text, ddlState.SelectedValue, tbZip.Text, planType.ToString(), ddlRelationship.SelectedValue, tbPercentage.Text, User.Identity.Name);
            else
                BLL.EnrollmentForm.UpdateOEBeneficiary(benId.Value, tbLastName.Text, tbFirstName.Text, tbMiddle.Text, tbSSN.Text, tbAddress1.Text, tbCity.Text, ddlState.SelectedValue, tbZip.Text, planType.ToString(), ddlRelationship.SelectedValue, tbPercentage.Text, User.Identity.Name);
            beneficiaries.Rebind();
            clearAll();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearAll();
        }

        protected void beneficiaries_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (GridDataItem)e.Item;
            object tmp = item.GetDataKeyValue("rId");
            switch (e.CommandName)
            {
                case "edit1":
                    fillAll(tmp.ToString());
                    break;
                case "delete":

                    BLL.EnrollmentForm.DeleteBeneficiary(tmp.ToString());
                    break;
                default:
                    break;
            }
        }

        public void fillAll(string bId)
        {
            benId.Value = bId;
            btnUpdate.Text = "Update";
            btnCancel.Text = "Cancel Update";
            string [] arr = BLL.EnrollmentForm.getSingleBeneficiary(bId);
            tbFirstName.Text = arr[0];
            tbMiddle.Text = arr[1];
            tbLastName.Text = arr[2];
            tbSSN.Text = arr[3];
            tbAddress1.Text = arr[4];
            tbCity.Text = arr[5];
            ddlState.SelectedValue = arr[6];
            tbZip.Text = arr[7];
            ddlRelationship.SelectedValue = arr[8];
            tbPercentage.Text = arr[9];
        }

        public void clearAll()
        {
            benId.Value = "";
            btnUpdate.Text = "Add";
            btnCancel.Text = "Cancel Add";
            tbFirstName.Text = "";
            tbMiddle.Text = "";
            tbLastName.Text = "";
            tbSSN.Text = "";
            tbAddress1.Text = "";
            tbCity.Text = "";
            ddlState.SelectedValue = "";
            tbZip.Text = "";
            ddlRelationship.SelectedValue = "";
            tbPercentage.Text = "";
        }
    }
}