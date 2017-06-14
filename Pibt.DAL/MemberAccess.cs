using System;
using System.Data;
using Oracle.DataAccess.Client;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.DAL
{
    public class MemberAccess
    {
        public static DataTable GetEmployeesByDeptId(string deptId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pDeptId", OracleDbType.Varchar2, 8, deptId, ParameterDirection.Input),
                new OracleParameter("V_Refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetEmployeesByDeptId", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable SearchEmployees(string employerId, string optionId, string clue)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, 8, employerId, ParameterDirection.Input),
                new OracleParameter("pOptionId", OracleDbType.Varchar2, 1, optionId, ParameterDirection.Input),
                new OracleParameter("pClue", OracleDbType.Varchar2, clue, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_SearchEmployees", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        //Get Employer Biz Contacts
        public static DataTable GetMemberPlanDetails(string memberId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberID", OracleDbType.Varchar2, 8, memberId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetMemberPlanDetails", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        // Get member info  details
        public static MemberDetails GetMemberDetails(string memberId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberID", OracleDbType.Varchar2, 8, memberId, ParameterDirection.Input),
                new OracleParameter("cur_MemberDetails", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            MemberDetails details = null;
            using (OracleDataReader dr = OracleHelper.ExecuteReader("WEB_GetMemberDetails", _params, CommandType.StoredProcedure))
            {
                // Read data
                if (dr.Read())
                {
                    // get member info details
                    details = new MemberDetails();
                    details.EmployerId = Utilities.ToString(dr["employerId"]);
                    details.EmployeeId = Utilities.ToString(dr["employeeId"]);
                    details.MemberId = Utilities.ToString(dr["memberId"]);
                    details.LastName = Utilities.ToString(dr["lastName"]);
                    details.FirstName = Utilities.ToString(dr["firstName"]);
                    details.MiddleName = Utilities.ToString(dr["middleName"]);
                    details.EmployeeTypeId = Utilities.ToString(dr["employeeTypeId"]);
                    details.EemployeeType = Utilities.ToString(dr["employeeType"]);
                    details.Gender = Utilities.ToString(dr["gender"]);
                    details.SocsecNbr = Utilities.ToString(dr["socsecNbr"]);
                    details.BirthDate = Utilities.ToString(dr["birthDate"]);
                    details.MarriageDate = Utilities.ToString(dr["marriageDate"]);
                    details.HireDate = Utilities.ToString(dr["hireDate"]);
                    details.AddressOne = Utilities.ToString(dr["addressOne"]);
                    details.AddressTwo = Utilities.ToString(dr["addressTwo"]);
                    details.City = Utilities.ToString(dr["city"]);
                    details.State = Utilities.ToString(dr["state"]);
                    details.Zip = Utilities.ToString(dr["zip"]);
                    details.HomePhoneNbr = Utilities.ToString(dr["homePhoneNbr"]);
                    details.WorkPhoneNbr = Utilities.ToString(dr["workPhoneNbr"]);
                    details.MobilePhoneNbr = Utilities.ToString(dr["mobilePhoneNbr"]);
                    details.EmailAddress = Utilities.ToString(dr["emailAddress"]);
                    details.DeptId = Utilities.ToString(dr["deptId"]);
                    details.AdoptionDate = Utilities.ToString(dr["adoptionDate"]);
                    details.Handicapped = Utilities.ToString(dr["handicapped"]);
                    details.MaritalstatusId = Utilities.ToString(dr["maritalstatusId"]);
                    details.UserName = Utilities.ToString(dr["FullName"]);
                    details.LoginName = Utilities.ToString(dr["Loginname"]);
                    details.IsLockout = Utilities.ToBool(dr["Islockout"]);
                    details.LastLoginIP = Utilities.ToString(dr["Lastloginip"]);
                    details.LastLoginTime = Utilities.ToString(dr["Lastlogintime"]);
                    details.Updated = Utilities.ToString(dr["Updated"]);
                    details.UpdatedBy = Utilities.ToString(dr["Updatedby"]);
                    details.EeContribution = Utilities.ToString(dr["Contribution"]);
                    details.DepContribution = Utilities.ToString(dr["ContributionDep"]);
                    details.EeDollar = Utilities.ToString(dr["Dollar"]);
                    details.DepDollar = Utilities.ToString(dr["DollarDep"]);
                    details.PeriodsPerYear = Utilities.ToString(dr["Periodsperyear"]);
                    details.SalaryPerPeriod = Utilities.ToString(dr["Salaryperperiod"]);
                    details.hoursWorked = Utilities.ToString(dr["hoursWorked"]);
                    details.smoker = Utilities.ToBool(dr["smoker"]);
                }
            }
            return details;
        }

        //Insert a new member.
        public static bool UpdateMember(string memberId, string lastName, string firstName, string middleName, string male, string socsecNbr, DateTime? birthDate,
                                        DateTime? marriageDate, DateTime? hireDate, string addressOne, string addressTwo, string city, string state, string zip,
                                        string mobilePhoneNbr, string homePhoneNbr, string workPhoneNbr, string emailAddress, string handicapped, string deptId,
                                        DateTime? adoptionDate, string updatedBy, string salaryPerPeriod, string periodsPerYear, string hoursWorked, string smoker)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberId", OracleDbType.Varchar2, 8, memberId, ParameterDirection.Input),
                new OracleParameter("pLastName", OracleDbType.Varchar2, 20, lastName, ParameterDirection.Input),
                new OracleParameter("pFirstName", OracleDbType.Varchar2, 15, firstName, ParameterDirection.Input),
                new OracleParameter("pMiddleName", OracleDbType.Varchar2, 1, middleName, ParameterDirection.Input),
                new OracleParameter("pMale", OracleDbType.Varchar2, 1, male, ParameterDirection.Input),
                new OracleParameter("pSocsecNbr", OracleDbType.Varchar2, 9, socsecNbr, ParameterDirection.Input),
                new OracleParameter("pBirthDate", OracleDbType.Date, birthDate, ParameterDirection.Input),
                new OracleParameter("pMarriageDate", OracleDbType.Date, marriageDate, ParameterDirection.Input),
                new OracleParameter("pHireDate", OracleDbType.Date, hireDate, ParameterDirection.Input),
                new OracleParameter("pAddressOne", OracleDbType.Varchar2, 80, addressOne, ParameterDirection.Input),
                new OracleParameter("pCity", OracleDbType.Varchar2, 15, city, ParameterDirection.Input),
                new OracleParameter("pState", OracleDbType.Varchar2, 13, state, ParameterDirection.Input),
                new OracleParameter("pZip", OracleDbType.Varchar2, 30, zip, ParameterDirection.Input),
                new OracleParameter("pMobilePhoneNbr", OracleDbType.Varchar2, 10, mobilePhoneNbr, ParameterDirection.Input),
                new OracleParameter("pHomePhoneNbr", OracleDbType.Varchar2, 10, homePhoneNbr, ParameterDirection.Input),
                new OracleParameter("pWorkPhoneNbr", OracleDbType.Varchar2, 10, workPhoneNbr, ParameterDirection.Input),
                new OracleParameter("pEmailAddress", OracleDbType.Varchar2, 120, emailAddress, ParameterDirection.Input),
                new OracleParameter("pHandicapped", OracleDbType.Varchar2, 1, handicapped, ParameterDirection.Input),
                new OracleParameter("pDeptId", OracleDbType.Varchar2, 8, deptId, ParameterDirection.Input),
                new OracleParameter("pAdoptionDate", OracleDbType.Date, adoptionDate, ParameterDirection.Input),
                new OracleParameter("pUpdatedby", OracleDbType.Varchar2, 10, updatedBy, ParameterDirection.Input),
                new OracleParameter("pSalaryPerPeriod", OracleDbType.Varchar2, salaryPerPeriod, ParameterDirection.Input),
                new OracleParameter("pPeriodsPerYear", OracleDbType.Varchar2, periodsPerYear, ParameterDirection.Input),
                new OracleParameter("pHoursWorked", OracleDbType.Varchar2, hoursWorked, ParameterDirection.Input),
                new OracleParameter("pSmoker", OracleDbType.Varchar2, smoker, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_UpdateMember", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdateMemberContribution(string memberid, string contribution, string contributionDep, string dollar, string dollarDep, string period, string salary)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberid, ParameterDirection.Input),
                new OracleParameter("pContribution", OracleDbType.Varchar2, contribution, ParameterDirection.Input),
                new OracleParameter("pContributionDep", OracleDbType.Varchar2, contributionDep, ParameterDirection.Input),
                new OracleParameter("pDollar", OracleDbType.Varchar2, dollar, ParameterDirection.Input),
                new OracleParameter("pDollarDep", OracleDbType.Varchar2, dollarDep, ParameterDirection.Input),
                new OracleParameter("pPeriod", OracleDbType.Int32, period, ParameterDirection.Input),
                new OracleParameter("pSalar", OracleDbType.Varchar2, salary, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("WEB_UPDATEMEMBERCONTRIBUTION", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        // Insert a new member.
        public static bool InsertMember(string newMemberId, string employeeId, string employerId, string lastName, string firstName, string middleName,
                                        string employeeType, string male, string socsecNbr, DateTime? birthDate, DateTime? marriageDate, DateTime? hireDate,
                                        string addressOne, string addressTwo, string city, string state, string zip, string mobilePhoneNbr, string homePhoneNbr,
                                        string workPhoneNbr, string emailAddress, string handicapped, string maritalstatusId, string deptId, string updatedBy,
                                        string salaryPerPeriod, string periodsPerYear, string hoursWorked, string smoker)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pNewMemberId", OracleDbType.Varchar2, 8, newMemberId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, 8, employerId, ParameterDirection.Input),
                new OracleParameter("pLastName", OracleDbType.Varchar2, 20, lastName, ParameterDirection.Input),
                new OracleParameter("pFirstName", OracleDbType.Varchar2, 15, firstName, ParameterDirection.Input),
                new OracleParameter("pMiddleName", OracleDbType.Varchar2, 1, middleName, ParameterDirection.Input),
                new OracleParameter("pEmployeeType", OracleDbType.Varchar2, 1, employeeType, ParameterDirection.Input),
                new OracleParameter("pMale", OracleDbType.Varchar2, 1, male, ParameterDirection.Input),
                new OracleParameter("pSocsecNbr", OracleDbType.Varchar2, 9, socsecNbr, ParameterDirection.Input),
                new OracleParameter("pBirthDate", OracleDbType.Date, birthDate, ParameterDirection.Input),
                new OracleParameter("pMarriageDate", OracleDbType.Date, marriageDate, ParameterDirection.Input),
                new OracleParameter("pHireDate", OracleDbType.Date, hireDate, ParameterDirection.Input),
                new OracleParameter("pAddressOne", OracleDbType.Varchar2, 80, addressOne, ParameterDirection.Input),
                // TODO new OracleParameter("pAddressTwo", OracleDbType.Varchar2, 30, addressTwo, ParameterDirection.Input),
                new OracleParameter("pCity", OracleDbType.Varchar2, 15, city, ParameterDirection.Input),
                new OracleParameter("pState", OracleDbType.Varchar2, 13, state, ParameterDirection.Input),
                new OracleParameter("pZip", OracleDbType.Varchar2, 30, zip, ParameterDirection.Input),
                new OracleParameter("pMobilePhoneNbr", OracleDbType.Varchar2, 10, mobilePhoneNbr, ParameterDirection.Input),
                new OracleParameter("pHomePhoneNbr", OracleDbType.Varchar2, 10, homePhoneNbr, ParameterDirection.Input),
                new OracleParameter("pWorkPhoneNbr", OracleDbType.Varchar2, 10, workPhoneNbr, ParameterDirection.Input),
                new OracleParameter("pEmailAddress", OracleDbType.Varchar2, 120, emailAddress, ParameterDirection.Input),
                new OracleParameter("pHandicapped", OracleDbType.Varchar2, 1, handicapped, ParameterDirection.Input),
                new OracleParameter("pMaritalstatusId", OracleDbType.Varchar2, 1, maritalstatusId, ParameterDirection.Input),
                new OracleParameter("pDeptId", OracleDbType.Varchar2, 8, deptId, ParameterDirection.Input),
                new OracleParameter("pUpdatedby", OracleDbType.Varchar2, 10, updatedBy, ParameterDirection.Input),
                new OracleParameter("pSalaryPerPeriod", OracleDbType.Varchar2, salaryPerPeriod, ParameterDirection.Input),
                new OracleParameter("pPeriodsPerYear", OracleDbType.Varchar2, periodsPerYear, ParameterDirection.Input),
                new OracleParameter("pHoursWorked", OracleDbType.Varchar2, hoursWorked, ParameterDirection.Input),
                new OracleParameter("pSmoker", OracleDbType.Varchar2, 1, smoker, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("WEB_insertMember", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        //Insert a new member.
        public static bool InsertDependent( string newMemberId, string employeeId, string employerId, string lastName, string firstName, string middleName,
                                            string employeeType, string male, string socsecNbr, DateTime? birthDate, DateTime? marriageDate, string addressOne, //string addressTwo,
                                            string city, string state, string zip, string mobilePhoneNbr, string homePhoneNbr, string workPhoneNbr,string emailAddress,
                                            string handicapped, DateTime? adoptionDate, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pNewMemberId", OracleDbType.Varchar2, 8, newMemberId, ParameterDirection.Input),
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, 8, employeeId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, 8, employerId, ParameterDirection.Input),
                new OracleParameter("pLastName", OracleDbType.Varchar2, 20, lastName, ParameterDirection.Input),
                new OracleParameter("pFirstName", OracleDbType.Varchar2, 15, firstName, ParameterDirection.Input),
                new OracleParameter("pMiddleName", OracleDbType.Varchar2, 1, middleName, ParameterDirection.Input),
                new OracleParameter("pEmployeeType", OracleDbType.Varchar2, 1, employeeType, ParameterDirection.Input),
                new OracleParameter("pMale", OracleDbType.Varchar2, 1, male, ParameterDirection.Input),
                new OracleParameter("pSocsecNbr", OracleDbType.Varchar2, 9, socsecNbr, ParameterDirection.Input),
                new OracleParameter("pBirthDate", OracleDbType.Date, birthDate, ParameterDirection.Input),
                new OracleParameter("pMarriageDate", OracleDbType.Date, marriageDate, ParameterDirection.Input),
                new OracleParameter("pAddressOne", OracleDbType.Varchar2, 80, addressOne, ParameterDirection.Input),
                //new OracleParameter("pAddressTwo", OracleDbType.Varchar2, 30, addressTwo, ParameterDirection.Input),
                new OracleParameter("pCity", OracleDbType.Varchar2, 15, city, ParameterDirection.Input),
                new OracleParameter("pState", OracleDbType.Varchar2, 13, state, ParameterDirection.Input),
                new OracleParameter("pZip", OracleDbType.Varchar2, 30, zip, ParameterDirection.Input),
                new OracleParameter("pMobilePhoneNbr", OracleDbType.Varchar2, 10, mobilePhoneNbr, ParameterDirection.Input),
                new OracleParameter("pHomePhoneNbr", OracleDbType.Varchar2, 10, homePhoneNbr, ParameterDirection.Input),
                new OracleParameter("pWorkPhoneNbr", OracleDbType.Varchar2, 10, workPhoneNbr, ParameterDirection.Input),
                new OracleParameter("pEmailAddress", OracleDbType.Varchar2, 120, emailAddress, ParameterDirection.Input),
                new OracleParameter("pHandicapped", OracleDbType.Varchar2, 1, handicapped, ParameterDirection.Input),
                new OracleParameter("pAdoptionDate", OracleDbType.Date, adoptionDate, ParameterDirection.Input),
                new OracleParameter("pUpdatedby", OracleDbType.Varchar2, 10, updatedBy, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("WEB_insertDependent", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool SynMemberToWebUsersTable(string employerId, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("Pemployerid", OracleDbType.Varchar2, 8, employerId, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2, 10, updatedBy, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("Web_SynMemberWebUsersTable", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static DataTable GetMemberratetypes()
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetMemberratetypes", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static MemberDetails getMemberWithLink(string uniqueLink)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("puniqueLink", OracleDbType.Varchar2, uniqueLink, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            MemberDetails details = null;
            using (OracleDataReader dr = OracleHelper.ExecuteReader("web_getMemberRegLink", _params, CommandType.StoredProcedure))
            {
                // Read data
                if (dr.Read())
                {
                    // get member info details
                    details = new MemberDetails();
                    details.EmployerId = Utilities.ToString(dr["employerId"]);
                    details.EmployeeId = Utilities.ToString(dr["employeeId"]);
                    details.MemberId = Utilities.ToString(dr["memberId"]);
                    details.LastName = Utilities.ToString(dr["lastName"]);
                    details.FirstName = Utilities.ToString(dr["firstName"]);
                    details.SocsecNbr = Utilities.ToString(dr["socsecNbr"]);
                    details.EmailAddress = Utilities.ToString(dr["emailAddress"]);
                }
            }
            return details;
        }

        public static bool checkHasWebAccount(string uniqueLink)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUniqueLink", OracleDbType.Char, uniqueLink, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, uniqueLink, ParameterDirection.Output)
            };
            OracleHelper.ExecuteScalar("web_hasWebAccount", _params, CommandType.StoredProcedure);
            int count = int.Parse(_params[1].Value.ToString());
            return count > 0;
        }

        public static bool updateSmoker(string memberId, string flag)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberId, ParameterDirection.Input),
                new OracleParameter("pFlag", OracleDbType.Char, flag, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_updateSmokerFlag", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DataTable allMembers(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getAllMembers", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool deleteNewMember(string memberId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_deleteMember", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool deleteAllMembers(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_deleteAllTmpMembers", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DataTable checkMissingInfo(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_checkMissingInfo", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }
    }
}