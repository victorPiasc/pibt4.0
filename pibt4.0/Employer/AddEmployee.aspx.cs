using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Common;
using Pibt.Model;


namespace Pibt.Employer
{
    public partial class AddEmployee : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            if (userInfo.UserRole==UserRoles.Dependent || userInfo.UserRole==UserRoles.Employee || string.IsNullOrEmpty(EmployerId))
            {
                oops();
                return;
            }
 
            //set user controls
            CtlAddEmployee1.EmployerId = EmployerId;
        }
    }
}