using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.BLL;
using Pibt.Model;

namespace Pibt.Employer
{
    public partial class BusinessList : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                UserCacheInfo userInfo = CurrentUserInfo;
                if (userInfo.UserRole == UserRoles.Administrator)
                {
                    if (!string.IsNullOrEmpty( Request["roletype"]) && !string.IsNullOrEmpty( Request["uid"]))
                    {
                        CtlEmployerGrid1.UserRole = (UserRoles)int.Parse(Request["roletype"].ToString());
                        CtlEmployerGrid1.UserId = Request["uid"];
                    }
                    else
                    {
                        CtlEmployerGrid1.UserRole = UserRoles.Administrator;
                        CtlEmployerGrid1.UserId = userInfo.UserId;
                        CtlEmployerGrid1.agencyId = userInfo.AgencyId;
                    }
                }
                else if (userInfo.UserRole == UserRoles.Agent || userInfo.UserRole == UserRoles.RK || userInfo.UserRole == UserRoles.Broker || userInfo.UserRole == UserRoles.Enroller) {
                    CtlEmployerGrid1.UserRole = userInfo.UserRole;
                    CtlEmployerGrid1.UserId = userInfo.UserId;
                }
                else
                {
                    oops();
                }
            }
        }
    }
}