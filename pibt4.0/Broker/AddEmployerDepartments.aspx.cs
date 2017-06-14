using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using System.Data;

namespace Pibt.Broker
{
    public partial class AddEmployerDepartments : BasePage
    {
        public BizInfoDetails newEmployer
        {
            get
            {
                object tmp = Session["newEmployer"];
                return tmp == null ? null : (BizInfoDetails)tmp;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (newEmployer == null)
                oops();
            DataTable dt = BLL.Employer.GetDepartments(newEmployer.EmployerId);
            if (dt.Rows.Count < 1)
                BLL.Employer.InsertDepartments(newEmployer.EmployerId, "100", "General");
            CtlDept.EmployerId = newEmployer.EmployerId;
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            cancelBrokerEmployer(newEmployer);
        }

        protected void save_Click(object sender, EventArgs e)
        {
            saveForLaterBrokerEmployer();
        }
    }
}