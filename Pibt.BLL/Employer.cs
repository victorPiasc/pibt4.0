using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pibt.DAL;
using Pibt.Model;
using System.Data;

namespace Pibt.BLL
{
    public class Employer
    {

        /// <summary>
        /// Get New Member Id
        /// </summary>
        /// <returns></returns>
        public static string GetNewMemberId()
        {
            return EmployerAccess.GetNewMemberId();
        }

        /// <summary>
        /// Validate MemberId if it is belong to the employer
        /// </summary>
        /// <param name="employerId"></param>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public static bool ValidateMemberId(string employerId, string memberId)
        {
            return EmployerAccess.GetValidateMemberId(employerId, memberId);
        }

        public static bool ValidateDependentId(string employeeId, string memberId)
        {
            return EmployerAccess.GetValidateDependentId(employeeId, memberId);
        }

        public static bool ValidateInvoiceId(int employerId, int invoiceId)
        {
            return EmployerAccess.GetValidateInvoiceId(employerId, invoiceId);
        }

        public static bool GetValidateEnrollerEmployer(string employerId, string userId)
        {
            return EmployerAccess.GetValidateEnrollerEmployer(employerId, userId);
        }

        public static bool GetValidateAgentEmployer(string employerId, string userId)
        {
            return EmployerAccess.GetValidateAgentEmployer(employerId, userId);
        }

        /// <summary>
        /// Validate Employer if it is belong to the Agent
        /// </summary>
        /// <param name="employerId"></param>
        /// <param name="agentUID"></param>
        /// <returns></returns>
        public static bool ValidateAgentUserId(string employerId, string agentUID)
        {
            return EmployerAccess.GetValidateAgentUserId(employerId, agentUID);
        }

        /// <summary>
        /// Validate Employer if it is belong to the RK
        /// </summary>
        /// <param name="employerId"></param>
        /// <param name="rkUID"></param>
        /// <returns></returns>
        public static bool ValidateRKUserId(string employerId, string rkUID)
        {
            return EmployerAccess.GetValidateRKUserId(employerId, rkUID);
        }

        public static bool ValidateBrokerUserId(string brokerId, string bUID) {
            return BrokerDataAccess.GetValidateBrokerUserId(brokerId, bUID);
        }

        /// <summary>
        /// Get Employer Biz general  details
        /// </summary>
        /// <param name="employerId"></param>
        /// <returns></returns>
        public static BizInfoDetails GetBizInfoDetails(string employerId)
        {
            return EmployerAccess.GetBizInfoDetails(employerId);
        }

        /// <summary>
        ///  Get  Employer Biz Addtional info details
        /// </summary>
        /// <param name="employerId"></param>
        /// <returns></returns>
        public static BizAdditionalInfo GetBizInfoDetails2(string employerId)
        {
            return EmployerAccess.GetBizInfoDetails2(employerId);
        }

        /// <summary>
        /// Get Employer Biz name
        /// </summary>
        /// <param name="employerId"></param>
        /// <returns></returns>
        public static string GetBizName(string employerId)
        {
            return EmployerAccess.GetBizName(employerId);
        }

        /// <summary>
        /// Get Employer Biz Contacts
        /// </summary>
        /// <param name="employerId"></param>
        /// <returns></returns>
        public static DataTable GetBizContacts(string employerId)
        {
            using (DataTable dt = EmployerAccess.GetBizContacts(employerId))
            {
                return dt;
            }
        }

        public static DataTable SearchEmployer(string clue, string userId, string userRole)
        {
            using (DataTable dt = EmployerAccess.SearchEmployer(clue, userId, userRole))
            {
                return dt;
            }
        }

        /// <summary>
        /// Get Employer Biz EE Names.
        /// </summary>
        /// <param name="employerId"></param>
        /// <returns></returns>
        public static DataTable GetBizEeNames(string employerId)
        {
            using (DataTable dt = EmployerAccess.GetBizEeNames(employerId))
            {
                return dt;
            }
        }

