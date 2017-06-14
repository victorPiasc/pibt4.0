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
    public partial class RenewalOverview : BasePage
    {
        public Renewal renew
        {
            get
            {
                if (Session["renewal"] == null)
                    Session["renewal"] = BLL.Employer.getUnfinishedRenewalId(EmployerId);
                return (Renewal)Session["renewal"];
            }
            set { Session["renewal"] = value; }
        }

        public decimal minTotal
        {
            get
            {
                if (ViewState["minTotal"] == null)
                    ViewState["minTotal"] = BLL.OnlineQuote.minRequirement(renew.cartId);
                return (decimal)ViewState["minTotal"];
            }
            set { ViewState["minTotal"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (renew == null)
                Response.Redirect("/Employer/Plans.aspx");
            if (!IsPostBack)
                pageSetup();
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            if (saveToRenewal(--renew.state))
                Response.Redirect("/Employer/RenewalDashboard.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (saveToRenewal(renew.state))
                Response.Redirect("/Employer/BusinessInfo.aspx");
        }

        protected void Continue_Click(object sender, EventArgs e)
        {
            if(saveToRenewal(++renew.state))
                Response.Redirect("/Employer/RenewalTerms.aspx");
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            if (BLL.OnlineQuote.TransferErToQuote(renew.cartId, EmployerId) &&
                BLL.OnlineQuote.updateRenewal(renew.renewalId, 1, null, null))
                Response.Redirect("/Employer/RenewalAtoA.aspx");
        }

        public bool saveToRenewal(int state)
        {
            return BLL.OnlineQuote.updateRenewal(renew.renewalId, state, renew.isPercent, renew.isOverAll);
        }

        public void pageSetup()
        {
            effectiveDate.Text = renew.effectiveDate.ToShortDateString();
            DataTable dt = BLL.OnlineQuote.getRenewalPlanPt(renew.cartId);
            foreach (DataRow dr in dt.Rows)
            {
                Control ct = masterPanel.FindControl("type_" + dr.ItemArray[0].ToString());
                if (ct != null)
                {
                    Panel type = (ct as Panel);
                    type.Visible = true;
                }
            }
            radgrid_1.Columns[6].Display = radgrid_2.Columns[6].Display = radgrid_3.Columns[6].Display =
                radgrid_4.Columns[6].Display = radgrid_8.Columns[6].Display = renew.contributionId == 1 && renew.isPercent == "Y";
            if (renew.isPercent == "N")
            {
                Decimal[] dollar = BLL.OnlineQuote.getDollars(renew.cartId);
                dollarCont.Text = dollar[0].ToString();
                dollarDepCont.Text = dollar[1].ToString();
                overallDollar.Visible = true;
                overallContribution.Visible = perPlanType.Visible = false;
            }
            else if (renew.isOverAll == "N")
            {
                DataTable tmp = BLL.OnlineQuote.getERPlanTypeConts(renew.cartId);
                TextBox tb1, tb2;
                for (int i = 1; i < 6; i++)
                {
                    tb1 = perPlanType.FindControl("top_" + i) as TextBox;
                    tb1.Text = tmp.Rows[i - 1].ItemArray[0] != null ? tmp.Rows[i - 1].ItemArray[0].ToString() : "";
                    tb2 = perPlanType.FindControl("bot_" + i) as TextBox;
                    tb2.Text = tmp.Rows[i - 1].ItemArray[1] != null ? tmp.Rows[i - 1].ItemArray[1].ToString() : "";
                }
                perPlanType.Visible = true;
                overallContribution.Visible = overallDollar.Visible = false;
            }
            else
            {
                int[] percent = BLL.OnlineQuote.getPercent(renew.cartId);
                overAllContEE.Text = percent[0].ToString();
                overAllContDep.Text = percent[1].ToString();
                overallContribution.Visible = true;
                overallDollar.Visible = perPlanType.Visible = false;
            }
            if (!IsPostBack)
            {
                paForm.NavigateUrl += "&erId=" + EmployerId;
                contributionName.Text = renew.isPercent=="N" 
                    ? "Dollar Amount"
                    : renew.contributionId == 1
                        ? "Base Plan"
                        : renew.contributionId == 2
                            ? "Lowest Cost Plan"
                            : "Any Plan";
            }
        }

        public string minRequirement()
        {
            return (minTotal / decimal.Parse(BLL.OnlineQuote.CheckWebCartCount(renew.cartId, 0))).ToString("0.00");
        }

        protected void radgrid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                RadGrid tmp = (RadGrid)sender;
                GridDataItem item = e.Item as GridDataItem;
                string type = tmp.ID;
                type = type.Substring(8, type.Length-8);
                if (renew.isPercent == "Y" && renew.contributionId == 1)
                {
                    string basePlan = BLL.OnlineQuote.getBasePlanId(renew.cartId, type);
                    Button btn = (Button)item["btn"].Controls[0];
                    if(item["planId"].Text.Equals(basePlan))
                    {
                        btn.Enabled = false;
                        btn.BackColor = System.Drawing.Color.Red;
                        btn.Text = "Base Plan";
                    }
                    else
                        btn.Visible = false;
                }

                if (renew.isPercent == "N")
                {
                    decimal excess = decimal.Parse(dollarCont.Text) - decimal.Parse(minRequirement());
                    if (excess > 0 && int.Parse(type) != 6 && int.Parse(type) != 7)
                    {
                        decimal aggr = excess * (BLL.OnlineQuote.getMinPerPlanType(renew.cartId, int.Parse(type)) / minTotal) * decimal.Parse(BLL.OnlineQuote.CheckWebCartCount(renew.cartId, 0));
                        decimal cAmount = decimal.Parse(item["erPays"].Text.Remove(0, 1));
                        cAmount += aggr;
                        item["erPays"].Text = cAmount.ToString("C");
                        cAmount = decimal.Parse(item["eePays"].Text.Remove(0, 1));
                        cAmount -= aggr;
                        item["eePays"].Text = cAmount.ToString("C");
                    }
                }
            }
        }

        protected void radgrid_1_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            radgrid_1.DataSource = renew.isPercent == "Y"
                ? BLL.OnlineQuote.getSubsidyByType(renew.cartId, EmployerId, 1, 0, renew.isPercent)
                : BLL.OnlineQuote.getsubsidyByDollar(renew.cartId, 1);
        }

        protected void radgrid_2_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            radgrid_2.DataSource = renew.isPercent == "Y"
                ? BLL.OnlineQuote.getSubsidyByType(renew.cartId, EmployerId, 2, 0, renew.isPercent)
                : BLL.OnlineQuote.getsubsidyByDollar(renew.cartId, 2);
        }

        protected void radgrid_3_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            radgrid_3.DataSource = renew.isPercent == "Y"
                ? BLL.OnlineQuote.getSubsidyByType(renew.cartId, EmployerId, 3, 0, renew.isPercent)
                : BLL.OnlineQuote.getsubsidyByDollar(renew.cartId, 3);
        }

        protected void radgrid_4_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            radgrid_4.DataSource = renew.isPercent == "Y"
                ? BLL.OnlineQuote.getSubsidyByType(renew.cartId, EmployerId, 4, 0, renew.isPercent)
                : BLL.OnlineQuote.getsubsidyByDollar(renew.cartId, 4);
        }

        protected void radgrid_6_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            radgrid_6.DataSource = BLL.OnlineQuote.getSubsidyByType(renew.cartId, EmployerId, 6, 0, renew.isPercent);
        }

        protected void radgrid_7_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            radgrid_7.DataSource = BLL.OnlineQuote.getSubsidyByType(renew.cartId, EmployerId, 7, 0, renew.isPercent);
        }

        protected void radgrid_8_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            radgrid_8.DataSource = renew.isPercent == "Y"
                ? BLL.OnlineQuote.getSubsidyByType(renew.cartId, EmployerId, 8, 0, renew.isPercent)
                : BLL.OnlineQuote.getsubsidyByDollar(renew.cartId, 8);
        }
    }
}