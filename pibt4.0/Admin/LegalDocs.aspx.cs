using System;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Text.RegularExpressions;

namespace Pibt.Admin
{
    public partial class LegalDocs: SortaBasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void binder(object sender, GridItemEventArgs e) {
            if (e.Item is GridDataItem) {
                GridDataItem item = (GridDataItem)e.Item;
                if (item["ID"].Text=="0")
                    (item["DeleteColumn"].Controls[0] as ImageButton).Visible = false;
            }
        }

        protected void RadGridLegalDocs_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.InitInsertCommandName) //"Add new" button clicked
            {
                GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridLegalDocs.MasterTableView.GetColumn("EditCommandColumn");
                editColumn.Visible = false;
            }
            else if (e.CommandName == RadGrid.RebindGridCommandName && e.Item.OwnerTableView.IsItemInserted)
            {
                e.Canceled = true;
            }
            else
            {
                GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridLegalDocs.MasterTableView.GetColumn("EditCommandColumn");
                if (!editColumn.Visible)
                    editColumn.Visible = true;
            }
        }

        protected void odsLegalDocs_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["updatedBy"] = HttpContext.Current.User.Identity.Name;
        }

        protected void odsLegalDocs_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["updatedBy"] = HttpContext.Current.User.Identity.Name;
        }

        protected void RadGridLegalDocs_InsertCommand(object sender, GridCommandEventArgs e)
        {
            RadEditor editor = (e.Item as GridEditFormItem).FindControl("ContentEditor") as RadEditor;
            odsLegalDocs.InsertParameters["legalContent"].DefaultValue = Regex.Replace(editor.Text, "\n", "<br/>");
        }

        protected void RadGridLegalDocs_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            RadEditor editor = (e.Item as GridEditFormItem).FindControl("ContentEditor") as RadEditor;
            odsLegalDocs.UpdateParameters["legalContent"].DefaultValue = Regex.Replace(editor.Text, "\n", "<br/>");
        }

        protected void RadGridLegalDocs_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInInsertMode = true;
                e.ExceptionHandled = true;
                ((Label)e.Item.FindControl("lblErrorMsg")).Text = e.Exception.Message;
            }
        }

        protected void RadGridLegalDocs_ItemUpdated(object sender, GridUpdatedEventArgs e)
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