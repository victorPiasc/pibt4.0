using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using Telerik.Web.UI;

namespace Pibt.Employer
{
    public partial class BizSpecialPlans : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            if (userInfo.UserRole == UserRoles.Dependent || userInfo.UserRole == UserRoles.Employee || string.IsNullOrEmpty(EmployerId))
            {
                oops();
                return;
            }

            CtlSpecialPlans1.EmployerId = EmployerId;
            SearchTabs(RadTabStrip1);
        }
    }
}