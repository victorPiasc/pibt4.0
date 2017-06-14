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
    public partial class AddDependent : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            if (userInfo.UserRole==UserRoles.Dependent || string.IsNullOrEmpty(EmployeeId) || string.IsNullOrEmpty(EmployerId))
            {
                oops();
                return;
            }

            //set user control
            CtlAddDependent1.EmployeeId = EmployeeId;
            CtlAddDependent1.EmployerId = EmployerId;
            CtlAddDependent1.userInfo = userInfo;
        }
    }
}