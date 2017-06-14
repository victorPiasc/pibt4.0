using System;
using System.Web;
using System.Web.UI.WebControls;
using Pibt.BLL;
using Pibt.Model;

namespace Pibt.UserControl
{
    public partial class CtlEditMemberDetails : System.Web.UI.UserControl
    {
        public UserRoles Role { get; set; }
        public string EmployeeId { get; set; }
        public string MemberId { get; set; }
        public string EmployerId { get; set; }
        private string SSN { get { return Common.Utilities.ToString(ViewState["SSN"]); } set { ViewState["SSN"] = value; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Role != UserRoles.Administrator)
                {
                    dpBirthDate.Enabled = false;
                    dpMarriageDate.Enabled = false;
                    dpHireDate.Enabled = false;
                    ckHandicapped.Enabled = false;
                    dpAdoptionDate.Enabled = false;
                }
                BuildForm();
                ddlDept.Enabled = !BLL.Employer.SingleDepartment(EmployerId);
            }
            ContributionOptions.Visible = Role != UserRoles.Employee && Role != UserRoles.Dependent;
            lblError.Text = "";
        }

        protected void BuildForm()
        {
            MemberDetails mDetails = BLL.Employee.GetMemberDetails(MemberId);
            if (mDetails == null)
                BasePage.oops(HttpContext.Current);

            //Sets first panel
            tbLName.Text = mDetails.LastName;
            tbFName.Text = mDetails.FirstName;
            tbMName.Text = mDetails.MiddleName;
            ddlGender.SelectedValue = mDetails.Gender == "Male" ? "Y" : "N" ;
            SSN = mDetails.SocsecNbr;
            ddlEeType.SelectedValue = mDetails.EmployeeTypeId;
            ddlSmoker.SelectedValue = mDetails.smoker? "Y" : "N";
            tbHours.Text = mDetails.hoursWorked;
            if (!string.IsNullOrEmpty(mDetails.BirthDate))
            {
                dpBirthDate.SelectedDate = Convert.ToDateTime(mDetails.BirthDate);
            }

            if (!string.IsNullOrEmpty(mDetails.MarriageDate))
            {
                dpMarriageDate.SelectedDate = Convert.ToDateTime(mDetails.MarriageDate);
            }

            if (!string.IsNullOrEmpty(mDetails.HireDate))
            {
                dpHireDate.SelectedDate = Convert.ToDateTime(mDetails.HireDate);
            }

            //Sets Physical address and contact details 
            tbAdd1.Text = mDetails.AddressOne;
            tbAdd2.Text = mDetails.AddressTwo;
            tCity.Text = mDetails.City;
            ddlState.SelectedValue = mDetails.State;
            tbZip.Text = mDetails.Zip;
            tbHomePhoneNbr.Text = mDetails.HomePhoneNbr;
            tbWorkPhoneNbr.Text = mDetails.WorkPhoneNbr;
            tbCellNbr.Text = mDetails.MobilePhoneNbr;
            tEmail.Text = mDetails.EmailAddress;
            ddlDept.SelectedValue = mDetails.DeptId;
            ckHandicapped.Checked = mDetails.Handicapped == "Y";

            if (!string.IsNullOrEmpty(mDetails.AdoptionDate))
            {
                dpAdoptionDate.SelectedDate = Convert.ToDateTime(mDetails.AdoptionDate);
            }
            lblName.Text = mDetails.LastName + ", " + mDetails.FirstName + " " + mDetails.MiddleName;

            lblEmployeeType.Text = "#" + mDetails.MemberId + " " + mDetails.EemployeeType;

            if (Convert.ToInt32(mDetails.EmployeeTypeId) > 0)
                lblEmployeeType.Text = lblEmployeeType.Text + " of Employee #" + mDetails.EmployeeId;

            if (mDetails.EmployeeTypeId.Equals("0"))
            {
                dpAdoptionDate.Visible = false;
                lblAdoptionDate.Visible = false;
            }
            else
            {
                lblHireDate.Visible = false;
                dpHireDate.Visible = false;
                RfvDpHireDate.Enabled = false;
                lblDepartment.Visible = false;
                ddlDept.Visible = false;
                lblDeptId.Text = mDetails.DeptId;
            }

            //sets Employer contribution 
            eeContribution.Text = mDetails.EeContribution;
            depContribution.Text = mDetails.DepContribution;
            eeDollar.Text = mDetails.EeDollar;
            depDollar.Text = mDetails.DepDollar;
            ddlPeriod.SelectedValue = mDetails.PeriodsPerYear;
            salary.Text = mDetails.SalaryPerPeriod;
        }

