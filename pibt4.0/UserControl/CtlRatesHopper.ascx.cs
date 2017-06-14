using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.UserControl
{
   public partial class CtlRatesHopper : System.Web.UI.UserControl
   {
      public string EmployerId { get; set; }
      public UserRoles Role { get; set; }
      public string UserId { get; set; }

      protected void Page_Load(object sender, EventArgs e)
      {
          
      }

      protected void PlanTypeGrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
      {
         //PlanTypeGrid.DataSource = BLL.Plan.GetPlanTypesByErId(EmployerId);
      }

      protected void CurrentPlanGrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
      {
         object obj = PlanTypeGrid.SelectedValue;
         if (obj != null)
         {
            CurrentPlanGrid.DataSource = BLL.Plan.GetCurrentPlans(obj.ToString(), EmployerId);
         }
         else
         {
            CurrentPlanGrid.DataSource = null;
         }
      }

      protected void PlanTypeGrid_SelectedIndexChanged(object sender, EventArgs e)
      {
         CurrentPlanGrid.Rebind();
      }

      protected void PlanTypeGrid_DataBound(object sender, EventArgs e)
      {
          if (PlanTypeGrid.Items.Count > 0)
          {
             if (PlanTypeGrid.SelectedValue == null)
                PlanTypeGrid.Items[0].Selected = true;
          }
          CurrentPlanGrid.Rebind();
      }
   }

}