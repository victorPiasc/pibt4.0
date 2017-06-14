using System;
using Telerik.Web.UI;
using Pibt.BLL;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.Admin
{
    public partial class UsersLog : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) {
                btnSearch_Click(sender, e);
            }
            else {
                Logger.DeleteLogs(12, LogType.Audit); // Limit logs to 1 year back
            }
            Utilities.TieButton(Page, txtWords, btnSearch);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblGridHeader.Text = "Search Results:";
            LogGrid.Rebind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblGridHeader.Text = "";
            txtWords.Text = "";
            dtPickerStart.SelectedDate = null;
            dtPickerEnd.SelectedDate = null;
            LogGrid.Rebind();
        }

        protected void LogGrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            LogGrid.DataSource = Logger.SearchAuditLogs(txtWords.Text, dtPickerStart.SelectedDate, dtPickerEnd.SelectedDate);
        }
    }
}