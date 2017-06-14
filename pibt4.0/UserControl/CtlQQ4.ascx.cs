using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Web.UI.HtmlControls;
using Pibt.Model;

namespace Pibt.UserControl
{
    public partial class CtlQQ4 : System.Web.UI.UserControl
    {
        public BizInfoDetails pUser { get; set;}
        public int cartId { get { return BLL.OnlineQuote.QQCartId; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            lblCreationMessage.Text = "";
        }

        public void pageSetup(BizInfoDetails employer)
        {
            pUser = employer;
            DataTable dt = BLL.Employee.allMembers(pUser.EmployerId);
            if (dt.Rows.Count < 1)
                BLL.OnlineQuote.insertAllAsEmployees(cartId, pUser.EmployerId);
            eeGrid.Rebind();
            eeCount.Text = employeeCount();
            dept.DataSource = BLL.Employer.GetDepartments(pUser.EmployerId);
            dept.DataTextField = "description";
            dept.DataValueField = "deptId";
            dept.DataBind();
        }

        public bool validatePage()
        {
            string error = "";
            if(int.Parse(employeeCount())<2)
            {
                error = "You must add more than 1 employee in order to continue.";
                return false;
            }
            DataTable dt = BLL.Employee.checkMissingInfo(pUser.EmployerId);
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow row in dt.Rows)
                {
                    foreach (GridDataItem item in eeGrid.Items)
                        if (item["memberId"].Text == row.ItemArray[0].ToString())
                            item.BackColor = System.Drawing.ColorTranslator.FromHtml("#fa9c9c");
                    error += "Missing values for: " + row.ItemArray[1].ToString() + "<br/>";
                }
                lblCreationMessage.Text = Common.Utilities.FormatError(error);
                return false;
            }
            return true;
        }


