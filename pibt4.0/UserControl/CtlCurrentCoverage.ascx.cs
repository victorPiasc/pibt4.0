using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.UserControl
{
    public partial class CtlCurrentCoverage : System.Web.UI.UserControl
    {
        public string EmployerId;
        public string EmployeeId;
        public string oeId;
        public bool isOeNewHire;
        public int type;

        protected void Page_Load(object sender, EventArgs e)
        {
            summary.Columns[6].Visible = isOeNewHire;
        }

        protected void summary_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            DataTable dt = BLL.Plan.GetPlanTypes(EmployerId);
            if (dt.Rows.Count < 1)
                 BasePage.oops(HttpContext.Current);
            foreach (DataRow dr in dt.Rows)
            {
                GridColumn dc = summary.Columns.FindByUniqueName("col_" + dr.ItemArray[0].ToString());
                if (!dc.Display)
                    dc.Display = true;
            }
            summary.DataSource = BLL.EnrollmentForm.summaryOfCensus(oeId, EmployeeId, type);
        }
    }
}