        /// <summary>
        /// Get Employer Biz Only One EE Name.
        /// </summary>
        /// <param name="employerId"></param>
        /// <param name="employeeId"></param>
        /// <returns></returns>
        public static DataTable GetBizEeName(string employerId, string employeeId)
        {
            using (DataTable dt = EmployerAccess.GetBizEeName(employerId, employeeId))
            {
                return dt;
            }

        }

        /// <summary>
        /// Get Employer Biz Dependent Names.
        /// </summary>
        /// <param name="employeeId"></param>
        /// <returns></returns>
        public static DataTable GetBizDepNames(string employeeId)
        {
            using (DataTable dt = EmployerAccess.GetBizDepNames(employeeId))
            {
                return dt;
            }
        }

        /// <summary>
        /// Get Employer Biz Dep Names.
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public static DataTable GetBizMemberInfo(string memberId)
        {
            using (DataTable dt = EmployerAccess.GetBizMemberInfo(memberId))
            {
                return dt;
            }
        }

        /// <summary>
        /// Get Member info  details 
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>

        public static MemberInfoDetails GetMemberInfoDetails(string memberId)
        {
            return EmployerAccess.GetMemberInfoDetails(memberId);
        }

        /// <summary>
        /// Get Waiting Period List
        /// </summary>
        /// <returns></returns>
        public static DataTable GetWaitingPeriodList()
        {
            using (DataTable dt = EmployerAccess.GetWaitingPeriodList())
            {
                return dt;
            }
        }

        //Get Terms
        public static DataTable GetTerms()
        {
            using (DataTable dt = EmployerAccess.GetTerms())
            {
                return dt;
            }
        }

        /// <summary>
        /// Get RK Team Lead
        /// </summary>
        /// <param name="rkId"></param>
        /// <returns></returns>
        public static string GetRelationshipKeeperTeamLead(string rkId)
        {
            return EmployerAccess.GetRelationshipKeeperTeamLead(rkId);
        }

        public static bool InsertMember(string newMemberId, string employeeId, string employerId, string lastName, string firstName, string middleName,
                                        string employeeType, string male, string socsecNbr, DateTime? birthDate, DateTime? marriageDate, DateTime? hireDate,
                                        string addressOne, string addressTwo, string city, string state, string zip, string mobilePhoneNbr, string homePhoneNbr,
                                        string workPhoneNbr, string emailAddress, string handicapped, string maritalstatusId, string deptId, string updatedBy,
                                        string salaryPerPeriod, string periodsPerYear, string hoursWorked, string smoker)
        {
            return MemberAccess.InsertMember(newMemberId, employeeId, employerId, lastName, firstName, middleName, employeeType, male, socsecNbr, birthDate,
                marriageDate, hireDate, addressOne, addressTwo, city, state, zip, mobilePhoneNbr, homePhoneNbr, workPhoneNbr, emailAddress, handicapped,
                maritalstatusId, deptId, updatedBy, salaryPerPeriod, periodsPerYear, hoursWorked, smoker);
        }

