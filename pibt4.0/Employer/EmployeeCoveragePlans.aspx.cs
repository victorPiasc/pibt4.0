using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.Employer
{
    public partial class EmployeeCoveragePlans : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnSearch_Click(null, null);
        }

        protected void binder(object sender, GridItemEventArgs e) {
            binderLow(e, PlansGrid, "View this employee");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblGridHeader.Text = "Seach Results:";
            PlansGrid.Rebind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblGridHeader.Text = "";
            txtPlanName.Text = "";
            txtEmployeeName.Text = "";
            PlansGrid.Rebind();
        }

        protected void odsSearchPlans_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            if (lblGridHeader.Text != "")
            {
                e.InputParameters["erId"] = EmployerId;
                e.InputParameters["eeId"] = null;
                e.InputParameters["planId"] = null;
                e.InputParameters["eeName"] = txtEmployeeName.Text.Trim();
                e.InputParameters["planName"] = txtPlanName.Text.Trim();
               e.InputParameters["effectivedate"] = null;
               e.InputParameters["expirydate"] = null;
            }
        }
    }
}