using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;


namespace Pibt.UserControl
{
    public partial class CtlInvoiceHist : System.Web.UI.UserControl
    {
        public UserRoles Role { get; set; }
        public string EmployerId { get; set; }
        public string EmployeeId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Role == UserRoles.Employee)
            {
                InvoiceHistGrid.Columns[3].Visible = false;
                InvoiceHistGrid.Columns[4].Visible = false;
                InvoiceHistGrid.Columns[5].Visible = false;
                InvoiceHistGrid.Columns[6].Visible = false;
                RadTabStrip3.Visible = false;
                RadMultiPage3.Visible = false;
                RadTabStrip2.Visible = false;
                RadMultiPage2.Visible = false;
            }
        }

        protected void InvoiceHistGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            InvoiceHistGrid.DataSource= Role!=UserRoles.Employee
                ? BLL.Invoice.GetInvoiceHistoryByEmployer(EmployerId)
                : BLL.Invoice.GetInvoiceHistoryByEmployer(EmployeeId);
        }

        protected void InvoiceHistGrid_DataBound(object sender, EventArgs e)
        {
            if (InvoiceHistGrid.Items.Count > 0)
            {
                SelectedInvoiceNbr.Value = InvoiceHistGrid.SelectedValue == null
                    ? InvoiceHistGrid.Items[0].GetDataKeyValue("INVOICENBR").ToString()
                    : InvoiceHistGrid.SelectedValue.ToString();
                InvoiceHistGrid.Items[0].Selected = InvoiceHistGrid.SelectedValue == null;
            }
            InvoiceHistDetailGrid.Rebind();
            if (Role == UserRoles.Employer)
            {
                OtherChargeDetailsGrid.Rebind();
                if (InvoiceHistGrid.SelectedValue != null)
                {
                    InvoiceSummaryView1.DataSource = BLL.Invoice.GetInvoiceHistSummary(InvoiceHistGrid.SelectedValue.ToString());
                    InvoiceSummaryView1.DataBind();
                }
            }
        }

        protected void InvoiceHistDetailGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            object obj = InvoiceHistGrid.SelectedValue;
            if (obj != null)
            {
                if (Role == UserRoles.Employer)
                {
                    InvoiceHistDetailGrid.DataSource = BLL.Invoice.GetInvoiceHistoryByNumber(obj.ToString());
                }
                else if (Role == UserRoles.Employee)
                {
                    InvoiceHistDetailGrid.DataSource = BLL.Invoice.GetInvoiceHistoryByNumberAndEeId(obj.ToString(), EmployeeId);
                }
            }
        }

        protected void InvoiceHistGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            InvoiceHistDetailGrid.Rebind();
            if (Role == UserRoles.Employer)
            {
                OtherChargeDetailsGrid.Rebind();
                if (InvoiceHistGrid.SelectedValue != null)
                {
                    InvoiceSummaryView1.DataSource = BLL.Invoice.GetInvoiceHistSummary(InvoiceHistGrid.SelectedValue.ToString());
                    InvoiceSummaryView1.DataBind();
                }
            }
            SelectedInvoiceNbr.Value = InvoiceHistGrid.SelectedValue.ToString();
        }

        protected void OtherChargeDetailsGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            object obj = InvoiceHistGrid.SelectedValue;
            if (obj != null)
            {
                OtherChargeDetailsGrid.DataSource = BLL.Invoice.GetInvoiceHistoryOtherCharges(obj.ToString());
            }
        }
    }
}