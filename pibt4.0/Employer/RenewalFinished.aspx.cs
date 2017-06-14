using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;

namespace Pibt.Employer
{
    public partial class RenewalFinished : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserCacheInfo"] == null)
                {
                    Session["UserCacheInfo"] = BLL.User.RefreshUserCacheInfo(Page.User.Identity.Name);
                }
                BizAdditionalInfo erAddi = BLL.Employer.GetBizInfoDetails2(EmployerId);
                RKDetails rk = BLL.RK.GetRKDetailsById(erAddi.RKId);
                if (rk != null)
                {
                    name.Text = erAddi.RK.Substring(0, erAddi.RK.Length-9);
                    ext.Text = rk.Extension;
                }
            }
        }
    }
}