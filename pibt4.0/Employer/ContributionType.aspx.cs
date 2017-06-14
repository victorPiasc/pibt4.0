using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Employer
{
    public partial class contributionType : BasePage
    {
        public Renewal renew
        {
            get
            {
                if (Session["renewal"] == null)
                {
                    Session["renewal"] = BLL.Employer.getUnfinishedRenewalId(EmployerId);
                }
                return (Renewal)Session["renewal"];
            }
            set
            {
                Session["renewal"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (renew == null)
                Response.Redirect("/Employer/Plans.aspx");
        }

        public bool saveToRenewal(int state)
        {
            for (int i = 1; i < 4; i++)
            {
                if ((view2.FindControl("choice_" + i) as RadioButton).Checked)
                    renew.contributionId = i;
            }
            renew.state = state;
            return BLL.OnlineQuote.updateRenewalCont(renew.renewalId, state, renew.contributionId);
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            if(BLL.OnlineQuote.updateRenewal(renew.renewalId, --renew.state, renew.isPercent, renew.isOverAll))
                Response.Redirect("/Employer/Contribution.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Employer/BusinessInfo.aspx");
        }

        protected void Continue_Click(object sender, EventArgs e)
        {
            if (saveToRenewal(++renew.state))
                Response.Redirect("/Employer/RenewalDashBoard.aspx");
        }
    }
}