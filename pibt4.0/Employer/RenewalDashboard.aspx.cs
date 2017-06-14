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
using System.Drawing;

namespace Pibt.Employer
{
    public partial class RenewalDashboard : BasePage
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
            { Session["renewal"] = value; }
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

        public decimal minTotal { get { return BLL.OnlineQuote.minRequirement(renew.cartId); } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (renew == null)
                Response.Redirect("/Employer/Plans.aspx");
            if (!IsPostBack)
            {
                //display employee and dependent count at the top. 
                count.Text = BLL.OnlineQuote.CheckWebCartCount(renew.cartId, 0);
                pageSetup();
            }
            if (c_Approach.SelectedIndex == 2)
            {
                Decimal[] dollar = BLL.OnlineQuote.getDollars(renew.cartId);
                addPlan.Enabled = dollar[0] != 0;
            }
            else
                addPlan.Enabled = true;

            windowMessage.Text = message.Text= "";
            radWindow.VisibleOnPageLoad = false;
        }

        public void pageSetup()
        {
            //section 3. 
            cs_Basis.Enabled = renew.isPercent == "Y";
            cs_Basis.SelectedValue = renew.contributionId!=0 ? renew.contributionId.ToString(): "3";

            //section 2. 
            if (renew.isPercent == "N")
            {
                Decimal[] dollar = BLL.OnlineQuote.getDollars(renew.cartId);
                dollarCont.Text = dollar[0].ToString();
                dollarDepCont.Text = dollar[1].ToString();
                c_Approach.SelectedIndex = 2;//section 1.
                overallDollar.Visible = true;
                minRequired.Text = minRequirement();
                overallContribution.Visible = perPlanType.Visible = false;
            }
            else if (renew.isOverAll == "N")
            {
                DataTable dt = BLL.OnlineQuote.getERPlanTypeConts(renew.cartId);
                TextBox tb1, tb2; 
                for (int i = 1; i < 6; i++)
                {
                    tb1 = perPlanType.FindControl("top_" + i) as TextBox;
                    tb1.Text = dt.Rows[i-1].ItemArray[0] != null ? dt.Rows[i - 1].ItemArray[0].ToString() : "";
                    tb2 = perPlanType.FindControl("bot_" + i) as TextBox;
                    tb2.Text = dt.Rows[i - 1].ItemArray[1] != null ? dt.Rows[i - 1].ItemArray[1].ToString() : "";
                }
                c_Approach.SelectedIndex = 1;//section 1.
                perPlanType.Visible = true;
                overallContribution.Visible = overallDollar.Visible = false;
            }
            else
            {
                int[] percent = BLL.OnlineQuote.getPercent(renew.cartId);
                overAllContEE.Text = percent[0].ToString();
                overAllContDep.Text = percent[1].ToString();
                c_Approach.SelectedIndex = 0;//section 1.
                overallContribution.Visible = true;
                overallDollar.Visible = perPlanType.Visible = false;
            }

            //section 4 
            selectPlans.Columns[7].Display = renew.contributionId == 1 && c_Approach.SelectedIndex != 2;
        }

        public void resetInput()
        {
            top_1.Text = top_2.Text = top_3.Text = top_4.Text = top_5.Text =
                bot_1.Text = bot_2.Text = bot_3.Text = bot_4.Text = 
                dollarCont.Text = dollarDepCont.Text = 
                overAllContEE.Text = overAllContDep.Text="";
        }