        /// <summary>
        /// Insert a new member.
        /// </summary>
        /// <param name="newMemberId"></param>
        /// <param name="employeeId"></param>
        /// <param name="employerId"></param>
        /// <param name="lastName"></param>
        /// <param name="firstName"></param>
        /// <param name="middleName"></param>
        /// <param name="employeeType"></param>
        /// <param name="male"></param>
        /// <param name="socsecNbr"></param>
        /// <param name="birthDate"></param>
        /// <param name="marriageDate"></param>
        /// <param name="addressOne"></param>
        /// <param name="addressTwo"></param>
        /// <param name="city"></param>
        /// <param name="state"></param>
        /// <param name="zip"></param>
        /// <param name="mobilePhoneNbr"></param>
        /// <param name="homePhoneNbr"></param>
        /// <param name="workPhoneNbr"></param>
        /// <param name="emailAddress"></param>
        /// <param name="handicapped"></param>
        /// <param name="adoptionDate"></param>
        /// <param name="updatedBy"></param>
        /// <returns></returns>
        public static bool InsertDependent( string newMemberId, string employeeId, string employerId, string lastName, string firstName, string middleName,
                                            string employeeType, string male, string socsecNbr, DateTime? birthDate, DateTime? marriageDate, string addressOne, //string addressTwo,
                                            string city, string state, string zip, string mobilePhoneNbr, string homePhoneNbr, string workPhoneNbr, string emailAddress, 
                                            string handicapped, DateTime? adoptionDate, string updatedBy)
        {
            return MemberAccess.InsertDependent( newMemberId, employeeId, employerId, lastName, firstName, middleName,employeeType, male, socsecNbr, birthDate,
                marriageDate, addressOne,/*addressTwo,*/city, state, zip, mobilePhoneNbr, homePhoneNbr, workPhoneNbr, emailAddress, handicapped, adoptionDate,updatedBy);
        }

        /// <summary>
        /// Update Er General Info
        /// </summary>
        /// <param name="bizInfo"></param>
        /// <param name="updatedBy"></param>
        /// <returns></returns>
        public static bool UpdateEmployer(BizInfoDetails bizInfo, string updatedBy)
        {
            return EmployerAccess.UpdateEmployer(bizInfo, updatedBy);
        }

        /// <summary>
        /// Update Er Addtional Info
        /// </summary>
        /// <param name="bizInfo"></param>
        /// <param name="updatedBy"></param>
        /// <returns></returns>
        public static bool UpdateEmployer(BizAdditionalInfo bizInfo, string updatedBy)
        {
            return EmployerAccess.UpdateEmployer(bizInfo, updatedBy);
        }

        /// <summary>
        /// Add Er Contact
        /// </summary>
        /// <param name="bizContact"></param>
        /// <returns></returns>
        public static bool InsertBizContact(BizContact bizContact)
        {
            return EmployerAccess.InsertBizContact(bizContact);
        }
        /// <summary>
        /// Update Er Contact
        /// </summary>
        /// <param name="bizContact"></param>
        /// <returns></returns>
        public static bool UpdateBizContact(BizContact bizContact)
        {
            return EmployerAccess.UpdateBizContact(bizContact);
        }


        /// <summary>
        /// Get DBAs of the employer
        /// </summary>
        /// <param name="employerId"></param>
        /// <returns></returns>
        public static DataTable GetEmployerDBAs(string employerId)
        {

            // execute the stored procedure
            using (DataTable dt = EmployerAccess.GetEmployerDBAs(employerId))
            {
                return dt;
            }
        }

        /// <summary>
        /// Add Employer DBA
        /// </summary>
        /// <param name="employerId"></param>
        /// <param name="dbaName"></param>
        /// <returns></returns>
        public static bool InsertEmployerDBA(string employerId, string dbaName)
        {
            return EmployerAccess.InsertEmployerDBA(employerId, dbaName);
        }


        /// <summary>
        /// Delete Employer DBA
        /// </summary>
        /// <param name="employerId"></param>
        /// <param name="dbaName"></param>
        /// <returns></returns>
        public static bool DeleteEmployerDBA(string employerId, string dbaName)
        {
            return EmployerAccess.DeleteEmployerDBA(employerId, dbaName);
        }

        public static bool UpdateEmployerDBA(string rowId, string employerId, string dbaName)
        {
            return EmployerAccess.UpdateEmployerDBA(rowId, employerId, dbaName);
        }

        public static bool DeleteEmployerContact(string rowid)
        {
            return EmployerAccess.DeleteEmployerContactByRowId(rowid);
        }

        public static bool SynEmployerToWebUsersTable(int roleId, string userId, string updatedBy)
        {
            return EmployerAccess.SynEmployerToWebUsersTable(roleId, userId, updatedBy);
        }

