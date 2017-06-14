using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Pibt.Model;
using Pibt.BLL;

namespace Pibt.UserControl
{
    public partial class CtlEnrollmentFormTitle : System.Web.UI.UserControl
    {
        public string EmployeeId;
        public string EmployerId;
        public string oeId;

        protected void Page_Load(object sender, EventArgs e)
        {
            MemberInfoDetails MemberInfoDetails = BLL.Employer.GetMemberInfoDetails(EmployeeId);

            Label1.Text = "Employee # " + EmployeeId + "  " + MemberInfoDetails.Name.ToString();

            DateTime dt;          
            if (!string.IsNullOrEmpty(oeId))
            {
                //Get OE Id.
                OeDetails OEDetails = EnrollmentForm.GetOEDetails(oeId);
                if (!string.IsNullOrEmpty(OEDetails.Id))
                {
                    Label2.Visible = Label3.Visible = true;
                    Label2.Text = "<b>Form ID</b>: " + OEDetails.Id
                                + " || <b>Date Created</b>: "
                                + OEDetails.Created;

                    Label3.Text = "<b>Form Type:</b> " + OEDetails.TypeName + "<br>";
                }
            }

            if (!EnrollmentForm.GetCurrentPA(EmployerId, out dt) && EnrollmentForm.CheckOEWindowByErId(EmployerId))
            {
                Label4.Visible = true;
                Label4.Text = "<div class=\"required-info\">Participation Agreement has expired. Contact your Relationship Keeper to renew your Participation Agreement</div>";
            }
        }
    }
}