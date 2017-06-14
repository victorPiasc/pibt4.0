using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Pibt;
using Pibt.BLL;
using Pibt.Model;

namespace Pibt.UserControl
{
    public partial class CtlAvailablePlans : System.Web.UI.UserControl
    {
       public string EmployerId { get; set; } 
       
       protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               if (EnrollmentForm.CheckOEWindowByErId(EmployerId))
               {
                  RadComboBox1.DataSource = BLL.Plan.GetPlanTypes(EmployerId);
                  RadComboBox1.DataBind();
               }
               else
               {
                  lb_PlanTypes.Visible = false;
                  RadComboBox1.Visible = false;
                  AvailablePlansGrid.Visible = false;
                  LabelInvalid.Visible = true;
                  LabelInvalid.Text = "<font color=red>Plan changes are only available during open enrollment. </font> <br />";
               }
            }
        }


    }
}