using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Admin
{
    public partial class OnlineQuote : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo user = CurrentUserInfo;
            CtlOQGrid1.user = user;
        }
    }
}