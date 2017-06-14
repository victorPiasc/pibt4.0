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
    public partial class SummaryOfChanges : BasePage
    {
        public string oeId { get { return sessionVal("oeId"); } }
        public int oeType { get { return sessionValInt("OETypeId"); } }
        public bool isOeNewHire { get { return oeType == 1 || oeType == 4; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(oeId))
                    oops();
                    //NOT REACHED
                termPlans.Visible = oeType == 4;
                lFamily.Text = isOeNewHire ? "My Family" : "New Dependents";
            }
            CtlEnrollmentFormTitle1.EmployeeId = CtlCurrentCov1.EmployeeId = EmployeeId;
            CtlEnrollmentFormTitle1.EmployerId = CtlCurrentCov1.EmployerId = EmployerId;
            CtlEnrollmentFormTitle1.oeId = CtlCurrentCov1.oeId = oeId;
            CtlCurrentCov1.isOeNewHire = isOeNewHire;
            CtlCurrentCov1.type = 1;
        }

        protected void plans_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            RadGrid grid = (RadGrid)sender;
            grid.DataSource = BLL.EnrollmentForm.GetOEAvailablePlans(oeId, oeType, grid.ID.Contains("term")? 'Y':'N');
        }

        protected void BtBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/OE/LifeCoverage.aspx" + UrlBuilder(null));
        }

        protected void BtNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("/OE/Additional.aspx" + UrlBuilder(null));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SaveAndExit();
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            StartOver(oeId, User.Identity.Name, Request.UserHostAddress);
        }

        protected void plans_DataBound(object sender, EventArgs e)
        {
            foreach (GridFooterItem item in plans.MasterTableView.GetItems(GridItemType.Footer))
            {
                item["planName"].Visible = false;
                item["planType"].Visible = false;
                item["eeCount"].Visible = false;
                item["depCount"].Visible = false;
                item["effectiveDate"].Visible = false;
                item["price"].ColumnSpan = 5;
            }
        }
    }
}