using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.BLL;
using Pibt.Model;

namespace Pibt.OE
{
    public partial class UnfinishedOEWarning : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string oeId = BLL.EnrollmentForm.GetMemberUnfinishedOEId(EmployeeId);
                if (!string.IsNullOrEmpty(oeId))
                {
                    OeDetails oe = BLL.EnrollmentForm.GetOEDetails(oeId);
                    if (oe != null)
                        lblOEType.Text = oe.TypeName;
                    else
                        Response.Redirect("EmployeeDetails.aspx" + UrlBuilder(null));
                }
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            string oeId = BLL.EnrollmentForm.GetMemberUnfinishedOEId(EmployeeId);
            if (!string.IsNullOrEmpty(oeId))
            {
                if (BLL.EnrollmentForm.UpdateOEStatus(oeId, Model.OEStatus.Cancel, Page.User.Identity.Name, Request.UserHostAddress))
                {
                    Session["OEId"] = null;
                    Logger.WriteAuditLog(string.Format("{0} canceled an unfinished enrollment form #{1}.", Page.User.Identity.Name, oeId),
                        EventCode.CancelEnrollment);
                    Response.Redirect("Type.aspx" + UrlBuilder(null));
                }
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            if (CurrentUserInfo != null)
            {
                string oeId = BLL.EnrollmentForm.GetMemberUnfinishedOEId(EmployeeId);
                if (!string.IsNullOrEmpty(oeId))
                {
                    OeDetails oe = BLL.EnrollmentForm.GetOEDetails(oeId);
                    if (oe != null)
                    {
                        Session["OEId"] = oeId;
                        Session["OETypeId"] = oe.TypeId;
                        if (!(oe.TypeId=="3" || oe.TypeId=="6")) 
                        {
                            int cartId = BLL.EnrollmentForm.getCartId(oeId);
                            BLL.OnlineQuote.SetCookie(cartId);
                            HttpContext.Current.Session["QQ_CartID"] = cartId;
                            Response.Redirect(BLL.EnrollmentForm.oeRedirect(oeId, EmployerId) + ".aspx" + UrlBuilder(null));
                        }
                        else
                            Response.Redirect("TerminateForm.aspx" + UrlBuilder(null));
                    }
                }
            }
        }
    }
}