using Pibt.DAL;
using System.Data;

namespace Pibt.BLL
{
    public class Invoice
    {
        public static DataTable GetInvoiceDetailsByEmployee(string employeeId)
        {
            using (DataTable dt = InvoiceDataAccess.GetInvoiceDetailsByEmployeeId(employeeId))
            {
                return dt;
            }
        }


        public static DataTable GetOtherChargeByEmployer(string employerId)
        {
            using (DataTable dt = InvoiceDataAccess.GetOtherChargeByEmployerId(employerId))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceHistoryByEmployer(string employerId)
        {
            using (DataTable dt = InvoiceDataAccess.GetInvoiceHistoryByEmployerId(employerId))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceHistReportByNum(string invoiceNbr)
        {
            using (DataTable dt = InvoiceDataAccess.GetInvoiceHistReportByNum(invoiceNbr))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceChartForAdmin(string agencyId, string isCobrMember, string planTypeId, string months)
        {
            using (DataTable dt = InvoiceDataAccess.GetInvoiceChartForAdmin(agencyId, isCobrMember, planTypeId, months))
            {
                return dt;
            }
        }
        public static DataTable GetInvoiceHistoryByNumber(string invoiceNbr)
        {
            using (DataTable dt = InvoiceDataAccess.GetInvoiceHistoryDetails(invoiceNbr, null))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceHistoryDetails(string invoiceNbr, string employeeId)
        {
            using (DataTable dt = InvoiceDataAccess.GetInvoiceHistoryDetails(invoiceNbr, employeeId))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceHistoryByNumberAndEeId(string invoiceNbr, string employeeId)
        {
            using (DataTable dt = InvoiceDataAccess.GetInvoiceHistoryByNumberAndEeId(invoiceNbr, employeeId))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceHistoryOtherCharges(string invoiceNbr)
        {
            using (DataTable dt = InvoiceDataAccess.GetInvoiceHistoryOtherCharges(invoiceNbr))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceMembers(string invoiceNbr, string employeeId)
        {
            using (DataTable dt = InvoiceDataAccess.GetInvoiceMembers(invoiceNbr, employeeId))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceHistSummary(string invoiceNbr)
        {
            using (DataTable dt = InvoiceDataAccess.GetInvoiceHistSummary(invoiceNbr))
            {
                return dt;
            }
        }

        public static DataTable GetInvoiceAR(string empoyerId)
        {
            using (DataTable dt = InvoiceDataAccess.GetInvoiceAR(empoyerId))
            {
                return dt;
            }
        }

        public static bool EmployeeOnLastInvoice(string employerId, string employeeId)
        {
            return InvoiceDataAccess.EmployeeOnLastInvoice(employerId, employeeId);
        }

        public static DataTable singleInvoice(string invoiceNbr, string employerId)
        {
            using (DataTable dt = InvoiceDataAccess.singleInvoice(invoiceNbr, employerId))
            {
                return dt;
            }
        }
    }
}
