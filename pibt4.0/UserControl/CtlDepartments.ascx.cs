using System;
using System.Web;
using Telerik.Web.UI;
using Pibt.Model;
using System.Web.UI.WebControls;

namespace Pibt.UserControl
{
    public partial class CtlDepartments : System.Web.UI.UserControl
    {
        public string EmployerId { get; set; }
        public UserRoles Role { get; set; }
        public int departCount { get { return RadGridDeparts.Items.Count; } }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadGridDeparts_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            RadGridDeparts.DataSource = BLL.Employer.GetDepartments(EmployerId);
        }

        protected void RadGridDeparts_ItemCommand(object sender, GridCommandEventArgs e)
        {
            errormessage.Visible = false;
            GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridDeparts.MasterTableView.GetColumn("EditCommandColumn");
            TextBox tb1, tb2;
            switch (e.CommandName)
            {
                case "Update":
                    GridEditFormItem item = e.Item as GridEditFormItem;
                    tb1 = item.FindControl("tbDeptCode") as TextBox;
                    tb2 = item.FindControl("tbDescription") as TextBox;
                    string[] oldCode = item["description"].Text.Split('|');
                    object deptId = item.GetDataKeyValue("Deptid");
                    oldCode[0] = oldCode[0].Trim();
                    oldCode[1] = oldCode[1].Trim();
                    if (tb1.Text.ToUpper() != oldCode[0].ToUpper() && tb2.Text.ToUpper() != oldCode[1].ToUpper())
                        if(checkCode(int.Parse(tb1.Text), tb2.Text.ToUpper()))
                        {
                            errormessage.Visible = true;
                            errormessage.Text = Common.Utilities.FormatError("Duplicate departments are not allowed.");
                            e.Canceled = true;
                            return;
                        }
                    BLL.Employer.UpdateDepartments(deptId.ToString(), EmployerId, tb1.Text, tb2.Text);
                    RadGridDeparts.Rebind();
                    break;
                case "Insert":
                    GridEditFormInsertItem edit = e.Item as GridEditFormInsertItem;
                    tb1 = edit.FindControl("tbDeptCode") as TextBox;
                    tb2 = edit.FindControl("tbDescription") as TextBox;
                    if (checkCode(int.Parse(tb1.Text), tb2.Text.ToUpper()))
                    {
                        errormessage.Visible = true;
                        errormessage.Text = Common.Utilities.FormatError("Duplicate departments are not allowed.");
                        e.Canceled = true;
                        return;
                    }
                    BLL.Employer.InsertDepartments(EmployerId, tb1.Text, tb2.Text);
                    RadGridDeparts.MasterTableView.IsItemInserted = false;
                    RadGridDeparts.Rebind();
                    break;
                case "Cancel":
                    e.Canceled = true;
                    RadGridDeparts.MasterTableView.IsItemInserted = false;
                    RadGridDeparts.MasterTableView.ClearEditItems();
                    break;
            }
        }

        public bool checkCode(int code, string oldDesc)
        {
            string[] desc;
            foreach (GridDataItem item in RadGridDeparts.Items)
            {
                desc = item["description"].Text.Split('|');
                desc[1] = desc[1].Trim().ToUpper();
                desc[0] = desc[0].Trim();
                if (code == int.Parse(desc[0]) || oldDesc.Equals(desc[1]))
                    return true;
            }
            return false;
        }

        public void reloadGrid()
        {
            RadGridDeparts.Rebind();
        }
    }
}