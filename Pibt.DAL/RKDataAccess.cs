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
    public class RKDataAccess
    {
        public static RKDetails GetRKDetails(string userId,string rkId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUserId", OracleDbType.Varchar2,8, userId, ParameterDirection.Input),
                new OracleParameter("pRKId", OracleDbType.Varchar2,8, rkId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            RKDetails details = null;
            using (OracleDataReader dr = OracleHelper.ExecuteReader("WEB_GetRKDetails", _params, CommandType.StoredProcedure))
            {
                if (dr.Read())
                {
                    details = new RKDetails()
                    {
                        RKId = Utilities.ToString(dr["Csrid"]),
                        RKName = Utilities.ToString(dr["RK"]),
                        UserName = Utilities.ToString(dr["Username"]),
                        LoginName = Utilities.ToString(dr["loginname"]),
                        EmailAddress = Utilities.ToString(dr["Emailaddress"]),
                        UserId = Utilities.ToString(dr["Userid"]),
                        Extension = Utilities.ToString(dr["Extension"]),
                        Cobrarep = Utilities.ToString(dr["Cobrarep"]),
                        LeaderId = Utilities.ToString(dr["LeaderId"]),
                        LeaderName = Utilities.ToString(dr["TeamLead"]),
                        IsLockout = Utilities.ToBool(dr["IsLockout"]),
                        LastLoginIP = Utilities.ToString(dr["LastLoginIP"]),
                        LastLoginTime = Utilities.ToString(dr["LastLoginTime"]),
                        Updated = Utilities.ToString(dr["Updated"]),
                        UpdatedBy = Utilities.ToString(dr["UpdatedBy"])
                    };
                }
            }
            return details;
        }

        public static DataTable SearchRKs(string clue) {
            OracleParameter[] _params = new OracleParameter[] {
                new OracleParameter("pClue", OracleDbType.Varchar2, clue, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_SearchCsrinfo", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool SynRKToWebUsersTable(string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("PUpdatedBy", OracleDbType.Varchar2, 10, updatedBy, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("Web_SynRKWebUsersTable", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool validateEmployerRk(string userId, string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUserId", OracleDbType.Varchar2, userId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_validateEmployerRk", _params, CommandType.StoredProcedure);

            return int.Parse(_params[2].Value.ToString()) > 0;
        }
    }
}