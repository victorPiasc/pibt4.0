using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;

namespace Pibt.Employer
{
    public partial class EnrollmentForms : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            if (userInfo.UserRole == UserRoles.Dependent)
                oops();
                //NOT REACHED
            
            CtlEnrollmentHistoryList1.EmployerId = EmployerId;
            CtlEnrollmentHistoryList1.EmployeeId = EmployeeId;
            CtlEnrollmentHistoryList1.Role = userInfo.UserRole;
        }
    }
}