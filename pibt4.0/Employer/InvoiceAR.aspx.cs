using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Common;


namespace Pibt.Employer
{
    public partial class InvoiceAR : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployerId))
            {
                oops();
                return;
            }

            if (!IsPostBack)
            {
                RadTabStrip1.SelectedIndex = 0;
                RadMultiPage1.SelectedIndex = 0;
            }

            //set user control
            invoiceAR.EmployerId = EmployerId;
            invoiceAR.EmployeeId = EmployeeId;
            invoiceAR.Role = GetLimitedUserRole();
        }
    }
}