using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.BLL;
using Pibt.Model;
using Pibt.Common;
using System.Data;


namespace Pibt.UserControl
{
    public partial class CtlOEAdditional : System.Web.UI.UserControl
    {
        public string oeId;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private bool PlanOffices(GridViewRow gridRow, string planId) 
        {
            return EnrollmentForm.UpdateOEPlansAddtional(planId, (gridRow.FindControl("tbPlanOffice1") as TextBox).Text,(gridRow.FindControl("tbPlanOffice2") as TextBox).Text, (gridRow.FindControl("tbPlanOffice3") as TextBox).Text, "");
        }

        public string update(GridView grid)
        {
            int rowsCount = grid.Rows.Count;
            string message = "";
            for (int i = 0; i < rowsCount; i++)
            {
                GridViewRow row = grid.Rows[i];
                CheckBox cb = row.FindControl("cbAuto") as CheckBox;
                if (!cb.Checked)
                {
                    TextBox tb1 = row.FindControl("tbPlanOffice1") as TextBox;
                    TextBox tb2 = row.FindControl("tbPlanOffice2") as TextBox;
                    TextBox tb3 = row.FindControl("tbPlanOffice1") as TextBox;

                }
            }

                return "";
        }

        private bool UpdatePCP()
        {
            int rowsCount = GridViewPCP.Rows.Count;
            //Go throug all rows of the GridViewPCP to update
            for (int i = 0; i < rowsCount; i++)
            {
                if (PlanOffices(GridViewPCP.Rows[i], GridViewPCP.DataKeys[i].Value.ToString()))
                    Logger.WriteAuditLog(string.Format("{0} updated the PCP to the OE #{1}.", Page.User.Identity.Name, oeId),
                        EventCode.ModifyEnrollment);
                else
                    return false;
            }
            return true;
        }

        private bool UpdateDental()
        {
            int rowsCount = GridViewDental.Rows.Count;
            //Go throug all rows of the GridViewDental to update
            for (int i = 0; i < rowsCount; i++)
            {
                if (PlanOffices(GridViewDental.Rows[i], GridViewDental.DataKeys[i].Value.ToString())) {
                    Logger.WriteAuditLog(string.Format("{0} updated the dental provider to the OE #{1}.", Page.User.Identity.Name, oeId),
                        EventCode.ModifyEnrollment);
                }
                else
                    return false;
            }
            return true;
        }

        public bool UpdateForm()
        {
            update(GridViewPCP);
            return UpdatePCP() & UpdateDental(); // Using single & to force execution of each
        }

        protected override void OnPreRender(EventArgs e)
        {
            PanelPCP.Visible = !BLL.EnrollmentForm.IsPlanPPO(oeId,1);
            PanelDental.Visible = !BLL.EnrollmentForm.IsPlanPPO(oeId,2);

            if (!Page.IsPostBack && !PanelPCP.Visible && !PanelDental.Visible)
            {
                string referer = Page.Request.UrlReferrer.AbsolutePath.ToLower();
                Response.Redirect("/OE/"+
                    (referer.Contains("legaldocs")
                        ? "SummaryOfChanges"
                        : "LegalDocs" ) + ".aspx" + BasePage.UrlBuilder(HttpContext.Current.Request, null));
            }
            base.OnPreRender(e);
        }
    }
}