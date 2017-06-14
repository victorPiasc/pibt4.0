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
    public class LegalDocDataAccess
    {
        public static LegalDoc GetDetails(string id)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pId", OracleDbType.Varchar2,2,id, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor,ParameterDirection.Output) 
            };
            LegalDoc _legalDoc = null;
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETOELEGALDOCDETAILS", _params, CommandType.StoredProcedure))
            {
                if (dt.Rows.Count > 0)
                {
                    DataRow dr = dt.Rows[0];
                    _legalDoc = new LegalDoc()
                    {
                        Id = Utilities.ToString(dr["Id"]),
                        Description = Utilities.ToString(dr["Description"]),
                        LegalContentHtml = Utilities.ToString(dr["LegalContentHtml"]),
                        LegalContent = Utilities.ToString(dr["LegalContent"]),
                        CarrierId = Utilities.ToInt(dr["CarrierId"]),
                        CreatedDate = Convert.ToDateTime(dr["CREATEDDATE"]),
                        CreatedBy = Utilities.ToString(dr["CREATEDBY"]),
                        ModifiedDate = Convert.ToDateTime(dr["MODIFIEDDATE"]),
                        ModifiedBy = Utilities.ToString(dr["MODIFIEDBY"])
                    };
                }
            }
            return _legalDoc;
        }

        public static string GetLegalDocDetails(int carrierid, int html)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCARRIERID", OracleDbType.Varchar2,3,carrierid.ToString(), ParameterDirection.Input),
                new OracleParameter("pHTML", OracleDbType.Int32,1,html, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor,ParameterDirection.Output) 
            };
            object _legalDoc = OracleHelper.ExecuteScalar("Web_GetOELEGALDOCBYCARRIERIDS", _params, CommandType.StoredProcedure);
            return Utilities.ToString(_legalDoc);
        }

        public static bool Delete(string id)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pId", OracleDbType.Varchar2,2,id, ParameterDirection.Input),
            };

            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_DELETEOELEGALDOCS", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool Update(LegalDoc doc)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pDESCRIPTION", OracleDbType.Varchar2,200,doc.Description, ParameterDirection.Input),
                new OracleParameter("pLEGALCONTENTHtml", OracleDbType.Varchar2,4000,doc.LegalContentHtml, ParameterDirection.Input),
                new OracleParameter("pLEGALCONTENT", OracleDbType.Varchar2,4000,doc.LegalContent, ParameterDirection.Input),
                new OracleParameter("pCARRIERID", OracleDbType.Varchar2,3,doc.CarrierId.ToString(), ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2,20,doc.ModifiedBy, ParameterDirection.Input),
                new OracleParameter("pId", OracleDbType.Varchar2,2,doc.Id, ParameterDirection.Input)
            };

            int result = -1;
            result = OracleHelper.ExecuteNonQuery("Web_UpdateOELEGALDOCS", _params, CommandType.StoredProcedure);
            return (result != -1);

        }

        public static bool Insert(LegalDoc doc)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pDESCRIPTION", OracleDbType.Varchar2,200,doc.Description, ParameterDirection.Input),
                new OracleParameter("pLEGALCONTENTHtml", OracleDbType.Varchar2,4000,doc.LegalContentHtml, ParameterDirection.Input),
                new OracleParameter("pLEGALCONTENT", OracleDbType.Varchar2,4000,doc.LegalContent, ParameterDirection.Input),
                new OracleParameter("pCARRIERID", OracleDbType.Varchar2,3,doc.CarrierId.ToString(), ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2,20,doc.CreatedBy, ParameterDirection.Input)
            };

            int result = -1;
            result = OracleHelper.ExecuteNonQuery("Web_InsertOELEGALDOCS", _params, CommandType.StoredProcedure);
            return (result != -1);

        }

        public static DataTable GetList()
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("v_refcur", OracleDbType.RefCursor,ParameterDirection.Output) 
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETOELEGALDOCS", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }
    }
}