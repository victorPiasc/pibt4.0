using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Oracle.DataAccess.Client;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.DAL
{
    public class UserDataAccess
    {
        public static UserCacheInfo GetWebUserInfo(string loginName)
        {
            UserCacheInfo uInfo = new UserCacheInfo(loginName);

            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pLoginName", OracleDbType.Varchar2,loginName, ParameterDirection.Input),
                new OracleParameter("V_Refcur", OracleDbType.RefCursor,ParameterDirection.Output) 
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETWEBUSERINFO", _params, CommandType.StoredProcedure))
            {
                if (dt.Rows.Count > 0)
                {
                    uInfo.UserId = dt.Rows[0]["UserId"].ToString();
                    uInfo.EmployerId = dt.Rows[0]["Employerid"].ToString();
                    uInfo.EmployeeId = dt.Rows[0]["Employeeid"].ToString();
                    uInfo.MemberId = dt.Rows[0]["Memberid"].ToString();
                    uInfo.BrokerId = dt.Rows[0]["Brokerid"].ToString();
                    uInfo.AgencyId = dt.Rows[0]["AgencyId"].ToString();
                }
            }
            return uInfo;
        }

        public static WebUser GetAdminDetails(string uid)
        {
            WebAdmin uInfo = null;
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUserId", OracleDbType.Varchar2,uid, ParameterDirection.Input),
                new OracleParameter("V_Refcur", OracleDbType.RefCursor,ParameterDirection.Output) 
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetWebAdminDetails", _params, CommandType.StoredProcedure))
            {
                if (dt.Rows.Count > 0)
                {
                    uInfo = new WebAdmin();
                    uInfo.UserId = dt.Rows[0]["Userid"].ToString();
                    uInfo.UserName = dt.Rows[0]["Username"].ToString();
                    uInfo.LoginName = dt.Rows[0]["LoginName"].ToString();
                    uInfo.IsLockout = Utilities.ToBool(dt.Rows[0]["Islockout"]);
                    uInfo.LastLoginIP = dt.Rows[0]["Lastloginip"].ToString();
                    uInfo.LastLoginTime = Utilities.ToString(dt.Rows[0]["Lastlogintime"]);
                    uInfo.Updated = Utilities.ToString(dt.Rows[0]["Updated"]);
                    uInfo.UpdatedBy = dt.Rows[0]["UpdatedBy"].ToString();
                    uInfo.EmailAddress = dt.Rows[0]["Emailaddress"].ToString();
                }
            }
            return uInfo;
        }

        public static string GetWebUserLoginname(string userId, UserRoles role)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUserId", OracleDbType.Varchar2,userId, ParameterDirection.Input),
                new OracleParameter("pUserRole", OracleDbType.Int32,(int)role, ParameterDirection.Input),
                new OracleParameter("pWebName", OracleDbType.Varchar2,ParameterDirection.Output) 
            };

            _params[2].Size = 20;
            OracleHelper.ExecuteScalar("WEB_GETWEBUSERLOGINNAME", _params, CommandType.StoredProcedure);
            return _params[2].Value.ToString().Equals("null") ? "" : _params[2].Value.ToString();
        }


        public static string GetWebUserEmail(string employerid)
        {            
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,employerid, ParameterDirection.Input),
                new OracleParameter("pEmail", OracleDbType.Varchar2, ParameterDirection.Output )
            };
            _params[1].Size = 256;
            OracleHelper.ExecuteScalar("WEB_GETWEBUSEREMAIL", _params, CommandType.StoredProcedure);
            return _params[1].Value.ToString() == "null" ? "" : _params[1].Value.ToString();
        }

        public static bool UnlockAllUsers(bool UnlockAll)
        {
           SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@UnlockAll", SqlDbType.Bit)
            };
           int result = SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure,"Web_UnlockAllUsers",_params);
           return (result != -1);

        }

        public static bool LockoutMembshipUser(string loginName, bool lockUser)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@UserName", SqlDbType.NVarChar,20)
            };
            _params[0].Value = loginName;

            int result = lockUser 
                ? SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "aspnet_Membership_LockUser",_params)
                : SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "aspnet_Membership_UnLockUser",_params);
            return (result != -1);
        }


        public static bool UpdateMembshipUserEmail(string loginName, string email)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@UserName", SqlDbType.NVarChar,20),
                new SqlParameter("@Email", SqlDbType.NVarChar,20)
            };
            _params[0].Value = loginName;
            _params[1].Value = email;

            int result = SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure,"aspnet_Membership_UpdateEmail",_params);
            return (result != -1);

        }

        public static bool UpdateWebUserLoginInfo(string loginName, string ip)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("Ploginname", OracleDbType.Varchar2,loginName, ParameterDirection.Input),
                new OracleParameter("PLoginIp", OracleDbType.Varchar2,ip, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_UPDATEUSERWEBLOGININFO", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool DeleteWebUserById(string id, string deletedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pId", OracleDbType.Varchar2,id, ParameterDirection.Input),
                new OracleParameter("pDeletedBy", OracleDbType.Varchar2,deletedBy, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_DELETEWEBUSERBYID", _params, CommandType.StoredProcedure);
            return (result != -1);
        }


        public static bool DeleteWebUserByLoginName(string loginName, string deletedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pLoginName", OracleDbType.Varchar2,loginName, ParameterDirection.Input),
                new OracleParameter("pDeletedBy", OracleDbType.Varchar2,deletedBy, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_DELETEWEBUSERBYLOGINNAME", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool InsertWebUser(string loginName, UserRoles role, string userId, string employerId, string employeeId, string memberId, string brokerId, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pWebUserRoleId", OracleDbType.Int32,(int)role, ParameterDirection.Input),
                new OracleParameter("pWebName", OracleDbType.Varchar2,loginName, ParameterDirection.Input),
                new OracleParameter("pUserId", OracleDbType.Varchar2,userId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,employerId, ParameterDirection.Input),
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2,employeeId, ParameterDirection.Input),
                new OracleParameter("pMemberId", OracleDbType.Varchar2,memberId, ParameterDirection.Input),
                new OracleParameter("pBrokerId", OracleDbType.Varchar2,brokerId, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2,updatedBy, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_InsertWebUser", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdateUser(string userId, string userName, string emailAddress, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("Puserid", OracleDbType.Varchar2,userId, ParameterDirection.Input),
                new OracleParameter("pUserName", OracleDbType.Varchar2,userName, ParameterDirection.Input),
                new OracleParameter("Pemailaddress", OracleDbType.Varchar2,emailAddress, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2,updatedBy, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_UpdateUser", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static DataTable SearchAdministrators(string clue) {
            OracleParameter[] _params = new OracleParameter[] {
                new OracleParameter("pClue", OracleDbType.Varchar2, clue, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output) 
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_Searchwebadministrators", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool SysIsMaintenance()
        {
            object result = SQLHelper.ExecuteScalar(CommandType.StoredProcedure,"Maintenance_GetStatus", null);
            return Utilities.ToBool(result);
        }

        public static bool ChangeWebSiteStatus(bool off)
        {
            SqlParameter[] _params = new SqlParameter[] 
            {
                new SqlParameter("@Off",off)
            };
            int result = SQLHelper.ExecuteNonQuery( CommandType.StoredProcedure, "Maintenance_Update", _params);
            return (result != -1);
        }

        public static bool ValidateNewWebUserAccount(string uId, string roleId, string loginName, out string msg)
        {
            msg = "";

            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("Puserid", OracleDbType.Varchar2,8, uId, ParameterDirection.Input),
                new OracleParameter("puserroleid", OracleDbType.Varchar2,2, roleId, ParameterDirection.Input),
                new OracleParameter("Ploginname", OracleDbType.Varchar2,20, loginName, ParameterDirection.Input),
                new OracleParameter("Poutmsg", OracleDbType.Varchar2,200, msg, ParameterDirection.Output),
            };
            OracleHelper.ExecuteNonQuery("WEB_ValidateNewWebUser", _params, CommandType.StoredProcedure);

            if (_params[3].Value.ToString() == "1")
            {             
                return true;
            }
            msg = Utilities.ToString(_params[3].Value);
            return false;

        }

        public static DataTable GetState()
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)      
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_Getstate", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool ChangeLoginName(string applicationName,string loginName, string newLoginName)
        {
           SqlParameter[] _params = new SqlParameter[]
           {
              new SqlParameter("@ApplicationName", SqlDbType.NVarChar),
              new SqlParameter("@OldUserName", SqlDbType.NVarChar),
              new SqlParameter("@NewUserName", SqlDbType.NVarChar)
           };

           _params[0].Value = applicationName;
           _params[1].Value = loginName;
           _params[2].Value = newLoginName;

           int result = SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "User_ChangeLoginName", _params);
           // if change made to MS SQL server is success, then update oracle BMS.web_users table.  
          if (result == 0)
          {
             //Here update BMS web_users table.
             OracleParameter[] _oraParams = new OracleParameter[]
             {
                new OracleParameter("pLoginName", OracleDbType.Varchar2,loginName, ParameterDirection.Input),
                new OracleParameter("pNewLoginName", OracleDbType.Varchar2,newLoginName, ParameterDirection.Input)
             };

             result = OracleHelper.ExecuteNonQuery("WEB_UpdateLoginName", _oraParams, CommandType.StoredProcedure);
          }
          return (result != -1);
        }

        public static bool ChangeEmail(string username, string newEmail)
        {
           SqlParameter[] _params = new SqlParameter[]
           {              
              new SqlParameter("@UserName", SqlDbType.NVarChar),
              new SqlParameter("@NewEmail", SqlDbType.NVarChar)
           };
          
           _params[0].Value = username;
           _params[1].Value = newEmail;

           int result = SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure,"User_ChangeEmail",_params);
           return (result != -1);
        }

        public static bool hasValidTime(int userRole, string userName)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUserRole", OracleDbType.Int32, userRole, ParameterDirection.Input),
                new OracleParameter("pUserName", OracleDbType.Varchar2, userName, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_hasValidTime", _params, CommandType.StoredProcedure);
            return int.Parse(_params[2].Value.ToString()) > 0;
        }
    }
}