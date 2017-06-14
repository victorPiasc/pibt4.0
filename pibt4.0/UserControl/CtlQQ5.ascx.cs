using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using System.Data;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using System.Drawing;

namespace Pibt.UserControl
{
    //TODO combine with renewal dashboard
    public partial class CtlQQ5 : BaseUserControl
    {
        public int cartId { get; set; }
        public int type //current benefit type
        {
            get
            {
                if (ViewState["type"] == null)
                    return 1;
                return int.Parse(ViewState["type"].ToString());
            }
            set { ViewState["type"] = value; }
        }
        public bool display { get; set; }

        //the cost of 50% of the lowest priced plan
        public decimal minTotal { get { return BLL.OnlineQuote.minRequirement(cartId); } }

        protected void Page_Load(object sender, EventArgs e)
        {
            message.Text = "";
            if(c_Approach.SelectedIndex == 2)
            {
                Decimal[] dollar = BLL.OnlineQuote.getDollars(cartId);
                addPlan.Enabled = dollar[0] != 0;
            }
            else 
                addPlan.Enabled = true;

            update.Visible = addPlan.Visible = c_Approach.Enabled = cs_Basis.Enabled = overallContribution.Enabled = effectiveDate.Visible = !display;
        }

        public void pageSetup(string zip)
        {
            empZip.Text = zip;
            ListItem li = new ListItem();//add 3 months to the drop down
            for (int i = 1; i < 4; i++)
            {
                li = new ListItem(DateTime.Parse(DateTime.Now.Date.AddMonths(i).ToString("MM/01/yyyy")).ToString("MM/dd/yyyy"));
                effectiveDate.Items.Add(li);
            }
            Session["effectiveDate"] = effectiveDate.SelectedValue;
            eeCount.Text = BLL.OnlineQuote.CheckWebCartCount(cartId, 0); //number of employees
            int tmp = int.Parse(BLL.OnlineQuote.CheckWebCartCount(cartId, 1)) + int.Parse(BLL.OnlineQuote.CheckWebCartCount(cartId, 2)); //number of dependents
            depCount.Text = tmp.ToString();

            //[0]=isOverall [1]=ofBase [2]= basePlan [3]=dollar
            string[] arr = BLL.OnlineQuote.web_setUpPage(cartId);//page setup 
            //section A Contribution approach
            c_Approach.SelectedIndex = arr[3] == "Y"
                ? 2
                : arr[0] == "Y"
                    ? 1
                    : 0;
            //section C Contribution basis
            cs_Basis.SelectedIndex = arr[2] == "Y"
                ? 1
                : arr[1] == "Y"
                    ? 0
                    : 2;
            //Section B Adjust Contribution
            switch (c_Approach.SelectedIndex)
            {
                case 0://overall percent
                    int[] percent = BLL.OnlineQuote.getPercent(cartId);
                    overAllEE.Text = percent[0].ToString();
                    overAllDep.Text = percent[1].ToString();
                    overallContribution.Visible = true;
                    overallDollar.Visible = perPlanType.Visible = false;
                    break;
                case 1://per planType
                    DataTable dt = BLL.OnlineQuote.getERPlanTypeConts(cartId);
                    TextBox tb1, tb2;
                    for (int i = 1; i < 6; i++)
                    {
                        tb1 = perPlanType.FindControl("top_" + i) as TextBox;
                        tb1.Text = dt.Rows[i - 1].ItemArray[0] != null ? dt.Rows[i - 1].ItemArray[0].ToString() : "";
                        tb2 = perPlanType.FindControl("bot_" + i) as TextBox;
                        tb2.Text = dt.Rows[i - 1].ItemArray[1] != null ? dt.Rows[i - 1].ItemArray[1].ToString() : "";
                    }
                    perPlanType.Visible = true;
                    overallContribution.Visible = overallDollar.Visible = false;
                    break;
                default://dollar
                    Decimal[] dollar = BLL.OnlineQuote.getDollars(cartId);
                    dollarCont.Text = dollar[0].ToString();
                    dollarDepCont.Text = dollar[1].ToString();
                    overallDollar.Visible = true;
                    overallContribution.Visible = perPlanType.Visible = false;
                    minRequired.Text = minRequirement();
                    cs_Basis.Enabled = false;
                    break;
            }
            //Section D Select Benefit Type
            plansGrid.Columns[8].Display = cs_Basis.SelectedIndex == 1;
            BLL.OnlineQuote.setQuickQuoteRates(cartId, effectiveDate.SelectedIndex, 'N', type);//sets both the rates and the subsidy table 
            plansGrid.Rebind();
        }

