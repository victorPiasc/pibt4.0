using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Oracle.DataAccess.Client;
using Pibt.Model;
using Pibt.Common;
using System.Data.Common;
using System.Data.SqlClient;

namespace Pibt.DAL
{
    public class EventDataAccess
    {
        public static Event GetDetails(string id)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@EventId", SqlDbType.BigInt)
            };
            _params[0].Value = Convert.ToInt64(id);
            Event _event = null;
            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"Events_GetById",_params))
            {
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    _event = new Event()
                    {
                        Id = Utilities.ToString(dr["EventId"]),
                        Name = Utilities.ToString(dr["EventName"]),
                        Content = Utilities.ToString(dr["EventContent"]),
                        Cost = decimal.Parse(Utilities.ToString(dr["Cost"])),
                        KeyWords = Utilities.ToString(dr["KeyWords"]),
                        Location = Utilities.ToString(dr["Location"]),
                        EventDate = Convert.ToDateTime(dr["EventDate"]),
                        EventTime = Utilities.ToString(dr["EventTime"]),
                        CreatedDate = Convert.ToDateTime(dr["CREATEDDATE"]),
                        CreatedBy = Utilities.ToString(dr["CREATEDBY"]),
                        ModifiedDate = Convert.ToDateTime(dr["MODIFIEDDATE"]),
                        ModifiedBy = Utilities.ToString(dr["MODIFIEDBY"])
                    };
                }
            }
            return _event;
        }

        public static bool Delete(string eventId)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@EventID", SqlDbType.BigInt)
            };
            _params[0].Value = eventId;
            int result = SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure,"Events_Delete",_params);;
            return (result != -1);
        }
 
        public static bool Update(Event ev)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@EventName", SqlDbType.NVarChar),
                new SqlParameter("@EventDate", SqlDbType.DateTime),
                new SqlParameter("@Cost", SqlDbType.Decimal),
                new SqlParameter("@Location", SqlDbType.NVarChar),
                new SqlParameter("@EventContent", SqlDbType.NVarChar),
                new SqlParameter("@UpdatedBy", SqlDbType.NVarChar),
                new SqlParameter("@KeyWords", SqlDbType.NVarChar),
                new SqlParameter("@EventID", SqlDbType.BigInt)
            };
            _params[0].Value = ev.Name;
            _params[1].Value = ev.EventDate;
            _params[2].Value = ev.Cost;
            _params[3].Value = ev.Location;
            _params[4].Value = ev.Content;
            _params[5].Value = ev.ModifiedBy;
            _params[6].Value = ev.KeyWords;
            if (string.IsNullOrEmpty(ev.Id))
                _params[7].Value = DBNull.Value;
            else
                _params[7].Value = ev.Id;

            int result = SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure,"Events_Update",_params);
            return (result != -1);
        }

        public static DataTable GetList(int? top)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@TOP", SqlDbType.Int)
            };
            if (top.HasValue)
                _params[0].Value = top.Value;

            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"Events_Get",_params))
            {
                return dt;
            }
        }

        public static DataTable Searching(string keyWord)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@Keyword", SqlDbType.NVarChar,256)
            };
            if (string.IsNullOrEmpty(keyWord))
                _params[0].Value = DBNull.Value;
            else
                _params[0].Value = keyWord;

            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"Events_Searching",_params))
            {
                return dt;
            }
        }
    }
}