using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;


namespace Pibt
{
    public partial class Content : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if user is not logged in.
            if (!Page.User.Identity.IsAuthenticated)
            {
                // Clear all session values if use is logged out.
                Session.RemoveAll();
                HttpContext.Current.ClearError();
                Response.Redirect("~/Login.aspx", false);
                return;
            }

            UserCacheInfo uinfo = (UserCacheInfo)Session["UserCacheInfo"];
            if (uinfo != null && uinfo.UserRole != UserRoles.Administrator)
            {
                if (Pibt.BLL.User.SysIsMaintenance())
                {
                    Page.Response.Redirect("/SysMaintenance.aspx");
                }
            }
        }
    }
}