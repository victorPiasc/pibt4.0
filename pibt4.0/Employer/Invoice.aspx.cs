using System;
using System.Web;
using Pibt.Common;


namespace Pibt.Employer
{
    public partial class Invoice : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(EmployerId))
            {
                oops();
                return;
            }
             
            //set user control
            invoice1.EmployerId = EmployerId;
            invoice1.EmployeeId = EmployeeId;
            invoice1.Role = GetLimitedUserRole();
        }
    }
}