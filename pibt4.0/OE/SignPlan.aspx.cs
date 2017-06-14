using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using Pibt.BLL;
using Pibt.Model;

namespace Pibt.OE
{
    public partial class SignPlan : BasePage
    {
        public string oeId { get { return sessionVal("oeId"); } }

        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(EmployeeId) || string.IsNullOrEmpty(oeId))
                oops();
                //NOT REACHED

            //set user controls
            CtlEnrollmentFormTitle1.EmployeeId = EmployeeId;
            CtlEnrollmentFormTitle1.EmployerId = EmployerId;
            CtlEnrollmentFormTitle1.oeId = oeId;
        }
        protected void BtBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/OE/LegalDocs.aspx" + UrlBuilder(null));
        }

        protected void BtNext_Click(object sender, EventArgs e)
        {
            Bitmap bmp = ctlSignature.SaveSignature("");
            byte[] imageData;
            using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
            {
                bmp.Save(stream, System.Drawing.Imaging.ImageFormat.Png); // you can use format of your choice.
                stream.Position = 0;
                imageData = new byte[stream.Length];
                stream.Read(imageData, 0, imageData.Length);
                stream.Close();
            }
            int signatureId = BLL.Employer.newSignatureId();
            if (BLL.Employer.updateSignature(signatureId, imageData) && BLL.EnrollmentForm.UpdateSignatureName(oeId, printName.Text, signatureId))
            {
                Logger.WriteAuditLog(string.Format("{0} signed OE #{1}.", Page.User.Identity.Name, oeId), EventCode.ModifyEnrollment);
                Response.Redirect("/OE/EnrollmentPreview.aspx" + UrlBuilder(null));
            }
            else
                lblMsg.Text = Common.Utilities.FormatError("Please sign.");
        }

        protected void btnSaveAndExit_Click(object sender, EventArgs e)
        {
            SaveAndExit();
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            StartOver(oeId, User.Identity.Name, Request.UserHostAddress);
        }
    }
}