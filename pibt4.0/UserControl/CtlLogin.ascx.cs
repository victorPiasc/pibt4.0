using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Pibt.Common;
using Pibt.BLL;
using Pibt.Model;

namespace Pibt.UserControl
{
    public partial class CtlLogin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {           
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            ViewState.Clear();
            FormsAuthentication.SignOut();
            FormsAuthentication.RedirectToLoginPage();
            BLL.Logger.WriteAuditLog(string.Format("{0} logged out", Page.User.Identity.Name), EventCode.Logout);
            Response.Redirect("/login.aspx");
            //NOTREACHED
        }
    }
}