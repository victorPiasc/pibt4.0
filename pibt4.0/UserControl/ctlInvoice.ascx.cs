using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using Pibt.Common;
using System.Data;

namespace Pibt.UserControl
{
    public partial class CtlInvoice : System.Web.UI.UserControl
    {
        public string EmployerId { get; set; }
        public string EmployeeId { get; set; }
        public UserRoles Role { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployerId))
            {
                HttpContext.Current.ClearError();
                Response.Redirect("/Oooops.aspx", false);
                return;
            }

            if (!Page.IsPostBack)
            {
                UserCacheInfo userInfo = (UserCacheInfo)Session["UserCacheInfo"];
                if (userInfo.UserRole == UserRoles.Employee)
                {
                    InvoiceGrid.Visible = false;
                    RadTabStrip1.Tabs[1].Visible = false;
                    RadMultiPage1.PageViews[1].Visible = false;
                    RadTabStrip2.Visible = false;
                    RadMultiPage2.Visible = false;

                    RadTabStrip3.Visible = false;
                    RadMultiPage3.Visible = false;
                }
                else
                {
                    DataTable dt = BLL.Invoice.GetInvoiceSummaryByEmployer(EmployerId);
                    InvoiceSummaryDetailsView.DataSource = dt;
                    if (dt.Rows.Count > 0)
                    {
                        invoiceNbr.Value = dt.Rows[0]["Invoicenbr"].ToString();
                    }
                    InvoiceSummaryDetailsView.DataBind();
                    ObjectDataSource3.SelectParameters["employerId"].DefaultValue = EmployerId;
                }
            }


        }

        protected void InvoiceGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            if (Role == UserRoles.Employer)
            {
                InvoiceGrid.DataSource = BLL.Invoice.GetInvoiceDetailsByEmployer(EmployerId, null);
            }
            else if (Role == UserRoles.Employee)
            {
                InvoiceGrid.DataSource = BLL.Invoice.GetInvoiceDetailsByEmployer(null, EmployeeId);
            }
        }

        protected void InvoiceGrid_DataBound(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && InvoiceGrid.Items.Count > 0)
            {
                InvoiceGrid.Items[0].Selected = true;
            }
        }
         
        protected void ObjectDataSource2_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            if (Role == UserRoles.Employee)
            {
                e.InputParameters[0] = EmployeeId;
            }
        }
         

    }
}