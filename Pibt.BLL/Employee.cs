using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Pibt.DAL;
using Pibt.Model;

namespace Pibt.BLL
{
    public class Employee
    {
        public static DataTable GetEmployeesByDeptId(string deptId)
        {
            using (DataTable dt = MemberAccess.GetEmployeesByDeptId(deptId))
            {
                return dt;
            }
        }

        public static DataTable SearchEmployees(string employerId, string optionId, string clue)
        {
            using (DataTable dt = MemberAccess.SearchEmployees(employerId, optionId, clue))
            {
                return dt;
            }
        }

        /// <summary>
        /// Get Employer Biz Contacts
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public static DataTable GetMemberPlanDetails(string memberId)
        {
            // execute the stored procedure
            using (DataTable dt = MemberAccess.GetMemberPlanDetails(memberId))
            {
                return dt;
            }

        }

        /// <summary>
        /// Get member info  details
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public static MemberDetails GetMemberDetails(string memberId)
        {
            // return member details
            return MemberAccess.GetMemberDetails(memberId);
        }

        public static bool UpdateMember(string memberId, string lastName, string firstName, string middleName, string male, string socsecNbr, DateTime? birthDate,
                                        DateTime? marriageDate, DateTime? hireDate, string addressOne, string addressTwo, string city, string state, string zip,
                                        string mobilePhoneNbr, string homePhoneNbr, string workPhoneNbr, string emailAddress, string handicapped, string deptId,
                                        DateTime? adoptionDate, string updatedBy, string salaryPerPeriod, string periodsPerYear, string hoursWorked, string smoker)
        {

            // result will be true in case of success 
            return MemberAccess.UpdateMember(memberId, lastName, firstName, middleName, male, socsecNbr, birthDate, marriageDate, hireDate, addressOne, addressTwo,
                city, state, zip, mobilePhoneNbr, homePhoneNbr, workPhoneNbr, emailAddress, handicapped, deptId, adoptionDate, updatedBy, salaryPerPeriod,
                periodsPerYear, hoursWorked, smoker);

        }

        public static bool UpdateMember(string memberId, string lastName, string firstName, string middleName, string male, string socsecNbr, DateTime? birthDate,
                                        string emailAddress, string updatedBy, string hoursWorked, string smoker)
        {
            return MemberAccess.UpdateMember(memberId, lastName, firstName, middleName, male, socsecNbr,
                birthDate, null/*marriageDate*/, null/*hireDate*/, null/*addressOne*/, null /*addressTwo*/,
                null /*city*/, null /*state*/, null /*zip*/, null /*mobileNbr*/, null /*homeNbr*/, null /*workNbr*/,
                emailAddress, null /*handicapped*/, null /*deptId*/, null /*adoptionDate*/, updatedBy, null /*salaryPerPeriod*/,
                null /*periodsPerYear*/, hoursWorked, smoker);
        }

        public static bool UpdateMemberContribution(string memberid, string contribution, string contributionDep, string dollar, string dollarDep, string period, string salary)
        {
            return MemberAccess.UpdateMemberContribution(memberid, contribution, contributionDep, dollar, dollarDep, period, salary);
        }

        public static bool SynMemberToWebUsersTable(string employerId, string updatedBy)
        {
            return MemberAccess.SynMemberToWebUsersTable(employerId, updatedBy);
        }

        public static MemberDetails getMemberWithLink(string uniqueLink)
        {
            return MemberAccess.getMemberWithLink(uniqueLink);
        }

        public static bool checkHasWebAccount(string uniqueLink)
        {
            return MemberAccess.checkHasWebAccount(uniqueLink);
        }

        public static bool updateSmoker(string memberId, string flag)
        {
            return MemberAccess.updateSmoker(memberId, flag);
        }

        public static DataTable allMembers(string employerId)
        {
            using (DataTable dt = MemberAccess.allMembers(employerId))
            {
                return dt;
            }
        }

        public static bool deleteNewMember(string memberId)
        {
            return MemberAccess.deleteNewMember(memberId);
        }

        public static bool deleteAllMembers(string employerId)
        {
            return MemberAccess.deleteAllMembers(employerId);
        }

        public static DataTable checkMissingInfo(string employerId)
        {
            using (DataTable dt = MemberAccess.checkMissingInfo(employerId))
            {
                return dt;
            }
        }
    }
}
