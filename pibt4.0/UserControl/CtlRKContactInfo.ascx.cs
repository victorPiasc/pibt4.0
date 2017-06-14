using System;
using Pibt.Model;

namespace Pibt.UserControl
{
    public partial class CtlRKContactInfo : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["UserCacheInfo"] == null)
                {
                    Session["UserCacheInfo"] = BLL.User.RefreshUserCacheInfo(Page.User.Identity.Name);
                }
                UserCacheInfo uInfo = (UserCacheInfo)Session["UserCacheInfo"];
                if (uInfo != null && (uInfo.UserRole == UserRoles.Employer || uInfo.UserRole == UserRoles.Employee || uInfo.UserRole == UserRoles.Dependent))
                {
                    BizAdditionalInfo _erAddi = BLL.Employer.GetBizInfoDetails2(uInfo.EmployerId);
                    Model.RKDetails rk = BLL.RK.GetRKDetailsById(_erAddi.RKId);
                    if (rk != null)
                    {
                        string nameOnly = _erAddi.RK.Substring(0, _erAddi.RK.Length - 9);
                        lblRKName.Text = nameOnly;
                        lblRKext.Text = rk.Extension;
                        literalRKEmail.Text = string.IsNullOrEmpty(rk.EmailAddress) ? "" : string.Format(", or <a href='mailto:{0}'>{0}</a>", rk.EmailAddress);
                    }
                }
                else
                {
                    Visible = false;
                }
            }
        }
    }
}