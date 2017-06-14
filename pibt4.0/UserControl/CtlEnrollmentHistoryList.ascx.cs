using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using Telerik.Web.UI;
using Pibt.Common;
using System.Web.Security;


namespace Pibt.UserControl
{
    public partial class CtlEnrollmentHistoryList : System.Web.UI.UserControl
    {
        public UserRoles Role { get; set; }
        public string EmployerId { get; set; }
        public string EmployeeId { get; set; }

        protected void binder(object sender, GridItemEventArgs e) {
            Pibt.BasePage.binderLow(e, EnrollmentHistoryGrid, "View this form");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
                btnSearch_Click(sender, e);
            else {
                DefaultFields();
                PlaceHolder1.Visible = Role != UserRoles.Employee;
                PlaceHolder2.Visible = !(Role == UserRoles.Employee || Role == UserRoles.Employer);
                dtPickerStart.SelectedDate = DateTime.Parse(string.Format("{0}/01 {1}", DateTime.Now.Month, DateTime.Now.Year));
            }
            lblMessage.Text = "";
            Utilities.TieButton(Page, txtEmployerId, btnSearch);
            Utilities.TieButton(Page, txtEmployeeId, btnSearch);
        }

        protected void EnrollmentHistoryGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (Role == UserRoles.Employee) {
                EnrollmentHistoryGrid.Columns[3].Visible = false;
                EnrollmentHistoryGrid.Columns[4].Visible = false;
            }
            if (Role==UserRoles.Employee || Role==UserRoles.Employer) {
                EnrollmentHistoryGrid.Columns[1].Visible = false;
                EnrollmentHistoryGrid.Columns[2].Visible = false;
                EnrollmentHistoryGrid.MasterTableView.CommandItemDisplay = GridCommandItemDisplay.None;
            }
            EnrollmentHistoryGrid.DataSource = BLL.EnrollmentForm.SearchEnrollmentForms(
                (Role==UserRoles.Employee || Role==UserRoles.Employer) ? EmployerId : txtEmployerId.Text,
                Role==UserRoles.Employee ? EmployeeId : txtEmployeeId.Text,
                StatusCombo.SelectedValue,
                OETypesCombo.DefaultItem.Selected ? null : OETypesCombo.SelectedValue,
                dtPickerStart.SelectedDate,
                dtPickerEnd.SelectedDate);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                lblGridHeader.Text = "Search Results:";
                EnrollmentHistoryGrid.Rebind();
            }
        }

        protected void DefaultFields() {
            txtEmployerId.Text = EmployerId==null ? "" : EmployerId;
            txtEmployeeId.Text = EmployeeId==null ? "" : EmployeeId;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblGridHeader.Text = "";
            DefaultFields();
            OETypesCombo.DefaultItem.Selected = true;
            dtPickerStart.SelectedDate = null;
            dtPickerEnd.SelectedDate = null;

            EnrollmentHistoryGrid.Rebind();
        }
    }
}