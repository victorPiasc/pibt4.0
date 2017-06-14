using Pibt.Common;
using Pibt.Model;
using System;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.UserControl
{
    public partial class LeftMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = (UserCacheInfo)Session["UserCacheInfo"];
            if (userInfo.UserRole == UserRoles.Administrator && userInfo.AgencyId != "1" )
            {
                RadPanelBar bar = LoginViewLeftMenuPanel.FindControl("AdminMenuPanel") as RadPanelBar;
                foreach (RadPanelItem item in bar.Items)
                    item.Visible = item.Value == "all";
            }
        }

        protected void LogInImageButton_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
           Response.Redirect("/Login.aspx");
        }
    }
}