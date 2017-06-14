using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using Telerik.Web.UI;
using System.Drawing;

namespace Pibt
{
    public partial class Default1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void BtnSignOut_Click(object sender, ImageClickEventArgs e)
        {
           FormsAuthentication.SignOut();
           FormsAuthentication.RedirectToLoginPage();
        }
    }
}
