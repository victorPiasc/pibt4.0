using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;

namespace Pibt.UserControl
{
    public partial class CtlAdditionalInfoView : System.Web.UI.UserControl
    {
        public string EmployerId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetUpPage();
            }
        }

        protected void odsEmployer_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters[0] = EmployerId;
        }
        public void SetUpPage()
        {
            DataTable dt = BLL.Employer.GetPlantypeContribution(EmployerId);
            DataTable dt2 = BLL.Employer.getContribution(EmployerId);
            //DataRow[] dr = new DataRow[11];
            int tmp;
            foreach (DataRow r in dt.Rows)
            {
                tmp = int.Parse(r.ItemArray[0].ToString());
                tmp = tmp == 8 ? tmp - 3 : tmp;
                (this.FindControl("left_" + tmp) as Label).Text = r.ItemArray[1] != null ? r.ItemArray[1].ToString() : dt2.Rows[0].ItemArray[0].ToString();
                (this.FindControl("right_" + tmp) as Label).Text = r.ItemArray[2] != null ? r.ItemArray[2].ToString() : dt2.Rows[0].ItemArray[1].ToString();
                (this.FindControl("middle_" + tmp) as CheckBox).Checked = r.ItemArray[4].ToString().Equals("Y") ? true : false;

                ViewState["plantype_" + (tmp-1)] = r.ItemArray[3];
            }
        }
    }
}