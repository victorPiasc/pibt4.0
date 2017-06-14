using System;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.Admin
{
    public partial class EventList: SortaBasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblGridHeader.Text = "Search Results:";
                RadGridEvents.DataSourceID = "odsEventsSearching";
                RadGridEvents.Rebind();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblGridHeader.Text = "";
            txtKeyWord.Text = "";
            RadGridEvents.DataSourceID = "odsEvents";
            RadGridEvents.Rebind();
        }

        protected void RadGridEvents_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.InitInsertCommandName) //"Add new" button clicked
            {
                GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridEvents.MasterTableView.GetColumn("EditCommandColumn");
                editColumn.Visible = false;
            }
            else if (e.CommandName == RadGrid.RebindGridCommandName && e.Item.OwnerTableView.IsItemInserted)
            {
                e.Canceled = true;
            }
            else
            {
                GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridEvents.MasterTableView.GetColumn("EditCommandColumn");
                if (!editColumn.Visible)
                    editColumn.Visible = true;
            }
        }

        protected void odsEvents_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["updatedBy"] = HttpContext.Current.User.Identity.Name;
        }

        protected void odsEvents_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["updatedBy"] = HttpContext.Current.User.Identity.Name;
        }

        protected void RadGridEvents_InsertCommand(object sender, GridCommandEventArgs e)
        {
            RadDatePicker dtPicker = (e.Item as GridEditFormItem).FindControl("dtPicker") as RadDatePicker;
            odsEvents.InsertParameters["eventDate"].DefaultValue = dtPicker.SelectedDate.Value.ToString();
            odsEventsSearching.InsertParameters["eventDate"].DefaultValue = dtPicker.SelectedDate.Value.ToString();
        }

        protected void RadGridEvents_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            RadDatePicker dtPicker = (e.Item as GridEditFormItem).FindControl("dtPicker") as RadDatePicker;
            odsEvents.UpdateParameters["eventDate"].DefaultValue = dtPicker.SelectedDate.Value.ToString();
            odsEventsSearching.UpdateParameters["eventDate"].DefaultValue = dtPicker.SelectedDate.Value.ToString();
        }

        protected void RadGridEvents_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInInsertMode = true;
                e.ExceptionHandled = true;
            }
        }

        protected void RadGridEvents_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
            }
        }

        protected void RadGridEvents_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
        }

        protected void hideNewsDate_DataBinding(object sender, EventArgs e)
        {
            HiddenField hideNewsDate = sender as HiddenField;
            if (!string.IsNullOrEmpty(hideNewsDate.Value))
            {
                RadDatePicker dtPicker = hideNewsDate.Parent.FindControl("dtPicker") as RadDatePicker;
                dtPicker.SelectedDate = Convert.ToDateTime(hideNewsDate.Value);
            }
        }
    }
}