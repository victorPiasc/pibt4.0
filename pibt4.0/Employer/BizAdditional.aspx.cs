using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using Telerik.Web.UI;
using Pibt.UserControl;

namespace Pibt.Employer
{
    public partial class BizAdditional : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            SearchTabs(typeList);
            if (userInfo.UserRole == UserRoles.Dependent || userInfo.UserRole == UserRoles.Employee || string.IsNullOrEmpty(EmployerId))
            {
                oops();
                return;
            }

            CtlAdditionalInfo1.EmployerId = EmployerId;

            
        }
    }
}