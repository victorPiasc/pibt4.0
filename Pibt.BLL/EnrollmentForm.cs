using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pibt.Model;
using Pibt.DAL;
using System.Data;
using System.IO;

namespace Pibt.BLL
{
    public class EnrollmentForm
    {
       public static bool IsPlanPPO(string oeId, int planTypeId)
       {
          return EnrollmentFormAccess.IsPlanPPO(oeId, planTypeId);
       }

        public static DataTable GetActivePlansByPlanTypeId(string plantypeId, string employeeId)
        {
            using (DataTable dt = EnrollmentFormAccess.GetActivePlansByPlanTypeId(plantypeId, employeeId))
            {
                return dt;
            }
        }

        /// <summary>
        ///  Check if plans can be added
        /// </summary>
        /// <returns></returns>
        /// 
        public static bool CheckAddPlansAvailable(string EmployerId, string hireDate)
        {
           return EnrollmentFormAccess.CheckAddPlansAvailable(EmployerId, hireDate);            
        }

        /// <summary>
        ///  Get New Oe Id
        /// </summary>
        /// <returns></returns>
        public static string GetNewOeId()
        {
            return EnrollmentFormAccess.GetNewOeId();
        }

        /// <summary>
        /// Get current PA
        /// </summary>
        /// <param name="employerId"></param>
        /// <returns></returns>
        public static bool GetCurrentPA(string employerId, out DateTime dt)
        {
            return EnrollmentFormAccess.GetCurrentPA(employerId, out dt);
        }

        /// <summary>
        /// Get OE Details
        /// </summary>
        /// <param name="OEId"></param>
        /// <returns></returns>
        public static OeDetails GetOEDetails(string OEId)
        {
            return EnrollmentFormAccess.GetOEDetails(OEId);
        }

        /// <summary>
        /// Insert Enroller Form
        /// </summary>
        /// <param name="oeId"></param>
        /// <param name="employerId"></param>
        /// <param name="memberId"></param>
        /// <param name="typeId"></param>
        /// <param name="createdBy"></param>
        /// <param name="IP"></param>
        /// <returns></returns>
        public static bool InsertEnrollerForm(string oeId, string employerId, string memberId, string typeId, string createdBy, string IP)
        {
            return EnrollmentFormAccess.InsertEnrollerForm(oeId, employerId, memberId, typeId, createdBy, IP);
        }

        /// <summary>
        /// Insert Enroller Form Plans
        /// </summary>
        /// <param name="oeId"></param>
        /// <param name="employeeId"></param>
        /// <param name="memberId"></param>
        /// <param name="name"></param>
        /// <param name="type"></param>
        /// <param name="gender"></param>
        /// <param name="planId"></param>
        /// <param name="planName"></param>
        /// <param name="planTypeId"></param>
        /// <returns></returns>
        /// 

        public static string InsertEnrollerFormPlans(string oeId, int cartId, string memberId, string planId, string updatedBy, string keepCur)
        {
            return EnrollmentFormAccess.InsertEnrollerFormPlans(oeId, cartId, memberId, planId, updatedBy, keepCur);
        }

        /// <summary>
        /// Delete Enroller Form Plans
        /// </summary>
        /// <param name="oeId"></param>
        /// <param name="employeeId"></param>
        /// <param name="planId"></param>
        /// <returns></returns>
        public static bool DeleteEnrollerFormPlans(string oeId, string planId)
        {
            return EnrollmentFormAccess.DeleteEnrollerFormPlans(oeId, planId);
        }

        public static bool DeleteOETerminatePlans(string oeId)
        {
            return EnrollmentFormAccess.DeleteOETerminatePlans(oeId);
        }

        public static bool CheckEmployeeHasPlan(string memberid, string planid)
        {
            return EnrollmentFormAccess.CheckEmployeeHasPlan(memberid, planid);
        }

        public static bool CheckExistDeptActiveplans(string employeeId, string employeeTypeId)
        {
            return EnrollmentFormAccess.CheckExistDeptActiveplans(employeeId, employeeTypeId);
        }

        public static bool CheckUnavliableBeneficiary(string oeId, string memberId)
        {
            return EnrollmentFormAccess.CheckUnavliableBeneficiary(oeId, memberId);
        }

        public static bool CheckOEWindow(string employeeId)
        {
            return EnrollmentFormAccess.CheckOEWindow(employeeId);
        }