        public bool validatePage()
        {
            update_Click(null, null); //update in case the user did not click on update when entering their new data

            if (c_Approach.SelectedIndex != 2 && cs_Basis.SelectedIndex == 1 && !BLL.OnlineQuote.hasBasePlans(cartId)) //if base plan, make sure each plan has base plan where available
            {
                message.Text = Common.Utilities.FormatError("You must choose a base plan for every benefit type.");
                return false;
            }

            DataTable dt = BLL.OnlineQuote.getRenewalPlanPt(cartId); //check to see that the user has added at least one plan to the cart
            if (dt.Rows.Count < 1)
            {
                message.Text = Common.Utilities.FormatError("You must add at least one plan of any benefit type");
                return false;
            }

            return true;
        }

        protected void effectiveDate_SelectedIndexChanged(object sender, EventArgs e)
        {
            BLL.OnlineQuote.setQuickQuoteRates(cartId, effectiveDate.SelectedIndex, 'N', type);
            Session["effectiveDate"] = effectiveDate.SelectedValue;
            plansGrid.Rebind();
        }

        protected void c_Approach_SelectedIndexChanged(object sender, EventArgs e)
        {
            resetInput();
            switch (c_Approach.SelectedIndex)
            {
                case 0://overall percentage
                    overallContribution.Visible = cs_Basis.Enabled = true;
                    perPlanType.Visible = overallDollar.Visible = false;
                    plansGrid.Columns[8].Display = cs_Basis.SelectedIndex == 1;
                    BLL.OnlineQuote.deleteEmployerPlanTypes(cartId);
                    BLL.OnlineQuote.changeDollarPercent(cartId, "Y");
                    overAllEE.Text = "50";
                    overAllDep.Text = "0";
                    update_Click(null,null);
                    break;
                case 1://per plan type percentage
                    perPlanType.Visible = cs_Basis.Enabled = true;
                    overallDollar.Visible = overallContribution.Visible = false;
                    plansGrid.Columns[8].Display = cs_Basis.SelectedIndex == 1;
                    BLL.OnlineQuote.changeDollarPercent(cartId, "Y");
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
                    overallDollar.Visible = true;
                    overallContribution.Visible = perPlanType.Visible = cs_Basis.Enabled = plansGrid.Columns[8].Display = false;
                    minRequired.Text = minRequirement();
                    BLL.OnlineQuote.changeDollarPercent(cartId, "N");
                    break;
            }
            BLL.OnlineQuote.setQuickQuoteRates(cartId, effectiveDate.SelectedIndex, 'N', type);
            plansGrid.Rebind();
        }

        protected void cs_Basis_SelectedIndexChanged(object sender, EventArgs e)
        {
            switch (cs_Basis.SelectedIndex)
            {
                case 0://lowest cost
                    if (c_Approach.SelectedIndex == 0)
                        BLL.OnlineQuote.DeleteAllEmployerPlanType(cartId);
                    else
                        BLL.OnlineQuote.removeBasePlans(cartId);
                    BLL.OnlineQuote.updateOfBase(cartId, "Y");
                    plansGrid.Columns[8].Display = false;
                    break;
                case 1://base plan
                    BLL.OnlineQuote.updateOfBase(cartId, "N");
                    plansGrid.Columns[8].Display = true;
                    break;
                default://any plan
                    BLL.OnlineQuote.removeBasePlans(cartId);
                    if (c_Approach.SelectedIndex == 0)
                        BLL.OnlineQuote.DeleteAllEmployerPlanType(cartId);
                    BLL.OnlineQuote.updateOfBase(cartId, "N");
                    plansGrid.Columns[8].Display = false;
                    break;
            }
            BLL.OnlineQuote.setQuickQuoteRates(cartId, effectiveDate.SelectedIndex, 'N', type);
            plansGrid.Rebind();
        }

