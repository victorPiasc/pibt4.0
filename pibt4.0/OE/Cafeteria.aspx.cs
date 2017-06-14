using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using Pibt.BLL;


namespace Pibt.OE
{
    public partial class Cafeteria : BasePage
    {
        string oeId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployerId) && string.IsNullOrEmpty(EmployeeId))
            {
                oops();
                return;
            }

            //set user controls
            CtlEnrollmentFormTitle1.EmployeeId = EmployeeId;
            CtlEnrollmentFormTitle1.EmployerId = EmployerId;

            if (Session["OEId"] != null)
            {
                oeId = Session["OEId"].ToString();

                if (!IsPostBack)
                {
                    OeDetails OEDetails = EnrollmentForm.GetOEDetails(oeId);

                    CkCafeteria.Checked = OEDetails.AcceptedCafeteria;
                }
            }
            else
            {
                oops();
            }

        }

        protected void BtNext_Click(object sender, EventArgs e)
        {
            Logger.WriteAuditLog(string.Format(CkCafeteria.Checked ? "{0} accepted the cafeteria to OE #{1}." : "{0} unaccepted the cafeteria to the OE #{1}.",
                Page.User.Identity.Name, Session["OEId"]), EventCode.ModifyEnrollment);
            Response.Redirect("/OE/LegalDocs.aspx" + UrlBuilder(null));
        }

        protected void BtBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/OE/Additional.aspx" + UrlBuilder(null));
        }

        protected void CkCafeteria_CheckedChanged(object sender, EventArgs e)
        {
            lblStatus.Text = "";
            string isChecked = CkCafeteria.Checked ? "Y" : "N";
            bool success = EnrollmentForm.UpdateCafeteria(oeId, isChecked);

            BtNext.Enabled = CkCafeteria.Checked;

            if (success)
                lblStatus.Text = Common.Utilities.FormatAlertInfo("Updated successfully.");
            else
                lblStatus.Text = Common.Utilities.FormatError("Update failed!");
        }

        protected void btnSaveAndExit_Click(object sender, EventArgs e)
        {
            SaveAndExit();
        }
    }
}