        protected void btUpdate_Click(object sender, EventArgs e)
        {
            string mobilePhoneNbr = tbCellNbr.Text;
            string homePhoneNbr = tbHomePhoneNbr.Text;
            string workPhoneNbr = tbWorkPhoneNbr.Text;
            string lastName = tbLName.Text.Trim().ToUpper();
            string firstName = tbFName.Text.Trim().ToUpper();
            string addressOne = tbAdd1.Text.Trim().ToUpper();
            string addressTwo = tbAdd2.Text.Trim().ToUpper();
            string hours = tbHours.Text;
            string smoker = ddlSmoker.SelectedValue;
            string fault = CtlAddEmployee.allCheck(mobilePhoneNbr, homePhoneNbr, workPhoneNbr, firstName, lastName, addressOne);
            if (fault!=null) {
                lblError.Text = Common.Utilities.FormatError(fault);
                return;
            }

            string marriageDate = String.Format("{0:MM/dd/yyyy}", dpMarriageDate.SelectedDate);
            string emailAddress = tEmail.Text.Trim().ToUpper();
            // TODO Factor our UpdateMemberContribution, so that the data is stored in [Web_]InsertMember and Web_UpdateMember.  Then, factor these variables out.
            string periodperyear = ddlPeriod.SelectedValue;
            string salaryperperiod = string.IsNullOrEmpty(salary.Text) ? "0" : salary.Text;
            //TODO move this check to client side
            if (ddlEeType.SelectedValue.Equals("1") && !dpMarriageDate.SelectedDate.HasValue)
            {
                lblError.Text = Common.Utilities.FormatError("Marriage date required for spouse. Enter marriage date.");
                return;
            }

            if (ddlEeType.SelectedValue.Equals("1") && SSN.Equals(""))
            {
                lblError.Text = Common.Utilities.FormatError("SSN required for spouse. Enter SSN.");
                return;
            }

            // TODO Store addressTwo, hoursWorked, and smoker
            bool success = BLL.Employee.UpdateMember(MemberId, lastName, firstName, string.IsNullOrEmpty(tbMName.Text) ? "" : tbMName.Text.Trim().ToUpper(),
                ddlGender.SelectedValue.ToString(), SSN, dpBirthDate.SelectedDate, dpMarriageDate.SelectedDate,
                dpHireDate.SelectedDate, addressOne, addressTwo, tCity.Text.Trim().ToUpper(), ddlState.SelectedValue.ToString(),
                tbZip.Text.Trim(), mobilePhoneNbr, homePhoneNbr, workPhoneNbr, emailAddress, ckHandicapped.Checked ? "Y" : "N",
                ddlEeType.SelectedValue.Equals("0") ? ddlDept.SelectedValue.ToString() : lblDeptId.Text,
                dpAdoptionDate.SelectedDate, Page.User.Identity.Name, salaryperperiod, periodperyear, hours, smoker);

            if (Role!=UserRoles.Employee && Role!=UserRoles.Dependent && !BLL.Employee.UpdateMemberContribution(MemberId,
                eeContribution.Text, depContribution.Text, eeDollar.Text,  depDollar.Text, periodperyear, salaryperperiod))
            {
                lblError.Text = Common.Utilities.FormatError("Update member failed! Try again later or call Support.");
                return;
            }

            if (success)
            {
                string aspnetUserName = BLL.User.GetWebUserLoginname(MemberId, Role);
                if (!string.IsNullOrEmpty(aspnetUserName))
                {
                    BLL.User.UpdateMembshipUserEmail(aspnetUserName, emailAddress);
                }

                Logger.WriteAuditLog(string.Format("{0} updated {1}", Page.User.Identity.Name, EmployeeId),
                    ddlEeType.SelectedValue.Equals("0") ? EventCode.UpdateEmployee : EventCode.UpdateDependent);
                btPrevious_Click(null, null);
            }
            else
            {
                lblError.Text = Common.Utilities.FormatError("Update member failed! Try again later or call Support.");
            }
        }

        protected void odsDepartments_Selecting(object sender, System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["employerId"] = EmployerId;
        }

        protected void btPrevious_Click(object sender, EventArgs e)
        {
            string erId = Request["erId"];
            string eeId = Request["eeId"];
            Response.Redirect("~/employer/EmployeeDetails.aspx" + (string.IsNullOrEmpty(erId)? (string.IsNullOrEmpty(eeId)? "": "?eeId="+eeId): (string.IsNullOrEmpty(eeId)?  "?erId="+erId : "?erId="+erId + "&eeId="+eeId  )));
        }
    }
}