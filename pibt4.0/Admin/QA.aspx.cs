using System;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.Admin
{
    public partial class QA: SortaBasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                lblGridHeader.Text = "Search Results:";
                RadGridQA.DataSourceID = "odsQASearching";
                RadGridQA.Rebind();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            lblGridHeader.Text = "";
            txtKeyWord.Text = "";
            RadGridQA.DataSourceID = "odsQA";
            RadGridQA.Rebind();
        }

        protected void RadGridQA_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.InitInsertCommandName) //"Add new" button clicked
            {
                GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridQA.MasterTableView.GetColumn("EditCommandColumn");
                editColumn.Visible = false;
            }
            else if (e.CommandName == RadGrid.RebindGridCommandName && e.Item.OwnerTableView.IsItemInserted)
            {
                e.Canceled = true;
            }
            else
            {
                GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridQA.MasterTableView.GetColumn("EditCommandColumn");
                if (!editColumn.Visible)
                    editColumn.Visible = true;
            }
        }

        protected void RadGridQA_InsertCommand(object sender, GridCommandEventArgs e)
        {
            CheckBox chkTop = (e.Item as GridEditFormItem).FindControl("chkTop") as CheckBox;
            odsQA.InsertParameters["isTop"].DefaultValue = chkTop.Checked.ToString();
            odsQASearching.InsertParameters["isTop"].DefaultValue = chkTop.Checked.ToString();
        }

        protected void RadGridQA_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            CheckBox chkTop = (e.Item as GridEditFormItem).FindControl("chkTop") as CheckBox;
            odsQA.UpdateParameters["isTop"].DefaultValue = chkTop.Checked.ToString();
            odsQASearching.UpdateParameters["isTop"].DefaultValue = chkTop.Checked.ToString();
        }

        protected void odsQA_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["updatedBy"] = HttpContext.Current.User.Identity.Name;
        }

        protected void odsQA_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["updatedBy"] = HttpContext.Current.User.Identity.Name;
        }

        protected void RadGridQA_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInInsertMode = true;
                e.ExceptionHandled = true;
            }
        }

        protected void RadGridQA_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
            }
        }

        protected void RadGridQA_ItemDeleted(object sender, GridDeletedEventArgs e)
        {
        }

        protected void hideTop_DataBinding(object sender, EventArgs e)
        {
            HiddenField hideTop = sender as HiddenField;
            if (!string.IsNullOrEmpty(hideTop.Value))
            {
                CheckBox chkTop = hideTop.Parent.FindControl("chkTop") as CheckBox;
                chkTop.Checked = Pibt.Common.Utilities.ToBool(hideTop.Value);
            }
        }
    }
}