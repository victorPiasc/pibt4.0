using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Telerik.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Pibt;
using Pibt.Model;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace Pibt.UserControl
{
    public partial class CtlCurrentPlans : BaseUserControl
    {
        public int medType
        {
            get
            {
                if (ViewState["type"] == null)
                    return 1;
                return int.Parse(ViewState["type"].ToString());
            }
            set
            {
                ViewState["type"] = value;
            }
        }

        public string EmployerId { get; set; }
        public UserRoles Role { get; set; }
        public string UserId { get; set; }

        protected void Page_Load(object sender, EventArgs e) 
        {
            today.Text = DateTime.Today.ToShortDateString();
        }

        protected void CurrentPlanGrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            CurrentPlanGrid.DataSource = BLL.Plan.getCurrentPlansAndCount(EmployerId, medType);
        }

        protected void type_Command(object sender, CommandEventArgs e)
        {
            tab_command(typeList, e.CommandName);
            medType = int.Parse(e.CommandName);
            CurrentPlanGrid.Rebind();
        }

    }
}