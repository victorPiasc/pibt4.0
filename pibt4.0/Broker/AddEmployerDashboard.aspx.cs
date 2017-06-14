using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Broker
{
    public partial class AddEmployerDashboard : BasePage
    {
        public BizInfoDetails newEmployer
        {
            get
            {
                object tmp = Session["newEmployer"];
                return tmp == null ? null : (BizInfoDetails)tmp;
            }
        }

        public int cartId { get { return BLL.OnlineQuote.QQCartId; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (newEmployer == null)
                oops();
            if (!IsPostBack)
            {
                BLL.EnrollmentForm.TransferERForOe(cartId, newEmployer.EmployerId);
                BLL.OnlineQuote.newEmployerQuote(BLL.OnlineQuote.QQCartId, newEmployer.EmployerId);
                page5.pageSetup(newEmployer.PhsicalPostCode);
                page5.cartId = cartId;
                page5.display = false;
            }
        }

        protected void next_Click(object sender, EventArgs e)
        {
            if (page5.validatePage())
                Response.Redirect("/Broker/AddEmployerOverview.aspx");
            else
                message.Text = Common.Utilities.FormatError("Could not add plans");
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