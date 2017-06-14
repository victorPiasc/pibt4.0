using Pibt.Model;
using Pibt.UserControl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt
{
    public class EnrollerAgentDetails : BasePage
    {
        protected void loadPage(CtlEditAgentDetails adetails, CtlCreateWebUser cwUser, CtlChangePassword cpass, RadTabStrip strip )
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            string userid = !string.IsNullOrEmpty(Request["uid"]) ? Request["uid"] : userInfo.UserId;

            adetails.UserId = userid;
            cwUser.UserId = userid;
            cpass.UserId = userid;

            if (!Page.IsPostBack)
            {
                // check web portal account exists
                string loginName = BLL.User.GetWebUserLoginname(userid, UserRoles.Enroller);
                cwUser.Visible = string.IsNullOrEmpty(loginName);
                cpass.Visible = !cwUser.Visible;
                strip.Tabs[1].Text = string.IsNullOrEmpty(loginName) ? "Create Web Account" : "Change Password";
            }
        }
    }
}