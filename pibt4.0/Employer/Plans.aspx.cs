using System;
using Pibt.Common;
using Pibt.Model;

namespace Pibt.Employer
{
    public partial class Plans : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            //set user control
            CtlCurrentPlans1.EmployerId = EmployerId;
            CtlCurrentPlans1.Role = userInfo.UserRole;
            if (userInfo.UserRole == UserRoles.Agent)
                CtlCurrentPlans1.UserId = userInfo.AgentId;
            else if (userInfo.UserRole == UserRoles.RK)
                CtlCurrentPlans1.UserId = userInfo.RKId;
            else if (userInfo.UserRole == UserRoles.Broker)
                CtlCurrentPlans1.UserId = userInfo.BrokerId;
            else if (userInfo.UserRole == UserRoles.Employer)
                CtlCurrentPlans1.UserId = userInfo.EmployerId;
            else if (userInfo.UserRole == UserRoles.Employee)
                CtlCurrentPlans1.UserId = userInfo.EmployeeId;
            else // Must be dependent
                CtlCurrentPlans1.UserId = userInfo.MemberId;
        }
    }
}