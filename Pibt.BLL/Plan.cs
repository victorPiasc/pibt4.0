using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Pibt.DAL;

namespace Pibt.BLL
{
    public class Plan
    {
        /// <summary>
        /// Get Current ER Plans
        /// </summary>
        /// 
        public static DataTable GetCurrentPlans(string planTypeId, string employerId)
        {
            using (DataTable dt = PlanDataAccess.GetCurrentPlans(planTypeId, employerId, "", Model.UserRoles.Employer))
            {
                return dt;
            }
        }

        /// <summary>
        /// Get Current Member Plans
        /// </summary>
        /// <param name="planTypeId"></param>
        /// <param name="employeeId"></param>
        /// <returns></returns>
        public static DataTable GetCurrentMemberPlans(string planTypeId, string memberId, Model.UserRoles role)
        {
            using (DataTable dt = PlanDataAccess.GetCurrentPlans(planTypeId, "", memberId, role))
            {
                return dt;
            }
        }

        /// <summary>
        /// Get Plans Definition By Type
        /// </summary>
        /// <param name="typeId"></param>
        /// <returns></returns>
        public static DataTable GetPlansDefinitionByType(string typeId)
        {
            using (DataTable dt = PlanDataAccess.GetPlansDefinitionByType(typeId))
            {
                return dt;
            }
        }

        /// <summary>
        /// Get All types of Plan
        /// </summary>
        /// <returns></returns>
        public static DataTable GetPlanTypes(string employerid)
        {
            using (DataTable dt = PlanDataAccess.GetPlanTypes(employerid))
            {
                return dt;
            }
        }

        public static bool GetPlanTypesSingleP(string employerid)
        {
            return PlanDataAccess.GetPlanTypesSingleP(employerid);
        }

        public static bool GetPlanTypesByErIdSingleP(string employerid)
        {
            return PlanDataAccess.GetPlanTypesByErIdSingleP(employerid);
        }

        public static DataTable GetAvaliblePlanTypes(string memberId, string oeId)
        {
            using (DataTable dt = PlanDataAccess.GetAvaliblePlanTypes(memberId, oeId))
            {
                return dt;
            }
        }
        public static DataTable GetErCustomePlans(string employerId, string side)
        {
            using (DataTable dt = PlanDataAccess.GetErCustomePlans(employerId, side))
            {
                return dt;
            }
        }

        public static DataTable GetEmployerAvaliblePlansByPlanType(string typeId)
        {
            using (DataTable dt = PlanDataAccess.GetEmployerAvaliblePlansByPlanType(typeId))
            {
                return dt;
            }
        }

        public static DataTable GetEeAvaliblePlansByPlanType(string typeId, string employerId)
        {
            using (DataTable dt = PlanDataAccess.GetEeAvaliblePlansByPlanType(typeId, employerId))
            {
                return dt;
            }
        }

        public static DataTable GetDeptAvaliblePlansByPlanType(string typeId, string employerId)
        {
            using (DataTable dt = PlanDataAccess.GetDeptAvaliblePlansByPlanType(typeId, employerId))
            {
                return dt;
            }
        }

        public static DataTable GetUnusedAvaliablePlans(string typeId, string employerId, string employeeId)
        {
            using (DataTable dt = PlanDataAccess.GetUnusedAvaliablePlans(typeId, employerId, employeeId))
            {
                return dt;
            }
        }


        public static DataTable GetEEActivePlans(string employeeId)
        {
            using (DataTable dt = PlanDataAccess.GetEEActivePlans(employeeId))
            {
                return dt;
            }
        }

        public static DataTable GetEEActivePlansByPlanId(string employeeId, string planId)
        {
           using (DataTable dt = PlanDataAccess.GetEEActivePlansByPlanId(employeeId,planId))
           {
              return dt;
           }
        }

        public static bool Terminatememberplan(string oeId, string updatedBy)
        {
            return PlanDataAccess.Terminatememberplan(oeId, updatedBy);
        }

        public static bool CopyMemberPlansToOEPlans(string oeId, string memberPlanId, DateTime expirydate, string treasonid, string updatedBy)
        {
            return PlanDataAccess.CopyMemberPlansToOEPlans(oeId, memberPlanId, expirydate, treasonid, updatedBy);
        }

        public static DataTable SearchEEActivePlans(string erId, string eeId, string eeName, string planId, string planName, DateTime? effectivedate, DateTime? expirydate)
        {
            using (DataTable dt = PlanDataAccess.SearchEEActivePlans(erId, eeId, eeName, planId, planName, effectivedate, expirydate))
            {
                return dt;
            }
        }

        public static DataTable GetAllCurrentPlans(string memberId)
        {
            using (DataTable dt = PlanDataAccess.GetAllCurrentPlans(memberId))
            {
                return dt;
            }
        }

        public static DataTable getCurrentPlansAndCount(string employerId, int planType)
        {
            using (DataTable dt = PlanDataAccess.getCurrentPlansAndCount(employerId, planType))
            {
                return dt;
            }
        }

        public static DataTable getEmployerPlanTypes(string employerId)
        {
            using (DataTable dt = PlanDataAccess.getEmployerPlanTypes(employerId))
            {
                return dt;
            }
        }

        public static DataTable getPlanTypesFromBill(string employerId)
        {
            using (DataTable dt = PlanDataAccess.getPlanTypesFromBill(employerId))
            {
                return dt;
            }
        }

        public static bool hasCustomPlans(string employerId)
        {
            return PlanDataAccess.hasCustomPlans(employerId);
        }

        public static DataTable getFormPlans(string employerId)
        {
            using (DataTable dt = PlanDataAccess.getFormPlans(employerId))
            {
                return dt;
            }
        }

        public static DataTable summaryOfCensus(string employerId)
        {
            using (DataTable dt = PlanDataAccess.summaryOfCensus(employerId))
            {
                return dt;
            }
        }
    }
}
