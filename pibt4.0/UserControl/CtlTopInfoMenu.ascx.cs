using System;
using Pibt.Model;
using System.Web.Security;

namespace Pibt.UserControl
{
    public partial class CtlTopInfoMenu : System.Web.UI.UserControl
    {
        public string RoleName;
        public string UserId;
        public string UserName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                if (Session["UserCacheInfo"] == null)
                {
                    Session["UserCacheInfo"] = BLL.User.RefreshUserCacheInfo(Page.User.Identity.Name);
                }
                UserCacheInfo uInfo = (UserCacheInfo)Session["UserCacheInfo"];
                RoleName = uInfo.UserRole.ToString();
                UserId = uInfo.Id.Contains("-") ? "Pending" : uInfo.Id;
                switch (uInfo.UserRole)
                {
                    case UserRoles.Administrator:
                        WebUser admin = BLL.User.GetAdminDetails(uInfo.UserId);
                        UserName = admin.UserName;
                        break;
                    case UserRoles.Enroller:
                        AgentDetails enroller = BLL.Agent.GetEnrollerDetails(uInfo.AgentId, false);
                        UserName = enroller.UserName;
                        break;
                    case UserRoles.Agent:
                        AgentDetails agent = BLL.Agent.GetEnrollerDetails(uInfo.AgentId,true);
                        UserName = agent.UserName;
                        break;
                    case UserRoles.RK:
                        RKDetails rk = BLL.RK.GetRKDetails(uInfo.RKId);
                        UserName = rk.UserName;
                        break;
                    case UserRoles.Broker:
                        BrokerDetails b = BLL.Broker.GetBrokerDetails(uInfo.BrokerId);
                        UserName = b.UserName;
                        break;
                    case UserRoles.Employer:
                        Model.BizInfoDetails er = BLL.Employer.GetBizInfoDetails(uInfo.EmployerId);
                        UserName = er.CompanyName;
                        break;
                    case UserRoles.Employee:
                    case UserRoles.Dependent:
                        UserName = BLL.Employee.GetMemberDetails(uInfo.MemberId).UserName;
                        break;
                }
                MembershipUser user = Membership.GetUser(uInfo.LoginName);
            }
        }
    }
}