        protected void dep_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = BLL.Employer.GetNewMemberId();
            if (btn.CommandName == "add")
            {
                if (string.IsNullOrEmpty(hfEmployeeId.Value))
                    BLL.Employer.InsertMember(id, id, pUser.EmployerId, lName.Text, fName.Text, "", "0", gender.SelectedValue, ssn.Text, bday.SelectedDate, null /*marriageDate*/, DateTime.Today, null/*addressone*/, null/*addressTwo*/, null/*city*/, null/*state*/, pUser.PhsicalPostCode, null/*mobileNbr*/, null/*homeNbr*/, null/*workNbr*/, email.Text, "N", "0" /*maritalStatusId*/, dept.SelectedValue, pUser.EmployerId, "0", "0", hours.Text, smokerChoice.SelectedValue);
                else
                {
                    DateTime? marriage = null;
                    if(type.SelectedValue=="1")
                        marriage = DateTime.Today;
                    BLL.Employer.InsertDependent(id, hfEmployeeId.Value, pUser.EmployerId, lName.Text, fName.Text, "", type.SelectedValue, gender.SelectedValue, ssn.Text, bday.SelectedDate, marriage, null/*addressOne*/, null/*city*/, null/*state*/, pUser.PhsicalPostCode, null/*mobileNbr*/, null/*homeNbr*/, null/*workNbr*/, null/*email*/, "N", null/*adoptionaDate*/, pUser.EmployerId);
                }
            }
            fName.Text = lName.Text = ssn.Text = email.Text = hours.Text = hfEmployeeId.Value = "";
            gender.SelectedIndex = type.SelectedIndex = 0;
            bday.SelectedDate = null;
            smokerChoice.SelectedIndex = 1;
            popup1.Style.Add("display", "none");
            eeGrid.Rebind();
            eeCount.Text = employeeCount();
        }

        protected void employeeRadGrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            eeGrid.DataSource = BLL.Employee.allMembers(pUser.EmployerId);
        }

        protected void eeGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridDataItem item = (GridDataItem)e.Item;
            switch (e.CommandName)
            {
                case "update":
                    update(item);
                    eeGrid.Rebind();
                    eeCount.Text = employeeCount();
                    break;
                case "cancel":
                    e.Canceled = true;
                    break;
                case "action":
                    setUpPopUp(false,item);
                    break;
                case "delete":
                    BLL.Employee.deleteNewMember(item["memberId"].Text);
                    eeGrid.Rebind();
                    eeCount.Text = employeeCount();
                    break;
            }
            eeGrid.MasterTableView.ClearEditItems();
        }

        public void update(GridDataItem item)
        {
            GridEditableItem editItem = (GridEditableItem)item.EditFormItem;
            string type = item["employeeType"].Text;
            string memberId = editItem["memberId"].Text;
            TextBox tbFname = editItem.FindControl("fName") as TextBox;
            TextBox tbLname = editItem.FindControl("lName") as TextBox;
            DropDownList ddlGender = editItem.FindControl("gender") as DropDownList;
            RadDatePicker tbBday = editItem.FindControl("bday") as RadDatePicker;
            TextBox tbSsn = editItem.FindControl("ssn") as TextBox;
            RadioButtonList rblSmoker = editItem.FindControl("smokerChoice") as RadioButtonList;
            TextBox tbHours = editItem.FindControl("hours") as TextBox;
            TextBox tbEmail = editItem.FindControl("email") as TextBox;

            BLL.Employee.UpdateMember(memberId, tbLname.Text, tbFname.Text, null, ddlGender.SelectedValue, tbSsn.Text,
                tbBday.SelectedDate, tbEmail.Text, pUser.EmployerId, tbHours.Text, type == "2" ? "N" : rblSmoker.SelectedValue);
        }

        protected void add_Click(object sender, EventArgs e)
        {
            setUpPopUp(true, null);
        }

        public void setUpPopUp(bool isEmployee, GridDataItem item)
        {
            noDep.Visible = isEmployee;
            if (!isEmployee)
            {
                int spCount = 0;
                hfEmployeeId.Value = item["employeeId"].Text;
                foreach (GridDataItem member in eeGrid.Items)
                    if (item["employeeId"].Text == member["employeeId"].Text && member["employeeType"].Text == "1")
                        ++spCount;
                if (type.Items.FindByValue("2") == null )
                    type.Items.Add(new ListItem("Child", "2"));
                if(spCount < 1)
                {
                    if (type.Items.FindByValue("1") == null)
                        type.Items.Add(new ListItem("Spouse", "1"));
                }
                else
                {
                    if (type.Items.FindByValue("1") != null)
                        type.Items.Remove(type.Items.FindByValue("1"));
                }
                if (type.Items.FindByValue("0") != null)
                    type.Items.Remove(type.Items.FindByValue("0"));
            }
            else
            {
                if (type.Items.FindByValue("0") == null)
                    type.Items.Add(new ListItem("Employee", "0"));
                if (type.Items.FindByValue("1") != null)
                    type.Items.Remove(type.Items.FindByValue("1"));
                if (type.Items.FindByValue("2") != null)
                    type.Items.Remove(type.Items.FindByValue("2"));
            }
            newHeader.Text = isEmployee ? "New Member" : "New Dependent for " + item["firstName"].Text + " " + item["lastName"].Text;
            popup1.Style.Add("display", "inline");
        }

        protected void eeGrid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                Button btn;
                GridDataItem item = (GridDataItem)e.Item;
                if(item["employeeType"].Text != "0")
                {
                    btn = (Button)item["action"].Controls[0];
                    btn.Visible = false;
                }
            }
        }

        public string employeeCount()
        {
            int count = 0;
            foreach (GridDataItem item in eeGrid.Items)
                if (item["employeeType"].Text == "0")
                    count++;
            return count.ToString();
        }

        protected void gender_PreRender(object sender, EventArgs e)
        {
            //these variables cannot be set using Eval("item") because there is more than one selection
            DropDownList ddl = (DropDownList)sender;
            //on ddl prerender find item and work backworks to find parent
            GridEditFormItem editItem = (GridEditFormItem)ddl.NamingContainer;
            //find row this belongs to
            GridDataItem item = editItem.ParentItem;
            //find the other item that needs to be loaded 
            Panel p = (Panel)editItem.FindControl("noChild");
            RadioButtonList smoker =(RadioButtonList) p.FindControl("smokerChoice");
            //get data from row
            string tmp = item["male"].Text;
            ddl.SelectedIndex = tmp == "Y" ? 1 : 2;
            tmp = item["smoker"].Text;
            smoker.SelectedIndex = tmp == "Y" ? 0 : 1;
        }

        public void rebind( BizInfoDetails employer)
        {
            pUser = employer;
            eeGrid.Rebind();
            eeCount.Text = employeeCount();
        }
    }
}