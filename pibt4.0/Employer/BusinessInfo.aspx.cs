using System;
using System.Web;
using Telerik.Web.UI;

using Pibt.UserControl;
using Pibt.Model;
using Pibt.Common;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Employer
{
    public partial class BusinessInfo : BasePage
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

            CtlEmployerInfo1.EmployerId = EmployerId;
            CtlEmployerInfo1.Role = CurrentUserInfo.UserRole;
            CtlEmployerInfo1.Username = CurrentUserInfo.LoginName;
        }
    }
}