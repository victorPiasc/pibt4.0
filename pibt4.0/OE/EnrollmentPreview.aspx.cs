using System;
using System.Web;
using Pibt.Model;
using Pibt.Common;
using System.Web.Security;

namespace Pibt.OE {
    public partial class EnrollmentPreview : BasePage 
    {
        public string oeId { get { return sessionVal("oeId"); } }
        public int oeType{ get { return sessionValInt("OETypeId"); } } 

        protected void Page_Load(object sender, EventArgs e) {
            if (string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(EmployeeId) || string.IsNullOrEmpty(oeId)) 
                oops();
                //NOT REACHED

            CtlEnrollmentFormPreview1.OEId = oeId;
            CtlEnrollmentFormPreview1.EmployeeId = EmployeeId;
            CtlEnrollmentFormPreview1.EmployerId = EmployerId;
        }

        protected void BtNext_Click(object sender, EventArgs e) {
            if (CtlEnrollmentFormPreview1.CanSubmit()) 
            {
               MembershipUser user = Membership.GetUser(CurrentUserInfo.LoginName);
               string from = ApplicationConfiguration.SystemMailSender;
               string to = user.Email;
               string subject = Utilities.Us() + " Portal: Form Processed confirmation";
               string body = "This message confirms that the form "+ oeId +" was successfully submitted. If further information is required you will be contacted by " + Utilities.Us() + ". If you are not contacted for additional information, please consider it completed. If you have any questions contact " + Utilities.Us() + " at 1 (323) 728-9500 or 1 (800) 449-4898 Outside the Los Angeles Area<br/><br/>" + Utilities.Us() + "<br/><br/>" + disclaimer;

               if (oeType==3 || oeType==6) 
               {
                    if (BLL.Plan.Terminatememberplan(oeId, HttpContext.Current.User.Identity.Name)) 
                    {
                        Session["OEId"] = null;
                        Session["OETypeId"] = null;
                        Utilities.SendMail(from, to, subject, body);
                        BLL.Logger.WriteAuditLog(string.Format("{0} terminated enrollment #{1}", Page.User.Identity.Name, oeId), EventCode.TerminateEnrollment);
                        Response.Redirect("/OE/Finished.aspx" + UrlBuilder(null));
                    }
                }
                else 
               {
                    if (BLL.EnrollmentForm.UpdateOEStatus(oeId, OEStatus.Approved, Page.User.Identity.Name, Request.UserHostAddress)) {
                        Session["OEId"] = null;
                        Session["OETypeId"] = null;
                        Utilities.SendMail(from, to, subject, body);
                        BLL.Logger.WriteAuditLog(string.Format("{0} sumbitted enrollment #{1}", Page.User.Identity.Name, oeId), EventCode.SubmitEnrollment);
                        Response.Redirect("/OE/Finished.aspx" + UrlBuilder(null));
                    }
                }
            }
        }

        protected void BtBack_Click(object sender, EventArgs e) {
           Response.Redirect("/OE/SignPlan.aspx" + UrlBuilder(null));
        }

        protected void btnSaveAndExit_Click(object sender, EventArgs e) {
            SaveAndExit();
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            StartOver(oeId, User.Identity.Name, Request.UserHostAddress);
        }
    }
}