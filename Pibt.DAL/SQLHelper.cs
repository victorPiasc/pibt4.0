//===============================================================================
// This file is based on the Microsoft Data Access Application Block for .NET
// For more information please go to 
// http://msdn.microsoft.com/library/en-us/dnbda/html/daab-rm.asp
//===============================================================================

using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.DAL
{

    /// <summary>
    /// The SqlHelper class is intended to encapsulate high performance, 
    /// scalable best practices for common uses of SqlClient.
    /// </summary>
    public abstract class SQLHelper
    {
        public static string conn;
        private static int poolSize = ApplicationConfiguration.IsTestServer ? 10 : 1000;
        private static SqlConnection[] pool = new SqlConnection[poolSize];  // Placeholder for eventual connections
        public static bool[] poolBusy = new bool[poolSize];

        //Database connection strings 
        public static string constrg
        {
            get
            {
                if (string.IsNullOrEmpty(conn))
                {
                    System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/");
                    conn = rootWebConfig.ConnectionStrings.ConnectionStrings["MaximumASPSqlServer"].ConnectionString;
                }
                return conn;
            }
        }

        public static SqlConnection getConnection(string connectionString, out int index)
        {
            lock (pool)                                                    // Lock the area, because hits may be simultanous
            {
                for (index = poolSize; --index >= 0; )                     // Search for open space
                    if (!poolBusy[index])                                  // Available?
                    {
                        poolBusy[index] = true;                            // Yes - Mark as ours
                        break;
                    }
            }                                                              // Unlock ASAP
            if (index < 0)                                                   // Got one?
            {
                LogDataAccess.InsertLog(new WebSiteLog
                {
                    LogType = LogType.Error,
                    EventCode = EventCode.AppError,
                    EventDetails = "Pool exhausted",
                    UserName = "",
                    FromIP = ""
                });
                throw new Exception("Pool exhausted");                     // No - Pool not big enough
            }
            if (pool[index] == null)                                         // Is there a connection already?
            {
                pool[index] = new SqlConnection(connectionString);      // No - Make one
                pool[index].Open();
            }
            return pool[index];                                            // Either way, return a connection
        }

        public static object genericCommand(string cmdText, SqlParameter[] prms, CommandType Type, int choice)
        {
            int index = 0;
            object data = null;
            bool success = false;
            Exception savedEx = null;
            for (int tries = 0; !success && tries < poolSize; tries++)
            {
                SqlConnection conn = getConnection(constrg, out index);
                SqlCommand cmd = new SqlCommand(cmdText, conn);
                cmd.CommandType = Type;
                if (prms != null)
                    foreach (SqlParameter p in prms)
                        cmd.Parameters.Add(p);
                try
                {
                    switch (choice)
                    {
                        case 1:
                            SqlDataReader rd = cmd.ExecuteReader();
                            data = rd;
                            break;
                        case 2:
                            DataSet ds = new DataSet();
                            SqlDataAdapter adpt = new SqlDataAdapter(cmd);
                            adpt.Fill(ds);
                            data = ds;
                            break;
                        case 3:
                            DataTable dt = new DataTable();
                            SqlDataAdapter adpt2 = new SqlDataAdapter(cmd);
                            adpt2.Fill(dt);
                            data = dt;
                            break;
                        case 4:
                            cmd.ExecuteNonQuery();
                            data = 0;
                            break;
                        default:
                            data = cmd.ExecuteScalar();
                            break;
                    }
                    success = true;
                }
                catch (Exception ex)
                {
                    savedEx = ex;
                    pool[index] = null;
                }
                poolBusy[index] = false;
            }
            if (savedEx != null)
            {
                LogDataAccess.InsertLog(new WebSiteLog
                {
                    LogType = LogType.Error,
                    EventCode = EventCode.AppError,
                    EventDetails = savedEx.Message,
                    UserName = "",
                    FromIP = ""
                });
                throw savedEx;
            }
            return data;
        }


        /// <summary>
        /// Execute a SqlCommand (that returns no resultset) against the database specified in the connection string 
        /// using the provided parameters.
        /// </summary>
        /// <remarks>
        /// e.g.:  
        ///  int result = ExecuteNonQuery(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
        /// </remarks>
        /// <param name="connectionString">a valid connection string for a SqlConnection</param>
        /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
        /// <param name="commandText">the stored procedure name or T-SQL command</param>
        /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
        /// <returns>an int representing the number of rows affected by the command</returns>
        public static int ExecuteNonQuery(CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
        {
            return (int)genericCommand(cmdText, cmdParms, cmdType, 4);
        }

        /// <summary>
        /// Execute a SqlCommand that returns a resultset against the database specified in the connection string 
        /// using the provided parameters.
        /// </summary>
        /// <remarks>
        /// e.g.:  
        ///  SqlDataReader r = ExecuteReader(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
        /// </remarks>
        /// <param name="connectionString">a valid connection string for a SqlConnection</param>
        /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
        /// <param name="commandText">the stored procedure name or T-SQL command</param>
        /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
        /// <returns>A SqlDataReader containing the results</returns>
        public static SqlDataReader ExecuteReader(CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
        {
            return (SqlDataReader)genericCommand(cmdText, cmdParms, cmdType, 1);
        }

        /// <summary>
        /// Execute a SqlCommand that returns the first column of the first record against the database specified in the connection string 
        /// using the provided parameters.
        /// </summary>
        /// <remarks>
        /// e.g.:  
        ///  Object obj = ExecuteScalar(connString, CommandType.StoredProcedure, "PublishOrders", new SqlParameter("@prodid", 24));
        /// </remarks>
        /// <param name="connectionString">a valid connection string for a SqlConnection</param>
        /// <param name="commandType">the CommandType (stored procedure, text, etc.)</param>
        /// <param name="commandText">the stored procedure name or T-SQL command</param>
        /// <param name="commandParameters">an array of SqlParamters used to execute the command</param>
        /// <returns>An object that should be converted to the expected type using Convert.To{Type}</returns>
        public static object ExecuteScalar(CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
        {
            return genericCommand(cmdText, cmdParms, cmdType, 5);
        }

        public static DataTable ExecuteDataTable(CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
        {
            return (DataTable)genericCommand(cmdText, cmdParms, cmdType, 3);
        }

        public static DataSet ExecuteDataSet(CommandType cmdType, string cmdText, SqlParameter[] cmdParms)
        {
            return (DataSet)genericCommand(cmdText, cmdParms, cmdType, 2);
        }
    }
}