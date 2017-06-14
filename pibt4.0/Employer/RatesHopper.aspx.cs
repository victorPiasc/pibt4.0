using System;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.Employer
{
   public partial class RatesHopper : BasePage
   {
      protected void Page_Load(object sender, EventArgs e)
      {
         if (!IsPostBack)
         {
            if (!string.IsNullOrEmpty(Context.Request.QueryString["tab"]))
            {
               RadTabStrip1.SelectedIndex = Convert.ToInt32(Context.Request.QueryString["tab"]);
               RadMultiPage1.SelectedIndex = Convert.ToInt32(Context.Request.QueryString["tab"]);
            }
            else
            {
               RadTabStrip1.SelectedIndex = 0;
               RadMultiPage1.SelectedIndex = 0;
            }
         }

         UserCacheInfo userInfo = CurrentUserInfo;

         //set user control
         CtlRatesHopper1.EmployerId = EmployerId;
         CtlRatesHopper1.Role = userInfo.UserRole;
         if (userInfo.UserRole == UserRoles.Agent)
            CtlRatesHopper1.UserId = userInfo.AgentId;
         else if (userInfo.UserRole == UserRoles.RK)
            CtlRatesHopper1.UserId = userInfo.RKId;
         else if (userInfo.UserRole == UserRoles.Broker)
             CtlRatesHopper1.UserId = userInfo.BrokerId;
         else if (userInfo.UserRole == UserRoles.Employer)
            CtlRatesHopper1.UserId = userInfo.EmployerId;
         else if (userInfo.UserRole == UserRoles.Employee)
            CtlRatesHopper1.UserId = userInfo.EmployeeId;
         else // Must be dependent
            CtlRatesHopper1.UserId = userInfo.MemberId;
      }
   }
}