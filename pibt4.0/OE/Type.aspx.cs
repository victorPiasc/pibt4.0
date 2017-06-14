using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Pibt.BLL;
using Pibt.Model;
using Pibt.Common;


namespace Pibt.OE
{
    public partial class Type : BasePage
    {
        //create a new OE.
        string oeId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(EmployeeId))
                oops();
                //NOT REACHED
            string tmp = BLL.EnrollmentForm.GetMemberUnfinishedOEId(EmployeeId);
            if (!string.IsNullOrEmpty(tmp))
            {
                OeDetails oe = BLL.EnrollmentForm.GetOEDetails(tmp);
                /*Type 3 is plan termination
                 *unless we have passed the terminateForm page we do not store what plan is being terminate
                 *if type 3 then ignore the unfinished warning */
                if(oe.TypeId!="3")
                    Response.Redirect("UnfinishedOEWarning.aspx" + UrlBuilder(null));
                    //NOTREACHED
            }

            Session["OEId"] = null;
            //check if new hire
            if (EnrollmentForm.CheckIsNewHireAndNotPlans(EmployeeId))
                startEnrollment("1");
                //NOTREACHED
            //check if the employee has plans
            if (BLL.EnrollmentForm.EmployeePlanCount(EmployeeId) > 0)
            {
                if (Request["OeTypeId"] == "3")
                    startEnrollment("3");
                    //NOTREACHED
                if (Request["OeTypeId"] == "6")
                    startEnrollment("6");
                    //NOTREACHED
                if(EnrollmentForm.CheckIsNewBornAndNotPlans(EmployeeId))
                    startEnrollment("2");
                    //NOTREACHED
                if (EnrollmentForm.CheckIsNewMarryAndNotPlans(EmployeeId))
                    startEnrollment("5");
                    //NOTREACHED
            }
            if (EnrollmentForm.CheckOEWindow(EmployeeId))
                startEnrollment("4");
                //NOTREACHED

            // If no form for this member.
            // set CtlEnrollmentFormTitle1
            CtlEnrollmentFormTitle1.EmployeeId = EmployeeId;
            CtlEnrollmentFormTitle1.EmployerId = EmployerId;
               lb_Msg.Text = "Enrollment Activity is currently unavailable, it can be due to:<br><br>" +
             "&#149; The entered hire date is not within company waiting period.<br>" +
             "&#149; Life style change is not within 30 days from the event date.<br>" +
             "&#149; Open enrollment is not in session.<br><br>" +
             "You can either:<br><br>" +
             "Contact " + Utilities.Us() + " for further assistance on enrollment options or wait for next open enrollment.<br> (December-January)";
        }

        public void startEnrollment(string oeType)
        {
            oeId = EnrollmentForm.GetNewOeId();
            if (EnrollmentForm.InsertEnrollerForm(oeId, EmployerId, EmployeeId, oeType, HttpContext.Current.User.Identity.Name, Server.HtmlEncode(Request.UserHostAddress)))
            {
                Session["OETypeId"] = oeType;
                Session["OEId"] = oeId;
                Logger.WriteAuditLog(string.Format("{0} created a new OE #{1} with type {2}.", Page.User.Identity.Name, oeId, oeType), EventCode.CreateEnrollment);
                
                Response.Redirect((
                        oeType.Equals("6") || oeType.Equals("3") 
                            ? "/OE/TerminateForm.aspx" 
                            : oeType.Equals("4") 
                                ? "/OE/OEAtoA.aspx" 
                                :"/OE/Plans.aspx") + UrlBuilder(null));
            }
            oops();
        }

        protected void BtBack_Click(object sender, EventArgs e)
        {
            if (CurrentUserInfo.UserRole == UserRoles.Employee || CurrentUserInfo.UserRole == UserRoles.Dependent)
                Response.Redirect("/Employer/EmployeeDetails.aspx" + UrlBuilder(null));
            Response.Redirect("/Employer/Employee.aspx" + UrlBuilder(null));
        }
    }
}