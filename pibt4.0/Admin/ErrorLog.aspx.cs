using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.BLL;
using Pibt.Model;
using Pibt.Common;


namespace Pibt.Admin
{
    public partial class ErrorLog : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utilities.TieButton(Page, txtUserName, btnSearch);
            Utilities.TieButton(Page, txtWords, btnSearch);
            Logger.DeleteLogs(12, LogType.Error); // Limit error log to 1 year back
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblGridHeader.Text = "Search Results:";
            LogGrid.Rebind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblGridHeader.Text = "";
            txtUserName.Text = "";
            txtWords.Text = "";
            dtPickerStart.SelectedDate = null;
            dtPickerEnd.SelectedDate = null;
            LogGrid.Rebind();
        }

        protected void LogGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LogGrid.DataSource = Logger.SearchErrorLogs(txtUserName.Text, txtWords.Text, dtPickerStart.SelectedDate, dtPickerEnd.SelectedDate);
        }
    }
}