        protected void update_Click(object sender, EventArgs e)
        {
            string tmp1, tmp2;
            switch (c_Approach.SelectedIndex)
            {
                case 0://overall percentage
                    tmp1 = string.IsNullOrEmpty(overAllEE.Text) ? "0" : overAllEE.Text;
                    tmp2 = string.IsNullOrEmpty(overAllDep.Text) ? "0" : overAllDep.Text;
                    //BLL.OnlineQuote.setSubsidy(cartId);
                    BLL.OnlineQuote.UpdateEmployerContributions(cartId, tmp1, tmp2, cs_Basis.SelectedValue == "2" ? "Y" : "N"); //last argument is ofBase
                    break;
                case 1://per plan type percentage
                    for (int i = 1; i < 6; i++)
                    {
                        tmp1 = (perPlanType.FindControl("top_" + i) as TextBox).Text;
                        tmp2 = (perPlanType.FindControl("bot_" + i) as TextBox).Text;
                        BLL.OnlineQuote.InsertPlanTypeContributions(cartId, i == 5 ? i + 3 : i,
                            string.IsNullOrEmpty(tmp1) ? "0" : tmp1, string.IsNullOrEmpty(tmp2) ? "0" : tmp2, cs_Basis.SelectedValue == "2" ? "Y" : "N"); //last argument is ofBase
                    }
                    break;
                default://overall dollar
                    tmp1 = string.IsNullOrEmpty(dollarCont.Text) ? "0" : dollarCont.Text;
                    tmp2 = string.IsNullOrEmpty(dollarDepCont.Text) ? "0" : dollarDepCont.Text;
                    BLL.OnlineQuote.UpdateEmployerDollar(cartId, tmp1, tmp2);
                    addPlan.Enabled = true;
                    //BLL.OnlineQuote.setSubsidy(cartId);
                    break;
            }
            BLL.OnlineQuote.setSubsidy(cartId, type.ToString());
            plansGrid.Rebind();
        }

        protected void type_Command(object sender, CommandEventArgs e)
        {
            tab_command(typeList, e.CommandName);
            type = int.Parse(e.CommandName);
            BLL.OnlineQuote.setSubsidy(cartId, e.CommandName);
            if (cs_Basis.SelectedIndex == 1)
                plansGrid.Columns[8].Display = type != 6 && type != 7;
            if (c_Approach.SelectedIndex == 2)
                plansGrid.Columns[8].Display = false;
            if (plansGrid.Visible)
                plansGrid.Rebind();
            else
                eePlans.Rebind();
        }

        protected void plansGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            RadGrid tmp = (RadGrid)sender;
            tmp.DataSource = c_Approach.SelectedIndex == 2
                ? BLL.OnlineQuote.getQQDollar(cartId, type)
                : BLL.OnlineQuote.Web_QuickQuote(cartId, type, 'Y');
        }

