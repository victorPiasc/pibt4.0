using System;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.Admin
{
    public partial class OETypes: SortaBasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void RadGridOETypes_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.InitInsertCommandName) //"Add new" button clicked
            {
                GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridOETypes.MasterTableView.GetColumn("EditCommandColumn");
                editColumn.Visible = false;
            }
            else if (e.CommandName == RadGrid.RebindGridCommandName && e.Item.OwnerTableView.IsItemInserted)
            {
                e.Canceled = true;
            }
            else
            {
                GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridOETypes.MasterTableView.GetColumn("EditCommandColumn");
                if (!editColumn.Visible)
                    editColumn.Visible = true;
            }
        }
        
        protected void RadGridOETypes_UpdateCommand(object sender, GridCommandEventArgs e)
        {
        }

        protected void RadGridOETypes_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                ((Label)e.Item.FindControl("lblErrorMsg")).Text = e.Exception.Message;
            }
        }
    }
}