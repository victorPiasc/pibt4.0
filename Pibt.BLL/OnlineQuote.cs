using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Pibt.DAL;
using System.Web;
using Pibt.Common;
using Pibt.Model;

namespace Pibt.BLL
{
    public class OnlineQuote
    {
        public static int QQCartId
        {
            get
            {
                HttpContext context = HttpContext.Current;
                int cartId;
                object cartIdSession = context.Session["QQ_cartId"];
                cartId = cartIdSession != null
                    ? (int) cartIdSession
                    : context.Request.Cookies["QQ_cartId"]!=null
                        ? int.Parse(context.Request.Cookies["QQ_cartId"].Value)
                        : ForceNewCartId();
                context.Session["QQ_cartId"] = cartId;

                return cartId;
            }
        }

        public static int ForceNewCartId()
        {
            int cartId = OnlineQuoteAccess.newCartId();
            HttpContext.Current.Session["QQ_cartId"] = cartId;
            SetCookie(cartId);
            return cartId;
        }

        public static void SetCookie(int cartId)
        {
            HttpCookie cookie = new HttpCookie("QQ_cartId", cartId.ToString());
            cookie.Expires = DateTime.Now.Add(new TimeSpan(ApplicationConfiguration.CartPersistDays, 0, 0, 0));
            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        public static bool InsertWebQQCart(int cartId, string name, int type, string typeName, char male, DateTime DOB, int counter, string contribution, string contributionDep, string period, string salary)
        {            
            return OnlineQuoteAccess.InsertWebQQCart(cartId, name, type, typeName, male, DOB, counter, contribution, contributionDep,period, salary);
        }

        public static DataTable GetWebQQCart(int cartId)
        {
            using (DataTable dt = OnlineQuoteAccess.GetWebQQCart(cartId))
            {
                return dt;
            }
        }

        public static int getLastFamilyId(int cartId)
        {
            return OnlineQuoteAccess.getLastFamilyId(cartId);
        }

        public static bool DeleteFromWebQQCart(string rowID, string employeeTypeId)
        {
            return OnlineQuoteAccess.DeleteFromWebQQCart(rowID, employeeTypeId);
        }

        public static bool UpdateFromWebQQCart(string rowID, char male, DateTime DOB, string name)
        {
            return OnlineQuoteAccess.UpdateFromWebQQCart(rowID, male, DOB, name);
        }

        public static bool setQuickQuoteRates(int cartId, int monthsAhead, char isPdf, int planType)
        {
            return OnlineQuoteAccess.setQuickQuoteRates(cartId, monthsAhead, isPdf, planType);
        }

        public static DataTable Web_QuickQuote(int cartId, int planType, char selected)
        {
             using (DataTable dt = OnlineQuoteAccess.Web_QuickQuote(cartId,planType, selected))
            {
                return dt;
            }
        }

        public static string[] web_setUpPage(int cartId)
        {
            return OnlineQuoteAccess.web_setUpPage(cartId);
        }

        public static string CheckWebCartCount(int cartId, int employeeTypeId)
        {
            return OnlineQuoteAccess.CheckWebCartCount(cartId, employeeTypeId);
        }

        public static bool InsertCompareCart(int cartId, string planid)
        {
            return OnlineQuoteAccess.InsertCompareCart(cartId, planid);
        }

        public static bool DeleteAllCompareCart(int cartId)
        {
            return OnlineQuoteAccess.DeleteAllCompareCart(cartId);
        }

        public static DataTable getPDName(int cartId, string planTypeId)
        {
            using (DataTable dt = OnlineQuoteAccess.getPDName(cartId, planTypeId))
            {
                return dt;
            }
        }

        public static DataTable getPD(int cartId, string date, string planTypeId)
        {
            using (DataTable dt = OnlineQuoteAccess.getPD(cartId, date, planTypeId))
            {
                return dt;
            }
        }

        public static bool insertQQemployer(int cartId, string cname, string address, string city, string st, int zip, string fax, string name, string phone, string email, string isPc)
        {
            return OnlineQuoteAccess.insertQQemployer(cartId, cname, address, city, st, zip, fax, name, phone, email, isPc);
        }

        public static DataTable getQQEmployer(int cartId)
        {
            using (DataTable dt = OnlineQuoteAccess.getQQemployer(cartId))
            {
                return dt;
            }
        }

        public static int GetEmployerZip(int cartId)
        {
            return OnlineQuoteAccess.GetEmployerZip(cartId);
        }

        public static bool DeleteAllWebQQCart(int cartId)
        {
            return OnlineQuoteAccess.DeleteAllWebQQCart(cartId);
        }

        public static int CheckZipcode(int zip)
        {
            return OnlineQuoteAccess.CheckZipcode(zip);
        }

        public static DataTable getQQSavedQuotes(string username)
        {
            using (DataTable dt = OnlineQuoteAccess.getQQSavedQuotes(username))
            {
                return dt;
            }
        }

        public static DataTable searchSavedQuotes(string label)
        {
            using (DataTable dt = OnlineQuoteAccess.searchSavedQuotes(label))
            {
                return dt;
            }
        }

        public static bool insertSavedQuote(int cartId, string labelname, string createdby)
        {
            return OnlineQuoteAccess.insertSavedQuote(cartId, labelname, createdby);
        }

        public static DataTable getEmployeeList(int cartId)
        {
            using (DataTable dt = OnlineQuoteAccess.getEmployeeList(cartId))
            {
                return dt;
            }
        }

        public static bool InsertPlanTypeContributions(int cartId, int plantypeid, string contribution, string contributionDep, string ofBase)
        {
            return OnlineQuoteAccess.InsertPlanTypeContributions(cartId, plantypeid, contribution, contributionDep, ofBase);
        }

        public static bool UpdateEmployerContributions(int cartId, string contribution, string contDep, string ofBase)
        {
            return OnlineQuoteAccess.UpdateEmployerContributions(cartId, contribution, contDep, ofBase);
        }

        public static bool TransferErToQuote(int cartId, string employerid)
        {
            return OnlineQuoteAccess.TransferErToQuote(cartId, employerid);
        }

        public static DataTable getPlanTypes(int cartId)
        {
            using (DataTable dt = OnlineQuoteAccess.getPlanTypes(cartId))
            {
                return dt;
            }
        }

        public static bool startRenewal(string renewalId, string employerId, int cartId, int state)
        {
            return OnlineQuoteAccess.startRenewal(renewalId, employerId, cartId, state);
        }

        public static bool UpdateEmployerDollar(int cartId, string dollar, string dollarDep)
        {
            return OnlineQuoteAccess.UpdateEmployerDollar(cartId, dollar, dollarDep);
        }

        public static bool updateRenewal(string renewalId, int state, string isPercent, string isOverall)
        {
            return OnlineQuoteAccess.updateRenewal(renewalId, state, isPercent, isOverall);
        }

        public static bool updateRenewalCont(string renewalId, int state, int contribution)
        {
            return OnlineQuoteAccess.updateRenewalCont(renewalId, state, contribution);
        }

        public static Decimal[] getDollars(int cartId)
        {
            return OnlineQuoteAccess.getDollars(cartId);
        }

        public static int[] getPercent(int cartId)
        {
            return OnlineQuoteAccess.getPercent(cartId);
        }

        public static DataTable getERPlanTypeConts(int cartId)
        {
            using (DataTable dt = OnlineQuoteAccess.getERPlanTypeConts(cartId))
                return dt;
        }

        public static bool setRates(int cartId, string employerId, string forOe)
        {
            return OnlineQuoteAccess.setRates(cartId, employerId, forOe);
        }

        public static DataTable getSubsidyByType(int cartId, string employerId, int planTypeId, int select, string isPercent)
        {
            using (DataTable dt = OnlineQuoteAccess.getSubsidyByType(cartId, employerId, planTypeId, select, isPercent))
            {
                return dt;
            }
        }

        public static DataTable getsubsidyByDollar(int cartId, int planTypeId)
        {
            using (DataTable dt = OnlineQuoteAccess.getsubsidyByDollar(cartId, planTypeId))
            {
                return dt;
            }
        }

        public static DataTable getQQDollar(int cartId, int planTypeId)
        {
            using (DataTable dt = OnlineQuoteAccess.getQQDollar(cartId, planTypeId))
            {
                return dt;
            }
        }

        public static bool updateBasePlan(int cartId, string planId, string planTypeId)
        {
            return OnlineQuoteAccess.updateBasePlan(cartId, planId, planTypeId);
        }

        public static bool updateToComplete(string renewalId, int state, string isComplete)
        {
            return OnlineQuoteAccess.updateToComplete(renewalId, state, isComplete);
        }

        public static bool deleteEmployerPlanTypes(int cartId)
        {
            return OnlineQuoteAccess.deleteEmployerPlanTypes(cartId);
        }

        public static bool updateOfBase(int cartId, string ofBase)
        {
            return OnlineQuoteAccess.updateOfBase(cartId, ofBase);
        }

        public static bool removeBasePlans(int cartId)
        {
            return OnlineQuoteAccess.removeBasePlans(cartId);
        }

        public static bool changeDollarPercent(int cartId, string isPercent)
        {
            return OnlineQuoteAccess.changeDollarPercent(cartId, isPercent);
        }

        public static decimal minRequirement(int cartId)
        {
            return OnlineQuoteAccess.minRequirement(cartId);
        }

        public static bool setSubsidy(int cartId)
        {
            return OnlineQuoteAccess.setSubsidy(cartId,"");
        }

        public static bool setSubsidy(int cartId, string planType)
        {
            return OnlineQuoteAccess.setSubsidy(cartId, planType);
        }

        public static decimal getMinPerPlanType(int cartId, int planTypeId)
        {
            return OnlineQuoteAccess.getMinPerPlanType(cartId, planTypeId);
        }

        public static string getBasePlanId(int cartId, string planTypeId)
        {
            return OnlineQuoteAccess.getBasePlanId(cartId, planTypeId);
        }

        public static DataTable getAtoA(int cartId, string employerId, int planTypeId, int isTotal)
        {
            using (DataTable dt = OnlineQuoteAccess.getAtoA(cartId, employerId, planTypeId, isTotal))
            {
                return dt;
            }
        }

        public static bool cancelRenewal(string renewalId)
        {
            return OnlineQuoteAccess.cancelRenewal(renewalId);
        }

        public static bool InsertRenewalPlan(int cartId, string planId)
        {
            return OnlineQuoteAccess.InsertRenewalPlan(cartId, planId);
        }

        public static bool DeleteRenewalPlan(int cartId, string planid)
        {
            return OnlineQuoteAccess.DeleteRenewalPlan(cartId, planid);
        }

        public static bool DeleteAllEmployerPlanType(int cartId)
        {
            return OnlineQuoteAccess.DeleteAllEmployerPlanType(cartId);
        }

        public static DataTable GetRenewalPlans(int cartId, int planTypeId)
        {
            using (DataTable dt = OnlineQuoteAccess.GetRenewalPlans(cartId, planTypeId))
            {
                return dt;
            }
        }

         public static bool UpdateRenewalCR(string renewalId, string name, string title, DateTime effDate)
        {
            return OnlineQuoteAccess.UpdateRenewalCR(renewalId, name, title, effDate);
        }

         public static DataTable getRenewalTermPlans(string employerId, int cartId)
         {
             using (DataTable dt = OnlineQuoteAccess.getRenewalTermPlans(employerId, cartId))
             {
                 return dt;
             }
         }

         public static bool completePlanTransfer(int cartId, string user, string employerId, DateTime effectiveDate)
         {
             return OnlineQuoteAccess.completePlanTransfer(cartId, user, employerId, effectiveDate);
         }

        public static bool resetRates(int cartId, string employerId)
         {
             return OnlineQuoteAccess.resetRates(cartId, employerId);
         }

        public static DataTable getRenewalPlanPt(int cartId)
        {
            using (DataTable dt = OnlineQuoteAccess.getRenewalPlanPt(cartId))
            {
                return dt;
            }
        }

        public static DataTable eeLevelData(int cartId, int planTypeId)
        {
            using (DataTable dt = OnlineQuoteAccess.eeLevelData(cartId, planTypeId))
            {
                return dt;
            }
        }

        public static DataTable renewalPlanNames(int cartId, int planTypeId)
        {
            using (DataTable dt = OnlineQuoteAccess.renewalPlanNames(cartId, planTypeId))
            {
                return dt;
            }
        }

        public static DataTable exportQQtoExcel(int cartId)
        {
            using (DataTable dt = OnlineQuoteAccess.exportQQtoExcel(cartId))
            {
                return dt;
            }
        }

        public static DateTime oeEnddate(string employerId)
        {
            return OnlineQuoteAccess.oeEnddate(employerId);
        }

        public static bool setUpAtoA(int cartId, string employerId, string employeeId, int oeType)
        {
            return OnlineQuoteAccess.setUpAtoA(cartId, employerId, employeeId, oeType);
        }

        public static DateTime planEffectiveDate(string employerId)
        {
            return OnlineQuoteAccess.planEffectiveDate(employerId);
        }

        public static bool hasBasePlans(int cartId)
        {
            return OnlineQuoteAccess.hasBasePlans(cartId);
        }

        public static bool setLifeRates(int cartId, string employerId, DateTime date)
        {
            return OnlineQuoteAccess.setLifeRates(cartId, employerId, date);
        }

        public static bool insertPotentialUser(int cartId, string code, string email)
        {
            return OnlineQuoteAccess.insertPotentialUser(cartId, code, email);
        }

        public static int checkPotentialUsers(string code)
        {
            return OnlineQuoteAccess.checkPotentialUsers(code);
        }

        public static bool insertAllAsEmployees(int cart, string employerId)
        {
            return OnlineQuoteAccess.insertAllAsEmployees(cart, employerId);
        }

        public static bool newEmployerQuote(int cart, string employerId)
        {
            return OnlineQuoteAccess.newEmployerQuote(cart, employerId);
        }

        public static bool completeNewEmployer(string employerId, int cartId, DateTime effectiveDate, string name, string title)
        {
            return OnlineQuoteAccess.completeNewEmployer(employerId, cartId, effectiveDate, name, title);
        }
    }
}
