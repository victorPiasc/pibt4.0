using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;

namespace Pibt.Employer
{
    public partial class EnrollmentHistory : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            if (userInfo.UserRole == UserRoles.Dependent)
            {
                oops();
                return;
            }

            CtlEnrollmentHistoryList1.Role = CurrentUserInfo.UserRole;
            CtlEnrollmentHistoryList1.EmployerId = EmployerId;
            CtlEnrollmentHistoryList1.EmployeeId = EmployeeId;
        }
    }
}