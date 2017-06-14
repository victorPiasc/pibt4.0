using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;

namespace Pibt.Employer
{
    public partial class AllPlans : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int was = -1;
            if (Page.IsPostBack)
                was = ddPlanType.SelectedIndex;
            ddPlanType.DataSource = BLL.Plan.GetPlanTypes(EmployerId);
            ddPlanType.DataTextField = "DESCRIPTION";
            ddPlanType.DataValueField = "PLANTYPEID";
            ddPlanType.DataBind();
            if (BLL.Plan.GetPlanTypesSingleP(EmployerId))
                ddPlanType.Enabled = false;
            if (was>=0)
                ddPlanType.SelectedIndex = was;
        }

        protected void PlanTypeGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            CurrentPlanGrid.Rebind();
        }

        protected void CurrentPlanGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            UserCacheInfo userinfo = CurrentUserInfo;
            string which = ddPlanType.SelectedValue.ToString();
            if (which==null)
                which = "0";
            CurrentPlanGrid.DataSource = userinfo.UserRole == Model.UserRoles.Dependent
                ? BLL.Plan.GetCurrentMemberPlans(which, MemberId, userinfo.UserRole)
                : BLL.Plan.GetCurrentPlans(which, EmployerId);
        }
    }
}