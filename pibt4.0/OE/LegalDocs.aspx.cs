using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using Pibt.BLL;
using System.Data;
using Pibt.Class;


namespace Pibt.OE
{
    public partial class LegalDocs : BasePage
    {
        public string oeId { get { return sessionVal("oeId"); } }
        public int oeType { get { return sessionValInt("OETypeId"); } } 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(EmployeeId) || string.IsNullOrEmpty(oeId))
                oops();
                //NOT REACHED

            // set user controls
            CtlEnrollmentFormTitle1.EmployeeId = EmployeeId;
            CtlEnrollmentFormTitle1.EmployerId = EmployerId;
            CtlEnrollmentFormTitle1.oeId = oeId;

            if (!IsPostBack)
            {
                GeneralLegalContent.Text =LegalDocuments.getLegalDocs(oeId);
                OeDetails OEDetails = EnrollmentForm.GetOEDetails(oeId);
                CkLegal.Checked = OEDetails.ReadLegalDoc;
                BtNext.Enabled = CkLegal.Checked;
            }
        }

        protected void BtNext_Click(object sender, EventArgs e)
        {
           Response.Redirect("/OE/SignPlan.aspx"+ UrlBuilder(null));
        }

        protected void BtBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/OE/"+(
                    oeType == 3 || oeType == 6
                        ?"TerminateForm"
                        :"Additional")+".aspx"+UrlBuilder(null));
        }

        protected void CkLegal_CheckedChanged(object sender, EventArgs e)
        {
            EnrollmentForm.UpdateLegalDocs(oeId, CkLegal.Checked ? "Y" : "N");
            BtNext.Enabled = CkLegal.Checked;
            Logger.WriteAuditLog(string.Format(CkLegal.Checked ? "{0} acceptd the agreement to OE #{1}." : "{0} rejected the agreement to OE #{1}.",
                Page.User.Identity.Name, oeId), EventCode.ModifyEnrollment);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SaveAndExit();
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            StartOver(oeId, User.Identity.Name, Request.UserHostAddress);
        }
    }
}