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
    public class DocumentDataAccess
    {
        public static Document GetDetails(string id)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@DocumentId", SqlDbType.BigInt)
            };
            _params[0].Value = Convert.ToInt64(id);
            Document _doc = null;
            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"Documents_GetById",_params))
            {
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    _doc = new Document()
                    {
                        DocumentId = Utilities.ToString(dr["DocumentId"]),
                        Name = Utilities.ToString(dr["DocumentName"]),
                        DocumentURL = Utilities.ToString(dr["DocumentURL"]),
                        SortId = Utilities.ToInt(dr["Sort"]),
                        KeyWords = Utilities.ToString(dr["KeyWords"]),
                        DocumentTypeId = Utilities.ToInt(dr["DocumentTypeId"]),
                        DocumentTypeName = Utilities.ToString(dr["DocumentURL"]),
                        CreatedDate = Convert.ToDateTime(dr["CREATEDDATE"]),
                        CreatedBy = Utilities.ToString(dr["CREATEDBY"]),
                        ModifiedDate = Convert.ToDateTime(dr["MODIFIEDDATE"]),
                        ModifiedBy = Utilities.ToString(dr["MODIFIEDBY"])
                    };
                }
            }
            return _doc;
        }

        public static bool Delete(string docId)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@DOCUMENTID", SqlDbType.BigInt)
            };
            _params[0].Value = docId;
            int result = SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure,"Documents_Delete",_params);
            return (result != -1);
        }

        public static bool Update(Document doc)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@DOCUMENTNAME", SqlDbType.NVarChar),
                new SqlParameter("@DOCUMENTURL", SqlDbType.NVarChar),
                new SqlParameter("@DOCUMENTTYPEID", SqlDbType.Int),
                new SqlParameter("@SORT", SqlDbType.Int),
                new SqlParameter("@KEYWORDS", SqlDbType.NVarChar),
                new SqlParameter("@UPDATEDBY", SqlDbType.NVarChar),
                new SqlParameter("@DOCUMENTID", SqlDbType.BigInt)
            };
            _params[0].Value = doc.Name;
            _params[1].Value = doc.DocumentURL;
            _params[2].Value = doc.DocumentTypeId;
            _params[3].Value = doc.SortId;
            if (string.IsNullOrEmpty(doc.KeyWords))
                _params[4].Value = DBNull.Value;
            else
                _params[4].Value = doc.KeyWords;
            _params[5].Value = doc.ModifiedBy;
            if (string.IsNullOrEmpty(doc.DocumentId))
                _params[6].Value = DBNull.Value;
            else
                _params[6].Value = doc.DocumentId;
            int result = SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure,"Documents_Update",_params);
            return (result != -1);
        }

        public static DataTable GetDocType()
        {
            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"Documents_GetDocType", null))
            {
                return dt;
            }
        }

        public static DataTable GetList()
        {
            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"Documents_Get", null))
            {
                return dt;
            }
        }

        public static DataTable GetTypeList(bool onlyIncludedAvailable)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@AvailableType", SqlDbType.Bit)
            };
            if (onlyIncludedAvailable)
                _params[0].Value = true;
            else
                _params[0].Value = DBNull.Value;
            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"DocumentType_Get",_params))
            {
                return dt;
            }       
        }

        public static DataTable GetListByType(int typeId)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@DocumentTypeId", SqlDbType.Int)
            };

            _params[0].Value = typeId;
            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"Documents_GetByTypeId",_params))
            {
                return dt;
            }
        }

        public static DataTable Searching(string keyWord)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@Keyword", SqlDbType.NVarChar)
            };
            if (string.IsNullOrEmpty(keyWord))
                _params[0].Value = DBNull.Value;
            else
                _params[0].Value = keyWord;

            using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"Documents_Searching",_params))
            {
                return dt;
            }
        }
    }
}