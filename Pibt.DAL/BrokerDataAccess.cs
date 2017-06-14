using System.Data;
using Oracle.DataAccess.Client;
using Pibt.Model;
using System;
using Pibt.Common;

namespace Pibt.DAL 
{
    public class BrokerDataAccess 
    {
        public static bool SynBrokerToWebUsersTable(string updatedBy) 
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("PUpdatedBy", OracleDbType.Varchar2, 10, updatedBy, ParameterDirection.Input)
            };
            return OracleHelper.ExecuteNonQuery("Web_SynBrokerWebUsersTable", _params, CommandType.StoredProcedure) != -1;
        }

        public static DataTable SearchBrokers(string clue) 
        {
            OracleParameter[] _params = new OracleParameter[] 
            {
                new OracleParameter("pClue", OracleDbType.Varchar2, clue, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_SearchBrokerinfo", _params, CommandType.StoredProcedure)) 
            {
                return dt;
            }
        }

        public static BrokerDetails GetBrokerDetails(string brokerId) 
        {
            OracleParameter[] _params = new OracleParameter[] 
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2,8, brokerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            
            BrokerDetails details = null;
            using (OracleDataReader dr = OracleHelper.ExecuteReader("Web_GetBrokerDetails", _params, CommandType.StoredProcedure)) 
            {
                if (dr.Read()) 
                {
                    details = new BrokerDetails() 
                    {
                        BrokerId = Utilities.ToString(dr["brokerId"]),
                        BrokerName = Utilities.ToString(dr["name"]),
                        UserName = Utilities.ToString(dr["webname"]),
                        LoginName = Utilities.ToString(dr["loginname"]),
                        EmailAddress = Utilities.ToString(dr["Email"]),
                        UserId = Utilities.ToString(dr["Userid"]),
                        IsLockout = Utilities.ToBool(dr["IsLockout"]),
                        LastLoginIP = Utilities.ToString(dr["LastLoginIP"]),
                        LastLoginTime = Utilities.ToString(dr["LastLoginTime"]),
                        Updated = Utilities.ToString(dr["Updated"]),
                        UpdatedBy = Utilities.ToString(dr["UpdatedBy"])
                    };
                }
            }
            return details;
        }

        public static bool GetValidateBrokerUserId(string brokerId, string employerId) 
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_validateBrokerEmployerId", _params, CommandType.StoredProcedure);

            return int.Parse(_params[2].Value.ToString()) > 0;
        }

        public static bool updateBroker(string brokerId, string name, string email)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pName", OracleDbType.Varchar2, name, ParameterDirection.Input),
                new OracleParameter("pEmail", OracleDbType.Varchar2, email, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_updateBroker", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static DataTable getEmployerList(string brokerId, string clue, string dropDown)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pClue", OracleDbType.Varchar2, clue, ParameterDirection.Input),
                new OracleParameter("pDropDown", OracleDbType.Varchar2, dropDown, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getBrokerEmployers", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool assignBrokerEmployer(string brokerId, string employerId, DateTime? effective, DateTime? expiry)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pEffective", OracleDbType.Date, effective, ParameterDirection.Input),
                new OracleParameter("pExpiry", OracleDbType.Date, expiry, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_assignBrokerEmployer", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static string insertEmployer(string brokerId, BizInfoDetails user, BizAdditionalInfo addl, int partEE)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pName", OracleDbType.Varchar2, user.CompanyName, ParameterDirection.Input),
                new OracleParameter("pAddress", OracleDbType.Varchar2,user.PhsicalStreetAddress1, ParameterDirection.Input),
                new OracleParameter("pCity", OracleDbType.Varchar2, user.PhsicalCity, ParameterDirection.Input),
                new OracleParameter("pState", OracleDbType.Varchar2, user.PhsicalState, ParameterDirection.Input),
                new OracleParameter("pZip", OracleDbType.Varchar2,user.PhsicalPostCode, ParameterDirection.Input),
                new OracleParameter("pMaddress", OracleDbType.Varchar2, user.MailingStreetAddress1, ParameterDirection.Input),
                new OracleParameter("pMcity", OracleDbType.Varchar2, user.MailingCity, ParameterDirection.Input),
                new OracleParameter("pMstate", OracleDbType.Varchar2, user.MailingState, ParameterDirection.Input),
                new OracleParameter("pMzip", OracleDbType.Varchar2, user.MailingPostCode, ParameterDirection.Input),
                new OracleParameter("pPhoneNbr", OracleDbType.Varchar2, user.Phonenbr, ParameterDirection.Input),
                new OracleParameter("pFax", OracleDbType.Varchar2, user.Faxnbr, ParameterDirection.Input),
                new OracleParameter("pContact", OracleDbType.Varchar2, user.MailingContact, ParameterDirection.Input),
                new OracleParameter("pCemail", OracleDbType.Varchar2, user.MailingEmail, ParameterDirection.Input),
                new OracleParameter("pTaxId", OracleDbType.Varchar2,addl.Taxid, ParameterDirection.Input),
                new OracleParameter("pSic", OracleDbType.Varchar2, addl.Sic, ParameterDirection.Input),
                new OracleParameter("pWaitingPeriodId", OracleDbType.Varchar2, addl.WaitingPeriodId, ParameterDirection.Input),
                new OracleParameter("pPartEE", OracleDbType.Int32, partEE, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, user.EmployerId, ParameterDirection.InputOutput)
            };
            _params[18].Size = 8;
            OracleHelper.ExecuteScalar("web_insertBrokerEmployer", _params, CommandType.StoredProcedure);
            return _params[18].Value == null ? "" : _params[18].Value.ToString();
        }

        public static bool deleteBrokerEmployer(string brokerId, string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_deleteBrokerEmployer", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static int checkExistingBrokerEmployer(string brokerId, string employerId, DateTime? effective, DateTime? expiry)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pStart", OracleDbType.Date, effective, ParameterDirection.Input),
                new OracleParameter("pEnd", OracleDbType.Date, expiry, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_checkExistingBE", _params, CommandType.StoredProcedure);

            return int.Parse(_params[4].Value.ToString());
        }

        public static DataTable futureRenewals(string brokerId, int type, string clue,  DateTime? start, DateTime? end)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pType", OracleDbType.Int32, type, ParameterDirection.Input), 
                new OracleParameter("pClue", OracleDbType.Varchar2, clue, ParameterDirection.Input),
                new OracleParameter("pStart", OracleDbType.Date, start, ParameterDirection.Input), 
                new OracleParameter("pEnd", OracleDbType.Date, end, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_brokerEvents", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable invoiceSnapShot(string brokerId, string clue)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pClue", OracleDbType.Varchar2, clue, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using(DataTable dt = OracleHelper.ExecuteDataTable("web_brokerSnapShot", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable invoiceHist(string brokerId, string clue)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pClue", OracleDbType.Varchar2, clue, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("web_brokerInvHist", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable commHist(string brokerId, string clue)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pClue", OracleDbType.Varchar2, clue, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("web_BrokerCommHist", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable brokerAgents(string brokerId, int role)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pRole", OracleDbType.Int32 , role, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getBrokerAgents", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool deleteBrokerAgent(string pk)
        {
            return OracleHelper.ExecuteNonQuery("web_deleteBrokerAgent", new OracleParameter[] { new OracleParameter("pPk", pk) }, CommandType.StoredProcedure) != -1;
        }

        public static bool updateBrokerAgent(string pk, string brokerId, string lastname, string firstname, string mi, string license, DateTime? issued, string office, string cell, string email, string manager, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pPk", OracleDbType.Varchar2, pk, ParameterDirection.Input),
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("pLastName",OracleDbType.Varchar2 , lastname, ParameterDirection.Input),
                new OracleParameter("pFirstName",OracleDbType.Varchar2 , firstname, ParameterDirection.Input),
                new OracleParameter("pMiddle",OracleDbType.Varchar2 , mi, ParameterDirection.Input),
                new OracleParameter("pLicense",OracleDbType.Varchar2 , license, ParameterDirection.Input),
                new OracleParameter("pIssued",OracleDbType.Date , issued, ParameterDirection.Input),
                new OracleParameter("pOffice",OracleDbType.Varchar2 , office, ParameterDirection.Input),
                new OracleParameter("pCell",OracleDbType.Varchar2 , cell, ParameterDirection.Input),
                new OracleParameter("pEmail",OracleDbType.Varchar2 , email, ParameterDirection.Input),
                new OracleParameter("pManager",OracleDbType.Varchar2 , manager, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy",OracleDbType.Varchar2 , updatedBy, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_updateBrokerAgent", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DataTable savedQuotes(string brokerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pBrokerId", OracleDbType.Varchar2, brokerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using(DataTable dt = OracleHelper.ExecuteDataTable("web_getBrokerQuotes", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }
    }
}
