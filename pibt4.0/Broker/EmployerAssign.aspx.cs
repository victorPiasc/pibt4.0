using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using Telerik.Web.UI;

namespace Pibt.Broker
{
    public partial class EmployerAssign : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            message.Text = "";
            if (string.IsNullOrEmpty(BrokerId))
                oops();
            employerList.MasterTableView.GetColumn("DeleteColumn").Visible = employerList.MasterTableView.GetColumn("EditCommandColumn").Visible = newRecord.Visible = CurrentUserInfo.UserRole == UserRoles.Administrator;
        }

        protected void employerList_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
           employerList.DataSource = BLL.Broker.getEmployerList(BrokerId, tbSearch.Text, status.SelectedValue);
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            employerList.MasterTableView.ClearEditItems();
        }

        protected void assign_Click(object sender, EventArgs e)
        {
            DateTime? start = dpStart.SelectedDate;
            DateTime? end = dpEnd.SelectedDate;

            message.Text = BLL.Broker.checkExistingBrokerEmployer(BrokerId, tbEmployerId.Text, start, end) < 1
                ? BLL.Broker.assignBrokerEmployer(BrokerId, tbEmployerId.Text, start, end)
                    ? Common.Utilities.FormatNote("New broker record has been added")
                    : Common.Utilities.FormatError("Broker record could not be added")
                : Common.Utilities.FormatError("New broker record overlaps existing broker record");

            tbEmployerId.Text = "";
            dpStart.Clear();
            dpEnd.Clear();
            employerList.Rebind();
        }

        protected void update_Command(object sender, CommandEventArgs e)
        {
            Button update = sender as Button;
            GridEditFormItem item = (GridEditFormItem)update.NamingContainer;

            RadDatePicker en = item.FindControl("editEnd") as RadDatePicker;

            DateTime? start = (item.FindControl("editStart") as RadDatePicker).SelectedDate;
            DateTime? end = en.SelectedDate;

            message.Text = BLL.Broker.checkExistingBrokerEmployer(BrokerId, tbEmployerId.Text, start, end) < 1
                ? BLL.Broker.assignBrokerEmployer(BrokerId, e.CommandName, start, end)
                    ? Common.Utilities.FormatNote("Broker record has been updated")
                    : Common.Utilities.FormatError("Broker record could not be updated")
                : Common.Utilities.FormatError("Broker Record update overlaps existing record");

            employerList.MasterTableView.ClearEditItems();
            employerList.Rebind();
        }

        protected void employerList_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
                string erId = dataItem.GetDataKeyValue("EMPLOYERID").ToString();
                message.Text = BLL.Broker.deleteBrokerEmployer(BrokerId, erId)
                    ? Common.Utilities.FormatNote("Broker record has been deleted")
                    : Common.Utilities.FormatError("Broker record could not be deleted");
                employerList.Rebind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            employerList.Rebind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            tbSearch.Text = "";
            status.SelectedIndex = 0;
            employerList.Rebind();
        }

        protected void status_SelectedIndexChanged(object sender, EventArgs e)
        {
            employerList.Rebind();
        }
    }
}