        public static bool CheckOEWindowByErId(string employerId)
        {
           return EnrollmentFormAccess.CheckOEWindowByErId(employerId);
        }

        /// <summary>
        /// Insert Beneficiary
        /// </summary>
        /// <param name="oeId"></param>
        /// <param name="memberId"></param>
        /// <param name="lastName"></param>
        /// <param name="firstName"></param>
        /// <param name="Middleinitial"></param>
        /// <param name="Socsecnbr"></param>
        /// <param name="address"></param>
        /// <param name="city"></param>
        /// <param name="state"></param>
        /// <param name="zip"></param>
        /// <param name="planTypeId"></param>
        /// <param name="relationshipId"></param>
        /// <param name="percentage"></param>
        /// <param name="updatedBy"></param>
        /// <returns></returns>
        public static bool InsertOEBeneficiary(string memberId, string lastName, string firstName, string Middleinitial, string Socsecnbr,
            string address, string city, string state, string zip, string planTypeId, string relationshipId, string percentage, string updatedBy)
        {
            return EnrollmentFormAccess.InsertOEBeneficiary(memberId, lastName, firstName, Middleinitial, Socsecnbr, address, city, state, zip, planTypeId, relationshipId, percentage, updatedBy);
        }

        public static bool DeleteBeneficiary(string id)
        {
            return EnrollmentFormAccess.DeleteBeneficiary(id);
        }

        public static DataTable GetOEBeneficiary(string memberId, int planType)
        {
            using (DataTable dt = EnrollmentFormAccess.GetOEBeneficiary(memberId, planType))
            {
                return dt;
            }
        }


        /// <summary>
        /// Update Beneficiary
        /// </summary>
        /// <param name="Id"></param>
        /// <param name="lastName"></param>
        /// <param name="firstName"></param>
        /// <param name="Middleinitial"></param>
        /// <param name="Socsecnbr"></param>
        /// <param name="address"></param>
        /// <param name="city"></param>
        /// <param name="state"></param>
        /// <param name="zip"></param>
        /// <param name="planTypeId"></param>
        /// <param name="relationshipId"></param>
        /// <param name="percentage"></param>
        /// <param name="updatedBy"></param>
        /// <returns></returns>
        public static bool UpdateOEBeneficiary(string rId, string lastName, string firstName, string Middleinitial, string Socsecnbr, string address, string city, string state, string zip, string planTypeId, string relationshipId, string percentage, string updatedBy)
        {
            return EnrollmentFormAccess.UpdateOEBeneficiary(rId, lastName, firstName, Middleinitial, Socsecnbr, address,  city, state, zip, planTypeId, relationshipId, percentage, updatedBy);
        }

        public static string[] getSingleBeneficiary(string id)
        {
            return EnrollmentFormAccess.getSingleBeneficiary(id);
        }

        /// <summary>
        /// Get Oe Enrollers
        /// </summary>
        /// <param name="employeeId"></param>
        /// <param name="oeTypeId"></param>
        /// <returns></returns>
        public static DataTable GetOeEnrollers(string employeeId, int oeTypeId)
        {
            using (DataTable dt = EnrollmentFormAccess.GetOeEnrollers(employeeId, oeTypeId))
            {
                return dt;
            }
        }

        public static DataTable GetOEAdditionalInfo(string oeId)
        {
            using (DataTable dt = EnrollmentFormAccess.GetOEAdditionalInfo(oeId))
            {
                return dt;
            }
        }

        public static DataTable GetEnrollmentFormLifePlans(string oeId)
        {
            using (DataTable dt = EnrollmentFormAccess.GetEnrollmentFormPlans(oeId, 5))
            {
                dt.Merge(EnrollmentFormAccess.GetEnrollmentFormPlans(oeId, 7));
                dt.Merge(EnrollmentFormAccess.GetEnrollmentFormPlans(oeId, 10));
                return dt;
            }
        }

        public static DataTable getEnrollmentVtlPlans(int cartId, int oeType)
        {
            using (DataTable dt = EnrollmentFormAccess.getEnrollmentVtlPlans(cartId, oeType))
            {
                return dt;
            }
        }

        public static DataTable GetEnrollmentFormPlans(string oeId, int planTypeId)
        {
            using (DataTable dt = EnrollmentFormAccess.GetEnrollmentFormPlans(oeId, planTypeId))
            {
                return dt;
            }
        }

