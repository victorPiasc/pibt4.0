using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Employer
{
    public partial class RenewalIntroduction : BasePage
    {
        public enum statePage
        {
            RenewalAtoA = 1,
            Contribution = 2,
            ContributionType = 3,
            RenewalDashboard = 4,
            RenewalOverview = 5,
            RenewalTerms = 6,
            RenewalPA = 7,
            RenewalFinished = 8
        };

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Renewal renew = BLL.Employer.getUnfinishedRenewalId(EmployerId);
            if (renew != null)
                BLL.OnlineQuote.cancelRenewal(renew.renewalId);
            Response.Redirect("/Employer/BusinessInfo.aspx");
        }

        protected void next_Click(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = (UserCacheInfo)Session["UserCacheInfo"];
            Renewal renew = BLL.Employer.getUnfinishedRenewalId(userInfo.EmployerId);
            if (renew != null)
            {
                if (Session["renewal"] == null)
                    Session["renewal"] = renew;

                BLL.OnlineQuote.SetCookie(renew.cartId);
                Response.Redirect("/Employer/" + (statePage)renew.state + ".aspx");
            }
            else
            {
                renew = new Renewal();
                renew.cartId = BLL.OnlineQuote.ForceNewCartId();
                renew.renewalId = BLL.Employer.getNewRenewalId();
                renew.effectiveDate = BLL.OnlineQuote.planEffectiveDate(EmployerId);
                if (BLL.OnlineQuote.startRenewal(renew.renewalId, userInfo.EmployerId, renew.cartId, 1))
                {
                    Session["renewal"] = renew;
                    Response.Redirect("/Employer/RenewalAtoA.aspx");
                }
            }
        }
    }
}