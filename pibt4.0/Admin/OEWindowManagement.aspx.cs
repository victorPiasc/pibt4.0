using System;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.Admin
{
    public partial class OEWindowManagement: SortaBasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
            BLL.EnrollmentForm.ReNewOEWindows(Page.User.Identity.Name);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblGridHeader.Text = "Search Results:";
            RadGridOEWindow.Rebind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtERID.Text = "";
            lblGridHeader.Text = "";
            RadGridOEWindow.Rebind();
        }

        protected void RadGridOEWindow_ItemCommand(object sender, GridCommandEventArgs e)
        {
            GridEditCommandColumn editColumn = (GridEditCommandColumn)RadGridOEWindow.MasterTableView.GetColumn("EditCommandColumn");
            switch (e.CommandName)
            {
                case RadGrid.InitInsertCommandName:
                    editColumn.Visible = false;
                    break;
                case RadGrid.RebindGridCommandName:
                    if (e.Item.OwnerTableView.IsItemInserted)
                        e.Canceled = true;
                    break;
                default:
                    if (!editColumn.Visible)
                        editColumn.Visible = true;
                    break;
            }
        }

        protected void odsOEWindow_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            ValidParameters(e, "insert");
        }

        protected void odsOEWindow_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            ValidParameters(e, "update");
        }

        protected void RadGridOEWindow_ItemInserted(object sender, GridInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInInsertMode = true;
                e.ExceptionHandled = true;
                ((Label)e.Item.FindControl("lblErrorMsg")).Text = e.Exception.Message;
            }
        }

        protected void RadGridOEWindow_ItemUpdated(object sender, GridUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                e.KeepInEditMode = true;
                e.ExceptionHandled = true;
                ((Label)e.Item.FindControl("lblErrorMsg")).Text = e.Exception.Message;
            }
        }

        //TODO test if date or date and time 
        //TODO param should be date not string
        private void validDateFormat(string dateStr) // Throws
        {
             DateTime dt;
             if (!DateTime.TryParse(dateStr, out dt))
                 throw new FormatException("Please type the first day of the month, e.g., 06/01/2016.");
        }

        //TODO Treat dates like dates, and test for wrong input
        private void ValidParameters(ObjectDataSourceMethodEventArgs e, string ev) // Throws
        {            
            string oeFromMonth = e.InputParameters["oeFromMonth"].ToString();
            string oeToMonth = e.InputParameters["oeToMonth"].ToString();
            string planEffectiveDate = e.InputParameters["planEffectiveDate"].ToString();
            string employerid = e.InputParameters["employerId"].ToString();
            string employerName = BLL.Employer.GetBizName(employerid);
            if (string.IsNullOrEmpty(employerName))
                throw new FormatException("No such employer");

            foreach (GridDataItem item in RadGridOEWindow.Items)
                if(employerid == item["EMPLOYERID"].Text && ev.Equals("insert"))
                    throw new FormatException("Employer exist in grid already, update existing employer.");

            validDateFormat(oeFromMonth);
            validDateFormat(oeToMonth);
            validDateFormat(planEffectiveDate);
            if (DateTime.Parse(oeFromMonth) >= DateTime.Parse(oeToMonth))
                throw new ArgumentException("[To Date] must be more than [From Date].");
            e.InputParameters["updatedBy"] = HttpContext.Current.User.Identity.Name;
        }

        protected void odsOEWindow_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            if (lblGridHeader.Text != "")
                e.InputParameters[0] = txtERID.Text;
            else
                e.InputParameters[0] = null;
        }
    }
}