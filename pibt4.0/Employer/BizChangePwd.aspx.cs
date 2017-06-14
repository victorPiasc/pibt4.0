using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using Pibt.UserControl;
using Telerik.Web.UI;

namespace Pibt.Employer
{
    public partial class BizChangePwd : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            SearchTabs(typeList);
            if (userInfo.UserRole == UserRoles.Dependent || userInfo.UserRole == UserRoles.Employee || string.IsNullOrEmpty(EmployerId))
                oops();

            string loginName = BLL.User.GetWebUserLoginname(EmployerId, UserRoles.Employer);
            if (!string.IsNullOrEmpty(loginName))
            {
                CtlChangePassword1.Visible = true;
                CtlCreateWebUser1.Visible=false;
                CtlChangePassword1.AspnetUserName = CtlChangePassword1.userName = userInfo.LoginName;
                CtlChangePassword1.UserId = EmployerId;
            }
            else
            {
                CtlCreateWebUser1.UserId = EmployerId;
                CtlChangePassword1.Visible = false;
            }
        }

        void CtlCreateWebUser1_OnCreateFinished(object sender, CreateWebUserEventArgs e)
        {
            CtlChangePassword1.Visible = true;
            CtlChangePassword1.AspnetUserName = CtlChangePassword1.userName = e.NewUserName;
            CtlCreateWebUser1.Visible = false;
        }
    }
}