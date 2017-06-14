using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;

namespace Pibt.Admin
{
    //public partial class AgentLookup : System.Web.UI.Page
    public partial class AgentLookup : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            if (userInfo.UserRole == UserRoles.Employee && userInfo.UserRole == UserRoles.Employer)
            {
                oops();
                return;
            }

            CtlAgentLookup1.Role = CurrentUserInfo.UserRole;
            if (CurrentUserInfo.UserRole == Model.UserRoles.Agent)
            {
                CtlAgentLookup1.AgentId = CurrentUserInfo.AgentId;
            }
        }
    }
}