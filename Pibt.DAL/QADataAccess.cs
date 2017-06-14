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
    public class QADataAccess
    {
        public static QA GetDetails(string qaId)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@QAID", SqlDbType.BigInt)
            };
            _params[0].Value = Convert.ToInt64(qaId);
            QA _qa = null;
            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"QA_GetById",_params))
            {
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    _qa = new QA()
                    {
                        QAId = Utilities.ToString(dr["QAId"]),
                        Question = Utilities.ToString(dr["Question"]),
                        Answer = Utilities.ToString(dr["Answer"]),
                        IsTop = Utilities.ToBool(dr["IsTop"]),
                        KeyWords = Utilities.ToString(dr["KeyWords"]),
                        CreatedDate = Convert.ToDateTime(dr["CREATEDDATE"]),
                        CreatedBy = Utilities.ToString(dr["CREATEDBY"]),
                        ModifiedDate = Convert.ToDateTime(dr["MODIFIEDDATE"]),
                        ModifiedBy = Utilities.ToString(dr["MODIFIEDBY"])
                    };
                }
            }
            return _qa;
        }

        public static bool Delete(string qaId)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@QAID", SqlDbType.BigInt)
            };
            _params[0].Value = qaId;
            int result = SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure,"QA_Delete",_params);
            return (result != -1);
        }

        public static bool Update(QA qa)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@QUESTION", SqlDbType.NVarChar),
                new SqlParameter("@ANSWER", SqlDbType.NVarChar),
                new SqlParameter("@ISTOP", SqlDbType.Bit),
                new SqlParameter("@KEYWORDS", SqlDbType.NVarChar),
                new SqlParameter("@UPDATEDBY", SqlDbType.NVarChar),
                new SqlParameter("@QAID", SqlDbType.BigInt)
            };
            _params[0].Value = qa.Question;
            _params[1].Value = qa.Answer;
            _params[2].Value = qa.IsTop;
            _params[3].Value = qa.KeyWords;
            _params[4].Value = qa.ModifiedBy;
            if (string.IsNullOrEmpty(qa.QAId))
                _params[5].Value = DBNull.Value;
            else
                _params[5].Value = qa.QAId;

            int result =SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure,"QA_Update",_params);
            return (result != -1);
        }

        public static DataTable GetList(bool? isTop, int? top)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@isTop", SqlDbType.Bit),
                new SqlParameter("@Top", SqlDbType.Int)
            };

            if (isTop.HasValue)
                _params[0].Value = isTop.Value;
            if (top.HasValue)
                _params[1].Value = top.Value;

            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"QA_Get",_params))
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

            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"QA_Searching",_params))
            {
                return dt;
            }
        }
    }
}