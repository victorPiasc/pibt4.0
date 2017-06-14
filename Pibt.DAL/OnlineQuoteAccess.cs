using System;
using System.Collections.Generic;
using System.Data;
using Oracle.DataAccess.Client;
using Pibt.Common;
using Pibt.Model;
using System.Data.SqlClient;

namespace Pibt.DAL
{
    public class OnlineQuoteAccess
    {
        public static int newCartId()
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, ParameterDirection.Output)
            };
            _params[0].Size = 8;
            OracleHelper.ExecuteScalar("web_newCartId", _params, CommandType.StoredProcedure);
            int tmp;
            return int.TryParse(_params[0].Value.ToString(), out tmp) ? tmp : 0;
        }

        //Changes to web_qqcart start
        public static bool InsertWebQQCart(int cartId, string name, int type, string typeName, char male, DateTime DOB, int counter, string contribution, string contributionDep, string period, string salary)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployeename" , OracleDbType.Varchar2, name, ParameterDirection.Input),
                new OracleParameter("pEmployeetypeid" , OracleDbType.Int32, type, ParameterDirection.Input),
                new OracleParameter("pEmployeetype" , OracleDbType.Varchar2, typeName, ParameterDirection.Input),
                new OracleParameter("pMale" , OracleDbType.Char, male, ParameterDirection.Input),
                new OracleParameter("pBirthdate" , OracleDbType.Date, DOB, ParameterDirection.Input),              
                new OracleParameter("pFamilyid" , OracleDbType.Varchar2, counter, ParameterDirection.Input),
                new OracleParameter("pContribution", OracleDbType.Varchar2, contribution, ParameterDirection.Input ),
                new OracleParameter("pContributionDep", OracleDbType.Varchar2, contributionDep, ParameterDirection.Input),
                new OracleParameter("pPeriod", OracleDbType.Int32, period, ParameterDirection.Input),
                new OracleParameter("pSalary", OracleDbType.Varchar2, salary, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_INSERTWEB_QQCART", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static DataTable GetWebQQCart(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId,ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETQQCart", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static int getLastFamilyId(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pFamilyId", OracleDbType.Int32, ParameterDirection.Output)
            };
            OracleHelper.ExecuteScalar("web_getMaxFamilyId", _params, CommandType.StoredProcedure);
            return int.Parse(_params[1].Value.ToString());
        }

        public static bool DeleteFromWebQQCart(string rowID, string employeeTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pRowId", OracleDbType.Varchar2, rowID, ParameterDirection.Input),
                new OracleParameter("pTypeId", OracleDbType.Varchar2, employeeTypeId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_DELETEFROMQQWEBCART", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdateFromWebQQCart(string rowID, char male, DateTime DOB, string name)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pRowid", OracleDbType.Varchar2, rowID, ParameterDirection.Input), 
                new OracleParameter("pName", OracleDbType.Varchar2, name, ParameterDirection.Input), 
                new OracleParameter("pMale" , OracleDbType.Char, male, ParameterDirection.Input),
                new OracleParameter("pBirthdate" , OracleDbType.Date, DOB, ParameterDirection.Input)
            };           

            int result = OracleHelper.ExecuteNonQuery("WEB_UPDATEWEB_QQCART", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static string CheckWebCartCount(int cartId, int employeeTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployeeTypeId", OracleDbType.Int32, employeeTypeId, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Varchar2, ParameterDirection.Output)
            };

            _params[2].Size = 3;
            OracleHelper.ExecuteScalar("WEB_CHECKQQCART", _params, CommandType.StoredProcedure);
            return _params[2].Value.ToString();
        }

        public static bool DeleteAllWebQQCart(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input)                
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_DELETEALLFROMWEBQQCART", _params, CommandType.StoredProcedure);
            return (result != -1);
        }
        //Changes to web_qqcart end

        //quoting process start  
        public static bool setQuickQuoteRates(int cartId, int monthsAhead, char isPdf, int planType)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pMonthsAhead", OracleDbType.Int32,monthsAhead, ParameterDirection.Input),
                new OracleParameter("pIsPdf", OracleDbType.Char, isPdf, ParameterDirection.Input),
                new OracleParameter("pPlanType", OracleDbType.Int32, planType, ParameterDirection.Input),
                new OracleParameter("pFamilyId", OracleDbType.Varchar2, null,  ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_setQQRates", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DataTable Web_QuickQuote(int cartId, int planType, char selected)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanType", OracleDbType.Int32, planType, ParameterDirection.Input),
                new OracleParameter("pSelected", OracleDbType.Char, selected, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_EmployeeQuote", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static string[] web_setUpPage(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            string[] arr = new string[4];
            using (OracleDataReader dr = OracleHelper.ExecuteReader("web_setQQPage", _params, CommandType.StoredProcedure))
            {
                if (dr.Read())
                {
                    arr[0] = Utilities.ToString(dr["isOverall"]);
                    arr[1] = Utilities.ToString(dr["ofBase"]);
                    arr[2] = Utilities.ToString(dr["basePlan"]);
                    arr[3] = Utilities.ToString(dr["dollar"]);
                }
            }
            return arr;
        }

        public static bool InsertCompareCart(int cartId, string planid)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanId", OracleDbType.Varchar2, planid, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_INSERTCOMPARECART", _params, CommandType.StoredProcedure);
            return (result != -1);

        }

        public static bool DeleteAllCompareCart(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input)                
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_DELETEALLCOMPARECART", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        //functions for  plan description page star
        public static DataTable getPDName(int cartId,  string planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32,  cartId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("V_Refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETPDNAMEFORREPORT", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }
        public static DataTable getPD(int cartId, string date, string planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pDate", OracleDbType.Varchar2, date, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("V_Refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETPDFORREPORT", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }
        //functions for  plan description page end

        //changes and checks to employer start       
        public static bool insertQQemployer(int cartId, string cname, string address, string city, string st, int zip, string fax,  string name, string phone, string email , string isPc)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pCOMPANYNAME", OracleDbType.Varchar2, cname, ParameterDirection.Input),
                new OracleParameter("pADDRESS", OracleDbType.Varchar2, address, ParameterDirection.Input),
                new OracleParameter("pCITY", OracleDbType.Varchar2, city, ParameterDirection.Input),
                new OracleParameter("pST", OracleDbType.Varchar2, st, ParameterDirection.Input),
                new OracleParameter("pZIP", OracleDbType.Int32, zip, ParameterDirection.Input),
                new OracleParameter("pFAX", OracleDbType.Varchar2, fax, ParameterDirection.Input),               
                new OracleParameter("pNAME", OracleDbType.Varchar2, name, ParameterDirection.Input),                
                new OracleParameter("pPHONE", OracleDbType.Varchar2, phone, ParameterDirection.Input),
                new OracleParameter("pEMAIL", OracleDbType.Varchar2, email, ParameterDirection.Input),
                new OracleParameter("pIsPc", OracleDbType.Char, isPc, ParameterDirection.Input)
            };  

            int result = OracleHelper.ExecuteNonQuery("WEB_INSERTQQEMPLOYER", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static DataTable getQQemployer(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                 new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                 new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETQQEMPLOYER", _params, CommandType.StoredProcedure))
            {
                return dt;
            }

        }        
        public static int GetEmployerZip(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),                
                new OracleParameter("pZip", OracleDbType.Int32, ParameterDirection.Output)
            };
            
            OracleHelper.ExecuteScalar("WEB_GETQQEMPLOYERZIP", _params, CommandType.StoredProcedure);
            int zip;
            return _params[1].Value != null && int.TryParse(_params[1].Value.ToString(), out zip)
                    ? zip
                    : 0;
        }

        public static int CheckZipcode(int zip)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pZipcode", OracleDbType.Int32, zip, ParameterDirection.Input) ,
                new OracleParameter("pCount",OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("WEB_CHECKZIPCODE", _params, CommandType.StoredProcedure);
            int tmp;
            return int.TryParse(_params[1].Value.ToString(), out tmp) ? tmp : 0 ;
        }
        //changes and checks to employer end

        public static DataTable getQQSavedQuotes(string username)
        {
            OracleParameter[] _params = new OracleParameter[]
            { 
                 new OracleParameter("pUser", OracleDbType.Varchar2, username, ParameterDirection.Input),
                 new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETQQSAVEDQUOTES", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable searchSavedQuotes(string label)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                 new OracleParameter("Plabel", OracleDbType.Varchar2, label, ParameterDirection.Input),
                 new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_SEARCHQUOTES", _params, CommandType.StoredProcedure))
            {
                return dt;
            }

        }

        public static bool insertSavedQuote(int cartId, string labelname, string createdby)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pLABELNAME", OracleDbType.Varchar2, labelname, ParameterDirection.Input),
                new OracleParameter("pCREATEDBY", OracleDbType.Varchar2, createdby, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_INSERTSAVEQUOTE", _params, CommandType.StoredProcedure);

            return (result != -1);
        }

        public static DataTable getEmployeeList(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETQQEMPLOYEELIST", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool InsertPlanTypeContributions(int cartId, int plantypeid, string contribution, string contributionDep, string ofBase)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId",OracleDbType.Varchar2, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, plantypeid, ParameterDirection.Input),
                new OracleParameter("pContribution", OracleDbType.Varchar2, contribution, ParameterDirection.Input),
                new OracleParameter("pContributionDep", OracleDbType.Varchar2, contributionDep, ParameterDirection.Input),
                new OracleParameter("pOfBase", OracleDbType.Char, ofBase, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_INSERTQQEMPLOYERPLANTYPE", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdateEmployerContributions(int cartId, string contribution, string contDep, string ofBase)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pContribution", OracleDbType.Varchar2, contribution, ParameterDirection.Input),
                new OracleParameter("pContributionDep", OracleDbType.Varchar2, contDep, ParameterDirection.Input),
                new OracleParameter("pOfBase", OracleDbType.Char, ofBase, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_UPDATEERCONTRIBUTION", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool TransferErToQuote(int cartId, string employerid)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerid, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("Web_transferErtoQuote", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static DataTable getPlanTypes(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                 new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                 new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_getPdPlanType", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool startRenewal(string renewalId, string employerId, int cartId, int state)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pRenewalId", OracleDbType.Varchar2, renewalId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pState", OracleDbType.Int32, state, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_startRenewal", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool UpdateEmployerDollar(int cartId, string dollar, string dollarDep)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pDollar", OracleDbType.Varchar2, dollar, ParameterDirection.Input),
                new OracleParameter("pDollarDep", OracleDbType.Varchar2, dollarDep, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_UPDATEERDOLLAR", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool updateRenewal(string renewalId, int state, string isPercent, string isOverall)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pRenewalId", OracleDbType.Varchar2, renewalId, ParameterDirection.Input),
                new OracleParameter("pState", OracleDbType.Int32, state, ParameterDirection.Input),
                new OracleParameter("pIsPercent", OracleDbType.Varchar2, isPercent, ParameterDirection.Input),
                new OracleParameter("pIsOverall", OracleDbType.Varchar2, isOverall, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_updateRenewal", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool updateRenewalCont(string renewalId, int state, int contribution)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pRenewalId", OracleDbType.Varchar2, renewalId, ParameterDirection.Input),
                new OracleParameter("pState", OracleDbType.Int32, state, ParameterDirection.Input),
                new OracleParameter("pContributionType", OracleDbType.Varchar2, contribution, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_updateRenewalCont", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static decimal[] getDollars(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pDollar", OracleDbType.Varchar2, ParameterDirection.Output),
                new OracleParameter("pDollarDep", OracleDbType.Varchar2, ParameterDirection.Output)
            };

            _params[1].Size = _params[2].Size = 10;
            decimal[] dollar = new decimal[2];
            OracleHelper.ExecuteScalar("web_renewalDollarCont", _params, CommandType.StoredProcedure);
            dollar[0] = _params[1].Value.ToString() == "null" ? 0 : decimal.Parse(_params[1].Value.ToString());
            dollar[1] = _params[2].Value.ToString() == "null" ? 0 : decimal.Parse(_params[2].Value.ToString());
            return dollar;
        }

        public static int[] getPercent(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pContribution", OracleDbType.Int32, ParameterDirection.Output),
                new OracleParameter("pContributionDep", OracleDbType.Int32, ParameterDirection.Output)
            };
            int[] percent = new int[2];
            OracleHelper.ExecuteScalar("web_renewalPercentCont", _params, CommandType.StoredProcedure);
            percent[0] = _params[1].Value.ToString() == "null" ? 0 : int.Parse(_params[1].Value.ToString());
            percent[1] = _params[2].Value.ToString() == "null" ? 0 : int.Parse(_params[2].Value.ToString());
            return percent;
        }

        public static DataTable getERPlanTypeConts(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_renewalPlanTypeCont", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool setRates(int cartId, string employerId, string forOe)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pForOe", OracleDbType.Varchar2, forOe, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_setRates", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static DataTable getSubsidyByType(int cartId, string employerId, int planTypeId, int select, string isPercent)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, planTypeId, ParameterDirection.Input),
                new OracleParameter("pisPercent", OracleDbType.Varchar2, isPercent, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable(select==0 ? "web_getSubsidyByType" : "web_getUnSelectedPlans" , _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable getsubsidyByDollar(int cartId, int planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, planTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_setDollarSubsidyOverall", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable getQQDollar(int cartId, int planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, planTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_DollarEmployeeQuote", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool updateBasePlan(int cartId, string planId, string planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanId", OracleDbType.Varchar2, planId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, planTypeId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_updateBasePlanId", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool updateToComplete(string renewalId, int state, string isComplete)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pRenewalId", OracleDbType.Varchar2, renewalId, ParameterDirection.Input),
                new OracleParameter("pState", OracleDbType.Int32, state, ParameterDirection.Input),
                new OracleParameter("pIsComplete", OracleDbType.Varchar2, isComplete, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_completeRenewal", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool deleteEmployerPlanTypes(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_deleteEmployerPlanType", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool updateOfBase(int cartId, string ofBase)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pOfBase", OracleDbType.Varchar2, ofBase, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_updateOfBase", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool removeBasePlans(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_removeAllBasePlan", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool changeDollarPercent(int cartId, string isPercent)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pIsPercent", OracleDbType.Varchar2, isPercent, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_updateQQEmployer", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static decimal minRequirement(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pRequired", OracleDbType.Varchar2, ParameterDirection.Output)
            };

            _params[1].Size = 10;
            OracleHelper.ExecuteScalar("web_minDollarsRequired", _params, CommandType.StoredProcedure);
            return _params[1].Value.ToString().Equals("null") ? 0 : decimal.Parse(_params[1].Value.ToString());
        }

        public static bool setSubsidy(int cartId, string planType)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, string.IsNullOrEmpty(planType)? null: planType, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("writeWebSubsidy", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static decimal getMinPerPlanType(int cartId, int planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, planTypeId, ParameterDirection.Input),
                new OracleParameter("pMin", OracleDbType.Varchar2, ParameterDirection.Output)
            };

            _params[2].Size = 10;
            OracleHelper.ExecuteScalar("web_getMinPerPlanType", _params, CommandType.StoredProcedure);
            return decimal.Parse(_params[2].Value.ToString());
        }

        public static string getBasePlanId(int cartId, string planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("pPlanId", OracleDbType.Int32, ParameterDirection.Output)
            };

            _params[2].Size = 6;
            OracleHelper.ExecuteScalar("web_getBasePlanId", _params, CommandType.StoredProcedure);
            return _params[2].Value.ToString();
        }

        

        public static DataTable getAtoA(int cartId, string employerId, int planTypeId, int isTotal)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, planTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable(isTotal == 1 ? "web_getTotalComparison" : "web_getComparison", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool cancelRenewal(string renewalId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pRenewalId", OracleDbType.Varchar2, renewalId, ParameterDirection.Input),
            };

            int result = OracleHelper.ExecuteNonQuery("web_cancelRenewal", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool InsertRenewalPlan(int cartId, string planid)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanId", OracleDbType.Varchar2, planid, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_InsertRenewalPlan", _params, CommandType.StoredProcedure);
            return (result != -1);

        }

        public static bool DeleteRenewalPlan(int cartId, string planid)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pplanid", OracleDbType.Varchar2, planid, ParameterDirection.Input) 
            };

            int result = OracleHelper.ExecuteNonQuery("web_deleteRenewalPlan", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool DeleteAllEmployerPlanType(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input)
            };

            int resut = OracleHelper.ExecuteNonQuery("web_deleteAllEPT", _params, CommandType.StoredProcedure);
            return resut != -1;
        }

        public static DataTable GetRenewalPlans(int cartId, int planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, planTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getRenewalPlans", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool UpdateRenewalCR(string renewalId, string name, string title, DateTime effDate)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pRenewalId", OracleDbType.Varchar2, renewalId, ParameterDirection.Input),
                new OracleParameter("pName", OracleDbType.Varchar2, name, ParameterDirection.Input),
                new OracleParameter("pTitle", OracleDbType.Varchar2, title, ParameterDirection.Input),
                new OracleParameter("pEffectiveDate", OracleDbType.Date, effDate, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_updateRenewalCR", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DataTable getRenewalTermPlans(string employerId, int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getRenewalTermPlans", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool completePlanTransfer(int cartId, string user, string employerId, DateTime effectiveDate)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCart", OracleDbType.Varchar2, cartId, ParameterDirection.Input),
                new OracleParameter("puser", OracleDbType.Varchar2, user, ParameterDirection.Input),
                new OracleParameter("pEmployer", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pDate", OracleDbType.Date, effectiveDate, ParameterDirection.Input),
            };

            int result = OracleHelper.ExecuteNonQuery("web_actOnRenewalPlans", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool resetRates(int cartId, string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_resetRates", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DataTable getRenewalPlanPt(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getRenewalPt", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable eeLevelData(int cartId, int planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_renewalEELevel", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable renewalPlanNames(int cartId, int planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_renewalEEPlanNames", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable exportQQtoExcel(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_ExportQQExcel", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DateTime oeEnddate(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pDate", OracleDbType.Date, ParameterDirection.Output)
            };
            
            OracleHelper.ExecuteScalar("web_OE_Enddate", _params, CommandType.StoredProcedure);

            return DateTime.Parse(_params[1].Value.ToString());
        }


        public static bool setUpAtoA(int cartId, string employerId, string employeeId, int oeType)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pOeType", OracleDbType.Int32, oeType, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_setEEAtoA", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DateTime planEffectiveDate(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pDate", OracleDbType.Date, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_getPlanEffectiveDate", _params, CommandType.StoredProcedure);
            return DateTime.Parse(_params[1].Value.ToString());
        }

        public static bool hasBasePlans(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pOut", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_hasBasePlan", _params, CommandType.StoredProcedure);
            return int.Parse(_params[1].Value.ToString()) == 0;
        }

        public static bool setLifeRates(int cartId, string employerId, DateTime date)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId" , OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pDate", OracleDbType.Date, date, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("web_setLifeRates", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool insertPotentialUser(int cartId, string code, string email)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCart", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pCode", OracleDbType.Varchar2, code, ParameterDirection.Input),
                new OracleParameter("pEmail", OracleDbType.Varchar2, email, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };
            _params[3].Size = 1;
            OracleHelper.ExecuteScalar("web_insertPotentialUser", _params, CommandType.StoredProcedure);
            return _params[3].Value.ToString()=="1";
        }

        public static int checkPotentialUsers(string code)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCode", OracleDbType.Varchar2, code, ParameterDirection.Input),
                new OracleParameter("pResult" , OracleDbType.Int32, ParameterDirection.Output)
            };
            _params[1].Size = 8;
            OracleHelper.ExecuteScalar("web_potentialUserExist", _params, CommandType.StoredProcedure);
            return _params[1].Value.ToString() =="null" ? 0 : int.Parse(_params[1].Value.ToString());
        }

        public static bool insertAllAsEmployees(int cart, string employerId)
        {
             OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCart", OracleDbType.Int32, cart, ParameterDirection.Input),
                new OracleParameter("pEmployer" , OracleDbType.Varchar2, employerId, ParameterDirection.Input),
            };
             int result = OracleHelper.ExecuteNonQuery("web_insertAllFromQuote", _params, CommandType.StoredProcedure);
             return result != -1;
        }

        public static bool newEmployerQuote(int cart, string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCart", OracleDbType.Int32, cart, ParameterDirection.Input),
                new OracleParameter("pEmployer" , OracleDbType.Varchar2, employerId, ParameterDirection.Input),
            };
            int result = OracleHelper.ExecuteNonQuery("web_newEmployerQuote", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool completeNewEmployer(string employerId, int cartId, DateTime effectiveDate, string name, string title)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pCartId", OracleDbType.Varchar2, cartId, ParameterDirection.Input),
                new OracleParameter("pDate", OracleDbType.Date, effectiveDate, ParameterDirection.Input),
                new OracleParameter("pName", OracleDbType.Varchar2, name, ParameterDirection.Input),
                new OracleParameter("pTtitle", OracleDbType.Varchar2, title, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_finishNewEmployer", _params, CommandType.StoredProcedure);
            return result != -1;
        }
    }
}
