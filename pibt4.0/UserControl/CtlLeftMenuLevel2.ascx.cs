using System;
using Pibt.Model;
using Telerik.Web.UI;
using System.Web;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI;
using Pibt.Common;
using System.Configuration;

namespace Pibt.UserControl
{
    public partial class CtlLeftMenuLevel2 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CreateLeftMenu();
            }
            UserCacheInfo userInfo = (UserCacheInfo)Session["UserCacheInfo"];
            //hide button if it is not the test server. 
            if (userInfo.UserRole == UserRoles.Employer)
            {
                Button btn = LoginViewLeftMenuPanel.FindControl("renew") as Button;
                //For user group
                //if (BLL.Plan.hasCustomPlans(userInfo.EmployerId) && !(userInfo.EmployerId == "49298" || userInfo.EmployerId == "56350" || userInfo.EmployerId == "63325"))
                //Exclude 49298 for testing purposes. 
                if (BLL.Plan.hasCustomPlans(userInfo.EmployerId) && !(userInfo.EmployerId == "49298"))
                    btn.Visible = false;
                else
                {
                    switch (BLL.Employer.hasRenewalId(userInfo.EmployerId))
                    {
                        case 0:
                            btn.Text = "Click Here to Begin Renewal Process";
                            break;
                        case 1:
                            btn.Text = "Click Here to Continue Renewal Process";
                            break;
                        default:
                            btn.Visible = false;
                            break;
                    }
                }
            }

            if (userInfo.UserRole == UserRoles.Employee)
            {
                Button btn = LoginViewLeftMenuPanel.FindControl("oe") as Button;
                string oeId = BLL.EnrollmentForm.GetMemberUnfinishedOEId(userInfo.EmployeeId);
                btn.Text = string.IsNullOrEmpty(oeId) ? "Start Enrollment" : "Continue Enrollment";
            }
        }

        private void CreateLeftMenu()
        {
            string employerId = BasePage.UrlBuilder(HttpContext.Current.Request, null);
            string erId = Request["erId"];
            UserCacheInfo userInfo = (UserCacheInfo)Session["UserCacheInfo"];
            if (userInfo != null)
            {
                switch (userInfo.UserRole)
                {
                    case UserRoles.Administrator:
                    case UserRoles.Agent:
                    case UserRoles.RK:
                    case UserRoles.Broker:
                    case UserRoles.Enroller:
                        RadPanelBar bar = LoginViewLeftMenuPanel.FindControl("AdminMenuPanel") as RadPanelBar;
                        if (bar != null)
                        {
                            bar.Items.Clear();
                            RadPanelItem item;
                            RadPanelItem subitem;

                            item = new RadPanelItem("&#8810; Go Back", userInfo.UserRole != UserRoles.Broker ? "/employer/BusinessList.aspx": "/Broker/EmployerAssign.aspx");
                            item.CssClass = "blue";
                            bar.Items.Add(item);

                            item = new RadPanelItem("Company&nbsp;Profile", "/employer/businessInfo.aspx" + employerId);
                            item.CssClass = "blue";
                            subitem = new RadPanelItem("Company&nbsp;Documents", "/employer/DocumentsLibrary.aspx" + employerId);
                            item.Items.Add(subitem);
                            subitem = new RadPanelItem("General&nbsp;Documents", "/OnlineDocuments.aspx");
                            subitem.Target = "_blank";
                            item.Items.Add(subitem);
                            item.Expanded = true;
                            bar.Items.Add(item);
                            item = new RadPanelItem("Employee&nbsp;Management");
                            item.Expanded = true;
                            subitem = new RadPanelItem("View&nbsp;Employees", "/employer/employee.aspx" + employerId);
                            item.Items.Add(subitem);
                            subitem = new RadPanelItem("Add&nbsp;New&nbsp;Employee", "/employer/AddEmployee.aspx"+ 
                                (string.IsNullOrEmpty(erId)? employerId : "?erId="+erId) );
                            item.Items.Add(subitem);
                            subitem = new RadPanelItem("Forms&nbsp;History", "/employer/EnrollmentForms.aspx" + employerId);
                            item.Items.Add(subitem);
                            subitem = new RadPanelItem("Coverage&nbsp;Search", "/employer/EmployeeCoveragePlans.aspx" + employerId);
                            item.Items.Add(subitem);
                            //TODO add new page
                            //subitem = new RadPanelItem("Pending&Activity", "/" + employerId);
                            //item.Items.Add(subitem);
                            item.CssClass = "blue";
                            bar.Items.Add(item);

                            item = new RadPanelItem("Plan&nbsp;Management");
                            item.Expanded = true;
                            subitem = new RadPanelItem("Current&nbsp;Plans", "/employer/plans.aspx" + employerId);
                            item.Items.Add(subitem);
                            //TODO add new page
                            //subitem = new RadPanelItem("Contribution&nbsp;Center", "/employer/plans.aspx" + employerId);
                            //item.Items.Add(subitem);
                            item.CssClass = "blue";
                            bar.Items.Add(item);

                            item = new RadPanelItem("Invoice");
                            item.Expanded = true;
                            subitem = new RadPanelItem("Invoice&nbsp;History", "/employer/InvoiceHist.aspx" + employerId);
                            item.Items.Add(subitem);
                            subitem = new RadPanelItem("Payment&nbsp;History", "/employer/InvoiceAR.aspx" + employerId);
                            item.Items.Add(subitem);
                            item.CssClass = "blue";
                            bar.Items.Add(item);
                        }
                        break;
                }
            }
        }

        protected void renew_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Employer/RenewalIntroduction.aspx");
        }

        protected void oe_Click(object sender, EventArgs e)
        {
            Response.Redirect("/OE/Type.aspx");
        }
    }
}