        public static DataTable GetOEAvailablePlans(string oeId, int oeType, char term)
        {
            using (DataTable dt = EnrollmentFormAccess.GetOEAvailablePlans(oeId, oeType, term))
            {
                return dt;
            }
        }

        public static DataTable GetEnrollerFormData(string oeId, int notInclude)
        {
            using (DataTable dt = EnrollmentFormAccess.GetEnrollerFormData(oeId, notInclude))
            {
                return dt;
            }
        }

        public static DataTable GetOETerminatePlans(string oeId)
        {
            using (DataTable dt = EnrollmentFormAccess.GetOETerminatePlans(oeId))
            {
                return dt;
            }
        }

        public static DataTable GetOENewPlans(string oeId)
        {
            using (DataTable dt = EnrollmentFormAccess.GetOENewPlans(oeId))
            {
                return dt;
            }
        }


        public static DataTable GetMemberratetypes()
        {
            using (DataTable dt = MemberAccess.GetMemberratetypes())
            {
                return dt;
            }
        }

        /// <summary>
        /// Update Plans PCP
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static bool UpdateOEPlansAddtional(string id, string field1, string field2, string field3)
        {
            return EnrollmentFormAccess.UpdateOEPlansAddtional(id, field1, field2, field3);
        }

        /// <summary>
        /// Update Plans Add l
        /// </summary>
        /// <param name="id"></param>
        /// <param name="salary"></param>
        /// <param name="rateType"></param>
        /// <param name="rateTypeDesc"></param>
        /// <param name="insuranceAmount"></param>
        /// <param name="hoursWorked"></param>
        /// <param name="smoker"></param>
        /// <returns></returns>
        public static bool UpdatePlansAddl(string memberId, string planId, string oeId, string insuranceAmount)
        {
            return EnrollmentFormAccess.UpdatePlansAddl(memberId, planId, oeId, insuranceAmount);
        }

        /// <summary>
        /// Update Cafeteria
        /// </summary>
        /// <param name="oeId"></param>
        /// <param name="isChecked"></param>
        /// <returns></returns>
        public static bool UpdateCafeteria(string oeId, string isChecked)
        {
            return EnrollmentFormAccess.UpdateCafeteria(oeId, isChecked);
        }

        /// <summary>
        /// Update Legal Docs
        /// </summary>
        /// <param name="oeId"></param>
        /// <param name="isChecked"></param>
        /// <returns></returns>
        public static bool UpdateLegalDocs( string oeId, string isChecked)
        {
            return EnrollmentFormAccess.UpdateLegalDocs(oeId, isChecked);
        }

        public static bool UpdateSignatureName(string oeId, string signatureName, int signatureId)
        {
           return EnrollmentFormAccess.UpdateSignatureName(oeId, signatureName, signatureId);
        }

        /// <summary>
        /// Get OE Types
        /// </summary>
        /// <returns></returns>
        public static DataTable GetOETypes()
        {
            return EnrollmentFormAccess.GetOETypes();
        }

        /// <summary>
        /// Get Member Unfinished OEId
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public static string GetMemberUnfinishedOEId(string memberId)
        {
            return EnrollmentFormAccess.GetMemberUnfinishedOEId(memberId);
        }

        /// <summary>
        /// Update OE Status
        /// </summary>
        /// <param name="oeId"></param>
        /// <param name="status"></param>
        /// <param name="updatedBy"></param>
        /// <param name="ip"></param>
        /// <returns></returns>
        public static bool UpdateOEStatus(string oeId, OEStatus status, string updatedBy, string ip)
        {
            return EnrollmentFormAccess.UpdateOEStatus(oeId, status, updatedBy, ip);
        }

        public static DataTable SearchEnrollmentForms(string employerId, string memberId, string status, string typeId, DateTime? start, DateTime? end)
        {
            using (DataTable dt = EnrollmentFormAccess.SearchEnrollmentForms(employerId, memberId, status, typeId, start, end))
            {
                return dt;
            }
        }

        public static bool CheckEmployeeHasActivePlan(string employeeId, string planType)
        {
            return EnrollmentFormAccess.CheckEmployeeHasActivePlan(employeeId, planType);
        }

        public static DataTable GetBeneficiaryrelationship()
        {
            using (DataTable dt = EnrollmentFormAccess.GetBeneficiaryrelationship())
            {
                return dt;
            }
        }

