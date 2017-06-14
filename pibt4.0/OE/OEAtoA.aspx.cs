using Pibt.BLL;
using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.OE
{
    public partial class OEAtoA : BasePage
    {
        public string oeId { get { return sessionVal("oeId"); } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(EmployeeId) || string.IsNullOrEmpty(oeId))
                oops();

            if (!BLL.Invoice.EmployeeOnLastInvoice(EmployerId, EmployeeId))
                gotoNextPage();

            if (!IsPostBack)
                setCart();

            CtlEnrollmentFormTitle1.EmployeeId = EmployeeId;
            CtlEnrollmentFormTitle1.EmployerId = EmployerId;
            CtlEnrollmentFormTitle1.oeId = oeId;

            decimal[] total = new decimal[2];
            DataTable tmp = null;

            DataTable dt = BLL.Plan.GetPlanTypes(EmployerId);
            if (dt.Rows.Count == 0)
                oops();
            foreach (DataRow dr in dt.Rows)
            {
                Control ct = masterPanel.FindControl("type_" + dr.ItemArray[0].ToString());
                if (ct != null)
                {
                    Panel type_panel = ct as Panel;
                    type_panel.Visible = true;
                    tmp = BLL.EnrollmentForm.oeAtoA(BLL.OnlineQuote.QQCartId, EmployerId, EmployeeId, int.Parse(dr.ItemArray[0].ToString()));
                    if (tmp.Rows.Count > 0)
                    {
                        total[0] += decimal.Parse(tmp.Rows[0].ItemArray[3].ToString()) + decimal.Parse(tmp.Rows[0].ItemArray[4].ToString());
                        total[1] += decimal.Parse(tmp.Rows[0].ItemArray[7].ToString()) + decimal.Parse(tmp.Rows[0].ItemArray[8].ToString());
                    }
                }
            }
            expireTotal.Text = total[0].ToString("C");
            renewTotal.Text = total[1].ToString("C");
        }

        public void setCart()
        {
            //check if cartId exist for oeId, if it does not exist create new cartId
            int cartId = BLL.EnrollmentForm.getCartId(oeId);
            if (cartId==0)
            {
                cartId = BLL.OnlineQuote.ForceNewCartId();
                BLL.EnrollmentForm.setCartId(cartId, oeId);
                BLL.EnrollmentForm.TransferERForOe(cartId, EmployerId);
            }
            BLL.OnlineQuote.setUpAtoA(cartId, EmployerId, EmployeeId, 4);
            BLL.OnlineQuote.SetCookie(cartId);
            HttpContext.Current.Session["QQ_CartID"] = cartId;
        }

        protected void BtCancel_Click(object sender, EventArgs e)
        {
            BLL.Logger.WriteAuditLog(string.Format("{0} canceled enrollment #{1}", Page.User.Identity.Name, oeId), EventCode.CancelEnrollment);
            if (BLL.EnrollmentForm.UpdateOEStatus(oeId, OEStatus.Cancel, Page.User.Identity.Name, Request.UserHostAddress))
            {
                if (Session["OEId"] != null)
                {
                    Session["OEId"] = null;
                    Session["OETypeId"] = null;
                }
                Response.Redirect("/default.aspx");
            }
        }

        protected void BtChanges_Click(object sender, EventArgs e)
        {
            gotoNextPage();
        }

        protected void open_Command(object sender, CommandEventArgs e)
        {
            //get the panel
            Control ct = masterPanel.FindControl("type_" + e.CommandName) as Panel;
            if (ct != null)
            {
                Panel type_panel = ct as Panel;
                //get the buttons in the panel
                LinkButton open = type_panel.FindControl("open_" + e.CommandName) as LinkButton;
                LinkButton close = type_panel.FindControl("close_" + e.CommandName) as LinkButton;
                //get the grid in the panel
                RadGrid grid = type_panel.FindControl("radgrid_" + e.CommandName) as RadGrid;
                open.Visible = !open.Visible;
                close.Visible = !close.Visible;
                grid.Visible = !grid.Visible;
                if (grid.Visible)
                    grid.Rebind();
            }
        }

        protected void radgrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            RadGrid grid = sender as RadGrid;
            int gridNum = int.Parse(grid.ID.Substring(8));
            grid.DataSource = BLL.EnrollmentForm.oeAtoA(BLL.OnlineQuote.QQCartId, EmployerId, EmployeeId, gridNum);
        }

        public void gotoNextPage()
        {
            Response.Redirect("/OE/Plans.aspx"+UrlBuilder(null));
        }

        protected void btNoChange_Click(object sender, EventArgs e)
        {
            string message = BLL.EnrollmentForm.oeEnrollNoChanges(oeId, EmployeeId, EmployerId, User.Identity.Name);
            if (message !="null")
                rtnMessage.Text = Common.Utilities.FormatError(message);
            else 
                Response.Redirect("/OE/SummaryOfChanges.aspx"+UrlBuilder(null));
        }

        protected void radgrid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if(e.Item is GridDataItem)
            {
                GridDataItem gdi = (GridDataItem)e.Item;
                if (gdi["PlanName"].Text == "&nbsp;")
                {
                    gdi["PlanName"].Text = "No renewal plan. Plan is expiring.";
                    gdi["PlanName"].ForeColor = Color.Red;
                    gdi["PlanName"].Font.Bold = true;
                    if (!IsPostBack)
                        btNoChange.Visible = false;
                }
            }
        }

        protected void radgrid_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridNoRecordsItem)
            {
                GridNoRecordsItem nItem = (GridNoRecordsItem)e.Item;
                RadGrid grid = sender as RadGrid;
                int gridNum = int.Parse(grid.ID.Substring(8));
                string rtnValue = BLL.EnrollmentForm.planIsDeclinedOrNew(EmployeeId,EmployerId, gridNum);
                if (rtnValue != "2")
                {
                    nItem.TemplateCell.Text = "<span style=\"padding-left:10px;\">" +
                        (rtnValue == "0"
                            ? "Benefit is new to the employer."
                            : "Benefit was previously declined.") +
                        "</span>";
                }
            }
        }

        protected void radgrid_PreRender(object sender, EventArgs e)
        {
            RadGrid grid = sender as RadGrid;
            foreach (GridDataItem i in grid.Items)
            {
                if (i["oldPlanName"].Text.Contains("new") || i["planName"].Text.Contains("expiring"))
                    btNoChange.Visible = false;
            }
        }
    }
}