using System;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.Admin
{
   public partial class NewsList: SortaBasePage {
      protected void Page_Load(object sender, EventArgs e)
      {
      }

      protected void binder(object sender, GridItemEventArgs e) {
          Pibt.BasePage.binderLow(e, RadGridNews, "View this news item");
      }

      protected void btnSearch_Click(object sender, EventArgs e)
      {
         if (Page.IsValid)
         {
            lblGridHeader.Text = "Search Results:";
            RadGridNews.DataSourceID = "odsNewsSearching";
            RadGridNews.Rebind();
         }
      }

      protected void btnClear_Click(object sender, EventArgs e)
      {
         lblGridHeader.Text = "";
         txtKeyWord.Text = "";
         RadGridNews.DataSourceID = "odsNews";
         RadGridNews.Rebind();
      }

      protected void RadGridNews_ItemCommand(object sender, GridCommandEventArgs e)
      {
         if (e.CommandName == RadGrid.InitInsertCommandName) //"Add new" button clicked
         {
            GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridNews.MasterTableView.GetColumn("EditCommandColumn");
            editColumn.Visible = false;
         }
         else if (e.CommandName == RadGrid.RebindGridCommandName && e.Item.OwnerTableView.IsItemInserted)
         {
            e.Canceled = true;
         }
         else
         {
            GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridNews.MasterTableView.GetColumn("EditCommandColumn");
            if (!editColumn.Visible)
               editColumn.Visible = true;
         }
      }

      protected void odsNews_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
      {
         e.InputParameters["updatedBy"] = HttpContext.Current.User.Identity.Name;
         e.InputParameters["startDate"] = DateTime.Today;
         e.InputParameters["endDate"] = DateTime.Today;                
      }

      protected void odsNews_Updating(object sender, ObjectDataSourceMethodEventArgs e)
      {
         e.InputParameters["updatedBy"] = HttpContext.Current.User.Identity.Name;
      }

      protected void RadGridNews_InsertCommand(object sender, GridCommandEventArgs e)
      {
         RadDatePicker dtPicker = (e.Item as GridEditFormItem).FindControl("dtPicker") as RadDatePicker;
         odsNews.InsertParameters["newsDate"].DefaultValue = dtPicker.SelectedDate.Value.ToString();
         odsNewsSearching.InsertParameters["newsDate"].DefaultValue = dtPicker.SelectedDate.Value.ToString();

         DropDownList dll = (e.Item as GridEditFormItem).FindControl("tbPriority") as DropDownList;
         odsNews.InsertParameters["priorityLevel"].DefaultValue = dll.SelectedValue;
      }

      protected void RadGridNews_UpdateCommand(object sender, GridCommandEventArgs e)
      {
         RadDatePicker dtPicker = (e.Item as GridEditFormItem).FindControl("dtPicker") as RadDatePicker;
         odsNews.UpdateParameters["newsDate"].DefaultValue = dtPicker.SelectedDate.Value.ToString();
         odsNewsSearching.UpdateParameters["newsDate"].DefaultValue = dtPicker.SelectedDate.Value.ToString();
         odsNews.UpdateParameters["startDate"].DefaultValue = dtPicker.SelectedDate.Value.ToString();
         odsNews.UpdateParameters["endDate"].DefaultValue = dtPicker.SelectedDate.Value.ToString();
         DropDownList dll = (e.Item as GridEditFormItem).FindControl("tbPriority") as DropDownList;
         odsNews.UpdateParameters["priorityLevel"].DefaultValue = dll.SelectedValue;
      }

      protected void RadGridNews_ItemInserted(object sender, GridInsertedEventArgs e)
      {
         if (e.Exception != null)
         {
            e.KeepInInsertMode = true;
            e.ExceptionHandled = true;
         }
      }

      protected void RadGridNews_ItemUpdated(object sender, GridUpdatedEventArgs e)
      {
         if (e.Exception != null)
         {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
         }
      }

      protected void RadGridNews_ItemDeleted(object sender, GridDeletedEventArgs e)
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