        public static DataTable GetOELifeCoverages(string oeId)
        {
            using (DataTable dt = EnrollmentFormAccess.GetOELifeCoverages(oeId))
            {
                return dt;
            }
        }

        public static DataTable GetTReason(int? specialReasonId)
        {
            using (DataTable dt = EnrollmentFormAccess.GetTReason(specialReasonId))
            {
                return dt;
            }
        }

        public static DataTable GetOEPlansCarriers(string oeId)
        {
            using (DataTable dt = EnrollmentFormAccess.GetOEPlansCarriers(oeId))
            {
                return dt;
            }
        }

        public static bool CheckIsNewBornAndNotPlans(string employeeId)
        {
            return EnrollmentFormAccess.CheckIsNewBornAndNotPlans(employeeId);
        }

        public static bool CheckIsNewMarryAndNotPlans(string employeeId)
        {
            return EnrollmentFormAccess.CheckIsNewMarryAndNotPlans(employeeId);
        }

        public static bool ValidOEBeforeSubmit(string oeId, out string error)
        {
            error = "";
            return EnrollmentFormAccess.ValidOEBeforeSubmit(oeId, out error);
        }

        public static bool CheckIsNewHireAndNotPlans(string employeeId)
        {
            return EnrollmentFormAccess.CheckIsNewHireAndNotPlans(employeeId);
        }

        public static DataTable GetOEWindow(int? employerId)
        {
            using (DataTable dt = EnrollmentFormAccess.GetOEWindow(employerId))
            {
                return dt;
            }
        }

        public static bool InsertOEWindow(string employerId, DateTime oeFromMonth, DateTime oeToMonth, DateTime planEffectiveDate, string updatedBy)
        {
            return EnrollmentFormAccess.InsertOEWindow(employerId, oeFromMonth, oeToMonth, planEffectiveDate, updatedBy);
        }

        public static bool UpdateOEWindow(string id, string employerId, DateTime oeFromMonth, DateTime oeToMonth, DateTime planEffectiveDate, string updatedBy)
        {
            return EnrollmentFormAccess.UpdateOEWindow(id, employerId, oeFromMonth, oeToMonth, planEffectiveDate, updatedBy);
        }

        public static bool DeleteOEWindow(string id)
        {
            return EnrollmentFormAccess.DeleteOEWindow(id);
        }

        public static bool ReNewOEWindows(string updatedBy)
        {
            return EnrollmentFormAccess.ReNewOEWindows(updatedBy);
        }

        public static DateTime? OEPlanEffectiveDate(string memberId, string employerId, string oeTypeId)
        {
            return EnrollmentFormAccess.OEPlanEffectiveDate(memberId, employerId, Convert.ToInt32(oeTypeId));
        }

        public static bool UpdateOETypes(string id, string description, string usage)
        {
            return EnrollmentFormAccess.UpdateOETypes(id, description, usage);
        }

        public static int EmployeePlanCount(string employeeId)
        {
            return EnrollmentFormAccess.EmployeePlanCount(employeeId);
        }

        public static int getCartId(string oeId)
        {
            return EnrollmentFormAccess.getCartId(oeId);
        }

        public static bool setCartId(int cartId, string oeId)
        {
            return EnrollmentFormAccess.setCartId(cartId, oeId);
        }

        public static bool TransferERForOe(int cartid, string employerid)
        {
            return EnrollmentFormAccess.TransferERForOe(cartid, employerid);
        }

        public static bool InsertMemberToQuote(int cartid, string memberid)
        {
            return EnrollmentFormAccess.InsertMemberToQuote(cartid, memberid);
        }

        public static bool InsertDepFamilytoQuote(string employeeId, int cartId, int planType)
        {
            return EnrollmentFormAccess.InsertDepFamilytoQuote(employeeId, cartId, planType);
        }

        public static bool DeleteMemberFromQuote(int cartid, string memberid)
        {
            return EnrollmentFormAccess.DeleteMemberFromQuote(cartid, memberid);
        }

        public static DataTable GetOeQuote(int cartid, string employeeId, string employerid, int oeType, int planTypeId)
        {
            using (DataTable dt = EnrollmentFormAccess.GetOeQuote(cartid, employeeId, employerid, oeType, planTypeId))
            {
                return dt;
            }
        }

