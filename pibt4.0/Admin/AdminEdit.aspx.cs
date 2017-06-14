using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.UserControl;

using Pibt.Model;

namespace Pibt.Admin
{
    public partial class AdminEdit : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            string userid = !string.IsNullOrEmpty(Request["uid"]) ? userid = Request["uid"] : userid = userInfo.UserId;

            if (string.IsNullOrEmpty(userid))
                oops();

            if (!IsPostBack)
            {
                WebUser webUser = BLL.User.GetAdminDetails(userid);

                if (webUser == null)
                    oops();

                lblUserInfo.Text = webUser.UserName + "#" + userid;

                // check web portal account exists
                string loginName = BLL.User.GetWebUserLoginname(userid, UserRoles.Administrator);
                CtlCreateWebUser1.Visible = string.IsNullOrEmpty(loginName);
                CtlChangePassword1.Visible = !CtlCreateWebUser1.Visible;
                if (string.IsNullOrEmpty(loginName))
                    RadTabStrip1.Tabs[1].Text = "Create Web Account";
                else
                    RadTabStrip1.Tabs[1].Text = "Username & Password";
            }

            CtlEditAdministrator1.UserId = userid;
            CtlCreateWebUser1.UserId = userid;
            CtlChangePassword1.UserId = userid;
        }

        protected override void CreateChildControls()
        {
            CtlCreateWebUser1.OnCreateFinished += new UserControl.CreateFinished(CtlCreateWebUser1_OnCreateFinished);
            base.CreateChildControls();
        }

        void CtlCreateWebUser1_OnCreateFinished(object sender, CreateWebUserEventArgs e)
        {
            CtlChangePassword1.Visible = true;
            CtlChangePassword1.AspnetUserName = e.NewUserName;
            CtlCreateWebUser1.Visible = false;
            RadTabStrip1.Tabs[1].Text = "Username & Password";
        }
    }
}