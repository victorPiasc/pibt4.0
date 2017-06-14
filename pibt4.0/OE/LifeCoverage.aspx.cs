using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.OE
{
    public partial class LifeCoverage : BasePage
    {
        public string oeId { get { return sessionVal("oeId"); } }
        public int oeType { get { return sessionValInt("OETypeId"); } }
        public DateTime effDate { get { return BLL.EnrollmentForm.getEffectiveDate(oeId); } }
        public bool isOeNewHire { get { return oeType == 1 || oeType == 4; } }
        public int[] eeChoices { get { return new int[] { 10, 20, 30, 40, 50, 80, 100, 150, 200, 300, 400, 500 }; } }
        public int[] spChoices { get { return new int[] { 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 100, 150 }; } }

        public int memCount
        {
            get
            {
                object tmp = ViewState["count"];
                return tmp == null ? 0 : int.Parse(tmp.ToString());
            }
            set { ViewState["count"] = value; }
        }

        public double ee
        {
            get 
            { 
                object tmp = ViewState["ee"];
                return tmp == null ? 10 : double.Parse(tmp.ToString());
            }
            set { ViewState["ee"] = value; }
        }

        public double sp
        {
            get
            {
                object tmp = ViewState["sp"];
                return tmp == null ? 5 : double.Parse(tmp.ToString());
            }
            set { ViewState["sp"] = value; }
        }

        public double ch
        {
            get
            {
                object tmp = ViewState["ch"];
                return tmp == null ? 5 : double.Parse(tmp.ToString());
            }
            set { ViewState["ch"] = value; }
        }

        public int eeMax
        {
            get
            {
                object tmp = ViewState["eeMax"];
                return tmp == null ? BLL.EnrollmentForm.getEeMaxInsurance(EmployeeId) : int.Parse(ViewState["eeMax"].ToString());
            }
            set { ViewState["eeMax"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int cartId = BLL.OnlineQuote.QQCartId;
                setup(cartId);
                BLL.OnlineQuote.setRates(cartId, EmployerId, "Y");
                BLL.OnlineQuote.setLifeRates(cartId, EmployerId, effDate);
                vtlBenPanel.Visible = mtlAdd.Enabled = isOeNewHire;
                if (eeMax != 10)
                    BLL.EnrollmentForm.transferVtl(oeId, EmployeeId, oeType, effDate, User.Identity.Name);
            }
            CtlEnrollmentFormTitle1.EmployeeId = EmployeeId;
            CtlEnrollmentFormTitle1.EmployerId = EmployerId;
            CtlEnrollmentFormTitle1.oeId = oeId;
            message.Text = "";
        }

        protected override void OnPreRender(EventArgs e)
        {
            double total = 0;
            foreach (GridDataItem item in vtlView.Items)
                if (item.ItemIndex < memCount && !string.IsNullOrEmpty(item["rates"].Text))
                    total += double.Parse(item["rates"].Text.Replace("$", string.Empty));
            ltotal.Text = string.Format(" Total {0:C}", total);
            lmTotal.Text = string.Format("Updated Total Monthly Benefit Cost {0:C}", BLL.EnrollmentForm.oeTotalCost(oeId) + total);
            base.OnPreRender(e);
        }

        protected void BtBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/OE/Plans.aspx" + UrlBuilder(null));
        }

        protected void BtNext_Click(object sender, EventArgs e)
        {
            if (isOeNewHire) 
            { 
                CheckBox cb;
                int count=0;
                if (vtlView.Items.Count > 0)
                {
                    foreach (GridDataItem item in vtlView.Items)
                    {
                        cb = item["selected"].FindControl("selected") as CheckBox;
                        if (cb.Checked)
                        {
                            ++count;
                        }
                    }
                    if (count == 0 && !decline.Checked)
                    {
                        message.Text = Common.Utilities.FormatError("You must either check decline or select the employee in order to continue.");
                        return;
                    }
                }
                if (mtlView.Items.Count > 0 && mtlBen.Items.Count < 1)
                {
                    message.Text = Common.Utilities.FormatError("You are missing beneficiaries for your Medical Term Life Plan.");
                    return;
                }
                if (!decline.Checked && vtlView.Items.Count > 0 && vtlBen.Items.Count < 1)
                {
                    message.Text = Common.Utilities.FormatError("You are missing beneficiaries for your Voluntary Life plan.");
                    return;
                }
            }
            Response.Redirect("/OE/SummaryOfChanges.aspx" + UrlBuilder(null));
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SaveAndExit();
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            StartOver(oeId, User.Identity.Name, Request.UserHostAddress);
        }

        protected void Ben_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            RadGrid tmp = (RadGrid)sender;
            tmp.DataSource = BLL.EnrollmentForm.GetOEBeneficiary(EmployeeId, tmp.ID.Contains("mtl") ? 7 : 6);
        }

        protected void View_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            int cartId=BLL.OnlineQuote.QQCartId;
            RadGrid tmp = (RadGrid)sender;
            DataTable dt = tmp.ID.Contains("mtl") 
                    ? BLL.EnrollmentForm.GetEnrollmentFormPlans(oeId, 7)
                    : BLL.EnrollmentForm.getEnrollmentVtlPlans(cartId, oeType);
            if (tmp.ID.Contains("mtl"))
                mtl.Visible = isOeNewHire;

            if (!IsPostBack && dt.Rows.Count == 0)
            {
                if (tmp.ID.Contains("mtl"))
                    mtl.Visible = false;
                else
                    vtl.Visible = false;
            }

            if (tmp.ID.Contains("vtl") && !IsPostBack)
            {
                int count = memCount = 0;
                foreach (DataRow i in dt.Rows)
                {
                    if (i[0].ToString() == "0" && i[8].ToString() == "Y")
                        vtlAdd.Enabled = true;

                    if(i[0].ToString() != "2")
                        memCount++;
                    else
                        count++;
                }
                if (count > 0)
                    memCount++;
            }

            if (!mtl.Visible && !vtl.Visible)
            {
                string refer = Page.Request.UrlReferrer.AbsolutePath.ToLower();
                Response.Redirect("/OE/" +
                    (refer.Contains("summaryofchanges")
                        ? "Plans"
                        : "SummaryOfChanges") +
                        ".aspx" + UrlBuilder(null));
                //NOT REACHED
            }
            tmp.DataSource = dt;
        }

        protected void vtlView_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem )
            {
                GridDataItem item = (GridDataItem)e.Item;
                int insuranceAmount = int.Parse(item["insuranceAmount"].Text)/1000;
                DropDownList ddl = item["ddlInsurance"].FindControl("dpInsuranceAmount") as DropDownList;
                double price = double.Parse(item["rates"].Text.Replace("$",string.Empty));
                CheckBox cb = item["selected"].FindControl("selected") as CheckBox;
                RadioButtonList rb = item["rbSmoker"].FindControl("rbSmoker") as RadioButtonList;
                rb.SelectedValue = item["ndSmoker"].Text;
                cb.Visible = ddl.Visible = item.ItemIndex < memCount;
                if(!cb.Checked)
                {
                    ddl.Visible = false;
                    item["rates"].Text = item.ItemIndex < memCount ? "$0.00" : " ";
                    return;
                }
                switch (item["employeeTypeId"].Text)
                {
                    case "0":
                        addToDDL(insuranceAmount, 10, ddl);
                        //if(!IsPostBack)
                            ee = insuranceAmount;
                        item["rates"].Text = string.Format("{0:C}", ee * price);
                        price = ee * 1000;
                        break;
                    case "2":
                        ddl.Items.Add(new ListItem("$5,000.00", "5000"));
                        ddl.Items.Add(new ListItem("$10,000.00", "10000"));
                        //if (!IsPostBack)
                            ch = insuranceAmount;
                        item["rates"].Text = item.ItemIndex < memCount ? string.Format("{0:C}", ch == 5 ? price : ch * price / 5) : "";
                        price = ch * 1000;
                        break;
                    default:
                        addToDDL(insuranceAmount, 5, ddl);
                        //if (!IsPostBack)
                            sp = insuranceAmount;
                        item["rates"].Text = string.Format("{0:C}", sp * price);
                        price = sp * 1000;
                        break;
                }
                ddl.SelectedValue = price.ToString();
            }
        }

        public void addToDDL(int insuranceAmount, int factor, DropDownList ddl)
        {
            int[] choices = factor == 10 ? eeChoices : spChoices;
            //check to see if insurance amount is divisible by the factor
            int mod = insuranceAmount % factor;
            int max = factor == 10 
                ? 100
                : eeMax < 25 
                    ? eeMax
                    : 25;
            if (insuranceAmount > max && factor==10)
                max = insuranceAmount - mod;
            for (int i = 0; i < choices.Length; i++ )
                if (choices[i] <= max)
                    ddl.Items.Add(new ListItem("$"+choices[i] + ",000.00", choices[i] + "000"));
            if(mod!=0)
                ddl.Items.Add(new ListItem("$"+insuranceAmount+",000.00", insuranceAmount+"000"));
        }

        protected void dpInsuranceAmount_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            GridDataItem item = (GridDataItem)ddl.NamingContainer;
            double selected = double.Parse(ddl.SelectedValue)/1000;
            double price = double.Parse(item["rates"].Text.Replace("$", string.Empty));
            switch (item["employeeTypeId"].Text)
            {
                case "0":
                    eeMax = (int)selected;
                    price = price / ee;
                    ee = selected;
                    break;
                case "2":
                    price = price / ch;
                    ch = selected;
                    break;
                default:
                    price = price / sp;
                    sp = selected;
                    break;
            }
            BLL.EnrollmentForm.UpdatePlansAddl(item["memberId"].Text, item["planId"].Text, oeId, ddl.SelectedValue);
            price = selected * price;
            item["rates"].Text = price.ToString("C");
            vtlView.Rebind();
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            LinkButton1.Visible = e.CommandName == "2";
            LinkButton2.Visible = !LinkButton1.Visible;
            noteList.Visible = e.CommandName == "1";
        }

        protected void decline_CheckedChanged(object sender, EventArgs e)
        {
            if (decline.Checked)
            {
                BLL.EnrollmentForm.RemoveVtl(EmployeeId, EmployeeId, "0", oeId);//delete everyone
                BLL.EnrollmentForm.AddVtl(oeId, oeType, "", EmployeeId, "0", effDate, User.Identity.Name);
            }
            else
                BLL.EnrollmentForm.RemoveVtl(EmployeeId, EmployeeId, "0", oeId);

            if (isOeNewHire)
                vtlBenPanel.Visible = vtlBen.Visible = !decline.Checked;
            vtlView.Rebind();
            vtlView.Columns[6].Display = vtlView.Columns[8].Display = vtlView.Columns[9].Display = lmTotal.Visible = ltotal.Visible = !decline.Checked;
        }

        protected void selected_CheckedChanged(object sender, EventArgs e)
        {
            //add remove from web enroller form plans 
            CheckBox cb = (CheckBox)sender;
            GridDataItem item = (GridDataItem)cb.NamingContainer;
            if (cb.Checked)
            {
                BLL.EnrollmentForm.AddVtl(oeId, oeType, item["planId"].Text, item["memberId"].Text, item["employeeTypeId"].Text, effDate, User.Identity.Name);
                vtlAdd.Enabled = isOeNewHire;
            }
            else
            {
                BLL.EnrollmentForm.RemoveVtl(item["memberId"].Text, EmployeeId, item["employeeTypeId"].Text, oeId);
                if (item["employeeTypeId"].Text == "0")
                    vtlAdd.Enabled = false;
            }
            if(cb.Checked && item["employeeTypeId"].Text !="0")
            {
                GridDataItem eeItem = vtlView.Items[0];
                CheckBox eeCb = eeItem["selected"].FindControl("selected") as CheckBox;
                if(!eeCb.Checked && eeItem["employeeTypeId"].Text =="0")//make sure the first record in the list is employee and not spouse
                    BLL.EnrollmentForm.AddVtl(oeId, oeType, eeItem["planId"].Text, eeItem["memberId"].Text, eeItem["employeeTypeId"].Text, effDate, User.Identity.Name);
            }
            vtlView.Rebind();
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Session["life"] = btn.ID.Contains("mtl") ? 7 : 6;
            BLL.EnrollmentForm.updateBenTable(oeId, EmployeeId, btn.ID.Contains("mtl") ? 7 : 6, false);
            Response.Redirect("/OE/Beneficiary.aspx" + UrlBuilder(null));
        }

        public void setup(int cartId)
        {
            BLL.OnlineQuote.DeleteAllWebQQCart(cartId);
            DataTable people = BLL.EnrollmentForm.GetOeEnrollers(EmployeeId, oeType);
            foreach (DataRow i in people.Rows)
                BLL.EnrollmentForm.InsertMemberToQuote(cartId, i.ItemArray[0].ToString());
            if(!isOeNewHire)
                BLL.EnrollmentForm.InsertDepFamilytoQuote(EmployeeId, BLL.OnlineQuote.QQCartId, 6);
        }

        protected void rbSmoker_SelectedIndexChanged(object sender, EventArgs e)
        {
            RadioButtonList rb = (RadioButtonList)sender;
            GridDataItem item = (GridDataItem)rb.NamingContainer;
            BLL.Employee.updateSmoker(item["memberId"].Text, rb.SelectedValue);
            CheckBox cb = item["selected"].FindControl("selected") as CheckBox;
            if (cb.Checked)
                BLL.EnrollmentForm.correctVtl(item["memberId"].Text, oeId, item["planId"].Text);
            vtlView.Rebind();
        }
    }
}