using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Broker
{
    public partial class AddEmployerOverview : BasePage
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
            if (!IsPostBack)
                page6.pageSetup();
        }

        protected void next_Click(object sender, EventArgs e)
        {
            DateTime effective = DateTime.Parse(Session["effectiveDate"].ToString());
            if (BLL.OnlineQuote.completePlanTransfer(BLL.OnlineQuote.QQCartId, User.Identity.Name, newEmployer.EmployerId, effective))
            {
                BLL.OnlineQuote.ForceNewCartId();
                Response.Redirect("/Broker/EmployerAssign.aspx");
            }
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