        protected void c_Approach_SelectedIndexChanged(object sender, EventArgs e)
        {
            resetInput();
            switch (c_Approach.SelectedIndex)
            {
                case 0://overall percentage
                    renew.isOverAll = renew.isPercent ="Y";
                    overallContribution.Visible = cs_Basis.Enabled = true;
                    perPlanType.Visible = overallDollar.Visible = false;
                    selectPlans.Columns[7].Display = renew.contributionId==1;
                    BLL.OnlineQuote.deleteEmployerPlanTypes(renew.cartId);
                    BLL.OnlineQuote.changeDollarPercent(renew.cartId, "Y");
                    overAllContEE.Text = "50";
                    overAllContDep.Text = "0";
                    update_Click(null,null);
                    break;
                case 1://per plan type percentage
                    renew.isOverAll = "N";
                    renew.isPercent = "Y";
                    perPlanType.Visible = cs_Basis.Enabled = true;
                    overallDollar.Visible = overallContribution.Visible = false;
                    selectPlans.Columns[7].Display = renew.contributionId == 1;
                    BLL.OnlineQuote.changeDollarPercent(renew.cartId, renew.isPercent);
                    TextBox t1, t2;
                    for (int i = 1; i < 6; i++)
                    {
                        t1 = perPlanType.FindControl("top_" + i) as TextBox;
                        t1.Text = "50";
                        t2 = perPlanType.FindControl("bot_" + i) as TextBox;
                        t2.Text = "0";
                    }
                    update_Click(null, null);
                    break;
                default://overall dollar
                    renew.isPercent = "N";
                    overallDollar.Visible = true;
                    overallContribution.Visible = perPlanType.Visible = cs_Basis.Enabled = selectPlans.Columns[7].Display = false;
                    minRequired.Text = minRequirement();
                    BLL.OnlineQuote.changeDollarPercent(renew.cartId, renew.isPercent);
                    break;
            }
            BLL.OnlineQuote.updateRenewal(renew.renewalId, renew.state, renew.isPercent, renew.isOverAll);
        }

        protected void cs_Basis_SelectedIndexChanged(object sender, EventArgs e)
        {
            renew.contributionId = int.Parse(cs_Basis.SelectedValue);
            switch (renew.contributionId)
            {
                case 1:
                    BLL.OnlineQuote.updateOfBase(renew.cartId, "N");
                    selectPlans.Columns[7].Display = true;
                    break;
                case 2:
                    if (renew.isOverAll == "Y")
                        BLL.OnlineQuote.DeleteAllEmployerPlanType(renew.cartId);
                    else
                        BLL.OnlineQuote.removeBasePlans(renew.cartId);
                    BLL.OnlineQuote.updateOfBase(renew.cartId, "Y");
                    selectPlans.Columns[7].Display = false;;
                    break;
                default:
                    BLL.OnlineQuote.removeBasePlans(renew.cartId);
                    if(renew.isOverAll=="Y")
                        BLL.OnlineQuote.DeleteAllEmployerPlanType(renew.cartId);
                    BLL.OnlineQuote.updateOfBase(renew.cartId, "N");
                    selectPlans.Columns[7].Display = false;
                    break;
            }
            BLL.OnlineQuote.updateRenewalCont(renew.renewalId, renew.state, renew.contributionId);
            selectPlans.Rebind();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            string tmp1, tmp2;
            if (renew.isPercent == "N")
            {
                tmp1 = string.IsNullOrEmpty(dollarCont.Text) ? "0" : dollarCont.Text;
                tmp2 = string.IsNullOrEmpty(dollarDepCont.Text) ? "0" : dollarDepCont.Text;
                BLL.OnlineQuote.UpdateEmployerDollar(renew.cartId, tmp1, tmp2);
                BLL.OnlineQuote.setSubsidy(renew.cartId);
                //if excess exist add excess to all plans 
            }
            else if (renew.isOverAll == "N")
            {
                for (int i = 1; i < 6; i++)
                {
                    tmp1 = (perPlanType.FindControl("top_" + i) as TextBox).Text;
                    tmp2 = (perPlanType.FindControl("bot_" + i) as TextBox).Text;
                    BLL.OnlineQuote.InsertPlanTypeContributions(renew.cartId, i == 5 ? i + 3 : i,
                        string.IsNullOrEmpty(tmp1) ? "0" : tmp1, string.IsNullOrEmpty(tmp2) ? "0" : tmp2, cs_Basis.SelectedValue=="2"?"Y" : "N"); //last argument is ofBase
                }
                BLL.OnlineQuote.setSubsidy(renew.cartId);
            }
            else
            {
                tmp1 = string.IsNullOrEmpty(overAllContEE.Text) ? "0" : overAllContEE.Text;
                tmp2 = string.IsNullOrEmpty(overAllContDep.Text) ? "0" : overAllContDep.Text;
                BLL.OnlineQuote.setSubsidy(renew.cartId);
                BLL.OnlineQuote.UpdateEmployerContributions(renew.cartId, tmp1, tmp2, cs_Basis.SelectedValue == "2" ? "Y" : "N"); //last argument is ofBase
            }
            selectPlans.Rebind();
        }

