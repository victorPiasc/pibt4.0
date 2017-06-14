using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.Employer
{
    public partial class RenewalAtoA : BasePage
    {
        public Renewal renew
        {
            get
            {
                if (Session["renewal"] == null)
                    Session["renewal"] = BLL.Employer.getUnfinishedRenewalId(EmployerId);
                return (Renewal)Session["renewal"];
            }
            set { Session["renewal"] = value;}
        }

        public int isTotal
        {
            get
            {
                if (ViewState["isTotal"] == null) 
                    ViewState["isTotal"] = 1;
                return int.Parse(ViewState["isTotal"].ToString());
            }
            set { ViewState["isTotal"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (renew == null)
                oops();
            if (!IsPostBack)
            {
                //load only the benefit types that the employer has been billed on 
                DataTable dt = BLL.Plan.getPlanTypesFromBill(EmployerId);
                if (dt.Rows.Count == 0 && saveToRenewal(++renew.state))
                    Response.Redirect("/Employer/Contribution.aspx");
                    //NOT REACHED
                foreach (DataRow dr in dt.Rows)
                {
                    Control ct = masterPanel.FindControl("type_"+dr.ItemArray[0].ToString());
                    if ( ct != null)
                    {
                        censusSummary.Columns[int.Parse(dr.ItemArray[0].ToString())].Display = true;
                        Panel type = (ct as Panel);
                        type.Visible = true;
                    }
                }
                paForm.NavigateUrl += "&erId=" + EmployerId;
            }
        }

        protected void open_Command(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "1":
                    closeMed.Visible = !closeMed.Visible;
                    openMed.Visible = !openMed.Visible;
                    grid_1.Visible = closeMed.Visible;
                    if (grid_1.Visible)
                        grid_1.Rebind();
                    break;
                case "2":
                    closeDen.Visible = !closeDen.Visible;
                    openDen.Visible = !closeDen.Visible;
                    grid_2.Visible = closeDen.Visible;
                    if (grid_2.Visible)
                        grid_2.Rebind();
                    break;
                case "3":
                    closeVis.Visible = !closeVis.Visible;
                    openVis.Visible = !openVis.Visible;
                    grid_3.Visible = closeVis.Visible;
                    if (grid_3.Visible)
                        grid_3.Rebind();
                    break;
                case "4":
                    closeChiro.Visible = !closeChiro.Visible;
                    openChiro.Visible = !closeChiro.Visible;
                    grid_4.Visible = closeChiro.Visible;
                    if (grid_4.Visible)
                        grid_4.Rebind();
                    break;
                case "6":
                    closeVtl.Visible = !closeVtl.Visible;
                    openVtl.Visible = !closeVtl.Visible;
                    grid_6.Visible = closeVtl.Visible;
                    if (grid_6.Visible)
                        grid_6.Rebind();
                    break;
                case "7":
                    closeMtl.Visible = !closeMtl.Visible;
                    openMtl.Visible = !closeMtl.Visible;
                    grid_7.Visible = closeMtl.Visible;
                    if (grid_7.Visible)
                        grid_7.Rebind();
                    break;
                case "8":
                    closeMh.Visible = !closeMh.Visible;
                    openMh.Visible = !closeMh.Visible;
                    grid_8.Visible = closeMh.Visible;
                    if (grid_8.Visible)
                        grid_8.Rebind();
                    break;
                default:
                    closeMtlGa.Visible = !closeMtlGa.Visible;
                    openMtlGa.Visible = !closeMtlGa.Visible;
                    grid_10.Visible = closeMtlGa.Visible;
                    if (grid_10.Visible)
                        grid_10.Rebind();
                    break;
            }
        }

        protected void grid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            RadGrid grid = sender as RadGrid;
            int gridNum = int.Parse(grid.ID.Substring(5));
            grid.DataSource = BLL.OnlineQuote.getAtoA(renew.cartId, EmployerId, gridNum, isTotal);
        }

        protected void details_Click(object sender, EventArgs e)
        {
            isTotal = isTotal == 0 ? 1 : 0;
            headerText.Text = isTotal == 0? "Employee Level Detail" : "Employer Level Detail";
            eeDetails.Visible = !eeDetails.Visible;
            noDetails.Visible = !noDetails.Visible;
            changeNameDisplay(isTotal==0);
            rebindGrids();
        }

        public void rebindGrids()
        {
            grid_1.Rebind();
            grid_2.Rebind();
            grid_3.Rebind();
            grid_4.Rebind();
            grid_6.Rebind();
            grid_7.Rebind();
            grid_8.Rebind();
            grid_10.Rebind();
        }

        public void changeNameDisplay(bool onOff)
        {
            grid_1.MasterTableView.GetColumn("fullName").Display = onOff;
            grid_2.MasterTableView.GetColumn("fullName").Display = onOff;
            grid_3.MasterTableView.GetColumn("fullName").Display = onOff;
            grid_4.MasterTableView.GetColumn("fullName").Display = onOff;
            grid_6.MasterTableView.GetColumn("fullName").Display = onOff;
            grid_7.MasterTableView.GetColumn("fullName").Display = onOff;
            grid_8.MasterTableView.GetColumn("fullName").Display = onOff;
            grid_10.MasterTableView.GetColumn("fullName").Display = onOff;
        }

        protected void Continue_Click(object sender, EventArgs e)
        {
            if (saveToRenewal(++renew.state))
                Response.Redirect("/Employer/Contribution.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            renew.isPercent = "Y";
            renew.isOverAll = "Y";
            BLL.OnlineQuote.setSubsidy(renew.cartId);
            if (saveToRenewal(renew.state = 5))
                Response.Redirect("/Employer/RenewalOverview.aspx");
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Employer/RenewalIntroduction.aspx");
        }

        public bool saveToRenewal(int state)
        {
            return BLL.OnlineQuote.updateRenewal(renew.renewalId, state, renew.isPercent, renew.isOverAll);
        }

        protected void censusSummary_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            censusSummary.DataSource = BLL.Plan.summaryOfCensus(EmployerId);
        }
    }
}