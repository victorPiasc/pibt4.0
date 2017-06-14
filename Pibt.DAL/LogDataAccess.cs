using System;
using System.Data;
using Pibt.Model;
using System.Data.SqlClient;

namespace Pibt.DAL
{
    public class LogDataAccess
    {
        public static void InsertLog(WebSiteLog log)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@UserName", SqlDbType.NVarChar),
                new SqlParameter("@EventDetails", SqlDbType.NVarChar),
                new SqlParameter("@EventCode", SqlDbType.Int),
                new SqlParameter("@FromIP", SqlDbType.NVarChar)
            };
            _params[0].Value = log.UserName;
            _params[1].Value = log.EventDetails;
            _params[2].Value = (int)log.EventCode;
            _params[3].Value = log.FromIP;

            SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, log.LogType == LogType.Audit ?"Audit_Insert":"ErrorLog_Insert", _params);
        }

        public static DataTable SearchAuditLogs(string clue, DateTime? dtStart, DateTime? dtEnd) {
            SqlParameter[] _params = new SqlParameter[] {
                new SqlParameter("@pClue", SqlDbType.NVarChar),
                new SqlParameter("@StartDate", SqlDbType.DateTime),
                new SqlParameter("@EndDate", SqlDbType.DateTime)
            };
            _params[0].Value = clue;

            // Can't use ternary on these IFs
            if (dtStart.HasValue)
                _params[1].Value = dtStart.Value;
            else
                _params[1].Value = DBNull.Value;
            if (dtEnd.HasValue)
                _params[2].Value = dtEnd.Value;
            else
                _params[2].Value = DBNull.Value;

            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure, "Audit_Search", _params))
            {
                return dt;
            }
        }

        // TODO Should be converted to CLUE format, up and down the call chain from here
        public static DataTable SearchErrorLogs(string userName, string keyWords, DateTime? dtStart, DateTime? dtEnd)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@Username", SqlDbType.NVarChar),
                new SqlParameter("@KeyWords", SqlDbType.NVarChar),
                new SqlParameter("@StartDate", SqlDbType.DateTime),
                new SqlParameter("@EndDate", SqlDbType.DateTime)
            };
            _params[0].Value = userName;
            _params[1].Value = string.IsNullOrEmpty(keyWords.Trim()) ? "" : keyWords.Replace(" ", "%");
            if (dtStart.HasValue)
                _params[2].Value = dtStart.Value;
            else
                _params[2].Value = DBNull.Value;
            if (dtEnd.HasValue)
                _params[3].Value = dtEnd.Value;
            else
                _params[3].Value = DBNull.Value;

            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"ErrorLog_Search",_params))
            {
                return dt;
            }

        }

        public static DataTable GetAuditLogs()
        {
            return GetLogs(LogType.Audit);
        }

        public static DataTable GetErrorLogs()
        {
            return GetLogs(LogType.Error);
        }

        private static DataTable GetLogs(LogType type)
        {
            string cmdText = type == LogType.Audit ? "Audit_Get":"ErrorLog_Get";
            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure, cmdText, null))
            {
                return dt;
            }
        }

        public static void DeleteLogs(int months, LogType type)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@Month", SqlDbType.Int)
            };
            _params[0].Value = months;
            string cmdText = type == LogType.Audit ? "Audit_Delete" : "ErrorLog_Delete";
            SQLHelper.ExecuteNonQuery( CommandType.StoredProcedure, cmdText, _params);
        }
    }
}