using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using System.Data;
using Pibt.BLL;
using Pibt.Class;

namespace Pibt.UserControl
{
    public partial class CtlEnrollmentFormPreview : System.Web.UI.UserControl
    {
        public string OEId;
        public string EmployerId;
        public string EmployeeId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                OeDetails _OEDetails = EnrollmentForm.GetOEDetails(OEId);
                if (_OEDetails == null)
                {
                    HttpContext.Current.ClearError();
                    Response.Redirect("/Oooops.aspx");
                }
                HeadTypeName.Text = _OEDetails.TypeName.ToUpper();
                lblOETypeName.Text = _OEDetails.TypeName;
                ViewState["OETypeId"] = _OEDetails.TypeId;
                chkReadLegalDoc.Checked = _OEDetails.ReadLegalDoc;
                HasSignature.Checked = _OEDetails.HasSignatrue;

                int signatureId = BLL.Employer.getSigntureId(OEId, 0, null);
                imgSignature.ImageUrl = "/Signatrue.ashx?signatrue=" + HttpUtility.UrlEncode(Common.Utilities.Encrypt(signatureId.ToString()));

                odsErInfo.SelectParameters["employerId"].DefaultValue = EmployerId;
                odsEeInfo.SelectParameters["memberId"].DefaultValue = EmployeeId;
                odsCoverage.SelectParameters["oeId"].DefaultValue = OEId;
                odsTerminate.SelectParameters["oeId"].DefaultValue = OEId;
                odsPCP.SelectParameters["oeId"].DefaultValue = OEId;
                odsDental.SelectParameters["oeId"].DefaultValue = OEId;
                odsgvConverageAddtional.SelectParameters["oeId"].DefaultValue = OEId;

                name.Text = _OEDetails.SignatureName;
                date.Text = _OEDetails.Created;
                LegalDocContent.Text = LegalDocuments.getLegalDocs(OEId);

                export.NavigateUrl = string.Format("/download/exportpdf.aspx?oeId={0}&erId={1}&eeId={2}", OEId, EmployerId, EmployeeId);
            }
        }

        public bool CanSubmit()
        {
            lblMsg.Text = lblMsg2.Text =  "";
            string returnMsg = "";
            if(!BLL.EnrollmentForm.ValidOEBeforeSubmit(OEId, out returnMsg))
            { 
                lblMsg.Text = lblMsg2.Text = Common.Utilities.FormatError(returnMsg);
                return false;
            }
            return true;
        }

        public string setPayPeriod(object payperiod)
        {
            string tmp;
            switch (payperiod == null ? "" : payperiod.ToString())
            {
                case "2":
                    tmp = "Semi-annual";
                    break;
                case "4":
                    tmp = "Quarterly";
                    break;
                case "12":
                    tmp = "Monthly";
                    break;
                case "24":
                    tmp = "Semi-monthly";
                    break;
                case "26":
                    tmp = "Bi-weekly";
                    break;
                case "52":
                    tmp = "Weekly";
                    break;
                case "260":
                    tmp = "Daily";
                    break;
                case "2080":
                    tmp = "Daily";
                    break;
                default:
                    tmp = "";
                    break;
            }
            return tmp;
        }
    }
}