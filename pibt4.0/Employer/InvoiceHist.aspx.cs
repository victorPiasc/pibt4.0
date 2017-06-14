using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Common;


namespace Pibt.Employer
{
    public partial class InvoiceHist : BasePage
    {
        public string ExportLink;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentUserInfo.UserRole == Model.UserRoles.Dependent || string.IsNullOrEmpty(EmployerId))
            {
                oops();
                return;
            }

            if (!IsPostBack)
            {
                RadTabStrip1.SelectedIndex = 0;
                RadMultiPage1.SelectedIndex = 0;
            }

            //set user controls
            invoiceHist.EmployerId = EmployerId;
            invoiceHist.EmployeeId = EmployeeId;
            invoiceHist.Role = GetLimitedUserRole();

            ExportLink = string.Format("/download/ExportInvoiceHistory.ashx?erId={0}", EmployerId);
        }
    }
}