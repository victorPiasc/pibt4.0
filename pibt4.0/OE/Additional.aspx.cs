using Pibt.BLL;
using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Pibt.OE
{
    public partial class Additional : BasePage
    {
        public string oeId { get { return sessionVal("oeId"); } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(EmployeeId) || string.IsNullOrEmpty(oeId))
                oops();
                //NOT REACHED

            // set user controls
            CtlEnrollmentFormTitle1.EmployeeId = EmployeeId;
            CtlEnrollmentFormTitle1.EmployerId = EmployerId;
            CtlEnrollmentFormTitle1.oeId = oeId;
            medMessage.Text = denMessage.Text = "";
        }

        protected void BtNext_Click(object sender, EventArgs e)
        {
            if (PanelPCP.Visible && !update(GridViewPCP, medMessage)) 
                return;
            if (PanelDental.Visible && !update(GridViewDental, denMessage))
                return;
            Response.Redirect("/OE/LegalDocs.aspx" + UrlBuilder(null));
        }

        protected void BtBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/OE/SummaryOfChanges.aspx" + UrlBuilder(null));
        }

        protected void btnSaveAndExit_Click(object sender, EventArgs e)
        {
            SaveAndExit();
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            StartOver(oeId, User.Identity.Name, Request.UserHostAddress);
        }

        public bool update(GridView grid, Literal message)
        {
            int rowsCount = grid.Rows.Count;
            for (int i = 0; i < rowsCount; i++)
            {
                string recordId = grid.DataKeys[i].Value.ToString();
                GridViewRow row = grid.Rows[i];
                CheckBox cb = row.FindControl("cbAuto") as CheckBox;
                if (!cb.Checked)
                {
                    TextBox tb1 = row.FindControl("tbPlanOffice1") as TextBox;
                    TextBox tb2 = row.FindControl("tbPlanOffice2") as TextBox;
                    TextBox tb3 = row.FindControl("tbPlanOffice3") as TextBox;
                    if (string.IsNullOrEmpty(tb2.Text) || string.IsNullOrEmpty(tb3.Text) && grid.ID.Contains("PCP"))
                    {
                        message.Text = Common.Utilities.FormatError( "You must either check auto assign or fill out both " +
                            (grid.ID.Contains("PCP") ? "Provider Id and Medical Group IPA/Enrollment Id " : "Provider ID and Dental Office ID ") + "for "+ row.Cells[2].Text);
                        return false;
                    }

                    EnrollmentForm.UpdateOEPlansAddtional(recordId, tb1.Text, tb2.Text, tb3.Text);//assign provided information
                    Logger.WriteAuditLog(string.Format("{0} updated the PCP to the OE #{1}.", Page.User.Identity.Name, oeId),
                        EventCode.ModifyEnrollment);
                }
                else
                    EnrollmentForm.UpdateOEPlansAddtional(recordId, "", "", "");//set provider info to blank
            }
            return true;
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
            if (PanelPCP.Visible)
                setLink(1);
            if (PanelDental.Visible)
                setLink(2);
            base.OnPreRender(e);
        }

        public void setLink( int planType)
        {
            HiddenField hf = (planType == 1 ? GridViewPCP.Rows[0].FindControl("carrierId") : GridViewDental.Rows[0].FindControl("carrierId")) as HiddenField;
            switch (hf.Value)
            {
                case "4":
                    medSearch.NavigateUrl = "https://www.blueshieldca.com/fap/app/find-a-doctor.html";
                    break;
                case "18":
                case "143":
                    medSearch.NavigateUrl = "https://www.healthnet.com/portal/provider/home.ndo";
                    break;
                case "104":
                    denSearch.NavigateUrl = "https://www.blueshieldca.com/fap/app/find-a-doctor.html";
                    break;
                case "32":
                    denSearch.NavigateUrl = "https://www.humana.com/dentistfinder";
                    break;
                case "5":
                    denSearch.NavigateUrl = "https://hcpdirectory.cigna.com/web/public/providers";
                    break;
                default:
                    if (planType == 1)
                        medSearch.Visible = false;
                    else
                        denSearch.Visible = false;
                    break;
            }
        }
    }
}