        /// <summary>
        /// Get Departments
        /// </summary>
        /// <param name="employerId"></param>
        /// <returns></returns>
        public static DataTable GetDepartments(string employerId)
        {
            using (DataTable dt = EmployerAccess.GetDepartments(employerId))
            {
                return dt;
            }
        }

        public static bool SingleDepartment(string employerId) {
            return EmployerAccess.SingleDepartment(employerId);
        }

        public static bool InsertDepartments(string employerId, string deptCode, string name)
        {
            return EmployerAccess.InsertDepartments(employerId, deptCode, name);
        }

        public static bool UpdateDepartments(string deptId, string employerId, string deptCode, string name)
        {
            return EmployerAccess.UpdateDepartments(deptId, employerId, deptCode, name);
        }

        public static DataTable GetEnterpriseWithDefault()
        {
            using (DataTable dt = EmployerAccess.GetEnterprise())
            {
                DataRow dr = dt.NewRow();
                dr["Agencyid"] = 0;
                dr["Description"] = "All";
                dt.Rows.Add(dr);
                return dt;
            }
        }

        public static DataTable SearchEmployerByType(string userId, int userRole, string typeId, string clue)
        {
         using (DataTable dt = EmployerAccess.SearchEmployerByType(userId, userRole, typeId, clue))
         {
          return dt;
         }
        }

        public static DataTable GetPlantypeContribution(string employerid)
        {
            using (DataTable dt = EmployerAccess.GetPlantypeContribution(employerid))
            {
                return dt;
            }
        }

        public static bool InsertPlantypeContribution(string employerid, int plantypeid, string contribution, string contributionDep, string ofBase, object date)
        {
            return EmployerAccess.InsertPlantypeContribution(employerid, plantypeid, contribution, contributionDep, ofBase, date);
        }

        public static bool InsertRegistrationLink(string uniqueLink, string employeeId)
        {
            return EmployerAccess.InsertRegistrationLink(uniqueLink, employeeId);
        }

        public static bool checkHasLink(string uniqueLink)
        {
            return EmployerAccess.checkHasLink(uniqueLink);
        }

        public static int countActiveWebAccount(string employerId)
        {
            return EmployerAccess.countActiveWebAccount(employerId);
        }

        public static DataTable getContribution(string employerId)
        {
            using (DataTable dt = EmployerAccess.getContribution(employerId))
            {
                return dt;
            }
        }

        public static string getNewRenewalId()
        {
            return EmployerAccess.getNewRenewalId();
        }

        public static Renewal getUnfinishedRenewalId(string employerId)
        {
            return EmployerAccess.getUnfinishedRenewalId(employerId);
        }

        public static int hasRenewalId(string employerId)
        {
            return EmployerAccess.hasRenewalId(employerId);
        }

        public static string insertEmployer(int cart, BizInfoDetails user, BizAdditionalInfo addl, int partEE)
        {
            return EmployerAccess.insertEmployer(cart, user, addl, partEE);
        }

        public static BizInfoDetails getPotentialUser(string code, int cart)
        {
            return EmployerAccess.getPotentialUser(code, cart);
        }

        public static int newSignatureId()
        {
            return EmployerAccess.newSignatureId();
        }

         public static bool updateSignature(int signatureId, byte[] image)
        {
            return EmployerAccess.updateSignature(signatureId, image);
        }

         public static byte[] getSignature(int signatureId)
         {
             return EmployerAccess.getSignature(signatureId);
         }

         /// <summary>
         /// Get existing signatureId 
         /// Type:0 = web_oe
         ///    1: web_renewal
         ///    2: web_potentialUser
         /// </summary>
         /// <returns></returns>
         public static int getSigntureId(string id, int type, string vCode)
         {
             return EmployerAccess.getSigntureId(id, type, vCode);
         }

         public static bool updateSignatureId(string id, int type, string name, string title, int signatureId)
         {
             return EmployerAccess.updateSignatureId(id, type, name, title, signatureId);
         }

        public static bool removeEmployer(int employerId)
         {
             return EmployerAccess.removeEmployer(employerId);
         }
    }
}
