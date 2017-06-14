using System;
using Telerik.Web.UI;
using Pibt.Model;
using Pibt.Common;
using Pibt.BLL;
using System.Web.UI.WebControls;

namespace Pibt.UserControl
{
    public partial class CtlEmployerGrid : System.Web.UI.UserControl
    {
        public string UserId
        {
            get { return ViewState["UserId"].ToString(); }
            set { ViewState["UserId"] = value; }
        }

        public UserRoles UserRole
        {
            get { return (UserRoles) ViewState["UserRole"]; }
            set { ViewState["UserRole"] = value; }
        }

        public string agencyId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            txtClue.Focus();
            Utilities.TieButton(Page, txtClue, btnSearch);
            object oldSettings = ViewState["oldSetting"];
            if (Page.IsPostBack)
            {
                if (oldSettings !=null && !ddlTypes.SelectedValue.ToString().Equals((string)(oldSettings)))
                { // Compiler requires these coersions
                    EmployersGrid.Rebind();
                    ViewState["oldSetting"] = ddlTypes.SelectedValue;
                }
            }
            else
            {
                BLL.Employer.SynEmployerToWebUsersTable((int)UserRole, UserId, Page.User.Identity.Name);
                ViewState["oldSetting"] = ddlTypes.SelectedValue;
            }
        }

        protected void binder(object sender, GridItemEventArgs e)
        {
            Pibt.BasePage.binderLow(e, EmployersGrid, "View this employer");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                EmployersGrid.Rebind();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtClue.Text = "";
            ddlTypes.SelectedIndex = 0;
            EmployersGrid.Rebind();
        }

        protected void EmployersGrid_DataBind()
        {
            EmployersGrid.DataSource = BLL.Employer.SearchEmployerByType(UserId, (int)UserRole, ddlTypes.SelectedValue, txtClue.Text);
        }

        protected void EmployersGrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            EmployersGrid_DataBind();
        }
    }
}