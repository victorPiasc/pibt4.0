using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;


namespace Pibt.UserControl
{
    public partial class CtlInvoiceAR : System.Web.UI.UserControl
    {
        public UserRoles Role { get; set; }
        public string EmployerId { get; set; }
        public string EmployeeId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InvoiceGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (Role == UserRoles.Employer)
                InvoiceGrid.DataSource = BLL.Invoice.GetInvoiceAR(EmployerId);
            else if (Role == UserRoles.Employee || Role == UserRoles.Dependent)
                InvoiceGrid.DataSource = null;
        }

    }
}