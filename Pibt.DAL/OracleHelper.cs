using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Configuration.Assemblies;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
using System.Configuration;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.DAL
{
    public class OracleHelper
    {
        private static string constrg = ConfigurationManager.ConnectionStrings["OracleLiveConnectionString"].ToString();
        private static int poolSize = ApplicationConfiguration.IsTestServer? 10 : 1000;
        private static OracleConnection[] pool = new OracleConnection[poolSize];  // Placeholder for eventual connections
        public static bool[] poolBusy = new bool[poolSize];


        public static OracleConnection getConnection(string connectionString, out int index) 
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
            if (index<0)                                                   // Got one?
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
            if (pool[index]==null)                                         // Is there a connection already?
            {
                pool[index] = new OracleConnection(connectionString);      // No - Make one
                pool[index].Open();
            }
            return pool[index];                                            // Either way, return a connection
        }

        public static object genericCommand(string cmdText, OracleParameter[] prms, CommandType Type, int choice)
        {
            int index=0;
            object data = null;
            bool success = false;
            Exception savedEx=null;
            OracleCommand cmd;
            OracleConnection conn;
            for (int tries = 0; !success && tries < poolSize; tries++)
            {
                conn = getConnection(constrg, out index);
                cmd = new OracleCommand(cmdText, conn);
                cmd.CommandType = Type;
                
                if (prms != null)
                    foreach (OracleParameter p in prms)
                        cmd.Parameters.Add(p);
                try
                {
                    switch(choice)
                    {
                        case 1:
                            OracleDataReader rd = cmd.ExecuteReader();
                            data = rd;
                            break;
                        case 2:
                            DataSet ds = new DataSet();
                            OracleDataAdapter adpt = new OracleDataAdapter(cmd);
                            adpt.Fill(ds);
                            data = ds;
                            break;
                        case 3:
                            DataTable dt = new DataTable();
                            OracleDataAdapter adpt2 = new OracleDataAdapter(cmd);
                            adpt2.Fill(dt);
                            data = dt;
                            break;
                        case 4:
                            cmd.ExecuteNonQuery();
                            data=0;
                            break;
                        default:
                            data = cmd.ExecuteScalar();
                            break;
                    }
                    success = true;
                }
                catch(Exception ex)
                {
                    savedEx = ex;
                    try
                    {
                        pool[index].Close();
                    }
                    catch (Exception)
                    {
                        //EMPTY
                    }
                    pool[index] = null;
                    cmd.Parameters.Clear();
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

        #region Reader
        /// <summary>
        /// Returns a datareader for the oracle command
        /// </summary>
        /// <param name="constrg"></param>
        /// <param name="cmdText"></param>
        /// <param name="prms"></param>
        /// <returns></returns>
        public static OracleDataReader ExecuteReader(string cmdText, OracleParameter[] prms, CommandType Type)
        {
            return (OracleDataReader) genericCommand(cmdText, prms, Type, 1);
        }

        /// <summary>
        /// Returns a datareader for the oracle command
        /// </summary>
        /// <param name="constrg"></param>
        /// <param name="cmdText"></param>
        /// <returns></returns>
        public static OracleDataReader ExecuteReader(string cmdText, CommandType Type)
        {
            return ExecuteReader(cmdText, null, Type);
        }
        #endregion

        #region DataSet
        /// <summary>
        /// Returns a dataset for the oracle command
        /// </summary>
        /// <param name="constrg"></param>
        /// <param name="cmdText"></param>
        /// <param name="prms"></param>
        /// <returns></returns>
        public static DataSet ExecuteDataSet(string cmdText, OracleParameter[] prms, CommandType Type)
        {
            return (DataSet)genericCommand(cmdText, prms, Type, 2);
        }

        /// <summary>
        /// Returns a dataset for the oracle command
        /// </summary>
        /// <param name="constrg"></param>
        /// <param name="cmdText"></param>
        /// <returns></returns>
        public static DataSet ExecuteDataSet(string cmdText, CommandType Type)
        {
            return ExecuteDataSet(cmdText, null, Type);
        }
        #endregion

        #region DataTable
        /// <summary>
        /// Returns a datatable for the oracle command
        /// </summary>
        /// <param name="constrg"></param>
        /// <param name="cmdText"></param>
        /// <param name="prms"></param>
        /// <returns></returns>
        public static DataTable ExecuteDataTable(string cmdText, OracleParameter[] prms, CommandType Type)
        {
            return (DataTable)genericCommand(cmdText, prms, Type, 3);
        }

        /// <summary>
        /// Returns a datatable for the oracle command
        /// </summary>
        /// <param name="constrg"></param>
        /// <param name="cmdText"></param>
        /// <returns></returns>
        public static DataTable ExecuteDataTable(string cmdText, CommandType Type)
        {
            return ExecuteDataTable(cmdText, null, Type);
        }
        #endregion

        #region NonQuery
        /// <summary>
        /// Executes a non query
        /// </summary>
        /// <param name="constrg"></param>
        /// <param name="cmdText"></param>
        /// <param name="prms"></param>
        /// <returns></returns>
        public static int ExecuteNonQuery(string cmdText, OracleParameter[] prms, CommandType Type)
        {
            return (int)genericCommand(cmdText, prms, Type, 4);
        }

        /// <summary>
        /// Executes a non query
        /// </summary>
        /// <param name="constrg"></param>
        /// <param name="cmdText"></param>
        /// <returns></returns>

        public static int ExecuteNonQuery(string cmdText, CommandType Type)
        {
            return ExecuteNonQuery(cmdText, null, Type);
        }
        #endregion

        #region Scalar
        /// <summary>
        /// Returns the scalar object of the query
        /// </summary>
        /// <param name="constrg"></param>
        /// <param name="cmdText"></param>
        /// <param name="prms"></param>
        /// <returns></returns>
        public static object ExecuteScalar(string cmdText, OracleParameter[] prms, CommandType Type)
        {
            return genericCommand(cmdText, prms, Type, 5);
        }

        /// <summary>
        /// Returns the scalar object of the query
        /// </summary>
        /// <param name="constrg"></param>
        /// <param name="cmdText"></param>
        /// <returns></returns>
        public static object ExecuteScalar(string cmdText, CommandType Type)
        {
            return ExecuteScalar(cmdText, null, Type);
        }
        #endregion
    }
}

