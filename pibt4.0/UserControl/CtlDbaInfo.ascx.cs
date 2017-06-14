using System;
using System.Web;
using System.Web.UI.WebControls;
using Pibt.BLL;
using Pibt.Model;
using Telerik.Web.UI;

namespace Pibt.UserControl
{
    public partial class CtlDbaInfo : System.Web.UI.UserControl
    {
        public string EmployerId { get; set; }
        public UserRoles Role { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void odsDBA_Selecting(object sender, System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["employerId"] = EmployerId;
        }

        protected void odsDBA_Updating(object sender, System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["employerId"] = EmployerId;
        }

        protected void odsDBA_Inserting(object sender, System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs e)
        {
            e.InputParameters["employerId"] = EmployerId;
        }

        protected void RadGridDBA_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == RadGrid.InitInsertCommandName) //"Add new" button clicked
            {
                GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridDBA.MasterTableView.GetColumn("EditCommandColumn");
                editColumn.Visible = false;
            }
            else if (e.CommandName == RadGrid.RebindGridCommandName && e.Item.OwnerTableView.IsItemInserted)
            {
                e.Canceled = true;
            }
            else
            {
                GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridDBA.MasterTableView.GetColumn("EditCommandColumn");
                if (!editColumn.Visible)
                    editColumn.Visible = true;
            }
        }        

        protected void RadGridDBA_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInInsertMode = true;
                e.ExceptionHandled = true;
            }            
        }

        protected void RadGridDBA_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
            }            
        }
         
    }
}