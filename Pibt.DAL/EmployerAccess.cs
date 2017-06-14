using System;
using System.Data;
using Oracle.DataAccess.Client;
using Pibt.Model;
using Pibt.Common;
using System.Data.SqlClient;

namespace Pibt.DAL
{
    public class EmployerAccess
    {
        // Get New Member Id
        public static string GetNewMemberId()
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("cur_NewMemberId", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            object newMemberId = null;
            newMemberId = OracleHelper.ExecuteScalar("WEB_GetNewMemberId", _params, CommandType.StoredProcedure);
            return newMemberId != null ? newMemberId.ToString() : "";
        }

        // Verify that a member is under an employer
        public static bool GetValidateMemberId(string employerId, string memberId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("pMemberId", OracleDbType.Varchar2,8,memberId, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("WEB_ValidateMemberId", _params, CommandType.StoredProcedure);

            return !_params[2].Value.ToString().Equals("0");
        }

        public static bool GetValidateEnrollerEmployer(string employerId, string userId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("pUserId", OracleDbType.Varchar2,8,userId, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_validateEnrollerEmployer", _params, CommandType.StoredProcedure);

            return int.Parse(_params[2].Value .ToString()) != 0;
        }

        public static bool GetValidateAgentEmployer(string employerId, string userId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("pUserId", OracleDbType.Varchar2,8,userId, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };

           OracleHelper.ExecuteScalar("web_validateAgentEmployer", _params, CommandType.StoredProcedure);

            return int.Parse(_params[2].Value.ToString()) != 0;
        }

        // Verify that a member is under an employee
        public static bool GetValidateDependentId(string employeeId, string memberId) {
            OracleParameter[] _params = new OracleParameter[] {
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberId, ParameterDirection.Input),
                new OracleParameter("result", OracleDbType.Int32, ParameterDirection.Output)
            };
          
            OracleHelper.ExecuteScalar("Web_ValidateDependent", _params, CommandType.StoredProcedure);            

            return !_params[2].Value.ToString().Equals("0");
        }

        // Verify that an invoice is under an employer
        public static bool GetValidateInvoiceId(int employerId, int invoiceId) {
            OracleParameter[] _params = new OracleParameter[] {
                new OracleParameter("pEmployerId", OracleDbType.Int32, employerId, ParameterDirection.Input),
                new OracleParameter("pInvioceId", OracleDbType.Int32, invoiceId, ParameterDirection.Input),
                new OracleParameter("result", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("Web_ValidateInvoice", _params, CommandType.StoredProcedure);            

            return !_params[2].Value.ToString().Equals("0");
        }

        public static bool GetValidateAgentUserId(string employerId, string agentUID)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("PagentUserid", OracleDbType.Varchar2,8,agentUID, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            object result = OracleHelper.ExecuteScalar("WEB_ValidateAgentEmployerId", _params, CommandType.StoredProcedure);

            return result.ToString() == "0" ? false : true;
        }

        public static bool GetValidateRKUserId(string employerId, string rkUID)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("PRKUserid", OracleDbType.Varchar2,8,rkUID, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            object result = OracleHelper.ExecuteScalar("WEB_ValidateRKEmployerId", _params, CommandType.StoredProcedure);

            return result.ToString() == "0" ? false : true;
        }

        // Get Employer Biz info  details
        public static BizInfoDetails GetBizInfoDetails(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("cur_BizInfo", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            BizInfoDetails details = null;
            using (OracleDataReader dr = OracleHelper.ExecuteReader("WEB_ER_BizInfo.WEB_GetBizInfoDetails", _params, CommandType.StoredProcedure))
            {
                // wrap retrieved data into a BizInfoDetails object
                // Read data
                if (dr.Read())
                {
                    // get biz info details
                    details = new BizInfoDetails();
                    details.EmployerId = Utilities.ToString(dr["Employerid"]);
                    details.CompanyName = dr["name"].ToString();
                    details.MailingStreetAddress1 = dr["addressOne"].ToString();
                    details.MailingStreetAddress2 = dr["addressTwo"].ToString();
                    details.MailingCity = dr["city"].ToString();
                    details.MailingState = dr["state"].ToString();
                    details.MailingPostCode = dr["zip"].ToString();
                    details.MailingContact = dr["mailContact"].ToString();
                    details.MailingEmail = dr["mailEmail"].ToString();
                    details.PhsicalStreetAddress1 = dr["billAddressOne"].ToString();
                    details.PhsicalStreetAddress2 = dr["billAddressTwo"].ToString();
                    details.PhsicalCity = dr["billCity"].ToString();
                    details.PhsicalState = dr["billState"].ToString();
                    details.PhsicalPostCode = dr["billZip"].ToString();
                    details.PhsicalContact = dr["billContact"].ToString();
                    details.PhsicalEmail = dr["billEmail"].ToString();
                    details.Phonenbr = Utilities.ToString(dr["Phonenbr"]);
                    details.Faxnbr = Utilities.ToString(dr["Faxnbr"]);
                    details.UserName = details.CompanyName;
                    details.UserRole = UserRoles.Employer;
                    details.LoginName = Utilities.ToString(dr["Loginname"]);
                    details.IsLockout = Utilities.ToBool(dr["Islockout"]);
                    details.LastLoginIP = Utilities.ToString(dr["Lastloginip"]);
                    details.LastLoginTime = Utilities.ToString(dr["Lastlogintime"]);
                    details.AgencyId = Utilities.ToString(dr["agencyid"]);
                    details.AgencyName = Utilities.ToString(dr["AgencyName"]);
                    details.StartDate = Utilities.ToString(dr["StartDate"]);
                    details.EndDate = Utilities.ToString(dr["EndDate"]);
                    details.EmailAddress = details.MailingEmail;
                }
            }
            return details;

        }

        // Get Addtional Employer Biz info  details 2
        public static BizAdditionalInfo GetBizInfoDetails2(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("cur_BizInfo2", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            BizAdditionalInfo details = new BizAdditionalInfo();
            using (OracleDataReader dr = OracleHelper.ExecuteReader("WEB_ER_BizInfo.WEB_GetBizInfoDetails2", _params, CommandType.StoredProcedure))
            {
                if (dr.Read())
                {
                    // get additonal biz info details
                    details.EmployerId = Utilities.ToString(dr["EmployerId"]);
                    details.EnrollerId = Utilities.ToString(dr["EnrollerId"]);
                    details.Enroller = Utilities.ToString(dr["Enroller"]);
                    details.WaitingPeriodId = Utilities.ToString(dr["WaitingPeriodId"]);
                    details.WaitingPeriod = Utilities.ToString(dr["WaitingPeriod"]);
                    details.TeamLeadId = Utilities.ToString(dr["TeamLeadId"]);
                    details.TeamLead = Utilities.ToString(dr["TeamLead"]);
                    details.RKId = Utilities.ToString(dr["RKId"]);
                    details.RK = Utilities.ToString(dr["RK"]);
                    details.TermId = Utilities.ToString(dr["TermId"]);
                    details.Term = Utilities.ToString(dr["Term"]);
                    details.EeContribution = Utilities.ToString(dr["EeContribution"]);
                    details.Depcontribution = Utilities.ToString(dr["Depcontribution"]);
                    details.EeDollar = Utilities.ToString(dr["EeDollar"]);
                    details.DepDollar = Utilities.ToString(dr["DepDollar"]);
                    details.Taxid = Utilities.ToString(dr["Taxid"]);
                    details.Sic = Utilities.ToString(dr["Sic"]);
                    details.NatureOfBiz = Utilities.ToString(dr["NatureOfBiz"]);
                    details.ofBase = Utilities.ToString(dr["ofBase"]);
                }
            }
            return details;
        }

        //Get Employer Biz name
        public static string GetBizName(string employerId)
        {
            string bizName;
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("pEmployerName", OracleDbType.Varchar2,30,employerId, ParameterDirection.Output)
            };
            OracleHelper.ExecuteNonQuery("WEB_GetBizName", _params, CommandType.StoredProcedure);
            bizName = _params[1].Value.ToString();
            if (bizName.Equals("null"))
                bizName = "";
            return bizName;
        }

        //Get Employer Biz Contacts
        public static DataTable GetBizContacts(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("cur_BizContacts", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_ER_BizInfo.WEB_GetBizContacts", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        //Search Employer
        public static DataTable SearchEmployer(string clue, string userId, string userRole)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUserId", OracleDbType.Varchar2, 8, userId, ParameterDirection.Input),
                new OracleParameter("pUserTypeId", OracleDbType.Varchar2, userRole, ParameterDirection.Input),
                new OracleParameter("pClue", OracleDbType.Varchar2, clue, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_SearchEmployers", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        //Get Employer Biz EE Names.
        public static DataTable GetBizEeNames(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("cur_BizEeNames", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_ER_BizInfo.WEB_GetBizEeNames", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        //Get Employer Biz Only One EE Name.
        public static DataTable GetBizEeName(string employerId, string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("pEmployeeID", OracleDbType.Varchar2,8,employeeId, ParameterDirection.Input),
                new OracleParameter("cur_BizEeNames", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_ER_BizInfo.WEB_GetBizEeName", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        //Get Employer Biz Dependent Names.
        public static DataTable GetBizDepNames(string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeID", OracleDbType.Varchar2,8,employeeId, ParameterDirection.Input),
                new OracleParameter("cur_BizDepNames", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_ER_BizInfo.WEB_GetBizDepNames", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        //Get Employer Biz Dep Names.
        public static DataTable GetBizMemberInfo(string memberId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberID", OracleDbType.Varchar2,8,memberId, ParameterDirection.Input),
                new OracleParameter("cur_BizMemberInfo", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_ER_BizInfo.WEB_GetBizMemberInfo", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        // Get Member info  details 
        public static MemberInfoDetails GetMemberInfoDetails(string memberId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberID", OracleDbType.Varchar2,8,memberId, ParameterDirection.Input),
                new OracleParameter("cur_BizMemberInfo", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            MemberInfoDetails details = new MemberInfoDetails();
            using (OracleDataReader dr = OracleHelper.ExecuteReader("WEB_ER_BizInfo.WEB_GetBizMemberInfo", _params, CommandType.StoredProcedure))
            {
                if (dr.Read())
                {
                    // get additonal biz info details
                    details.MemberId = dr["memberId"].ToString();
                    details.EmployeeId = dr["employeeId"].ToString();
                    details.Name = dr["name"].ToString();
                    details.EmployerId = dr["employerId"].ToString();
                    details.EmployeeTypeId = dr["employeeTypeId"].ToString();
                }
            }
            return details;
        }

        public static DataTable GetWaitingPeriodList()
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetWaitingPreiod", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetTerms()
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetTerms", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static string GetRelationshipKeeperTeamLead(string rkId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCSRID", OracleDbType.Varchar2,8,rkId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            object result = OracleHelper.ExecuteScalar("WEB_GetRKTeamLead", _params, CommandType.StoredProcedure);
            return Utilities.ToString(result);
        }

        //Get Employer Department
        public static DataTable GetDepartments(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetErDepartments", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        // Determine whether an employer has only 1 department
        public static bool SingleDepartment(string employerId) {
            OracleParameter[] _params = new OracleParameter[] {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("result", OracleDbType.Int32, ParameterDirection.Output)
            };
            OracleHelper.ExecuteScalar("Web_SingleDepartment", _params, CommandType.StoredProcedure);            
            return _params[1].Value.ToString().Equals("1");
        }

        public static bool InsertDepartments(string employerId, string deptCode, string name)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("Pdeptcode", OracleDbType.Varchar2,4,deptCode, ParameterDirection.Input),
                new OracleParameter("pDscription", OracleDbType.Varchar2,30,name, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_INSERTDEPARTMENT", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdateDepartments(string deptId, string employerId, string deptCode, string name)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pDEPTID", OracleDbType.Varchar2,8,deptId, ParameterDirection.Input),
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("Pdeptcode", OracleDbType.Varchar2,4,deptCode, ParameterDirection.Input),
                new OracleParameter("pDscription", OracleDbType.Varchar2,30,name, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_UPDATEDEPARTMENT", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdateEmployer(BizInfoDetails bizInfo, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,bizInfo.EmployerId, ParameterDirection.Input),
                new OracleParameter("pName", OracleDbType.Varchar2,bizInfo.CompanyName, ParameterDirection.Input),
                new OracleParameter("pAddressOne", OracleDbType.Varchar2,80,bizInfo.MailingStreetAddress1, ParameterDirection.Input),
                new OracleParameter("pCity", OracleDbType.Varchar2,30,bizInfo.MailingCity, ParameterDirection.Input),
                new OracleParameter("pState", OracleDbType.Varchar2,2,bizInfo.MailingState, ParameterDirection.Input),
                new OracleParameter("pZip", OracleDbType.Varchar2,9,bizInfo.MailingPostCode, ParameterDirection.Input),
                new OracleParameter("pMailContact", OracleDbType.Varchar2,60,bizInfo.MailingContact, ParameterDirection.Input),
                new OracleParameter("pMailEmail", OracleDbType.Varchar2,60,bizInfo.MailingEmail, ParameterDirection.Input),
                new OracleParameter("pBillAddressOne", OracleDbType.Varchar2,80,bizInfo.PhsicalStreetAddress1, ParameterDirection.Input),
                new OracleParameter("pBillCity", OracleDbType.Varchar2,30,bizInfo.PhsicalCity, ParameterDirection.Input),
                new OracleParameter("pBillState", OracleDbType.Varchar2,2,bizInfo.PhsicalState, ParameterDirection.Input),
                new OracleParameter("pBillZip", OracleDbType.Varchar2,9,bizInfo.PhsicalPostCode, ParameterDirection.Input),
                new OracleParameter("pBillContact", OracleDbType.Varchar2,60,bizInfo.PhsicalContact, ParameterDirection.Input),
                new OracleParameter("pBillEmail", OracleDbType.Varchar2,60,bizInfo.PhsicalEmail, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_UpdateEmployerGeneralInfo", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdateEmployer(BizAdditionalInfo bizInfo, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,bizInfo.EmployerId, ParameterDirection.Input),             
                new OracleParameter("pEmployeeContribution", OracleDbType.Varchar2,3,bizInfo.EeContribution, ParameterDirection.Input),
                new OracleParameter("pDependentContribution", OracleDbType.Varchar2,3,bizInfo.Depcontribution, ParameterDirection.Input),
                new OracleParameter("pEmployeeDollar", OracleDbType.Varchar2,3,bizInfo.EeDollar, ParameterDirection.Input),
                new OracleParameter("pDependentDollar", OracleDbType.Varchar2,3,bizInfo.DepDollar, ParameterDirection.Input),
                new OracleParameter("pOfBase", OracleDbType.Char, bizInfo.ofBase, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("WEB_UpdateEmployerAddInfo", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool InsertBizContact(BizContact bizContact)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,bizContact.EmployerId, ParameterDirection.Input),
                new OracleParameter("pTitle", OracleDbType.Varchar2,bizContact.Title, ParameterDirection.Input),
                new OracleParameter("pFirstName", OracleDbType.Varchar2, bizContact.FirstName, ParameterDirection.Input),
                new OracleParameter("pMiddleName", OracleDbType.Varchar2, bizContact.MiddleName, ParameterDirection.Input),
                new OracleParameter("pLastName", OracleDbType.Varchar2, bizContact.LastName, ParameterDirection.Input),
                new OracleParameter("pEmail", OracleDbType.Varchar2, bizContact.Email, ParameterDirection.Input),
                new OracleParameter("pPhone", OracleDbType.Varchar2, bizContact.Phone, ParameterDirection.Input),
                new OracleParameter("pFax", OracleDbType.Varchar2, bizContact.Fax, ParameterDirection.Input),
                new OracleParameter("pBizPhone1", OracleDbType.Varchar2, bizContact.BizPhone1, ParameterDirection.Input),
                new OracleParameter("pBizExt1", OracleDbType.Varchar2, bizContact.BizExt1, ParameterDirection.Input),
                new OracleParameter("pBizPhone2", OracleDbType.Varchar2, bizContact.BizPhone2, ParameterDirection.Input),
                new OracleParameter("pBizExt2", OracleDbType.Varchar2, bizContact.BizExt2, ParameterDirection.Input),
                new OracleParameter("pMobile", OracleDbType.Varchar2, bizContact.Mobile, ParameterDirection.Input),
                new OracleParameter("pEmail2", OracleDbType.Varchar2, bizContact.Email2, ParameterDirection.Input),
                new OracleParameter("pAssistant", OracleDbType.Varchar2, bizContact.Assistant, ParameterDirection.Input),
                new OracleParameter("pNotes", OracleDbType.Varchar2, bizContact.Notes, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2,10,bizContact.UpdatedBy, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_InsertEmployerContact", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdateBizContact(BizContact bizContact)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pRowId", OracleDbType.Varchar2,20,bizContact.Id, ParameterDirection.Input),
                new OracleParameter("pTitle", OracleDbType.Varchar2,bizContact.Title, ParameterDirection.Input),
                new OracleParameter("pFirstName", OracleDbType.Varchar2, bizContact.FirstName, ParameterDirection.Input),
                new OracleParameter("pMiddleName", OracleDbType.Varchar2, bizContact.MiddleName, ParameterDirection.Input),
                new OracleParameter("pLastName", OracleDbType.Varchar2, bizContact.LastName, ParameterDirection.Input),
                new OracleParameter("pEmail", OracleDbType.Varchar2, bizContact.Email, ParameterDirection.Input),
                new OracleParameter("pPhone", OracleDbType.Varchar2, bizContact.Phone, ParameterDirection.Input),
                new OracleParameter("pFax", OracleDbType.Varchar2, bizContact.Fax, ParameterDirection.Input),
                new OracleParameter("pBizPhone1", OracleDbType.Varchar2, bizContact.BizPhone1, ParameterDirection.Input),
                new OracleParameter("pBizExt1", OracleDbType.Varchar2, bizContact.BizExt1, ParameterDirection.Input),
                new OracleParameter("pBizPhone2", OracleDbType.Varchar2, bizContact.BizPhone2, ParameterDirection.Input),
                new OracleParameter("pBizExt2", OracleDbType.Varchar2, bizContact.BizExt2, ParameterDirection.Input),
                new OracleParameter("pMobile", OracleDbType.Varchar2, bizContact.Mobile, ParameterDirection.Input),
                new OracleParameter("pEmail2", OracleDbType.Varchar2, bizContact.Email2, ParameterDirection.Input),
                new OracleParameter("pAssistant", OracleDbType.Varchar2, bizContact.Assistant, ParameterDirection.Input),
                new OracleParameter("pNotes", OracleDbType.Varchar2, bizContact.Notes, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2,10,bizContact.UpdatedBy, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("Web_UpdateEmployerContact", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static DataTable GetEmployerDBAs(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETEMPLOYERDBA", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetEnterprise()
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetEnterprise", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }


        public static bool InsertEmployerDBA(string employerId, string dbaName)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,8, employerId, ParameterDirection.Input),
                new OracleParameter("pDBAName", OracleDbType.Varchar2, dbaName, ParameterDirection.Input) 
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_INSERTEMPLOYERDBA", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdateEmployerDBA(string rowId, string employerId, string dbaName)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("Prowid", OracleDbType.Varchar2,20, rowId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,8, employerId, ParameterDirection.Input),
                new OracleParameter("pDBAName", OracleDbType.Varchar2, dbaName, ParameterDirection.Input) 
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("Web_UpdateEmployerDBA", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool DeleteEmployerDBA(string employerId, string dbaName)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,8, employerId, ParameterDirection.Input),
                new OracleParameter("pDBAName", OracleDbType.Varchar2, dbaName, ParameterDirection.Input) 
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_DELETEEMPLOYERDBA", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool DeleteEmployerContactByRowId(string rowId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pRowId", OracleDbType.Varchar2,20, rowId, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_DELETEEMPLOYERCONTACT", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool SynEmployerToWebUsersTable(int roleId, string userId, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("Pwebuserroleid", OracleDbType.Varchar2,roleId, ParameterDirection.Input),
                new OracleParameter("Puserid", OracleDbType.Varchar2,10,userId, ParameterDirection.Input),
                new OracleParameter("PUpdatedBy", OracleDbType.Varchar2,10,updatedBy, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("Web_SynEmployerToWebUsersTable", _params, CommandType.StoredProcedure);
            return (result != -1);
        }


        //Search Employer By Type
        public static DataTable SearchEmployerByType(string userId, int userRole, string typeId, string clue)
        {
         OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUserId", OracleDbType.Varchar2, userId, ParameterDirection.Input),
                new OracleParameter("pUserTypeId", OracleDbType.Varchar2,userRole, ParameterDirection.Input),
                new OracleParameter("pSearchTypeId",OracleDbType.Varchar2,typeId, ParameterDirection.Input),
                new OracleParameter("pClue",OracleDbType.Varchar2,clue, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
         using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_SEARCHEMPLOYERBYTYPE", _params, CommandType.StoredProcedure))
         {
          return dt;
         }
        }

        public static DataTable GetPlantypeContribution(string employerid)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerid", OracleDbType.Varchar2, employerid, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETPLANTYPECONTRIBUTION", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool InsertPlantypeContribution(string employerid, int plantypeid, string contribution, string contributionDep, string ofBase, object date)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Int32, employerid, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, plantypeid, ParameterDirection.Input),
                new OracleParameter("pContributio",OracleDbType.Varchar2, contribution, ParameterDirection.Input),
                new OracleParameter("pContributionDep", OracleDbType.Varchar2, contributionDep, ParameterDirection.Input),
                new OracleParameter("pOfBase", OracleDbType.Char, ofBase, ParameterDirection.Input),
                new OracleParameter("pDate", OracleDbType.Date , date, ParameterDirection.Input),
                //TODO null needs to be changed to base planid
                new OracleParameter("pBase", OracleDbType.Int32, null, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("UPSERTEMPLOYERPLANTYPE", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool InsertRegistrationLink(string uniqueLink, string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUniqueLink", OracleDbType.Char, uniqueLink, ParameterDirection.Input),
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("web_insertRegistrationLink", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool checkHasLink(string uniqueLink)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUniqueLink", OracleDbType.Char, uniqueLink, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };
            OracleHelper.ExecuteScalar("web_checkRegistrationLink", _params, CommandType.StoredProcedure);
            int count = int.Parse(_params[1].Value.ToString());
            return count > 0;
        }

        public static int countActiveWebAccount(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };
            OracleHelper.ExecuteScalar("web_webAccountCount", _params, CommandType.StoredProcedure);
            return int.Parse(_params[1].Value.ToString());
        }

        public static DataTable getContribution(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getOverallContribution", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static string getNewRenewalId()
        {
            OracleParameter[] _params = new OracleParameter[] 
            {
                new OracleParameter("pRenewalId", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_getNewRenewalId", _params, CommandType.StoredProcedure);
            return _params[0].Value.ToString();
        }

        public static Renewal getUnfinishedRenewalId(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            Renewal renew = null;
            using (OracleDataReader dr = OracleHelper.ExecuteReader ("web_getUnfinishedRenewal", _params, CommandType.StoredProcedure))
            {
                if (dr.Read())
                {
                    renew = new Renewal();
                    renew.renewalId = Utilities.ToString(dr["renewalId"]);
                    renew.cartId = Utilities.ToInt(dr["cart"]);
                    renew.state = Utilities.ToInt(dr["state"]);
                    renew.contributionId = Utilities.ToInt(dr["contributionTypeId"]);
                    renew.isComplete = Utilities.ToString(dr["isComplete"]);
                    renew.isPercent = Utilities.ToString(dr["isPercent"]);
                    renew.isOverAll = Utilities.ToString(dr["isOverall"]);
                    renew.name = Utilities.ToString(dr["name"]);
                    renew.title = Utilities.ToString(dr["title"]);
                    renew.effectiveDate = Utilities.toDateTime(dr["effectiveDate"]);
                }
            }
            return renew;
        }

        public static int hasRenewalId(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pExist", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar( "web_getLatestRenewal", _params, CommandType.StoredProcedure);

            return int.Parse(_params[1].Value.ToString());
        }

        public static string insertEmployer(int cart, BizInfoDetails user, BizAdditionalInfo addl, int partEE)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCart", OracleDbType.Int32, cart, ParameterDirection.Input),
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
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, ParameterDirection.Output)
            };
            _params[18].Size=8;
            OracleHelper.ExecuteScalar ("web_insertEmployer",_params, CommandType.StoredProcedure);
            return _params[18].Value == null ? "":_params[18].Value.ToString();
        }

        public static BizInfoDetails getPotentialUser(string code, int cart)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCode", OracleDbType.Varchar2, code, ParameterDirection.Input),
                new OracleParameter("pCart" , OracleDbType.Int32, cart, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            BizInfoDetails details = null;
            using (OracleDataReader dr = OracleHelper.ExecuteReader("web_getPotentialUser", _params, CommandType.StoredProcedure))
            {
                if (dr.Read())
                {
                    details = new BizInfoDetails();
                    details.EmployerId = Utilities.ToString(dr["employerId"]);
                    details.CompanyName = Utilities.ToString(dr["name"]);
                    details.AgencyId = Utilities.ToString(dr["agencyId"]);
                    details.PhsicalStreetAddress1 = Utilities.ToString(dr["billAddressOne"]);
                    details.PhsicalStreetAddress2 = Utilities.ToString(dr["billAddressTwo"]);
                    details.PhsicalCity = Utilities.ToString(dr["billCity"]);
                    details.PhsicalState = Utilities.ToString(dr["billState"]);
                    details.PhsicalPostCode = Utilities.ToString(dr["billZip"]);
                    details.MailingStreetAddress1 = Utilities.ToString(dr["addressOne"]);
                    details.MailingStreetAddress2 = Utilities.ToString(dr["addressTwo"]);
                    details.MailingCity = Utilities.ToString(dr["city"]);
                    details.MailingState = Utilities.ToString(dr["state"]);
                    details.MailingPostCode = Utilities.ToString(dr["zip"]);
                    details.MailingContact = Utilities.ToString(dr["mailContact"]);
                    details.MailingEmail = Utilities.ToString(dr["mailEmail"]);
                    details.Faxnbr = Utilities.ToString(dr["faxNbr"]);
                    details.Phonenbr = Utilities.ToString(dr["phoneNbr"]);
                    details.StartDate = Utilities.ToString(dr["startDate"]);
                }
            }
            return details;
        }

        public static int newSignatureId()
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pSignatureId", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_getNewSignatureId", _params, CommandType.StoredProcedure);
            return _params[0].Value == null ? 0 : int.Parse(_params[0].Value.ToString());
        }

        public static bool updateSignature(int signatureId, byte[] image)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@signatureId", SqlDbType.Int), 
                new SqlParameter("@signatureImage", SqlDbType.Image), 
            };
            _params[0].Value = signatureId;
            _params[1].Value = image;

            int result = SQLHelper.ExecuteNonQuery(CommandType.StoredProcedure, "updateSignature", _params);
            return result != -1;
        }

        public static byte[] getSignature(int signatureId)
        {
            SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@signatureId", SqlDbType.Int)
            };

            _params[0].Value = signatureId;

            byte[] signatureImage = null;
            object result = SQLHelper.ExecuteScalar(CommandType.StoredProcedure, "getSignature", _params);
            if (result != null)
                signatureImage = (byte[])result;
            return signatureImage;
        }

        public static int getSigntureId(string id, int type, string vCode)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pId", OracleDbType.Varchar2, id, ParameterDirection.Input),
                new OracleParameter("pType", OracleDbType.Int32, type, ParameterDirection.Input),
                new OracleParameter("pCode", OracleDbType.Varchar2, vCode, ParameterDirection.Input),
                new OracleParameter("pSignatureId", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_getSignatureId", _params, CommandType.StoredProcedure);
            return _params[3].Value.ToString() == "null" ? 0 : int.Parse(_params[3].Value.ToString());
        }

        public static bool updateSignatureId(string id, int type, string name, string title, int signatureId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pId", OracleDbType.Varchar2, id, ParameterDirection.Input),
                new OracleParameter("pType", OracleDbType.Int32, type, ParameterDirection.Input),
                new OracleParameter("pName", OracleDbType.Varchar2, name, ParameterDirection.Input),
                new OracleParameter("pTitle", OracleDbType.Varchar2, title, ParameterDirection.Input),
                new OracleParameter("pSignatureId", OracleDbType.Int32, signatureId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_updateSignature", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool removeEmployer(int employerId)
        {
            int result = OracleHelper.ExecuteNonQuery("deleteEmployer",
                new OracleParameter[] { new OracleParameter("n", OracleDbType.Int32,employerId, ParameterDirection.Input) }, 
                CommandType.StoredProcedure);
            return result != -1;
        }
    }
}