        protected void selectPlans_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            mtlMessage.Visible = type == 7;
            selectPlans.DataSource = renew.isPercent == "Y" || type == 6 || type == 7
                ? BLL.OnlineQuote.getSubsidyByType(renew.cartId, EmployerId, type, 0, renew.isPercent)
                : BLL.OnlineQuote.getsubsidyByDollar(renew.cartId, type);
        }

        protected void selectPlans_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.Item;
            switch (e.CommandName)
            {
                case "base":
                    BLL.OnlineQuote.updateBasePlan(renew.cartId, dataItem["planId"].Text, type.ToString());
                    break;
                case "delete":
                    BLL.OnlineQuote.DeleteRenewalPlan(renew.cartId, dataItem["planId"].Text);
                    break;
                default:
                    break;
            }
            if (renew.isPercent == "N")
                minRequired.Text = minRequirement();
            selectPlans.Rebind();
        }

        protected void type_Command(object sender, CommandEventArgs e)
        {
            tab_command(typeList, e.CommandName);
            type = int.Parse(e.CommandName);
            if(renew.contributionId == 1)
                selectPlans.Columns[7].Display = type != 6 && type != 7;
            if (renew.isPercent == "N")
                selectPlans.Columns[7].Display = false;
            if (selectPlans.Visible)
                selectPlans.Rebind();
            else
                eePlans.Rebind();
        }

        protected void addPlan_Click(object sender, EventArgs e)
        {
            if(type == 7 && selectPlans.Items.Count>0)
            {
                message.Text = Common.Utilities.FormatError("You can only add one medical term life plan. If you wish to add another plan, remove plan below and click on Add More Plans");
                return;
            }
            mtlMessage2.Visible = type == 7;
            planSelection.AllowMultiRowSelection = type != 7;
            planSelection.DataSource = BLL.OnlineQuote.getSubsidyByType(renew.cartId, EmployerId, type, 1, renew.isPercent);
            planSelection.DataBind();
            radWindow.VisibleOnPageLoad = true;
        }

        protected void compare_Click(object sender, EventArgs e)
        {
            BLL.OnlineQuote.DeleteAllCompareCart(renew.cartId);
            if (selectPlans.SelectedItems.Count == 0)
            {                
                message.Text = Common.Utilities.FormatError("No plans were selected.");
                return;
            }
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

        protected void add_Click(object sender, EventArgs e)
        {
            string error;
            foreach (GridDataItem item in planSelection.SelectedItems)
            {
                if (CurrentUserInfo.AgencyId != "4") //GA excluded from all checks
                {
                    error = planRules(item); 
                    if (!string.IsNullOrEmpty(error))
                    {
                        selectPlans.Rebind();
                        message.Text = Common.Utilities.FormatError(error);
                        return;
                    }
                }
                BLL.OnlineQuote.InsertRenewalPlan(renew.cartId, item["planId"].Text);
            }
            radWindow.VisibleOnPageLoad = false;
            if(renew.isPercent == "N")
                minRequired.Text = minRequirement();
            selectPlans.Rebind();
        }

        protected void selectPlans_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if(e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (renew.isPercent == "Y" && renew.contributionId == 1 )
                {
                    string basePlan = BLL.OnlineQuote.getBasePlanId(renew.cartId, type.ToString());
                    if (item["planId"].Text.Equals(basePlan))
                    {
                        Button btn = (Button)item["btn"].Controls[0];
                        btn.Enabled = false;
                        btn.BackColor = System.Drawing.Color.Red;
                        btn.Text = "Base Plan";
                    }
                }

                if(renew.isPercent == "N" )
                {
                    decimal excess = string.IsNullOrEmpty(dollarCont.Text) ? 0 :decimal.Parse(dollarCont.Text) - decimal.Parse(minRequired.Text);
                    if (excess > 0 && type !=6 && type !=7)
                    {
                        decimal aggr = excess * (BLL.OnlineQuote.getMinPerPlanType(renew.cartId, type) / minTotal) * decimal.Parse(count.Text);
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

        public string minRequirement()
        {
             return (minTotal / decimal.Parse(count.Text)).ToString("0.00");
        }

        protected void eePlans_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            selectPlans.Rebind();
            eePlans.DataSource = createDataTable(BLL.OnlineQuote.renewalPlanNames(renew.cartId, type), BLL.OnlineQuote.eeLevelData(renew.cartId, type));
        }

        public DataTable createDataTable(DataTable names, DataTable data)
        {
            DataTable ee = new DataTable();
            ee.Columns.Add(new DataColumn("Employee Name", typeof(string)));

            foreach (DataRow r in names.Rows)
            {
                ee.Columns.Add(new DataColumn(r.ItemArray[0].ToString(), typeof(string)));
            }
            string[] eeArray = new string[names.Rows.Count + 1];
            string[] depArray = new string[names.Rows.Count + 1];
            string familyId = "";
            bool hasDep = false;
            int x = 0, y = 0;
            foreach (DataRow r in data.Rows)
            {
                if (!familyId.Equals(r.ItemArray[0].ToString()))
                {
                    if (data.Rows[0] != r)
                    {
                        ee.Rows.Add(eeArray);
                        if (hasDep)
                            ee.Rows.Add(depArray);
                    }
                    familyId = r.ItemArray[0].ToString();
                    x = y = 0;
                    eeArray[x++] = r.ItemArray[1].ToString();
                    hasDep = decimal.Parse(r.ItemArray[8].ToString()) > 0;
                    if (hasDep)
                        depArray[y++] = tier(r.ItemArray[1].ToString(),r.ItemArray[3].ToString(), r.ItemArray[4].ToString());
                }
                eeArray[x++] = "$"+(decimal.Parse(r.ItemArray[7].ToString()) - decimal.Parse(r.ItemArray[9].ToString())).ToString("0.00");
                if (hasDep)
                    depArray[y++] = "$" + (decimal.Parse(r.ItemArray[8].ToString()) - decimal.Parse(r.ItemArray[10].ToString())).ToString("0.00");
            }
            ee.Rows.Add(eeArray);
            if(hasDep)
                ee.Rows.Add(depArray);
            return ee;
        }

        public string tier(string fName, string spouse, string children)
        {
            string tier;
            int sp = int.Parse(spouse);
            int ch = int.Parse(children);
            tier = "<span>" + fName.Split(',')[0]+"'S&nbsp;";
            tier += sp > 0 && ch > 0
                ? "FAMILY"
                : sp > 0
                    ? "SPOUSE"
                    : ch>1
                        ? "CHILDREN"
                        : "CHILD";
            return tier+"</span>";
        }

        protected void eePlans_PreRender(object sender, EventArgs e)
        {
            decimal lowest = 0;
            int x=3;
            TableCell tc = new TableCell();
            bool isDep = false;
            decimal excess = 0;
            //if dollar cont then calculate excess
            if(renew.isPercent=="N")
                excess = decimal.Parse(dollarCont.Text) - decimal.Parse(minRequired.Text);

            for (int i = 0; i < eePlans.Items.Count; i++)
            {
                isDep = eePlans.Items[i].Cells[2].Text.Contains("<sp");
                lowest = 0;
                if (!isDep)
                    x = 3;

                for (int j = 3; j < eePlans.Items[i].Cells.Count; j++)
                {
                    tc = eePlans.Items[i].Cells[j];
                    tc.HorizontalAlign = HorizontalAlign.Right;
                    if (!isDep)
                    {
                        if (j == 3)
                            lowest = decimal.Parse(tc.Text.Remove(0, 1));
                        if (lowest != 0 && lowest > decimal.Parse(tc.Text.Remove(0, 1)))
                        {
                            lowest = decimal.Parse(tc.Text.Remove(0, 1));
                            x = j;
                        }
                    }

                    if (!isDep && renew.isPercent == "N" && excess > 0 && type != 6 && type != 7)
                    {
                        tc.Text = (decimal.Parse(tc.Text.Remove(0, 1)) - excess * (BLL.OnlineQuote.getMinPerPlanType(renew.cartId, type) / minTotal)).ToString("C");
                    }
                }
                if (renew.isPercent=="Y" && renew.contributionId == 2)
                {
                    tc = eePlans.Items[i].Cells[x];
                    tc.BackColor = Color.DimGray;
                    tc.ForeColor = Color.White;
                }
                
            }
        }

        protected void eePlans_ColumnCreated(object sender, GridColumnCreatedEventArgs e)
        {
            string cPlanName = e.Column.HeaderText;
            string basePlan = BLL.OnlineQuote.getBasePlanId(renew.cartId, type.ToString());

            //sets the layout for the first cell of the grid
            if (cPlanName.Equals("Employee Name"))
            {
                e.Column.HeaderText = "<div style=\"height:100%; width:100%\"><div style=\"text-align:right; border-bottom: 1px solid; display:block; height:30px; color:#aaaaaa;\">Total EE Monthly Cost</div><div style=\"text-align:center; height:70px; padding-top:34px \">" + cPlanName + "</div></div>";
            }

            //sets total amount in the header for each plantype
            foreach (GridDataItem item in selectPlans.Items)
            {
                if (cPlanName.Equals(item["planName"].Text))
                {
                    e.Column.HeaderText = "<div style=\"height:100%; width:100%\"><div style=\"border-bottom: 1px solid; display:block; height:30px;color:#aaaaaa;\">" + item["eePays"].Text + "</div><div style=\"text-align:center; height:70px;\">" + cPlanName + "</div></div>";

                    //if this plan is the base plan then alter the style 
                    if (renew.isPercent=="Y" && !string.IsNullOrEmpty(basePlan) && basePlan.Equals(item["planId"].Text))
                    {
                        e.Column.ItemStyle.BackColor = Color.DimGray;
                        e.Column.ItemStyle.BorderColor = Color.DimGray;
                        e.Column.ItemStyle.ForeColor = Color.White;
                    }
                    break;
                }
            }
        }

        protected void eeLevel_Click(object sender, EventArgs e)
        {
            if (selectPlans.Visible && selectPlans.Items.Count == 0)
            {
                message.Text = Common.Utilities.FormatError("No plans to view employee details.");
                return;
            }
            c_Approach.Enabled = !c_Approach.Enabled;
            switch (c_Approach.SelectedIndex)
            {
                case 0://overall percentage
                    overAllContEE.Enabled = !overAllContEE.Enabled;
                    overAllContDep.Enabled = !overAllContDep.Enabled;
                    break;
                case 1://per plan type percentage 
                    for (int i = 1; i < 6; i++)
                    {
                        (perPlanType.FindControl("top_" + i) as TextBox).Enabled = c_Approach.Enabled;
                        (perPlanType.FindControl("bot_" + i) as TextBox).Enabled = c_Approach.Enabled;
                    }
                    break;
                default://dollar 
                    dollarCont.Enabled = !dollarCont.Enabled;
                    dollarDepCont.Enabled = !dollarDepCont.Enabled;
                    break;
            }
            update.Enabled = !update.Enabled;
            cs_Basis.Enabled = !cs_Basis.Enabled;
            buttons.Visible = !buttons.Visible;
            addPlan.Visible = compare.Visible = !addPlan.Visible;
            erLevel.Visible = !erLevel.Visible;
            selectPlans.Visible = !selectPlans.Visible;
            eePlans.Visible = !eePlans.Visible;
            if (selectPlans.Visible){
                //dispose of eeplans 
                selectPlans.Rebind();
                eePlans.DataSource = new string[] { };
                eePlans.DataBind();
            }
            else
                eePlans.Rebind();
        }

        public bool saveToRenewal(int state)
        {
            renew.state = state;
            return BLL.OnlineQuote.updateRenewal(renew.renewalId, state, renew.isPercent, renew.isOverAll);
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            if(renew.isPercent =="Y" && saveToRenewal(3))
                Response.Redirect("/Employer/ContributionType.aspx");
            saveToRenewal(2);
            Response.Redirect("/Employer/Contribution.aspx");
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            if (BLL.OnlineQuote.TransferErToQuote(renew.cartId, EmployerId) &&
                BLL.OnlineQuote.updateRenewal(renew.renewalId, 1, null, null))
                Response.Redirect("/Employer/RenewalAtoA.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (saveToRenewal(renew.state))
                Response.Redirect("/Employer/BusinessInfo.aspx");
        }

        protected void Continue_Click(object sender, EventArgs e)
        {
            if(renew.isPercent=="Y" && cs_Basis.SelectedValue=="1" && !BLL.OnlineQuote.hasBasePlans(renew.cartId))
            {
                message.Text = Common.Utilities.FormatError("You must choose a base plan for every benefit type.");
                return;
            }

            update_Click(null, null); //update in case the user did not click on update when entering their new data

            DataTable dt = BLL.OnlineQuote.getRenewalPlanPt(renew.cartId);
            if (dt.Rows.Count < 1)
            {
                message.Text = Common.Utilities.FormatError("You must add at least one plan of any benefit type");
                return;
            }

            if (renew.isPercent == "Y")
                BLL.OnlineQuote.updateOfBase(renew.cartId, renew.contributionId == 2 ? "Y" : "N");

            if (saveToRenewal(++renew.state))
            {
                Response.Redirect("/Employer/RenewalOverview.aspx");
            }
        }

        public string planRules(GridDataItem item)
        {
            string error="";
            string carrierId = item["carrierId"].Text;
            switch(item["planTypeId"].Text)
            {
                case "1":
                    if (carrierId == "4")
                    {
                        string subPlanType = item["subPlanTypeId"].Text;
                        if (subPlanType == "13" || subPlanType == "15" || subPlanType == "19")
                        {
                            error = loopForSubPlans(planSelection.SelectedItems, subPlanType,"","");
                            if (!string.IsNullOrEmpty(error))
                                break;
                            error = loopForSubPlans(selectPlans.Items, subPlanType,"","");
                        }
                    }
                    break;
                case "2":
                    if (carrierId == "29")
                    {
                        error = loopForSubPlans(planSelection.SelectedItems, "",carrierId , item["planId"].Text);
                        if (!string.IsNullOrEmpty(error))
                            break;
                        error = loopForSubPlans(selectPlans.Items, "", carrierId, item["planId"].Text);
                    }
                    break;
                case "4":
                    if (carrierId == "20")
                    {
                        error = loopForSubPlans(planSelection.SelectedItems, "", carrierId, item["planId"].Text);
                        if (!string.IsNullOrEmpty(error))
                            break;
                        error = loopForSubPlans(selectPlans.Items, "", carrierId, item["planId"].Text);
                    }
                    break;
            }
            return error;
        }

        public string loopForSubPlans(GridItemCollection items, string subPlanType, string carrierId, string planId)
        {
            string error ="";
            foreach (GridDataItem gdi in items)
            {
                if(!string.IsNullOrEmpty(subPlanType))
                {
                    string compareSub = gdi["subPlanTypeId"].Text;
                    if (compareSub == "13" || compareSub == "15" || compareSub == "19")
                        if (compareSub != subPlanType)
                        {
                            error = "You may offer Access+ HMO plans or LocalAccess+ HMO plans or TrioACO HMO plans but not a combination of any of these plans";
                            break;
                        }
                }
                if(!string.IsNullOrEmpty(carrierId))
                {
                    if(gdi["carrierId"].Text==carrierId && gdi["planId"].Text != planId)
                    {
                        if (type==2)
                            error = "Only one Western Dental plan can be selected";
                        if (type==4)
                            error = "Only one Chiropractic plan can be selected";
                        break;
                    }
                }
            }
            return error;
        }
    }
}