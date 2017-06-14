using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Pibt.OE
{
    public partial class Finished : BasePage
    {
        public string oeId { get { return sessionVal("oeId"); } }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(EmployeeId))
                oops();
                //NOT REACHED

            //set user controls
            CtlEnrollmentFormTitle1.EmployeeId = EmployeeId;
            CtlEnrollmentFormTitle1.EmployerId = EmployerId;
            CtlEnrollmentFormTitle1.oeId = oeId;
        }
    }
}