        public static int GetPlanType(string oeid, int oeType, string employerid)
        {
            return EnrollmentFormAccess.GetPlanType(oeid, oeType, employerid);
        }

        public static bool AddMtl(string employeeId, string employerId, string oeId, string updatedBy)
        {
            return EnrollmentFormAccess.AddMtl(employeeId, employerId, oeId, updatedBy);
        }

        public static double oeTotalCost(string oeId)
        {
            return EnrollmentFormAccess.oeTotalCost(oeId);
        }

        public static bool prepEnrollmentForm(int cartId, DateTime date, string employerId, string type)
        {
            return EnrollmentFormAccess.prepEnrollmentForm(cartId, date, employerId, type);
        }

        public static DataTable getEeCurrent(int cartId, string employeeId, string employerId, string oeId)
        {
            using (DataTable dt = EnrollmentFormAccess.getEeCurrent(cartId, employeeId, employerId, oeId))
            {
                return dt;
            }
        }

        public static bool prepPaForm(int cartId, string employerId, DateTime date)
        {
            return EnrollmentFormAccess.prepPaForm(cartId, employerId, date);
        }

        public static DataTable oeAtoA(int cartId, string employerId, string employeeId, int planTypeId)
        {
            using (DataTable dt = EnrollmentFormAccess.oeAtoA(cartId, employerId, employeeId, planTypeId))
            {
                return dt;
            }
        }

        public static DataTable summaryOfCensus(string oeId, string employeeId, int type)
        {
            using (DataTable dt = EnrollmentFormAccess.summaryOfCensus(oeId, employeeId, type))
            {
                return dt;
            }
        }

        public static bool prepRenewalOverview(int cartId)
        {
            return EnrollmentFormAccess.prepRenewalOverview(cartId);
        }

        public static bool prepRenewalAtoA(int cartId, string employerId)
        {
            return EnrollmentFormAccess.prepRenewalAtoA(cartId, employerId);
        }

        public static string oeRedirect(string oeId, string employerId)
        {
            return EnrollmentFormAccess.oeRedirect(oeId, employerId);
        }

        public static string oeEnrollNoChanges(string oeId, string employeeId, string employerId, string updatedBy)
        {
            return EnrollmentFormAccess.oeEnrollNoChanges(oeId, employeeId, employerId, updatedBy);
        }

        public static string planIsDeclinedOrNew(string employeeId, string employerId, int planTypeId)
        {
            return EnrollmentFormAccess.planIsDeclinedOrNew(employeeId, employerId, planTypeId);
        }

        public static int plansPageCheck(string oeId, string employerId, int oeType)
        {
            return EnrollmentFormAccess.plansPageCheck(oeId, employerId, oeType);
        }

        public static bool startOver(string oeId, string updatedBy, string ip)
        {
            return EnrollmentFormAccess.startOver(oeId, updatedBy, ip);
        }

        public static string employerAgencyId(string employerId)
        {
            return EnrollmentFormAccess.employerAgencyId(employerId);
        }

        public static bool AddVtl(string oeId, int oeType, string planId, string memberId, string employeeType, DateTime effectiveDate, string updatedBy)
        {
            return EnrollmentFormAccess.AddVtl(oeId, oeType, planId, memberId, employeeType, effectiveDate, updatedBy);
        }

        public static bool RemoveVtl(string memberId, string employeeId, string employeeType, string oeId)
        {
            return EnrollmentFormAccess.RemoveVtl(memberId, employeeId, employeeType, oeId);
        }

        public static bool correctVtl(string memberId, string oeId, string planId)
        {
            return EnrollmentFormAccess.correctVtl(memberId, oeId, planId);
        }

        public static DateTime getEffectiveDate(string oeId)
        {
            return EnrollmentFormAccess.getEffectiveDate(oeId);
        }

        public static int getEeMaxInsurance(string employeeId)
        {
            return EnrollmentFormAccess.getEeMaxInsurance(employeeId);
        }

        public static bool updateBenTable(string oeId, string memberId, int planTypeId, bool isCancel)
        {
            return EnrollmentFormAccess.updateBenTable(oeId, memberId, planTypeId, isCancel);
        }

        public static bool transferVtl(string oeId, string employeeId, int oeType, DateTime effective, string updateBy)
        {
            return EnrollmentFormAccess.transferVtl(oeId, employeeId, oeType, effective, updateBy);
        }
    }
}
