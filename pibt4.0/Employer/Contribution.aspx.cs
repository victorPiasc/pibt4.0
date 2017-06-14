using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Employer
{
    public partial class Contribution : BasePage
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
            if (!IsPostBack)
                setPage();
        }

        protected void keepCur_Click(object sender, EventArgs e)
        {
            renew.isPercent = "Y" ;
            renew.isOverAll = "Y";
            if (BLL.OnlineQuote.updateRenewal(renew.renewalId, 3, renew.isPercent, renew.isOverAll))
                Response.Redirect("/Employer/ContributionType.aspx");
        }

        public void setPage()
        {
            DataTable dt = BLL.Employer.getContribution(EmployerId);
            
            eeCount.Text = dt.Rows[0].ItemArray[0].ToString() + " %";
            depCount.Text = dt.Rows[0].ItemArray[1].ToString() + " %";
        }

        public bool saveToRenewal(int state)
        {
            string tmp1, tmp2;
            renew.state = state;
            renew.isPercent = rdlPercentDollar.SelectedValue == "2" ? "N" : "Y";
            renew.isOverAll = rdlPerType.SelectedValue == "2" ? "N" : "Y";
            DataTable dt = BLL.Employer.getContribution(EmployerId);
            BLL.OnlineQuote.updateRenewal(renew.renewalId, state, renew.isPercent, renew.isOverAll);
            if (renew.isPercent=="N")
            {
                tmp1 = string.IsNullOrEmpty(dollarCont.Text) ? "0" : dollarCont.Text;
                tmp2 = string.IsNullOrEmpty(dollarDepCont.Text) ? "0" : dollarDepCont.Text;
                //if dollar then update dollar contribution, update percent to 50% set rates and set the subsidy
                return BLL.OnlineQuote.UpdateEmployerDollar(renew.cartId, tmp1, tmp2) &&
                    BLL.OnlineQuote.UpdateEmployerContributions(renew.cartId, "50", "50", "N") && 
                    BLL.OnlineQuote.setSubsidy(renew.cartId);
            }
            if(renew.isOverAll=="N")
            {
                for (int i = 1; i < 6; i++)
                {
                    tmp1 = (perPlanTypeCont.FindControl("top_" + i) as TextBox).Text;
                    tmp2 = (perPlanTypeCont.FindControl("bot_" + i) as TextBox).Text;
                    if (!BLL.OnlineQuote.InsertPlanTypeContributions(renew.cartId, i == 5 ? i + 3 : i,
                        string.IsNullOrEmpty(tmp1) ? dt.Rows[0].ItemArray[0].ToString() : tmp1, string.IsNullOrEmpty(tmp2) ? dt.Rows[0].ItemArray[1].ToString() : tmp2, "N"))
                        return false;
                }
                return true;
            }
            tmp1 = string.IsNullOrEmpty(overAllContEE.Text) ? dt.Rows[0].ItemArray[0].ToString() : overAllContEE.Text;
            tmp2 = string.IsNullOrEmpty(overAllContDep.Text) ? dt.Rows[0].ItemArray[1].ToString() : overAllContDep.Text;
            return BLL.OnlineQuote.UpdateEmployerContributions(renew.cartId, tmp1, tmp2, "N");
        }

        protected void Continue_Click(object sender, EventArgs e)
        {
            BLL.OnlineQuote.resetRates(renew.cartId, EmployerId);
            if (saveToRenewal(renew.isPercent == "N" ? 4 : 3))
                Response.Redirect(renew.isPercent == "N" ? "/Employer/RenewalDashboard.aspx" : "/Employer/ContributionType.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (saveToRenewal(renew.state))
                Response.Redirect("/Employer/BusinessInfo.aspx");
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            if (BLL.OnlineQuote.updateRenewal(renew.renewalId, --renew.state, renew.isPercent, renew.isOverAll) &&
                BLL.OnlineQuote.TransferErToQuote(renew.cartId, EmployerId))
                Response.Redirect("/Employer/RenewalAtoA.aspx");
        }
    }
}