        protected void plansGrid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            GridDataItem dataItem = (GridDataItem)e.Item;
            switch (e.CommandName)
            {
                case "base":
                    BLL.OnlineQuote.updateBasePlan(cartId, dataItem["planId"].Text, type.ToString());
                    break;
                case "delete":
                    BLL.OnlineQuote.DeleteRenewalPlan(cartId, dataItem["planId"].Text);
                    break;
                default:
                    break;
            }
            BLL.OnlineQuote.setSubsidy(cartId, type.ToString());
            if (c_Approach.SelectedIndex == 2)
                minRequired.Text = minRequirement();
            plansGrid.Rebind();
        }

        protected void plansGrid_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (c_Approach.SelectedIndex != 2 && cs_Basis.SelectedIndex == 1)
                {
                    string basePlan = BLL.OnlineQuote.getBasePlanId(cartId, type.ToString());
                    if (item["planId"].Text.Equals(basePlan))
                    {
                        Button btn = (Button)item["btn"].Controls[0];
                        btn.Enabled = false;
                        btn.BackColor = System.Drawing.Color.Red;
                        btn.Text = "Base Plan";
                    }
                }

                if (c_Approach.SelectedIndex == 2)
                {
                    decimal excess = (string.IsNullOrEmpty(dollarCont.Text) ? 0 : decimal.Parse(dollarCont.Text)) - decimal.Parse(minRequired.Text);
                    if (excess > 0 && type != 6 && type != 7)
                    {
                        decimal aggr = excess * (BLL.OnlineQuote.getMinPerPlanType(cartId, type) / minTotal) * decimal.Parse(eeCount.Text);
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

        protected void eePlans_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            plansGrid.Rebind();
            eePlans.DataSource = createDataTable(BLL.OnlineQuote.renewalPlanNames(cartId, type), BLL.OnlineQuote.eeLevelData(cartId, type));
        }

        protected void eePlans_ColumnCreated(object sender, Telerik.Web.UI.GridColumnCreatedEventArgs e)
        {
            string cPlanName = e.Column.HeaderText;
            string basePlan = BLL.OnlineQuote.getBasePlanId(cartId, type.ToString());

            //sets the layout for the first cell of the grid
            if (cPlanName.Equals("Employee Name"))
            {
                e.Column.HeaderText = "<div style=\"height:100%; width:100%\"><div style=\"text-align:right; border-bottom: 1px solid; display:block; height:30px; color:#aaaaaa;\">Total EE Monthly Cost</div><div style=\"text-align:center; height:70px; padding-top:34px \">" + cPlanName + "</div></div>";
            }

            //sets total amount in the header for each plantype
            foreach (GridDataItem item in plansGrid.Items)
            {
                if (cPlanName.Equals(item["planName"].Text))
                {
                    e.Column.HeaderText = "<div style=\"height:100%; width:100%\"><div style=\"border-bottom: 1px solid; display:block; height:30px;color:#aaaaaa;\">" + item["eePays"].Text + "</div><div style=\"text-align:center; height:70px;\">" + cPlanName + "</div></div>";

                    //if this plan is the base plan then alter the style 
                    if (c_Approach.SelectedIndex != 2 && !string.IsNullOrEmpty(basePlan) && basePlan.Equals(item["planId"].Text))
                    {
                        e.Column.ItemStyle.BackColor = Color.DimGray;
                        e.Column.ItemStyle.BorderColor = Color.DimGray;
                        e.Column.ItemStyle.ForeColor = Color.White;
                    }
                    break;
                }
            }
        }

        protected void eePlans_PreRender(object sender, EventArgs e)
        {
            decimal lowest = 0;
            int x = 3;
            TableCell tc = new TableCell();
            bool isDep = false;
            decimal excess = 0;
            //if dollar cont then calculate excess
            if (c_Approach.SelectedIndex == 2)
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

                    if (!isDep && c_Approach.SelectedIndex == 2 && excess > 0 && type != 6 && type != 7)
                        tc.Text = (decimal.Parse(tc.Text.Remove(0, 1)) - excess * (BLL.OnlineQuote.getMinPerPlanType(cartId, type) / minTotal)).ToString("C");
                }
                if (c_Approach.SelectedIndex != 2 && cs_Basis.SelectedIndex == 0)
                {
                    tc = eePlans.Items[i].Cells[x];
                    tc.BackColor = Color.DimGray;
                    tc.ForeColor = Color.White;
                }

            }
        }

        protected void add_Click(object sender, EventArgs e)
        {
            string error;
            foreach (GridDataItem item in planSelection.SelectedItems)
            {
                //get agency from zipcode
                //if (CurrentUserInfo.AgencyId != "4") //GA excluded from all checks
                //{
                error = planRules(item);
                if (!string.IsNullOrEmpty(error))
                {
                    plansGrid.Rebind();
                    popUp1.Style.Add("display", "none");
                    message.Text = Common.Utilities.FormatError(error);
                    return;
                }
                //}
                BLL.OnlineQuote.InsertRenewalPlan(cartId, item["planId"].Text);
            }
            popUp1.Style.Add("display", "none");
            if (c_Approach.SelectedIndex == 2)
                minRequired.Text = minRequirement();
            BLL.OnlineQuote.setSubsidy(cartId, type.ToString());
            plansGrid.Rebind();
        }

        protected void erLevel_Click(object sender, EventArgs e)
        {
            if (plansGrid.Visible && plansGrid.Items.Count == 0)
            {
                message.Text = Common.Utilities.FormatError("No plans to view employee details.");
                return;
            }
            c_Approach.Enabled = !c_Approach.Enabled;
            switch (c_Approach.SelectedIndex)
            {
                case 0://overall percentage
                    overAllEE.Enabled = !overAllEE.Enabled;
                    overAllDep.Enabled = !overAllDep.Enabled;
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
            addPlan.Visible = compare.Visible = !addPlan.Visible;
            plansGrid.Visible = !plansGrid.Visible;
            eePlans.Visible = !eePlans.Visible;
            //submit.Visible = !submit.Visible;
            if (plansGrid.Visible)
            {
                //dispose of eeplans 
                plansGrid.Rebind();
                eePlans.DataSource = new string[] { };
                eePlans.DataBind();
                erLevel.CssClass = "btn";
                erLevel.Text = "Employee Level";
            }
            else
            {
                erLevel.CssClass = "btn-green";
                erLevel.Text = "Return to Employer Level";
                eePlans.Rebind();
            }
        }

        protected void addPlan_Click(object sender, EventArgs e)
        {
            if (type == 7 && plansGrid.Items.Count > 0)
            {
                message.Text = Common.Utilities.FormatError("You can only add one medical term life plan. If you wish to add another plan, remove plan below and click on Add More Plans");
                return;
            }
            planSelection.DataSource = BLL.OnlineQuote.Web_QuickQuote(BLL.OnlineQuote.QQCartId, type, 'N');
            planSelection.DataBind();
            planSelection.AllowMultiRowSelection = type != 7;
            popUp1.Style.Add("display", "inline");
        }

        protected void compare_Click(object sender, EventArgs e)
        {
            BLL.OnlineQuote.DeleteAllCompareCart(cartId);
            if (plansGrid.SelectedItems.Count == 0)
            {
                message.Text = Common.Utilities.FormatError("No plans were selected.");
                return;
            }
            foreach (GridDataItem item in plansGrid.MasterTableView.Items)
                if (item.Selected)
                    BLL.OnlineQuote.InsertCompareCart(cartId, item["planId"].Text);
            string js = "window.open('/PlanDescription.aspx?date=" + effectiveDate.SelectedValue + "', 'popup_window', 'width=1200, height=700, left=100, top=50, resizable=yes');";
            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script", js, true);
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
                        depArray[y++] = tier(r.ItemArray[1].ToString(), r.ItemArray[3].ToString(), r.ItemArray[4].ToString());
                }
                eeArray[x++] = "$" + (decimal.Parse(r.ItemArray[7].ToString()) - decimal.Parse(r.ItemArray[9].ToString())).ToString("0.00");
                if (hasDep)
                    depArray[y++] = "$" + (decimal.Parse(r.ItemArray[8].ToString()) - decimal.Parse(r.ItemArray[10].ToString())).ToString("0.00");
            }
            ee.Rows.Add(eeArray);
            if (hasDep)
                ee.Rows.Add(depArray);
            return ee;
        }

        public string tier(string fName, string spouse, string children)
        {
            string tier;
            int sp = int.Parse(spouse);
            int ch = int.Parse(children);
            tier = fName.Split(',')[0] + "'s&nbsp;";
            tier += sp > 0 && ch > 0
                ? "Family"
                : sp > 0
                    ? "Spouse"
                    : ch > 1
                        ? "Children"
                        : "Child";
            return tier;
        }

        public void resetInput()
        {
            top_1.Text = top_2.Text = top_3.Text = top_4.Text = top_5.Text =
                bot_1.Text = bot_2.Text = bot_3.Text = bot_4.Text =
                dollarCont.Text = dollarDepCont.Text =
                overAllEE.Text = overAllDep.Text = "";
        }

        public string minRequirement()
        {
            return (minTotal / decimal.Parse(eeCount.Text)).ToString("0.00");
        }

        public string planRules(GridDataItem item)
        {
            string error = "";
            string carrierId = item["carrierId"].Text;
            switch (item["planTypeId"].Text)
            {
                case "1":
                    if (carrierId == "4")
                    {
                        string subPlanType = item["subPlanTypeId"].Text;
                        if (subPlanType == "13" || subPlanType == "15" || subPlanType == "19")
                        {
                            error = loopForSubPlans(planSelection.SelectedItems, subPlanType, "", "");
                            if (!string.IsNullOrEmpty(error))
                                break;
                            error = loopForSubPlans(plansGrid.Items, subPlanType, "", "");
                        }
                    }
                    break;
                case "2":
                    if (carrierId == "29")
                    {
                        error = loopForSubPlans(planSelection.SelectedItems, "", carrierId, item["planId"].Text);
                        if (!string.IsNullOrEmpty(error))
                            break;
                        error = loopForSubPlans(plansGrid.Items, "", carrierId, item["planId"].Text);
                    }
                    break;
                case "4":
                    if (carrierId == "20")
                    {
                        error = loopForSubPlans(planSelection.SelectedItems, "", carrierId, item["planId"].Text);
                        if (!string.IsNullOrEmpty(error))
                            break;
                        error = loopForSubPlans(plansGrid.Items, "", carrierId, item["planId"].Text);
                    }
                    break;
                default:
                    break;
            }
            return error;
        }

        public string loopForSubPlans(GridItemCollection items, string subPlanType, string carrierId, string planId)
        {
            string error = "";
            foreach (GridDataItem gdi in items)
            {
                if (!string.IsNullOrEmpty(subPlanType))
                {
                    string compareSub = gdi["subPlanTypeId"].Text;
                    if (compareSub == "13" || compareSub == "15" || compareSub == "19")
                        if (compareSub != subPlanType)
                        {
                            error = "You may offer Access+ HMO plans or LocalAccess+ HMO plans or TrioACO HMO plans but not a combination of any of these plans";
                            break;
                        }
                }
                if (!string.IsNullOrEmpty(carrierId))
                {
                    if (gdi["carrierId"].Text == carrierId && gdi["planId"].Text != planId)
                    {
                        if (type == 2)
                            error = "Only one Western Dental plan can be selected";
                        if (type == 4)
                            error = "Only one Chiropractic plan can be selected";
                        break;
                    }
                }
            }
            return error;
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            popUp1.Style.Add("display","none");
        }
    }
}