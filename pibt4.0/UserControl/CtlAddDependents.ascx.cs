using System;
using System.Web;
using Pibt.Model;
using Pibt.BLL;
using Pibt.Common;

namespace Pibt.UserControl
{
    public partial class CtlAddDependents : System.Web.UI.UserControl
    {
        public string EmployeeId { get; set; }
        public string EmployerId { get; set; }
        public UserCacheInfo userInfo { get; set; }
        private string newMemberId;

        protected void Page_Load(object sender, EventArgs e)
        {
            lbleeId.Text = EmployeeId;

            MemberInfoDetails MemberInfoDetails = BLL.Employer.GetMemberInfoDetails(EmployeeId);
            lblEeName.Text = MemberInfoDetails.Name.ToString();
            if (!Page.IsPostBack)
            {
                tbAddress1.Focus();
                Model.MemberDetails ee = BLL.Employee.GetMemberDetails(EmployeeId);
                if (ee != null)
                {
                    tbAddress1.Text = ee.AddressOne;
                    tbCity.Text = ee.City;
                    ddlState.SelectedValue = ee.State;
                    tbPostCode.Text = ee.Zip;
                    tbHomePhoneNbr.Text = ee.HomePhoneNbr;
                }
            }

            lblError.Text = "";
        }

        // Disable Marriage Date when adding child or D.P.
        protected void ddlEeType_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool vis = ddlEeType.SelectedValue != "2" && ddlEeType.SelectedValue != "3";
            dpMarriageDate.Visible = vis;
            lb_MarriageDate.Visible = vis;
            lb_MarriageDate2.Visible = vis;
            dpBirthDate.Focus();
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            string employeeType = ddlEeType.SelectedValue.ToString();
            string socsecNbr = tbSSN.Text.Trim().ToUpper();

            if (employeeType.Equals("1") || employeeType.Equals("3"))
            {
                if (BLL.EnrollmentForm.CheckExistDeptActiveplans(EmployeeId, employeeType))
                {
                    lblError.Text = Utilities.FormatError("Active Spouse/Domestic Partner in the system, need to terminate current Spouse/Domestic Partner before adding new one.");
                    return;
                }
            }

            if (employeeType.Equals("1") && dpMarriageDate == null)
            {
                lblError.Text = Utilities.FormatError("Marriage date required for spouse. Enter marriage date.");
                return;
            }

            if (employeeType.Equals("1") && socsecNbr.Equals(""))
            {
                lblError.Text = Utilities.FormatError("SSN required for spouse. Enter SSN.");
                return;
            }            
            if (employeeType.Equals("2"))
            {
                // Depdent age can't over age 26
                // Here is how to do it
                // sysdate - dob = age
                // e.g.: 20080814 - 19800703 = 280111 
                // then the age is  28.0111
                var today = DateTime.Today;
                DateTime DOB = DateTime.Parse(dpBirthDate.SelectedDate.ToString());

                var _today = (today.Year * 100 + today.Month) * 100 + today.Day;
                var _DOB = (DOB.Year * 100 + DOB.Month) * 100 + DOB.Day;
                int _age = (int)(_today - _DOB);

                // if age is over age 26
                if (_age >= 260000)
                {
                    lblError.Text = Utilities.FormatError("Dependent age cannot be over 26.");
                    return;
                }

                // if age is less than 0
                if (_age < 0)
                {
                    lblError.Text = Utilities.FormatError("Dependent birthdate can't be in the future");
                    return;
                }                              
            }

            // if not open enrollment and dependent is not more than 30 days old and it is not new hire 
            if (!BLL.EnrollmentForm.CheckOEWindowByErId(EmployerId) && ((employeeType.Equals("2") && (DateTime.Today - (DateTime)dpBirthDate.SelectedDate).TotalDays >= 30) || (employeeType.Equals("1") && (DateTime.Today - (DateTime)dpMarriageDate.SelectedDate).TotalDays >= 30)) && !EnrollmentForm.CheckIsNewHireAndNotPlans(EmployeeId))
            {
                lblError.Text = Utilities.FormatError("Dependent may only be added within 30 days of a qualifying event.");
                return;
            }

            string mobilePhoneNbr = tbCellNbr.Text;
            string homePhoneNbr = tbHomePhoneNbr.Text;
            string workPhoneNbr = tbWorkPhoneNbr.Text;
            string firstName = tbFName.Text.Trim().ToUpper();
            string lastName = tbLName.Text.Trim().ToUpper();
            string addressOne = tbAddress1.Text.Trim().ToUpper();
            string fault = CtlAddEmployee.allCheck(mobilePhoneNbr, homePhoneNbr, workPhoneNbr, firstName, lastName, addressOne);
            if (fault!=null) {
                lblError.Text = Utilities.FormatError(fault);
                return;
            }

            bool success = false;
            string middleName = tbMName.Text.Trim().ToUpper();
            string male = ddlGender.SelectedValue.ToString();
            string city = tbCity.Text.Trim().ToUpper();
            string state = ddlState.SelectedValue.ToString();
            string zip = tbPostCode.Text.Trim().ToUpper();
            string emailAddress = tbEmail.Text.Trim().ToUpper();
            string handicapped = "N";

            if (male=="X") {
                lblError.Text = Utilities.FormatError("Please select a gender");
                return;
            }

            //get newMemberId
            newMemberId = BLL.Employer.GetNewMemberId();

            if (!string.IsNullOrEmpty(newMemberId))
            {

                // Insert dependent info into BMS.member table  
                success = BLL.Employer.InsertDependent(newMemberId, EmployeeId, EmployerId, lastName, firstName, middleName, employeeType, male, socsecNbr,
                                                       dpBirthDate.SelectedDate, dpMarriageDate.SelectedDate, addressOne, city, state, zip, mobilePhoneNbr, homePhoneNbr, workPhoneNbr,
                                                       emailAddress, handicapped, null, Page.User.Identity.Name);
            }

            if (success)
            {
                Logger.WriteAuditLog(string.Format("{0} added a new dependent {1}.", Page.User.Identity.Name, newMemberId), EventCode.AddDependent);
                cleanForm();
                Response.Redirect("/OE/EmployeeInfo.aspx" + BasePage.UrlBuilder(HttpContext.Current.Request, null));
            }
            else
            {
                lblError.Text = Utilities.FormatError("Add new dependent failed! Try again or call " + Utilities.Us() + " for support!");
                Logger.InsertLog(new WebSiteLog
                {
                    LogType = LogType.Error,
                    EventCode = EventCode.AppError,
                    EventDetails = "Error adding new dependent in CtlAddDependent.ascx.cs",
                    UserName = Page.User.Identity.Name,
                    FromIP = HttpContext.Current.Request.UserHostAddress
                });
            }
        }

        protected void cleanForm()
        {
            tbFName.Text = string.Empty;
            tbMName.Text = string.Empty;
            tbSSN.Text = string.Empty;
            dpBirthDate.SelectedDate = null;
            dpMarriageDate.SelectedDate = null;
            tbCellNbr.Text = string.Empty;
            tbWorkPhoneNbr.Text = string.Empty;
        }
    }
}