using System;
using System.Data;

namespace Pibt.UserControl
{
    public partial class CtlQQ3 : System.Web.UI.UserControl
    {
        public string employerId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ctlDepartments1.EmployerId = employerId;
        }

        public void pageSetup(string employer)
        {
            employerId = employer;
            DataTable dt = BLL.Employer.GetDepartments(employerId);
            if(dt.Rows.Count<1)
                BLL.Employer.InsertDepartments(employerId, "100", "General");
            ctlDepartments1.EmployerId = employerId;
            ctlDepartments1.reloadGrid();
        }
    }
}