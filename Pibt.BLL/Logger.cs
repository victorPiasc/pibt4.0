using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pibt.Model;
using System.Web;
using Pibt.DAL;
using System.Data;

namespace Pibt.BLL
{
    public class Logger
    {
        /// <summary>
        /// Write Audit Log for current authenticated user
        /// </summary>
        /// <param name="message"></param>
        /// <param name="eCode"></param>
        public static void WriteAuditLog(string message, EventCode eCode)
        {
            LogDataAccess.InsertLog(new WebSiteLog
            {
                LogType = Model.LogType.Audit,
                EventCode = eCode,
                EventDetails = message,
                UserName = HttpContext.Current.User.Identity.Name,
                FromIP = HttpContext.Current.Request.UserHostAddress
            });
        }

        /// <summary>
        /// Write Audit Log
        /// </summary>
        /// <param name="message"></param>
        /// <param name="eCode"></param>
        /// <param name="op"></param>
        /// <param name="ip"></param>
        public static void WriteAuditLog(string message, EventCode eCode, string op, string ip)
        {
            LogDataAccess.InsertLog(new WebSiteLog
            {
                LogType = Model.LogType.Audit,
                EventCode = eCode,
                EventDetails = message,
                UserName = op,
                FromIP = ip
            });
        }

        /// <summary>
        /// Add Log
        /// </summary>
        /// <param name="log"></param>
        public static void InsertLog(WebSiteLog log)
        {
            LogDataAccess.InsertLog(log);
        }

        /// <summary>
        /// Get All Audit Logs
        /// </summary>
        /// <returns></returns>
        public static DataTable GetAuditLogs()
        {
            using (DataTable dt = LogDataAccess.GetAuditLogs())
            {
                return dt;
            }
        }

        public static DataTable SearchAuditLogs(string clue, DateTime? dtStart, DateTime? dtEnd) {
            using (DataTable dt = LogDataAccess.SearchAuditLogs(clue, dtStart, dtEnd)) {
                return dt;
            }
        }

        /// <summary>
        /// Search System Error Logs
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="keyWords"></param>
        /// <param name="dtStart"></param>
        /// <param name="dtEnd"></param>
        /// <returns></returns>
        public static DataTable SearchErrorLogs(string userName, string keyWords, DateTime? dtStart, DateTime? dtEnd)
        {
            using (DataTable dt = LogDataAccess.SearchErrorLogs(userName, keyWords, dtStart, dtEnd))
            {
                return dt;
            }
        }

        /// <summary>
        /// Get All Error Logs
        /// </summary>
        /// <returns></returns>
        public static DataTable GetErrorLogs()
        {
            using (DataTable dt = LogDataAccess.GetErrorLogs())
            {
                return dt;
            }
        }

        public static void DeleteLogs(int months, LogType type)
        {
            LogDataAccess.DeleteLogs(months, type);
        }

    }
}
