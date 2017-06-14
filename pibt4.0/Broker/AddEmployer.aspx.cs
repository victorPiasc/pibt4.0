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
    public partial class AddEmployer : BasePage
    {
        public BizInfoDetails newEmployer
        {
            get
            {
                object tmp = Session["newEmployer"];
                if (tmp == null)
                    Session["newEmployer"] = new BizInfoDetails();
                return (BizInfoDetails)Session["newEmployer"];
            }
            set { Session["newEmployer"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(newEmployer.EmployerId))//check if we already have a session open
                {
                    DataTable dt = BLL.Plan.getEmployerPlanTypes(newEmployer.EmployerId);
                    if (dt.Rows.Count > 0)//if the employer in the session has plans then the employer has been added already. 
                    {
                        newEmployer = new BizInfoDetails();//create new employer
                        BLL.OnlineQuote.ForceNewCartId();
                    }
                }
                page2.pageSetup(newEmployer);
            }
            if (!string.IsNullOrEmpty(newEmployer.EmployerId))
                CtlLeftMenu1.ViewStateMode = ViewStateMode.Disabled;
        }

        protected void next_Click(object sender, EventArgs e)
        {
            page2.pUser = newEmployer;
            if (page2.validatePage(BrokerId))
            {
                newEmployer = page2.pUser;
                Response.Redirect("/Broker/AddEmployerDepartments.aspx");
            }
            else
                message.Text = Common.Utilities.FormatError("Could not add employer");
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            cancelBrokerEmployer(newEmployer);
        }
    }
}