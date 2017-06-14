using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Employer
{
    public partial class RenewalLegalDocs : BasePage
    {
        public Renewal renew
        {
            get
            {
                if (Session["renewal"] == null)
                {
                    Session["renewal"] = BLL.Employer.getUnfinishedRenewalId(EmployerId);
                }
                return (Renewal)Session["renewal"];
            }
            set
            {
                Session["renewal"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (renew == null)
                oops();
            date2.Text = DateTime.Now.ToShortDateString();
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            if (BLL.OnlineQuote.updateRenewal(renew.renewalId, --renew.state, renew.isPercent, renew.isOverAll))
                Response.Redirect("/Employer/RenewalOverview.aspx");
        }

        protected void Continue_Click(object sender, EventArgs e)
        {
            renew.name = tbName.Text;
            renew.title = tbTitle.Text;
            if (InsertSignature() &&
                BLL.OnlineQuote.UpdateRenewalCR(renew.renewalId, tbName.Text, tbTitle.Text, renew.effectiveDate) &&
                BLL.OnlineQuote.updateRenewal(renew.renewalId, ++renew.state, renew.isPercent, renew.isOverAll))
               Response.Redirect("/Employer/RenewalPA.aspx");
        }

        public bool InsertSignature()
        {
            Bitmap bmp = ctlSignature.SaveSignature("");
            byte[] imageData;
            using (System.IO.MemoryStream stream = new System.IO.MemoryStream())
            {
                bmp.Save(stream, System.Drawing.Imaging.ImageFormat.Png);
                stream.Position = 0;
                imageData = new byte[stream.Length];
                stream.Read(imageData, 0, imageData.Length);
                stream.Close();
            }
            int signatureId = BLL.Employer.newSignatureId();
            return BLL.Employer.updateSignature(signatureId, imageData) && BLL.Employer.updateSignatureId(renew.renewalId, 1, null, null, signatureId);
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            if(BLL.OnlineQuote.TransferErToQuote(renew.cartId, EmployerId) &&
                BLL.OnlineQuote.updateRenewal(renew.renewalId, 1, null, null))
                Response.Redirect("/Employer/RenewalAtoA.aspx");
        }
    }
}