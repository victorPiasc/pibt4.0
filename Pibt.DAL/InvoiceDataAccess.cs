using System;
using Oracle.DataAccess.Client;
using System.Data;

namespace Pibt.DAL
{
    public class InvoiceDataAccess
    {
        public static DataTable GetInvoiceDetailsByEmployeeId(string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetEmployeeInvoiceDetails", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetOtherChargeByEmployerId(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetOtherChargeByEmployer", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceHistoryByEmployerId(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetEmployerInvoiceHist", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceHistoryDetails(string invoiceNbr, string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("PInvoicenbr", OracleDbType.Varchar2, invoiceNbr, ParameterDirection.Input),
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetInvoiceHistDetails", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceHistReportByNum(string invoiceNbr)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("PInvoicenbr", OracleDbType.Varchar2, invoiceNbr, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetInvoiceHistReportByNum", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceChartForAdmin(string agencyId, string isCobrMember, string planTypeId, string months)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("Pagencyid", OracleDbType.Varchar2, agencyId, ParameterDirection.Input),
                new OracleParameter("Pcobramember", OracleDbType.Varchar2, isCobrMember, ParameterDirection.Input),
                new OracleParameter("Pplantypeid", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("Pmonths", OracleDbType.Varchar2, months, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetinvoicechartForAdmin", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceHistoryByNumberAndEeId(string invoiceNbr, string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("PInvoicenbr", OracleDbType.Varchar2, invoiceNbr, ParameterDirection.Input),
                new OracleParameter("PEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetInvoiceHistByEmployee", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceHistoryOtherCharges(string invoiceNbr)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("PInvoicenbr", OracleDbType.Varchar2, invoiceNbr, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetInvoiceHistOtherCharges", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceMembers(string invoiceNbr, string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("PInvoicenbr", OracleDbType.Varchar2, invoiceNbr, ParameterDirection.Input),
                new OracleParameter("PEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetInvoiceEmployees", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceHistSummary(string invoiceNbr)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("PInvoicenbr", OracleDbType.Varchar2, invoiceNbr, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetInvoiceHistSummary", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceAR(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetInvoiceAR", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool EmployeeOnLastInvoice(string employerId, string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_checkEmployeePastInvoice", _params, CommandType.StoredProcedure);

            return 0 < int.Parse(_params[2].Value.ToString());
        }

        public static DataTable singleInvoice(string invoiceNbr, string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pInvoiceNbr", OracleDbType.Varchar2, invoiceNbr, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getSingleInvoice", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }
    }
}
