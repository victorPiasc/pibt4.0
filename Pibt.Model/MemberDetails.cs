using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    public class MemberDetails : WebUser
    {
        public string EmployerId { get; set; }
        public string EmployeeId { get; set; }
        public string MemberId { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string EmployeeTypeId { get; set; }
        public string EemployeeType { get; set; }
        public string Gender { get; set; }
        public string SocsecNbr { get; set; }
        public string BirthDate { get; set; }
        public string MarriageDate { get; set; }
        public string HireDate { get; set; }
        public string AddressOne { get; set; }
        public string AddressTwo { get; set; }
        public string Address { get { return AddressOne + " " + AddressTwo; } }
        public string City { get; set; }
        public string State { get; set; }
        public string Zip { get; set; }
        public string HomePhoneNbr { get; set; }
        public string WorkPhoneNbr { get; set; }
        public string MobilePhoneNbr { get; set; }
        public string DeptId { get; set; }
        public string AdoptionDate { get; set; }
        public string Handicapped { get; set; }
        public string MaritalstatusId { get; set; }
        public string EeContribution { get; set; }
        public string DepContribution { get; set; }
        public string EeDollar { get; set; }
        public string DepDollar { get; set; }
        public string PeriodsPerYear { get; set; }
        public string SalaryPerPeriod { get; set; }
        public bool smoker { get; set; }
        public string hoursWorked { get; set; } // Might be null or empty
    }
}
