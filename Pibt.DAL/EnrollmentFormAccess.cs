using System;
using System.Data;
using Oracle.DataAccess.Client;
using Pibt.Model;
using System.Data.Common;
using System.Data.SqlClient;

namespace Pibt.DAL
{
    public class EnrollmentFormAccess
    {
        //Check if plan is PPO
        public static bool IsPlanPPO(string oeId, int planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("vOut", OracleDbType.Int32, ParameterDirection.Output)
            };
            _params[2].Size = 2;
            OracleHelper.ExecuteScalar("WEB_IsPlanPPO", _params, CommandType.StoredProcedure);
            return _params[2].Value.ToString() == "0";
        }

        //Get Insured Plans
        public static DataTable GetActivePlansByPlanTypeId(string planTypeId, string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {                
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, 8, employeeId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, 1, planTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetActivePlansByPlanTypeId", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool CheckAddPlansAvailable(string EmployerId, string hireDate)
        {
           OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, 8, EmployerId, ParameterDirection.Input),
                new OracleParameter("pHireDate", OracleDbType.Varchar2, 10, hireDate, ParameterDirection.Input),
                new OracleParameter("v_return", OracleDbType.Varchar2, ParameterDirection.Output)
            };
            _params[2].Size = 5;
            OracleHelper.ExecuteNonQuery("WEB_CheckAddPlansAvailable", _params, CommandType.StoredProcedure);
            return Common.Utilities.ToBool(_params[2].Value);

        }

