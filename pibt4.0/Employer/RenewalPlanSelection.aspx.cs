using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.Employer
{
    public partial class RenewalPlanSelection : BasePage
    {
        public Renewal renew
        {
            get
            {
                if (Session["renewal"] == null)
                    Session["renewal"] = BLL.Employer.getUnfinishedRenewalId(EmployerId);
                return (Renewal)Session["renewal"];
            }
            set
            { Session["renewal"] = value;}
        }

        public int type
        {
            get
            {
                if (ViewState["type"] == null)
                    return 1;
                return int.Parse(ViewState["type"].ToString());
            }
            set { ViewState["type"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (renew == null)
                Response.Redirect("/Employer/Plans.aspx");
            if(!IsPostBack)
            {
                count.Text = BLL.OnlineQuote.CheckWebCartCount(renew.cartId, 0);
                int spouse = int.Parse(BLL.OnlineQuote.CheckWebCartCount(renew.cartId, 1));
                int children = int.Parse(BLL.OnlineQuote.CheckWebCartCount(renew.cartId, 2));
                depCount.Text = (spouse + children).ToString(); 
                BLL.OnlineQuote.setDollarSubsidyMed(renew.cartId);
                pageSetup();
            }
            message.Text = "";
            RadWindow3.VisibleOnPageLoad = false;
        }

        protected void change_Command(object sender, CommandEventArgs e)
        {
            type = BLL.Plan.GetPlanTypesByErId(EmployerId, e.CommandName.Equals("next") ? "Y" : "N", type, true);
            selectPlans.Rebind();
            planSelection.Rebind();
        }

        public bool saveToRenewal(int state)
        {
            return BLL.OnlineQuote.updateRenewal(renew.renewalId, state, renew.isPercent, renew.isOverAll);
        }

        protected void selectPlans_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            selectPlans.DataSource = BLL.OnlineQuote.getSubsidyByType(renew.cartId, EmployerId, type, 0, renew.isPercent);
        }

        public void pageSetup()
        {
            rdlPerType.SelectedIndex = renew.isOverAll == "Y" ? 0 : 1;
            RadioButtonList2.SelectedIndex = renew.isPercent == "Y" ? 0 : 1;
            if (renew.isPercent == "N")
            {
                decimal[] dollar = BLL.OnlineQuote.getDollars(renew.cartId);
                dollarCont.Text = dollar[0].ToString();
                dollarDepCont.Text = dollar[1].ToString();
                overallDollar.Style["display"] = "inline";
                overallContribution.Style["display"] = "none";
                perPlanType.Style["display"] = "none";
            }
            else if (renew.isOverAll == "N")
            {
                DataTable dt = BLL.OnlineQuote.getERPlanTypeConts(renew.cartId);
                for (int i = 1; i < 6; i++)
                {
                    (perPlanType.FindControl("top_" + i) as TextBox).Text = dt.Rows[i - 1].ItemArray[0].ToString();
                    (perPlanType.FindControl("bot_" + i) as TextBox).Text = dt.Rows[i - 1].ItemArray[1].ToString();
                }
                overallDollar.Style["display"] = "none";
                overallContribution.Style["display"] = "none";
                perPlanType.Style["display"] = "inline";
            }
            else
            {
                int[] percent = BLL.OnlineQuote.getPercent(renew.cartId);
                overAllContEE.Text = percent[0].ToString();
                overAllContDep.Text = percent[1].ToString();
                overallDollar.Style["display"] = "none";
                overallContribution.Style["display"] = "inline";
                perPlanType.Style["display"] = "none";
            }
        }

        protected void update_Click(object sender, EventArgs e)
        {
            string tmp1, tmp2;
            if (renew.isPercent=="N")
            {
                tmp1 = string.IsNullOrEmpty(dollarCont.Text) ? "0" : dollarCont.Text;
                tmp2 = string.IsNullOrEmpty(dollarDepCont.Text) ? "0" : dollarDepCont.Text;
                BLL.OnlineQuote.UpdateEmployerDollar(renew.cartId, tmp1, tmp2);
                if (type == 1)
                    BLL.OnlineQuote.setDollarSubsidyMed(renew.cartId);
            }
            else if (renew.isOverAll=="N")
            {
                for (int i = 1; i < 6; i++)
                {
                    tmp1 = (perPlanType.FindControl("top_" + i) as TextBox).Text;
                    tmp2 = (perPlanType.FindControl("bot_" + i) as TextBox).Text;
                    BLL.OnlineQuote.InsertPlanTypeContributions(renew.cartId, i == 5 ? i + 3 : i,
                        string.IsNullOrEmpty(tmp1) ? "0" : tmp1, string.IsNullOrEmpty(tmp2) ? "0" : tmp2, "N");
                }
            }
            else
            {
                tmp1 = string.IsNullOrEmpty(overAllContEE.Text) ? "0" : overAllContEE.Text;
                tmp2 = string.IsNullOrEmpty(overAllContDep.Text) ? "0" : overAllContDep.Text;
                BLL.OnlineQuote.UpdateEmployerContributions(renew.cartId, tmp1, tmp2, "N");
            }
            BLL.OnlineQuote.setSubsidy(renew.cartId);
            renew.isPercent = RadioButtonList2.SelectedValue == "1" ? "Y" : "N";
            renew.isOverAll = rdlPerType.SelectedValue == "1" ? "Y" : "N";
            BLL.OnlineQuote.updateRenewal(renew.renewalId, renew.state, renew.isPercent, renew.isOverAll);
            selectPlans.Rebind();
            pageSetup();
        }

        protected void selectPlans_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
                //int pId=int.Parse();
                if (BLL.OnlineQuote.DeleteRenewalPlan(renew.cartId, dataItem["planId"].Text))
                {
                    //check paired plans table and add the necessary plans 
                    //if (pId == 8625)
                    //    BLL.OnlineQuote.DeleteRenewalPlan(renew.cartId, 8627);
                    selectPlans.Rebind();
                }
            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            foreach (GridDataItem item in planSelection.SelectedItems)
            {
                BLL.OnlineQuote.InsertRenewalPlan(renew.cartId, item["planId"].Text);
                //check paired plans table and add the necessary plans 
                //if (item["planId"].Text == "8625")
                //    BLL.OnlineQuote.InsertRenewalPlan(renew.cartId, "8627");
            }
            RadWindow3.VisibleOnPageLoad = false;
            selectPlans.Rebind();
        }

        protected void rdlPerType_SelectedIndexChanged(object sender, EventArgs e)
        {
            renew.isOverAll = rdlPerType.SelectedValue == "1" ? "Y" : "N";
            renew.isPercent = RadioButtonList2.SelectedValue == "1" ? "Y" : "N";
            BLL.OnlineQuote.updateRenewal(renew.renewalId, renew.state, renew.isPercent, renew.isOverAll);
            if (renew.isPercent == "Y")
            {
                overallContribution.Style["display"] = rdlPerType.SelectedValue == "1" ? "inline" : "none";
                perPlanType.Style["display"] = rdlPerType.SelectedValue == "1" ? "none" : "inline";
                dollarCont.Text = dollarDepCont.Text = "";
                if (renew.isOverAll == "Y")
                {
                    resetInput();
                    BLL.OnlineQuote.deleteEmployerPlanTypes(renew.cartId);
                }
                else
                    overAllContEE.Text = overAllContDep.Text = "";
            }
            selectPlans.Rebind();
        }

        protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            renew.isPercent = RadioButtonList2.SelectedValue == "1" ? "Y" : "N";
            BLL.OnlineQuote.updateRenewal(renew.renewalId, renew.state, renew.isPercent, renew.isOverAll);
            BLL.OnlineQuote.changeDollarPercent(renew.cartId, renew.isPercent);
            if (renew.isPercent == "Y")
            {
                dollarCont.Text = dollarDepCont.Text = "";
                overallContribution.Style["display"] = rdlPerType.SelectedValue == "1" ? "inline" : "none";
                perPlanType.Style["display"] = rdlPerType.SelectedValue == "1" ? "none" : "inline"; ;
                overallDollar.Style["display"] = "none";
            }
            else
            {
                resetInput();
                overAllContEE.Text = overAllContDep.Text = "";
                overallContribution.Style["display"] = "none";
                perPlanType.Style["display"] = "none";
                overallDollar.Style["display"] = "inline";
            }
            selectPlans.Rebind();
        }

        public void resetInput()
        {
            top_1.Text = top_2.Text = top_3.Text = top_4.Text = top_5.Text =
                bot_1.Text = bot_2.Text = bot_3.Text = bot_4.Text = "";
        }

        protected void addPlan_Click(object sender, EventArgs e)
        {
            planSelection.DataSource = BLL.OnlineQuote.getSubsidyByType(renew.cartId, EmployerId, type, 1, renew.isPercent);
            planSelection.DataBind();
            if (type == 7 && selectPlans.Items.Count > 0)
            {
                message.Text = Common.Utilities.FormatNote("You can only add one medical term life plan. If you wish to add another plan, remove plan below and click on Add More Plans");
                return;
            }
            RadWindow3.VisibleOnPageLoad = true;
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            //TODO remove basePlan, ofBasePlan and redo rates
            if (renew.isPercent == "Y" && saveToRenewal(3))
                Response.Redirect("/Employer/ContributionType.aspx");
            saveToRenewal(2);
            Response.Redirect("/Employer/Contribution.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (saveToRenewal(renew.state))
                Response.Redirect("/Employer/BusinessInfo.aspx");
        }

        protected void Continue_Click(object sender, EventArgs e)
        {
            if(renew.isPercent=="Y")
                BLL.OnlineQuote.updateOfBase(renew.cartId, renew.contributionId == 2 ? "Y" : "N");
            if (saveToRenewal(++renew.state))
                Response.Redirect("/Employer/RenewalOverview.aspx");
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            if (BLL.OnlineQuote.TransferErToQuote(renew.cartId, EmployerId) &&
                BLL.OnlineQuote.updateRenewal(renew.renewalId, 1, null, null))
                Response.Redirect("/Employer/RenewalAtoA.aspx");
        }

        protected void type_Command(object sender, CommandEventArgs e)
        {
            foreach (Control item in typeList.Controls)
            {
                if (item is HtmlGenericControl)
                {
                    HtmlControl li = (HtmlControl)item;
                    string className = li.Attributes["class"].ToString();
                    li.Attributes.Add("class", item.ID.Equals("l" + e.CommandName) ? "selected" : className.Replace("selected", ""));
                }
            }
            type = int.Parse(e.CommandName);
            selectPlans.Rebind();
        }

        protected void compare_Click(object sender, EventArgs e)
        {
            BLL.OnlineQuote.DeleteAllCompareCart(renew.cartId);
            if (selectPlans.SelectedItems.Count==0)
            {
                windowmessage.Text = Common.Utilities.FormatError("No plans were selected.");
            }
            else
            {
                foreach (GridDataItem item in selectPlans.MasterTableView.Items)
                {
                    if (item.Selected)
                    {
                        BLL.OnlineQuote.InsertCompareCart(renew.cartId, item["planId"].Text);
                    }
                }
                string js = "window.open('/PlanDescription.aspx?date=" + renew.effectiveDate.ToShortDateString() + "', 'popup_window', 'width=1200, height=700, left=100, top=50, resizable=yes');";
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script", js, true);
            }
        }
    }
}