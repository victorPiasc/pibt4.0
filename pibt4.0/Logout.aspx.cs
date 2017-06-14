using System;
using System.Web;
using Pibt.Model;

namespace Pibt
{
    public partial class Logout: SortaBasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserCacheInfo"] != null)
                {
                    UserCacheInfo uInfo = (UserCacheInfo)(Session["UserCacheInfo"]);
                    BLL.Logger.WriteAuditLog(string.Format("{0} logout at {1}.", uInfo.LoginName, DateTime.Now), EventCode.Logout, uInfo.LoginName, Page.Request.UserHostAddress);
                }

                // Clear all session values.
                HttpContext.Current.ClearError();
                Session.RemoveAll();
            }
        }
    }
}