        // Get New Member Id
        public static string GetNewOeId()
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Int32, ParameterDirection.Output)
            };
            OracleHelper.ExecuteScalar("WEB_GetNewOeId", _params, CommandType.StoredProcedure);
            return _params[0].Value == null ? "" : _params[0].Value.ToString();
        }

        public static bool GetCurrentPA(string employerId,out DateTime dt)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerID", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("peffective", OracleDbType.Date, ParameterDirection.Output)
            };
            OracleHelper.ExecuteScalar("WEB_GETCURRENTPA", _params, CommandType.StoredProcedure);
            if (_params[1].Value == null)
            {
                dt = DateTime.MinValue;
                return false;
            }            
            return  DateTime.TryParse(_params[1].Value.ToString(), out dt);
        }

        public static OeDetails GetOEDetails(string OEId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOEId", OracleDbType.Varchar2,8,OEId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            OeDetails details = null;
            using (OracleDataReader dr = OracleHelper.ExecuteReader("WEB_GetOEDetails", _params, CommandType.StoredProcedure))
            {
                if (dr.Read())
                {
                    details = new OeDetails();
                    details.Id = Common.Utilities.ToString(dr["Id"]);
                    details.EmployerId = Common.Utilities.ToString(dr["EmployerId"]);
                    details.MemberId = Common.Utilities.ToString(dr["MemberId"]);
                    details.TypeId = Common.Utilities.ToString(dr["TypeId"]);
                    details.TypeName = Common.Utilities.ToString(dr["TypeName"]);
                    details.AcceptedCafeteria = Common.Utilities.ToBool(dr["cafeteria"]);
                    details.ReadLegalDoc = Common.Utilities.ToBool(dr["legalDocs"]);
                    details.HasSignatrue = Common.Utilities.ToBool(dr["signatrue"]);
                    details.Created = Common.Utilities.ToString(dr["Created"]);
                    details.CreatedBy = Common.Utilities.ToString(dr["CreatedBy"]);
                    details.Updated = Common.Utilities.ToString(dr["Updated"]);
                    details.UpdatedBy = Common.Utilities.ToString(dr["UpdatedBy"]);
                    details.Ip = Common.Utilities.ToString(dr["Ip"]);
                    details.Status = (OEStatus)Common.Utilities.ToInt(dr["Status"]);
                    details.TreasonId = Common.Utilities.ToString(dr["Treasonid"]);
                    details.SignatureName = Common.Utilities.ToString(dr["SignatureName"]);
                }
            }
            return details;
        }

        public static bool InsertEnrollerForm(string oeId, string employerId, string memberId, string typeId, string createdBy, string IP)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2,28,oeId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input),
                new OracleParameter("pMemberid", OracleDbType.Varchar2, 8,memberId, ParameterDirection.Input),
                new OracleParameter("pTypeId", OracleDbType.Varchar2,2, typeId, ParameterDirection.Input),
                new OracleParameter("pCreatedBy", OracleDbType.Varchar2, 40,createdBy, ParameterDirection.Input),
                new OracleParameter("pIP", OracleDbType.Varchar2,15, IP, ParameterDirection.Input) 
            };
            int result = OracleHelper.ExecuteNonQuery("WEB_InsertEnrollerForm", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static string InsertEnrollerFormPlans(string oeId, int cartId, string memberId, string planId, string updatedBy, string keepCur)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2,oeId, ParameterDirection.Input),
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberId, ParameterDirection.Input),
                new OracleParameter("pPlanId", OracleDbType.Varchar2, planId, ParameterDirection.Input), 
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2, updatedBy, ParameterDirection.Input),
                new OracleParameter("pKeepCur", OracleDbType.Char, keepCur, ParameterDirection.Input),
                new OracleParameter("pOut", OracleDbType.Varchar2, ParameterDirection.Output)
            };
            _params[6].Size = 150;

            OracleHelper.ExecuteScalar("web_insertEnrollerFormPlans", _params, CommandType.StoredProcedure);
            return _params[6].Value.ToString();
        }

        public static bool CheckEmployeeHasPlan(string memberid, string planid)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberid, ParameterDirection.Input),
                new OracleParameter("pPlanId", OracleDbType.Varchar2, planid, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            object result = OracleHelper.ExecuteScalar("WEB_CHECKEMPLOYEEHASPLAN", _params, CommandType.StoredProcedure);
            return result.ToString() != "0" ? true : false;
        }

        public static bool CheckExistDeptActiveplans(string employeeId, string employeeTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2,8,employeeId, ParameterDirection.Input),
                new OracleParameter("pEmployeeTypId", OracleDbType.Varchar2,1,employeeTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            object result = OracleHelper.ExecuteScalar("Web_CheckDeptActiveplans", _params, CommandType.StoredProcedure);
            return result.ToString() != "0" ? true : false;
        }

        public static bool CheckUnavliableBeneficiary(string oeId, string memberId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOEID", OracleDbType.Varchar2,28,oeId, ParameterDirection.Input),
                new OracleParameter("pMemberId", OracleDbType.Varchar2,8,memberId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            object result = OracleHelper.ExecuteScalar("WEB_CheckUnavliableBeneficiary", _params, CommandType.StoredProcedure);
            return result.ToString() == "0" ? true : false;
        }

        public static bool CheckOEWindow(string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeId", OracleDbType.Int32,8,Convert.ToInt32(employeeId), ParameterDirection.Input),
                new OracleParameter("v_return", OracleDbType.Varchar2,ParameterDirection.Output)
            };
            _params[1].Size = 5;
            OracleHelper.ExecuteNonQuery("Web_Checkoewindow", _params, CommandType.StoredProcedure);
            return Common.Utilities.ToBool(_params[1].Value);
        }

        public static bool CheckOEWindowByErId(string employerId)
        {
           OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Int32,8,Convert.ToInt32(employerId), ParameterDirection.Input),
                new OracleParameter("v_return", OracleDbType.Varchar2,ParameterDirection.Output)
            };
           _params[1].Size = 5;
           OracleHelper.ExecuteNonQuery("WEB_CHECKOEBYERID", _params, CommandType.StoredProcedure);
           return Common.Utilities.ToBool(_params[1].Value);
        }

        public static bool DeleteEnrollerFormPlans(string oeId, string planId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOEID", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pPlanId", OracleDbType.Varchar2, planId, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("WEB_DeleteEnrollerFormPlans", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool InsertOEBeneficiary(string memberId, string lastName, string firstName, string middleName, string SSN, string address, string city, string state, string zip, string planTypeId, string relationshipId, string percentage, string updatedBy)
        {
            if (!string.IsNullOrEmpty(firstName))
                firstName = firstName.ToUpper();
            if (!string.IsNullOrEmpty(lastName))
                lastName = lastName.ToUpper();
            if (!string.IsNullOrEmpty(middleName))
                middleName = middleName.ToUpper();
            if (!string.IsNullOrEmpty(address))
                address = address.ToUpper();
            if (!string.IsNullOrEmpty(city))
                city = city.ToUpper();
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberId", OracleDbType.Varchar2,memberId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("pFirstName", OracleDbType.Varchar2, firstName, ParameterDirection.Input),
                new OracleParameter("pMiddleName", OracleDbType.Varchar2,middleName, ParameterDirection.Input),
                new OracleParameter("pLastName", OracleDbType.Varchar2, lastName, ParameterDirection.Input),
                new OracleParameter("pAddress", OracleDbType.Varchar2,address, ParameterDirection.Input),
                new OracleParameter("pCity", OracleDbType.Varchar2, city, ParameterDirection.Input),
                new OracleParameter("pState", OracleDbType.Varchar2, state, ParameterDirection.Input),
                new OracleParameter("pZip", OracleDbType.Varchar2, zip, ParameterDirection.Input),
                new OracleParameter("pPercentage", OracleDbType.Varchar2, percentage, ParameterDirection.Input),
                new OracleParameter("pSSN", OracleDbType.Varchar2, SSN, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2, updatedBy, ParameterDirection.Input),
                new OracleParameter("pRelationshipId", OracleDbType.Varchar2, relationshipId, ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_InsertOEBeneficiary", _params, CommandType.StoredProcedure);
            return (result != -1);
        }


        public static bool UpdateOEBeneficiary(string rId, string lastName, string firstName, string middleName, string SSN, string address, string city, string state, string zip, string planTypeId, string relationshipId, string percentage, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pId", OracleDbType.Varchar2, rId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("pFirstName", OracleDbType.Varchar2, firstName, ParameterDirection.Input),
                new OracleParameter("pMiddleName", OracleDbType.Varchar2, middleName, ParameterDirection.Input),
                new OracleParameter("pLastName", OracleDbType.Varchar2, lastName, ParameterDirection.Input),
                new OracleParameter("pAddress", OracleDbType.Varchar2, address, ParameterDirection.Input),
                new OracleParameter("pCity", OracleDbType.Varchar2, city, ParameterDirection.Input),
                new OracleParameter("pState", OracleDbType.Varchar2, state, ParameterDirection.Input),
                new OracleParameter("pZip", OracleDbType.Varchar2, zip, ParameterDirection.Input),
                new OracleParameter("pPercentage", OracleDbType.Varchar2, percentage, ParameterDirection.Input),
                new OracleParameter("pSSN", OracleDbType.Varchar2, SSN, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2, updatedBy, ParameterDirection.Input),
                new OracleParameter("pRelationshipId", OracleDbType.Varchar2, relationshipId,ParameterDirection.Input)
            };
            int result = -1;
            result = OracleHelper.ExecuteNonQuery("WEB_UpdateOEBeneficiary", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static DataTable GetOeEnrollers(string employeeId, int oeTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeID", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pOeTypeId", OracleDbType.Varchar2,3, oeTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetOeEnrollers", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetEnrollmentFormPlans(string oeId, int planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeid", OracleDbType.Varchar2,8, oeId, ParameterDirection.Input),
                new OracleParameter("pPlantypeid", OracleDbType.Varchar2,3, planTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetEnrollmentFormPlans", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable getEnrollmentVtlPlans(int cartId, int oeType)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pOeTypeId", OracleDbType.Int32, oeType, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getOeVTLplans", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetOEAvailablePlans(string oeId, int oeType, char term)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeid", OracleDbType.Varchar2,8, oeId, ParameterDirection.Input),
                new OracleParameter("pOeType", OracleDbType.Int32, oeType, ParameterDirection.Input),
                new OracleParameter("pTerm", OracleDbType.Char, term, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetOEAvailablePlans", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetEnrollerFormData(string oeId, int notInclude)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeid", OracleDbType.Varchar2,8, oeId, ParameterDirection.Input),
                new OracleParameter("pNotIncludeTerminate", OracleDbType.Int32, notInclude, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getEnrollerFormData", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetOETerminatePlans(string oeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                     new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                     new OracleParameter("V_Refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetOETerminatePlans", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetOENewPlans(string oeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                     new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                     new OracleParameter("V_Refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETOENEWPLANS", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetOEAdditionalInfo(string oeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeid", OracleDbType.Varchar2,8, oeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetOEAdditionalInfo", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool UpdateOEPlansAddtional(string id, string field1, string field2, string field3)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pId", OracleDbType.Varchar2,8,id, ParameterDirection.Input),
                new OracleParameter("pField1", OracleDbType.Varchar2, field1, ParameterDirection.Input),
                new OracleParameter("pField2", OracleDbType.Varchar2, field2, ParameterDirection.Input),
                new OracleParameter("pField3", OracleDbType.Varchar2, field3, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("WEB_UpdateOEPlansAddtional", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdatePlansAddl(string memberId, string planId, string oeId, string insuranceAmount)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberId, ParameterDirection.Input),
                new OracleParameter("pPlanId", OracleDbType.Varchar2, planId, ParameterDirection.Input),
                new OracleParameter("pOeId", OracleDbType.Varchar2,oeId, ParameterDirection.Input),
                new OracleParameter("pInsuranceamount", OracleDbType.Varchar2, insuranceAmount, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("WEB_UpdatePlansAddl", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdateCafeteria(string oeId, string isChecked)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2,oeId, ParameterDirection.Input),
                new OracleParameter("pCafeteria", OracleDbType.Varchar2, isChecked, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("WEB_UpdateCafeteria", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdateLegalDocs(string oeId, string isChecked)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2,oeId, ParameterDirection.Input),
                new OracleParameter("pLegalDocs", OracleDbType.Varchar2, isChecked, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("WEB_updateLegalDocs", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static bool UpdateSignatureName(string oeId, string signatureName, int signatureId)
        {
           OracleParameter[] _params = new OracleParameter[]
           {
              new OracleParameter("pOeid", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
              new OracleParameter("pSignatureName", OracleDbType.Varchar2, signatureName, ParameterDirection.Input),
              new OracleParameter("pSignatureId", OracleDbType.Int32, signatureId, ParameterDirection.Input)
           };
           int result = OracleHelper.ExecuteNonQuery("WEB_UpdateSignatureName", _params, CommandType.StoredProcedure);
           return (result != -1);
        }

        public static bool UpdateSignatrue(string oeId, string signatrue)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2,oeId, ParameterDirection.Input),
                new OracleParameter("pSignatrue", OracleDbType.Varchar2, signatrue, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("WEB_UpdateSignatrue", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static DataTable GetOETypes()
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                     new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetOETypes", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool UpdateOETypes(string id, string description, string usage)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pId", OracleDbType.Varchar2,1,id, ParameterDirection.Input),
                new OracleParameter("pDescription", OracleDbType.Varchar2,30, description, ParameterDirection.Input),
                new OracleParameter("pUsage", OracleDbType.Varchar2, 4000, usage,ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("Web_UpdateOETypes", _params, CommandType.StoredProcedure);
            return (result != -1);
        }

        public static string GetMemberUnfinishedOEId(string memberId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("PMemberId", OracleDbType.Varchar2,memberId, ParameterDirection.Input),
                new OracleParameter("pOeId", OracleDbType.Int32, ParameterDirection.Output)
            };
            OracleHelper.ExecuteScalar("Web_GetMemberUnfinishedOE", _params, CommandType.StoredProcedure);
            return _params[1].Value.ToString().Equals("null") ? "" : _params[1].Value.ToString();
        }

        public static bool UpdateOEStatus(string oeId, OEStatus status, string updatedBy, string ip)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2,8,oeId, ParameterDirection.Input),
                new OracleParameter("Pstatus", OracleDbType.Int32,1,(int)status, ParameterDirection.Input),
                new OracleParameter("Pupdatedby", OracleDbType.Varchar2,updatedBy, ParameterDirection.Input),
                new OracleParameter("pIp", OracleDbType.Varchar2,15,ip, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("Web_UpdateOEStatus", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DataTable SearchEnrollmentForms(string employerId, string memberId, string status, string typeId, DateTime? start, DateTime? end)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2,employerId, ParameterDirection.Input),
                new OracleParameter("pMemberId", OracleDbType.Varchar2,memberId, ParameterDirection.Input),
                new OracleParameter("Pstatusid", OracleDbType.Varchar2,status, ParameterDirection.Input),
                new OracleParameter("pDaterangestart", OracleDbType.Date, start,ParameterDirection.Input),
                new OracleParameter("pDaterangeend", OracleDbType.Date, end, ParameterDirection.Input),
                new OracleParameter("pTypeId", OracleDbType.Varchar2,typeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_SearchEnrollmentForm", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool CheckEmployeeHasActivePlan(string employeeId, string planType)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("Pemployeeid", OracleDbType.Varchar2,8,employeeId, ParameterDirection.Input),
                new OracleParameter("pPlanType", OracleDbType.Varchar2,planType, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            object result = OracleHelper.ExecuteScalar("Web_CheckEEactiveplanbytype", _params, CommandType.StoredProcedure);
            return result.ToString() != "0" ? true : false;
        }

        public static DataTable GetOEBeneficiary(string memberId, int planType)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberId, ParameterDirection.Input), 
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planType, ParameterDirection.Input), 
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetOEBeneficiary", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static string[] getSingleBeneficiary(string id)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pRId", OracleDbType.Varchar2, id, ParameterDirection.Input), 
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            string[] arr = new string[10];
            using (OracleDataReader dr = OracleHelper.ExecuteReader("web_getSingleBeneficiary", _params, CommandType.StoredProcedure))
            {
                if (dr.Read())
                {
                    arr[0] = Common.Utilities.ToString(dr["firstName"]);
                    arr[1] = Common.Utilities.ToString(dr["middleInitial"]);
                    arr[2] = Common.Utilities.ToString(dr["lastName"]);
                    arr[3] = Common.Utilities.ToString(dr["socSecNbr"]);
                    arr[4] = Common.Utilities.ToString(dr["address"]);
                    arr[5] = Common.Utilities.ToString(dr["city"]);
                    arr[6] = Common.Utilities.ToString(dr["state"]);
                    arr[7] = Common.Utilities.ToString(dr["zip"]);
                    arr[8] = Common.Utilities.ToString(dr["relationshipId"]);
                    arr[9] = Common.Utilities.ToString(dr["percentage"]);
                }
            }
            return arr;
        }

        public static bool DeleteBeneficiary(string id)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pRId", OracleDbType.Varchar2, id, ParameterDirection.Input) 
            };
            int result = OracleHelper.ExecuteNonQuery("Web_DeleteOEBeneficiary", _params, CommandType.StoredProcedure);
            return result != -1;
        }
        public static bool DeleteOETerminatePlans(string id)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOEID", OracleDbType.Varchar2,8,id, ParameterDirection.Input) 
            };
            int result = OracleHelper.ExecuteNonQuery("WEB_DeleteOEPlansByOEID", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DataTable GetBeneficiaryrelationship()
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetBeneficiaryrelationship", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetOELifeCoverages(string oeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOEID", OracleDbType.Varchar2, oeId,ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETOELIFECOVERAGE", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetTReason(int? specialReasonId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pSpecialReasonId", OracleDbType.Varchar2, specialReasonId ,ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GETTReason", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable GetOEPlansCarriers(string oeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOEID", OracleDbType.Varchar2,oeId,ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("WEB_GetOEPlansCarriers", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool CheckIsNewBornAndNotPlans(string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2,employeeId,ParameterDirection.Input),
                new OracleParameter("v_return", OracleDbType.Varchar2, ParameterDirection.Output)
            };
            _params[1].Size = 5;
            OracleHelper.ExecuteNonQuery("WEB_CheckIsNewBornAndNotPlans", _params, CommandType.StoredProcedure);
            return Common.Utilities.ToBool(_params[1].Value);
        }

        public static bool CheckIsNewHireAndNotPlans(string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2,employeeId,ParameterDirection.Input),
                new OracleParameter("v_return", OracleDbType.Varchar2, ParameterDirection.Output)
            };
            _params[1].Size = 5;
            OracleHelper.ExecuteNonQuery("WEB_CheckIsNewHireAndNotPlans", _params, CommandType.StoredProcedure);
            return Common.Utilities.ToBool(_params[1].Value);
        }

        public static bool CheckIsNewMarryAndNotPlans(string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2,employeeId,ParameterDirection.Input),
                new OracleParameter("v_return", OracleDbType.Varchar2, ParameterDirection.Output)
            };
            _params[1].Size = 5;
            OracleHelper.ExecuteNonQuery("WEB_CheckIsNewMarryAndNotPlans", _params, CommandType.StoredProcedure);
            return Common.Utilities.ToBool(_params[1].Value);

        }

        public static bool ValidOEBeforeSubmit(string oeId, out string error)
        {
            error = "";
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("Poeid", OracleDbType.Varchar2,8,oeId,ParameterDirection.Input),
                new OracleParameter("v_return", OracleDbType.Varchar2, ParameterDirection.Output)
            };
            _params[1].Size = 1000;
            OracleHelper.ExecuteNonQuery("Web_ValidOEBeforeSubmit", _params, CommandType.StoredProcedure);
            if (Common.Utilities.ToString(_params[1].Value) == "OK")
                return true;
            else
            {
                error = Common.Utilities.ToString(_params[1].Value);
                return false;
            }
        }

        public static DataTable GetOEWindow(int? employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("Web_GetOEWindow", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool InsertOEWindow(string employerId, DateTime fromMonth, DateTime toMonth, DateTime effectiveDate,string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEMPLOYERID", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input), 
                new OracleParameter("pISRENEW", OracleDbType.Varchar2, 5, "True", ParameterDirection.Input), 
                new OracleParameter("pOEFROMMONTH", OracleDbType.Date,fromMonth, ParameterDirection.Input), 
                new OracleParameter("pOETOMONTH", OracleDbType.Date,toMonth, ParameterDirection.Input), 
                new OracleParameter("pPLANEFFECTIVEDATE", OracleDbType.Date,effectiveDate, ParameterDirection.Input), 
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2,20,updatedBy, ParameterDirection.Input) 
            };
            int result = OracleHelper.ExecuteNonQuery("Web_InsertOEWindow", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool UpdateOEWindow(string id, string employerId, DateTime fromMonth, DateTime toMonth, DateTime effectiveDate, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pId", OracleDbType.Varchar2,8,id, ParameterDirection.Input), 
                new OracleParameter("pEMPLOYERID", OracleDbType.Varchar2,8,employerId, ParameterDirection.Input), 
                new OracleParameter("pISRENEW", OracleDbType.Varchar2, 5, "True", ParameterDirection.Input), 
                new OracleParameter("pOEFROMMONTH", OracleDbType.Date,fromMonth, ParameterDirection.Input), 
                new OracleParameter("pOETOMONTH", OracleDbType.Date,toMonth, ParameterDirection.Input), 
                new OracleParameter("pPLANEFFECTIVEDATE", OracleDbType.Date,effectiveDate, ParameterDirection.Input), 
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2,20,updatedBy, ParameterDirection.Input) 
            };
            int result = OracleHelper.ExecuteNonQuery("Web_UpdateOEWindow", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool DeleteOEWindow(string id)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pId", OracleDbType.Varchar2,8,id, ParameterDirection.Input)  
            };
            int result = OracleHelper.ExecuteNonQuery("Web_DeleteOEWindow", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool ReNewOEWindows(string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2,updatedBy, ParameterDirection.Input)  
            };
            int result = OracleHelper.ExecuteNonQuery("Web_ReNewOEWindows", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DateTime? OEPlanEffectiveDate(string memberId, string employerId, int oeTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberId", OracleDbType.Varchar2,memberId, ParameterDirection.Input)  ,
                new OracleParameter("Pemployerid", OracleDbType.Varchar2,employerId, ParameterDirection.Input)  , 
                new OracleParameter("pOETypeId", OracleDbType.Varchar2,oeTypeId, ParameterDirection.Input)  , 
                new OracleParameter("v_return", OracleDbType.Date, ParameterDirection.ReturnValue)  
            };
            OracleHelper.ExecuteNonQuery("FN_OEPlanEffectiveDate", _params, CommandType.StoredProcedure);
            if (_params[3].Value != null)
            {
                return Convert.ToDateTime(_params[3].Value);
            }
            else
            {
                return null;
            }
        }

        public static int EmployeePlanCount(string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pCount", OracleDbType.Int32, ParameterDirection.Output)
            };
            OracleHelper.ExecuteScalar("WEB_EMPLOYEEPLANCOUNT", _params, CommandType.StoredProcedure);
            return int.Parse(_params[1].Value.ToString());
        }

        public static int getCartId(string oeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pCartId", OracleDbType.Int32, ParameterDirection.Output)
            };
            _params[1].Size = 8;
            OracleHelper.ExecuteScalar("web_getOeCartId", _params, CommandType.StoredProcedure);
            int tmp;
            return int.TryParse(_params[1].Value.ToString(), out tmp) ? tmp : 0; 
        }

        public static bool setCartId(int cartId, string oeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("web_insertOeCartId", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool TransferERForOe(int cartid, string employerid)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartid, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerid, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("web_transferQuoteForOE", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool InsertMemberToQuote(int cartid, string memberid)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartid, ParameterDirection.Input),
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberid, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("web_insertMembertoQuote", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool InsertDepFamilytoQuote(string employeeId, int cartId, int planType)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, planType, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("web_addFamilyForNewDep", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool DeleteMemberFromQuote(int cartid, string memberid)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartid, ParameterDirection.Input),
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberid, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("web_deleteMemberFromQuote", _params, CommandType.StoredProcedure);
            return result != -1;

        }

        public static DataTable GetOeQuote(int cartid, string employeeId, string employerId, int oeType, int planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32 , cartid, ParameterDirection.Input),
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("psEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pOeType", OracleDbType.Int32, oeType, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };
            using (DataTable dt = OracleHelper.ExecuteDataTable("web_oeQuote", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static int GetPlanType(string oeid, int oeType, string employerid)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeid, ParameterDirection.Input),
                new OracleParameter("pOeType", OracleDbType.Int32, oeType, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerid, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, ParameterDirection.Output)
            };
            OracleHelper.ExecuteScalar("web_getOeplanType", _params, CommandType.StoredProcedure);
            return int.Parse(_params[3].Value.ToString());
        }

        public static bool AddMtl(string employeeId, string employerId, string oeId, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2,8,employeeId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pOeId", OracleDbType.Varchar2,28,oeId, ParameterDirection.Input),
                new OracleParameter("pCarrierId", OracleDbType.Int32 ,ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2, 40,updatedBy, ParameterDirection.Input)
            };
            int result = OracleHelper.ExecuteNonQuery("web_addMTL", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static double oeTotalCost(string oeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pTotal", OracleDbType.Double, ParameterDirection.Output)
            };
            _params[1].Size = 10;
            OracleHelper.ExecuteScalar("web_oeTotalCost", _params, CommandType.StoredProcedure);
            return _params[1].Value.ToString() == "null" ? 0 : double.Parse(_params[1].Value.ToString());
        }

        public static bool prepEnrollmentForm(int cartId, DateTime date, string employerId, string type)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32 , cartId, ParameterDirection.Input),
                new OracleParameter("pDate", OracleDbType.Date, date, ParameterDirection.Input),
                new OracleParameter("pEmployer", OracleDbType.Varchar2, employerId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery(type.Equals("1")?"prepEnrollmentForm":"prepEmptyEnrollmentForm", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DataTable getEeCurrent(int cartId, string employeeId, string employerId, string oeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getEECurrent", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool prepPaForm(int cartId, string employerId, DateTime date)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployer", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("asOf", OracleDbType.Date, date, ParameterDirection.Input),
            };

            int result = OracleHelper.ExecuteNonQuery("prepPAFormData", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DataTable oeAtoA(int cartId, string employerId, string employeeId, int planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getOeComparison", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static DataTable summaryOfCensus(string oeId, string employeeId, int type)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pType", OracleDbType.Int32, type, ParameterDirection.Input),
                new OracleParameter("v_refcur", OracleDbType.RefCursor, ParameterDirection.Output)
            };

            using (DataTable dt = OracleHelper.ExecuteDataTable("web_getEESummaryCensus", _params, CommandType.StoredProcedure))
            {
                return dt;
            }
        }

        public static bool prepRenewalOverview(int cartId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("prepRenewalOverview", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool prepRenewalAtoA(int cartId, string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pCartId", OracleDbType.Int32, cartId, ParameterDirection.Input),
                new OracleParameter("pEmployer", OracleDbType.Varchar2, employerId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("prepRenewalAtoA", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static string oeRedirect(string oeId, string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pPage", OracleDbType.Varchar2, ParameterDirection.Output)
            };
            _params[2].Size = 20;

            OracleHelper.ExecuteScalar("web_oeRedirect", _params, CommandType.StoredProcedure);

            return _params[2].Value.ToString();
        }

        public static string oeEnrollNoChanges(string oeId, string employeeId, string employerId, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2, updatedBy, ParameterDirection.Input),
                new OracleParameter("pOut", OracleDbType.Varchar2, ParameterDirection.Output)
            };

            _params[4].Size = 150;
            OracleHelper.ExecuteScalar("web_oeEnrollNoChanges", _params, CommandType.StoredProcedure);
            return _params[4].Value.ToString();
        }

        public static string planIsDeclinedOrNew(string employeeId, string employerId, int planTypeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Varchar2, planTypeId, ParameterDirection.Input),
                new OracleParameter("pOut", OracleDbType.Varchar2, ParameterDirection.Output)
            };
            _params[3].Size = 4;

            OracleHelper.ExecuteScalar("web_isDeclinedOrNew", _params, CommandType.StoredProcedure);
            return _params[3].Value.ToString();
        }

        public static int plansPageCheck(string oeId, string employerId, int oeType)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pOeType", OracleDbType.Varchar2, oeType, ParameterDirection.Input),
                new OracleParameter("pErrorNum", OracleDbType.Int32, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_OePlansPageCheck", _params, CommandType.StoredProcedure);
            return int.Parse(_params[3].Value.ToString());
        }

        public static bool startOver(string oeId, string updatedBy, string ip)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2, updatedBy, ParameterDirection.Input),
                new OracleParameter("pIp", OracleDbType.Varchar2, ip, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_oeStartOver", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static string employerAgencyId(string employerId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployerId", OracleDbType.Varchar2, employerId, ParameterDirection.Input),
                new OracleParameter("pAgencyId", OracleDbType.Varchar2, ParameterDirection.Output),
            };
            _params[1].Size = 2;
            OracleHelper.ExecuteScalar("web_getAgencyId", _params, CommandType.StoredProcedure);
            return _params[1].Value.ToString();
        }

        public static bool AddVtl(string oeId, int oeType, string planId, string memberId, string employeeType,  DateTime effectiveDate, string updatedBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pOeType", OracleDbType.Int32, oeType, ParameterDirection.Input),
                new OracleParameter("pPlanId", OracleDbType.Varchar2, planId, ParameterDirection.Input),
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberId, ParameterDirection.Input),
                new OracleParameter("pEmployeeType", OracleDbType.Varchar2, employeeType, ParameterDirection.Input),
                new OracleParameter("pEffectiveDate", OracleDbType.Date, effectiveDate, ParameterDirection.Input),
                new OracleParameter("pUpdatedBy", OracleDbType.Varchar2, updatedBy, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_addVtl", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool RemoveVtl(string memberId, string employeeId, string employeeType, string oeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberId, ParameterDirection.Input),
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pEmployeeType", OracleDbType.Varchar2, employeeType, ParameterDirection.Input),
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_removeVtl", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool correctVtl(string memberId, string oeId, string planId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberId, ParameterDirection.Input),
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pPlanId", OracleDbType.Varchar2, planId, ParameterDirection.Input),
            };

            int result = OracleHelper.ExecuteNonQuery("web_correctPlan", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static DateTime getEffectiveDate(string oeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pDate", OracleDbType.Date, ParameterDirection.Output)
            };

            OracleHelper.ExecuteScalar("web_getOeEffectiveDate", _params, CommandType.StoredProcedure);
            return DateTime.Parse(_params[1].Value.ToString());
        }

        public static int getEeMaxInsurance(string employeeId)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pEmployeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pInsuranceAmount", OracleDbType.Int32, ParameterDirection.Output)
            };
            _params[1].Size = 6;
            OracleHelper.ExecuteScalar("web_getEeInsuranceAmount", _params, CommandType.StoredProcedure);
            return int.Parse(_params[1].Value.ToString());
        }

        public static bool updateBenTable(string oeId, string memberId, int planTypeId, bool isCancel)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input ),
                new OracleParameter("pMemberId", OracleDbType.Varchar2, memberId, ParameterDirection.Input),
                new OracleParameter("pPlanTypeId", OracleDbType.Int32, planTypeId, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery(isCancel ? "web_cancelBen" : "web_transferBenToOe", _params, CommandType.StoredProcedure);
            return result != -1;
        }

        public static bool transferVtl(string oeId, string employeeId, int oeType,  DateTime effective, string updateBy)
        {
            OracleParameter[] _params = new OracleParameter[]
            {
                new OracleParameter("pOeId", OracleDbType.Varchar2, oeId, ParameterDirection.Input),
                new OracleParameter("pOeType", OracleDbType.Int32, oeType, ParameterDirection.Input),
                new OracleParameter("pEmpoyeeId", OracleDbType.Varchar2, employeeId, ParameterDirection.Input),
                new OracleParameter("pEffectiveDate", OracleDbType.Date, effective, ParameterDirection.Input),
                new OracleParameter("pUpdated", OracleDbType.Varchar2, updateBy, ParameterDirection.Input)
            };

            int result = OracleHelper.ExecuteNonQuery("web_transferVtl", _params, CommandType.StoredProcedure);
            return result != -1;
        }
    }
}