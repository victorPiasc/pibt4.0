using System;
using Pibt.Model;
using System.Web.Security;
using Pibt.DAL;
using Pibt.Common;
using System.Data;

namespace Pibt.BLL
{
    public class User
    {
        /// <summary>
        /// Create New Membership User
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="email"></param>
        /// <param name="role"></param>
        /// <param name="password"></param>
        /// <param name="autoGeneratePassword"></param>
        /// <returns></returns>
        public static bool CreateAspnetUser(string userId, string savedEmail, string senderEmail,  UserRoles role, string password, bool autoGeneratePassword, out string returnMsg)
        {
            returnMsg = "";
            if (autoGeneratePassword)
                password = Membership.GeneratePassword(10, 1);
            MembershipCreateStatus status = MembershipCreateStatus.Success;
            MembershipUser user = Membership.CreateUser(userId, password, savedEmail, "What is your Employer Account ID #?", userId, true, out status);
            returnMsg = status==MembershipCreateStatus.InvalidPassword ? "Invalid Password" : status.ToString();
            if (status == MembershipCreateStatus.Success)
            {
                Roles.AddUserToRole(userId, role.ToString());
                return true;
            }
            return false;
        }

        /// <summary>
        /// Refresh login user cache
        /// </summary>
        /// <param name="loginame"></param>
        public static UserCacheInfo RefreshUserCacheInfo(string loginame)
        {
            UserCacheInfo uInfo = UserDataAccess.GetWebUserInfo(loginame);
            if (Roles.IsUserInRole(uInfo.LoginName, "Administrator"))
            {
                uInfo.Id = uInfo.UserId;
                uInfo.UserRole = UserRoles.Administrator;
            }
            else if (Roles.IsUserInRole(uInfo.LoginName, "Enroller"))
            {
                uInfo.Id = uInfo.UserId;
                uInfo.AgentId = uInfo.UserId;
                uInfo.UserRole = UserRoles.Enroller;
            }
            else if (Roles.IsUserInRole(uInfo.LoginName, "Agent"))
            {
                uInfo.Id = uInfo.UserId;
                uInfo.AgentId = uInfo.UserId;
                uInfo.UserRole = UserRoles.Agent;
            }
            else if (Roles.IsUserInRole(uInfo.LoginName, "RK"))
            {
                uInfo.Id = uInfo.UserId;
                uInfo.RKId = uInfo.UserId;
                uInfo.UserRole = UserRoles.RK;
            }
            else if (Roles.IsUserInRole(uInfo.LoginName, "Broker")) 
            {
                uInfo.Id = uInfo.BrokerId;
                uInfo.UserRole = UserRoles.Broker;
            }
            else if (Roles.IsUserInRole(uInfo.LoginName, "Employer"))
            {
                uInfo.Id = uInfo.EmployerId;
                uInfo.UserRole = UserRoles.Employer;
                BizInfoDetails _er = BLL.Employer.GetBizInfoDetails(uInfo.EmployerId);
                if (_er != null)
                {
                    uInfo.AgencyId = _er.AgencyId;
                }
            }
            else if (Roles.IsUserInRole(uInfo.LoginName, "Employee"))
            {
                uInfo.Id = uInfo.EmployeeId;
                uInfo.UserRole = UserRoles.Employee;
                MemberInfoDetails ee = EmployerAccess.GetMemberInfoDetails(uInfo.EmployeeId);
                uInfo.MemberId = ee.MemberId;
                uInfo.EmployerId = ee.EmployerId;
            }
            else if (Roles.IsUserInRole(uInfo.LoginName, "Dependent"))
            {
                uInfo.Id = uInfo.MemberId;
                uInfo.UserRole = UserRoles.Dependent;
                MemberInfoDetails ee = EmployerAccess.GetMemberInfoDetails(uInfo.MemberId);
                uInfo.EmployerId = ee.EmployerId;
                uInfo.EmployeeId = ee.EmployeeId;
            }
            else
            {
                uInfo = null;
            }
            return uInfo;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="loginName"></param>
        /// <returns></returns>
        public static UserCacheInfo GetWebUserInfo(string loginName)
        {
            return UserDataAccess.GetWebUserInfo(loginName);
        }

        /// <summary>
        /// Get Web Admin User Details
        /// </summary>
        /// <param name="uid"></param>
        /// <returns></returns>
        public static WebUser GetAdminDetails(string uid)
        {
            return UserDataAccess.GetAdminDetails(uid);
        }

        /// <summary>
        /// Get Web User Login name
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="role"></param>
        /// <returns></returns>
        public static string GetWebUserLoginname(string userId, UserRoles role)
        {
            return UserDataAccess.GetWebUserLoginname(userId, role);
        }

        public static string GetWebUserEmail(string employerid)
        {
            return UserDataAccess.GetWebUserEmail(employerid);
        }

        /// <summary>
        /// Update Web User Status
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="isLocked"></param>
        /// <returns></returns>
        public static bool UpdateWebUserStatus(string loginName, bool lockUser)
        {
            return UserDataAccess.LockoutMembshipUser(loginName, lockUser);
        }

        /// <summary>
        /// Insert new web user into Web_User Table
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="role"></param>
        /// <param name="userId"></param>
        /// <param name="employerId"></param>
        /// <param name="employeeId"></param>
        /// <param name="memberId"></param>
        /// <param name="updatedBy"></param>
        /// <returns></returns>
        public static bool InsertWebUser(string loginName, UserRoles role, string userId, string employerId, string employeeId, string memberId, string brokerId, string updatedBy)
        {
            return UserDataAccess.InsertWebUser(loginName, role, userId, employerId, employeeId, memberId, brokerId, updatedBy);
        }

        /// <summary>
        /// Update Web User
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="userName"></param>
        /// <param name="emailAddress"></param>
        /// <param name="updatedBy"></param>
        /// <returns></returns>
        public static bool UpdateUser(string userId, string userName, string emailAddress, string updatedBy)
        {
            return UserDataAccess.UpdateUser(userId, userName, emailAddress, updatedBy);
        }

        public static DataTable SearchAdministrators(string clue) {
            using (DataTable dt = UserDataAccess.SearchAdministrators(clue)) {
                return dt;
            }
        }

        /// <summary>
        /// Check web site if it is in maintenance
        /// </summary>
        /// <returns></returns>
        public static bool SysIsMaintenance()
        {
            return UserDataAccess.SysIsMaintenance();
        }

        public static bool UnlockAllUsers(bool UnlockAll)
        {
           return UserDataAccess.UnlockAllUsers(UnlockAll);
        }

        public static bool ChangeWebSiteStatus(bool off)
        {
            return UserDataAccess.ChangeWebSiteStatus(off);
        }

        /// <summary>
        /// After login, Update Web User Login Info
        /// </summary>
        /// <param name="loginName"></param>
        /// <param name="ip"></param>
        /// <returns></returns>
        public static bool UpdateWebUserLoginInfo(string loginName, string ip)
        {
            return UserDataAccess.UpdateWebUserLoginInfo(loginName, ip);
        }

        /// <summary>
        /// Delete web user account and membership user
        /// </summary>
        /// <param name="loginName"></param>
        /// <returns></returns>
        public static bool DeleteWebUserByLoginName(string loginName, string deletedBy)
        {
            if (Membership.DeleteUser(loginName))
            {
                return UserDataAccess.DeleteWebUserByLoginName(loginName, deletedBy);
            }
            return false;
        }

        /// <summary>
        /// Delete Web User And Membership User
        /// </summary>
        /// <param name="id"></param>
        /// <param name="deletedBy"></param>
        /// <returns></returns>
        public static bool DeleteWebUserAndMembershipUser(string id, string loginName, string deletedBy)
        {
            if (!string.IsNullOrEmpty(loginName))
            {
                Membership.DeleteUser(loginName);
            }
            return UserDataAccess.DeleteWebUserById(id, deletedBy);
        }

        public static bool ValidateNewWebUserAccount(string uId, string roleId, string loginName, out string msg)
        {
            return UserDataAccess.ValidateNewWebUserAccount(uId, roleId, loginName, out msg);
        }

        public static bool UpdateMembshipUserEmail(string loginName, string email)
        {
            return UserDataAccess.UpdateMembshipUserEmail(loginName, email);
        }

        public static DataTable GetState()
        {
            using (DataTable dt = UserDataAccess.GetState())
            {
                return dt;
            }
        }
        public static bool ChangeLoginName(string applicationName,string loginName, string newLoginName)
        {
           return UserDataAccess.ChangeLoginName(applicationName,loginName, newLoginName);
        }

        public static bool ChangeEmail(string username , string newEmail)
        {
           return UserDataAccess.ChangeEmail(username, newEmail);
        }

        public static bool hasValidTime(int userRole, string userName)
        {
            return UserDataAccess.hasValidTime(userRole, userName);
        }
    }
}
