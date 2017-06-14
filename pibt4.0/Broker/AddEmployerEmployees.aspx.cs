using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Broker
{
    public partial class AddEmployerEmployees : BasePage
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
            if(!IsPostBack)
                page4.pageSetup(newEmployer);
            page4.pUser = newEmployer;
        }

        protected void next_Click(object sender, EventArgs e)
        {
            page4.pUser = newEmployer;
            if (page4.validatePage())
                Response.Redirect("/Broker/AddEmployerDashboard.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string uploadMessage = SortaBasePage.uploadGeneric(HttpContext.Current, fuCensus, "../UploadFiles/", 0, 0, newEmployer, false);
            if (!string.IsNullOrEmpty(uploadMessage))
               message.Text = Common.Utilities.FormatError(uploadMessage);
            page4.rebind(newEmployer);
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