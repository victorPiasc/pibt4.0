using System;
using Pibt.Model;

namespace Pibt
{
   public partial class Default: SortaBasePage {
      protected void Page_Load(object sender, EventArgs e)
      {
         if (Page.User.Identity.IsAuthenticated)
         {
            if (Page.User.IsInRole(UserRoles.Administrator.ToString()))
            {
               Page.Response.Redirect("/Admin/AdminEdit.aspx");
            }
            else if (Page.User.IsInRole(UserRoles.Enroller.ToString()))
            {
                Page.Response.Redirect("/Admin/EnrollerDetails.aspx");
            }
            else if (Page.User.IsInRole(UserRoles.Agent.ToString()))
            {
               Page.Response.Redirect("/Admin/AgentDetails.aspx");
            }
            else if (Page.User.IsInRole(UserRoles.RK.ToString()))
            {
               Page.Response.Redirect("/Admin/RKDetails.aspx");
            }
            else if (Page.User.IsInRole(UserRoles.Broker.ToString()))
            {
               Page.Response.Redirect("/Broker/BrokerDetails.aspx");
            }
            else if (Page.User.IsInRole(UserRoles.Employer.ToString()))
            {
               Page.Response.Redirect("/Employer/BusinessInfo.aspx");
            }
            else if (Page.User.IsInRole(UserRoles.Employee.ToString()))
            {
               Page.Response.Redirect("/Employer/EmployeeDetails.aspx");
            }
            else // Must be dependent
            {
               Page.Response.Redirect("/Employer/EmployeeDetails.aspx");
            }
         }
         else
         {
            Page.Response.Redirect("/oooops.aspx");
         }
      }
   }
}