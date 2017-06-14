using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Oracle.DataAccess.Client;

namespace Pibt.DAL
{
    public class PlanDataAccess
    {
        //Get Current Plans
        public static DataTable GetCurrentPlans(string planTypeId, string employerId, string memberId, Model.UserRoles role)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, 1, planTypeId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, 8, employerId, ParameterDirection.Input),
                new OracleParameter("Pmemberid", OracleDbType.Varchar2, 8, memberId, ParameterDirection.Input),
                new OracleParameter("pWebRoleId", OracleDbType.Int32, 1, (int)role, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetCurrentPlans", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetPlansDefinitionByType(string typeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, 3, typeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetAllPlans", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetPlanTypes(string employerid)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerid", OracleDbType.Varchar2, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            _params[0].Value = employerid;

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetPlanTypes", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool GetPlanTypesSingleP(string employerId) {
            OracleParameter[] _params = new OracleParameter[] {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("result", OracleDbType.Int32, ParameterDirection.Output)
            };
            OracleHelper.ExecuteScalar("Web_GetPlanTypesCount", _params, CommandType.StoredProcedure);
            return _params[1].Value.ToString().Equals("1");
        }

        public static bool GetPlanTypesByErIdSingleP(string employerId) {
            OracleParameter[] _params = new OracleParameter[] {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("result", OracleDbType.Int32, ParameterDirection.Output)
            };
            OracleHelper.ExecuteScalar("Web_GetPlanTypesByErIdCount", _params, CommandType.StoredProcedure);
            return _params[1].Value.ToString().Equals("1");
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="employeeId"></param>
        /// <param name="toEmployee">0:Employee, 1:Dependent</param>
        /// <returns></returns>
        public static DataTable GetAvaliblePlanTypes(string employeeId, string oeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2,  employeeId, ParameterDirection.Input),
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetEEAvailablePlanTypes", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetErCustomePlans(string employerId,string side)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pSide", OracleDbType.Varchar2, side, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETERCUSTOMEPLANS", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }       

        public static DataTable GetEmployerAvaliblePlansByPlanType(string planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_Geteravalibleplansbytype", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetEeAvaliblePlansByPlanType(string typeId, string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, typeId, ParameterDirection.Input),
                new OracleParameter("PEmployerid", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_Geteeavalibleplansbytype", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetDeptAvaliblePlansByPlanType(string typeId, string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, typeId, ParameterDirection.Input),
                new OracleParameter("PEmployeeid", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_Getdeptavalibleplansbytype", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetUnusedAvaliablePlans(string typeId, string employerId, string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, typeId, ParameterDirection.Input),
                new OracleParameter("PEmployerid", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("PEmployeeid", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetUnusedAvaliablePlans", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetEEActivePlans(string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeID", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetemployeeActivePlans", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetEEActivePlansByPlanId(string employeeId,string planId)
        {
           OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeID", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pPlanID", OracleDbType.Varchar2, planId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

           using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetEEActivePlansByPlanId", _params, CommandType.StoredProcedure))
           {
              return dt;
           }
        }
        public static bool Terminatememberplan(string oeId, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("Poeid", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2, updatedBy, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("Web_Terminatememberplans", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool CopyMemberPlansToOEPlans(string oeId, string memberPlanId, DateTime expirydate, string treasonid, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("Poeid", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("Pmemberplanid", OracleDbType.Varchar2, memberPlanId, ParameterDirection.Input),
                new OracleParameter("Pexpirydate", OracleDbType.Date, expirydate, ParameterDirection.Input),
                new OracleParameter("Ptreasonid", OracleDbType.Varchar2, treasonid, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2, updatedBy, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("Web_CopyMemberplansToOEPlans", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static DataTable SearchEEActivePlans(string erId, string eeId, string eeName, string planId, string planName, DateTime? effectivedate, DateTime? expirydate)
        {

            OracleParameter[] _params = new OracleParameter[]
            {
                    new OracleParameter("PemployerId", OracleDbType.Varchar2, ParameterDirection.Input),
                    new OracleParameter("PemployeeId", OracleDbType.Varchar2, ParameterDirection.Input),
                    new OracleParameter("Pusername", OracleDbType.Varchar2, ParameterDirection.Input),
                    new OracleParameter("PplanName", OracleDbType.Varchar2, ParameterDirection.Input),
                    new OracleParameter("pEffectiveDate", OracleDbType.Date, ParameterDirection.Input),
                    new OracleParameter("pExpiryDate", OracleDbType.Date, ParameterDirection.Input),
                    new OracleParameter("pPlanId", OracleDbType.Varchar2, ParameterDirection.Input),
                    new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            _params[0].Value = erId;
            _params[1].Value = eeId;
            _params[2].Value = eeName;
            _params[3].Value = planName;
            if (effectivedate.HasValue)
            {
                _params[4].Value = effectivedate.Value;
            }
            else
            {
                _params[4].Value = DBNull.Value;
            }
            if (expirydate.HasValue)
            {
                _params[5].Value = expirydate.Value;
            }
            else
            {
                _params[5].Value = DBNull.Value;
            }
            _params[6].Value = planId;
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_SearchEEActivePlans", _params, CommandType.StoredProcedure))
            {
                return dt;
            }

        }

        public static DataTable GetAllCurrentPlans(string memberId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETALLMEMBERSPLANS", _params, CommandType.StoredProcedure))
            {
                return dt;
            }

        }

        public static DataTable getCurrentPlansAndCount(string employerId, int planType)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, planType, ParameterDirection.Input) ,
                new OracleParameter("vRefCur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getCurrentPlansAndCount", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable getEmployerPlanTypes(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getEmployerPlanTypes", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable getPlanTypesFromBill(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getPlanTypesFromBill", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool hasCustomPlans(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_customPlanCount", _params, CommandType.StoredProcedure);
            return int.Parse(_params[1].Value.ToString()) > 0;
        }

        public static DataTable getFormPlans(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_enrollmentPdfPlans", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable summaryOfCensus(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_summaryOfCensus", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }
    }
}