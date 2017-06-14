using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Oracle.DataAccess.Client;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.DAL
{
    public class AgentDataAccess
    {
        public static DataTable GetAgentFavorites(string WebUserId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pWebUserId", OracleDbType.Varchar2, WebUserId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetAgentFavorites", _params, CommandType.StoredProcedure))
            {
               return dt;
            }
        }

        public static bool AddToFavorites(string WebUserId, string EmployerId, string UpdatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pWebUserId", OracleDbType.Varchar2, WebUserId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, EmployerId, ParameterDirection.Input),
                new OracleParameter("UpdatedBy", OracleDbType.Varchar2, UpdatedBy, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_AddToAgentFavorites", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static DataTable GetAgentIdByAgentName(string Name)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pName", OracleDbType.Varchar2, Name, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetAgentIdByAgentName", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetAgentList()
        {
            OracleParameter[] _params = new OracleParameter[]
            {               
               new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetAgentList", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetEnrollerIdbyWebName(string webName)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pWebName", OracleDbType.Varchar2, webName, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetEnrollerIdByWebName", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetEmployeesByEnrollerId(string enrollerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEnrollerId", OracleDbType.Varchar2, enrollerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETEMPLOYEESBYENROLLERID", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static AgentDetails GetEnrollerDetails(string userId, bool isAgent)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUserId", OracleDbType.Varchar2, userId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor,ParameterDirection.Output) 
            };
            AgentDetails details = null;
            using (OracleDataReader dr = OracleHelper.ExecuteReader(isAgent ? "web_GetAgentDetails" : "web_GetEnrollerDetails", _params, CommandType.StoredProcedure))
            {
                // Read data
                if (dr.Read())
                {
                    details = new AgentDetails()
                    {
                        AgentId = isAgent ? "": Utilities.ToString(dr["Enrollerid"]),
                        UserId = Utilities.ToString(dr["Userid"]),
                        UserName = Utilities.ToString(dr["Username"]),
                        LoginName = Utilities.ToString(dr["loginname"]),
                        EmailAddress = Utilities.ToString(dr["Emailaddress"]),
                        IsLockout = Utilities.ToBool(dr["IsLockout"]),
                        LastLoginIP = Utilities.ToString(dr["LastLoginIP"]),
                        LastLoginTime = Utilities.ToString(dr["LastLoginTime"]),
                        Updated = Utilities.ToString(dr["Updated"]),
                        UpdatedBy = Utilities.ToString(dr["UpdatedBy"])
                    };
                }
                dr.Close();
            }
            return details;
        }

        public static DataTable GetEnrollersByErId(int employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEemployerId", OracleDbType.Int32,8,employerId,ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor,ParameterDirection.Output) 
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETERENROLLERS", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool UpdateAgent(string userId, string userName, string emailAddress, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUserId", OracleDbType.Varchar2, userId,ParameterDirection.Input),
                new OracleParameter("pUserName", OracleDbType.Varchar2, userName,ParameterDirection.Input),
                new OracleParameter("pEmailAddress", OracleDbType.Varchar2, emailAddress,ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2, updatedBy,ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_UpdateAgent", _params, CommandType.StoredProcedure);
            return (result != -1);

        }

        public static DataTable SearchAgents(string clue, bool agent) {
            OracleParameter[] _params = new OracleParameter[] {
                new OracleParameter("pClue", OracleDbType.Varchar2, clue, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor,ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable(agent?"web_searchAgents": "web_searchEnrollers", _params, CommandType.StoredProcedure)) {
                return dt;
            }
        }

        public static bool SynAgentToWebUsersTable(string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("PUpdatedBy", OracleDbType.Varchar2, updatedBy,ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_syncEnrollerWebUsersTable", _params, CommandType.StoredProcedure);
            return (result != -1);
        }
    }
}