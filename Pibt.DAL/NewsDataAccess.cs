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
    public class NewsDataAccess
    {
        public static DataTable GetListBySortSeq(string sortSeq)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
               new SqlParameter("@SORTSEQ", SqlDbType.Int)
            };
            _params[0].Value = Convert.ToInt64(sortSeq);
            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure, "News_GetListBySortSeq", _params))
            {
               return dt;
            }
        }

        public static News GetDetails(string newsId)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@NEWSID", SqlDbType.BigInt)
            };
            _params[0].Value = Convert.ToInt64(newsId);
            News _news = null;
            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"News_GetById",_params))
            {
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    _news = new News()
                    {
                        Id = Utilities.ToString(dr["NEWSID"]),
                        Title = Utilities.ToString(dr["NEWSTITLE"]),
                        Content = Utilities.ToString(dr["NEWSCONTENT"]),
                        PublishedDate = Convert.ToDateTime(dr["NEWSDATE"]),
                        StartDate = Convert.ToDateTime(dr["STARTDATE"]),
                        EndDate = Convert.ToDateTime(dr["ENDDATE"]),
                        SortSeq = Convert.ToString(dr["SORTSEQ"]),
                        KeyWords = Utilities.ToString(dr["KeyWords"]),
                        CreatedDate = Convert.ToDateTime(dr["CREATEDDATE"]),
                        CreatedBy = Utilities.ToString(dr["CREATEDBY"]),
                        ModifiedDate = Convert.ToDateTime(dr["MODIFIEDDATE"]),
                        ModifiedBy = Utilities.ToString(dr["MODIFIEDBY"])
                    };
                }
            }
            return _news;
        }

        public static bool Delete(string newsId)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@NEWSID", SqlDbType.BigInt)
            };
            _params[0].Value = newsId;
            int result = SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure,"News_Delete",_params);
            return (result != -1);
        }

        public static bool Update(News news)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@NEWSTITLE", SqlDbType.NVarChar),
                new SqlParameter("@NEWSCONTENT", SqlDbType.NVarChar),
                new SqlParameter("@NEWSDATE", SqlDbType.DateTime),
                new SqlParameter("@STARTDATE", SqlDbType.DateTime),
                new SqlParameter("@ENDDATE", SqlDbType.DateTime),
                new SqlParameter("@KEYWORDS", SqlDbType.NVarChar),
                new SqlParameter("@UPDATEDBY", SqlDbType.NVarChar),
                new SqlParameter("@SORTSEQ", SqlDbType.Int),
                new SqlParameter("@NEWSID", SqlDbType.BigInt)

            };
            _params[0].Value = news.Title;
            _params[1].Value = news.Content;
            _params[2].Value = news.PublishedDate;
            _params[3].Value = news.StartDate;
            _params[4].Value = news.EndDate;
            _params[5].Value = news.KeyWords;
            _params[6].Value = news.ModifiedBy;
            _params[7].Value = news.SortSeq;
            if (string.IsNullOrEmpty(news.Id))
                _params[8].Value = DBNull.Value; //Cannot use ternary 
            else
                _params[8].Value = news.Id;
            int result = SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure,"News_Update",_params);
            return (result != -1);
        }

        public static DataTable GetList(int? top)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@Top", SqlDbType.Int)
            };
            if (top.HasValue)
                _params[0].Value = top.Value;

            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"News_Get",_params))
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
            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"News_Searching",_params))
            {
                return dt;
            }
        }
    }
}