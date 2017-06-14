using System;
using System.Web;
using System.Web.UI.WebControls;
using Pibt.BLL;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.UserControl
{
    public partial class CtlAddEmployee : System.Web.UI.UserControl
    {
        private string newMemberId;
        public string EmployerId { get; set; }
        public string EmployeeId { get; set; }
        public string HireDate { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
           if (BLL.Employer.SingleDepartment(EmployerId))
               ddlDept.Enabled = false;
        }

        protected void btPrevious_Click(object sender, EventArgs e)
        {
           Response.Redirect( "/employer/Employee.aspx"+ BasePage.UrlBuilder(HttpContext.Current.Request, null));
        }

        static public string phoneCheck(string ph, string fld) {
            switch (ph.Length) {
                case 0:
                    return null;
                case 10:
                    break;
                default:
                    return "Invalid " + fld + " phone number.";
            }
            char[] digits = ph.ToCharArray();
            for (int i=10; --i>=0; )
                if ((i==0 || i==3) && digits[i]<'2' || digits[i]<'0' || digits[i]>'9')
                    return "Invalid " + fld + " phone number.";
            return null;
        }

        static public string allCheck(string phm, string phh, string phw, string fn, string ln, string adr) {
            string fault = phoneCheck(phm, "Mobile");
            if (fault!=null)
                return fault;
            fault = phoneCheck(phh, "Home");
            if (fault!=null)
                return fault;
            fault = phoneCheck(phw, "Work");
            if (fault!=null)
                return fault;
            if (fn.Contains("*"))
                return "First name must not contain an asterisk.";
            char[] lastNameChars = ln.ToCharArray();
            for (int i=ln.Length; --i>=0; ) {
                char c = lastNameChars[i];
                if ((c<'A' || c>'Z') && c!=' ' && c!='-' && c!='.' && c!='\'')
                    return "Last name may contain only letters, blank, dash, period, and apostrophe.";
            }
            if (adr.Contains("*"))
                return "Address must not contain an asterisk.";
            return null;
        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (!(tbPostCode.Text.Length == 5 || tbPostCode.Text.Length == 9))
                {
                    lblError.Text = Utilities.FormatError("Zip length must be 5 or 9.");
                    return;
                }

                string male = ddlGender.SelectedValue.ToString();
                if (male=="X") {
                    lblError.Text = Utilities.FormatError("Please choose a gender.");
                    return;
                }

                string mobilePhoneNbr = tbCellNbr.Text;
                string homePhoneNbr = tbHomePhoneNbr.Text;
                string workPhoneNbr = tbWorkPhoneNbr.Text;
                string firstName = tbFName.Text.Trim().ToUpper();
                string lastName = tbLName.Text.Trim().ToUpper();
                string addressOne = tbAddress1.Text.Trim().ToUpper();
                string salaryPerPeriod = string.IsNullOrEmpty(tbSalary.Text)? "0" : tbSalary.Text;
                string periodsPerYear= ddlPeriod.SelectedValue;
                string hoursWorked= tbHours.Text;
                string smoker=ddlSmoker.SelectedValue;
                string fault = allCheck(mobilePhoneNbr, homePhoneNbr, workPhoneNbr, firstName, lastName, addressOne);
                if (fault!=null) {
                    lblError.Text = Utilities.FormatError(fault);
                    return;
                }

                bool success = false;
                newMemberId = BLL.Employer.GetNewMemberId();
                if (!string.IsNullOrEmpty(newMemberId))
                {
                   // TODO Fill the extra fields currently nulls
                   success = BLL.Employer.InsertMember(newMemberId, newMemberId, EmployerId, lastName, firstName, tbMName.Text.Trim().ToUpper(), "0"
                       /*employeeType*/, male, tbSSN.Text.Trim(), dpBirthDate.SelectedDate, dpMarriageDate.SelectedDate, dpHireDate.SelectedDate, addressOne, null, tbCity.Text.Trim().ToUpper(), ddlState.SelectedValue.ToString(), tbPostCode.Text.Trim(), mobilePhoneNbr, homePhoneNbr, workPhoneNbr, tbEmail.Text.Trim().ToUpper(), "N",
                       dpMarriageDate.SelectedDate == null ? "0" : "1", ddlDept.SelectedValue.ToString(), Page.User.Identity.Name, salaryPerPeriod, periodsPerYear, hoursWorked, smoker);
                }

                if (success)
                {
                    Logger.WriteAuditLog(string.Format("{0} added a new employee {1}.", Page.User.Identity.Name, newMemberId), EventCode.AddEmployee);
                    cleanForm();
                    Response.Redirect("/OE/EmployeeInfo.aspx" + BasePage.UrlBuilder(HttpContext.Current.Request,"&eeId=" + newMemberId));
                }
                else
                {
                    lblError.Text = Utilities.FormatError("Add Employee failed! Try again or contact " + Utilities.Us() + " for support!");
                    Logger.InsertLog(new WebSiteLog
                    {
                        LogType = LogType.Error,
                        EventCode = EventCode.AppError,
                        EventDetails = "Error adding new Employee at line 81 on CtlAddEmployee.ascx.cs",
                        UserName = Page.User.Identity.Name,
                        FromIP = HttpContext.Current.Request.UserHostAddress
                    });
                    lblCreationMessage2.Text = lblError.Text;
                }
            }
            catch (Exception exc)
            {
                lblError.Text = Utilities.FormatError("Add employee failed! Try again or contact " + Utilities.Us() + " for support!");
                Logger.InsertLog(new WebSiteLog
                {
                    LogType = LogType.Error,
                    EventCode = EventCode.AppError,
                    EventDetails = exc.Message,
                    UserName = Page.User.Identity.Name,
                    FromIP = HttpContext.Current.Request.UserHostAddress
                });
                lblCreationMessage2.Text = lblError.Text;
            }
        }

        protected void cleanForm()
        {
            tbLName.Text = string.Empty;
            tbFName.Text = string.Empty;
            tbMName.Text = string.Empty;
            tbSSN.Text = string.Empty;
            dpBirthDate.SelectedDate = null;
            dpMarriageDate.SelectedDate = null;
            tbAddress1.Text = string.Empty;
            tbCity.Text = string.Empty;
            tbPostCode.Text = string.Empty;
            tbCellNbr.Text = string.Empty;
            tbHomePhoneNbr.Text = string.Empty;
            tbWorkPhoneNbr.Text = string.Empty;
            tbEmail.Text = string.Empty;
        }

        protected void odsDepartments_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["employerId"] = EmployerId;
        }

        protected void RadDatePicker1_SelectedDateChanged(object sender, Telerik.Web.UI.Calendar.SelectedDateChangedEventArgs e)
        { 
           string hireDate = String.Format("{0:MM/dd/yyyy}", dpHireDate.SelectedDate);
           if (EnrollmentForm.CheckAddPlansAvailable(EmployerId, hireDate) || BLL.EnrollmentForm.CheckOEWindowByErId(EmployerId)){
               ddlPeriod.Focus();
               HireDateLabel.Text = "";
           }
           else
               HireDateLabel.Text = "The entered hire date " + hireDate + " is not within employer waiting period.<br>" +
                      "You can either wait for next open enrollment (November - January) or cancel the enrollment form.";
                        // TODO Call out actual OE period
        }
    }
}