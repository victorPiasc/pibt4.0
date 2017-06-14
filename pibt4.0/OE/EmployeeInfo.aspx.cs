using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Pibt.OE
{
    public partial class EmployeeInfo : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(EmployeeId))
            {
                oops();
                return;
            }

            //set user controls
            CtlEmployeeDetails1.EmployeeId = EmployeeId;
            CtlEmployeeDetails1.EmployerId = EmployerId;
        }
    }
}