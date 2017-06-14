using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.OE
{
    public partial class Plans : BasePage
    {
        public string oeId { get { return sessionVal("oeId"); } }
        public int oeType { get { return sessionValInt("OETypeId"); } } 

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployeeId) || string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(oeId))
                oops();
                //NOT REACHED
            //set user controls
            CtlEnrollmentFormTitle1.EmployeeId = CtlEnrollmentFormPlans1.EmployeeId = EmployeeId;
            CtlEnrollmentFormTitle1.EmployerId = CtlEnrollmentFormPlans1.EmployerId = EmployerId;
            CtlEnrollmentFormTitle1.oeId = CtlEnrollmentFormPlans1.oeId = oeId;
            CtlEnrollmentFormPlans1.agencyId = string.IsNullOrEmpty(CurrentUserInfo.AgencyId) 
                ? BLL.EnrollmentForm.employerAgencyId(EmployerId) 
                : CurrentUserInfo.AgencyId;
            CtlEnrollmentFormPlans1.oeType = oeType;
        }

        protected void BtNext_Click(object sender, EventArgs e)
        {
            if (CtlEnrollmentFormPlans1.IsValid())
                Response.Redirect("/OE/LifeCoverage.aspx" + UrlBuilder(null));
        }

        protected void BtBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(
                (oeType == 4
                    ? "/OE/OEAtoA" 
                    : "/Employer/EmployeeDetails")+".aspx" + UrlBuilder(null));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SaveAndExit();
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            StartOver(oeId, User.Identity.Name, Request.UserHostAddress);
        }
    }
}