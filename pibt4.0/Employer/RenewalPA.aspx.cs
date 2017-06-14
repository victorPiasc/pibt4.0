using Pibt.Common;
using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Windows.Forms;
using Telerik.Web.UI;

namespace Pibt.Employer
{
    public partial class RenewalPA : BasePage
    {
        public Renewal renew
        {
            get
            {
                if (Session["renewal"] == null)
                    Session["renewal"] = BLL.Employer.getUnfinishedRenewalId(EmployerId);
                return (Renewal)Session["renewal"];
            }
            set { Session["renewal"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            pageSetup();
            //DateTime date = BLL.OnlineQuote.oeEnddate(EmployerId);
            //paForm.NavigateUrl += "&erId=" + EmployerId + "&date=" + date.ToShortDateString();
        }

        public void pageSetup()
        {
            BizInfoDetails deets = BLL.Employer.GetBizInfoDetails(EmployerId);
            BizAdditionalInfo deets2 = BLL.Employer.GetBizInfoDetails2(EmployerId);
            lbCompanyName.Text = deets.CompanyName;
            //TODO talk to step about ignoring DBA and using Company name.
            //lblDba.text = 
            lblEffective.Text = renew.effectiveDate.ToShortDateString();
            lblFein.Text = deets2.Taxid;
            lblAddress.Text = deets.MailingStreetAddress1;
            lblCity.Text = deets.MailingCity;
            lblState.Text = deets.MailingState;
            lblZip.Text = deets.MailingPostCode;
            lblPhone.Text = deets.Phonenbr;
            lblFax.Text = deets.Faxnbr;
            lblWaitingperiod.Text = deets2.WaitingPeriod;
            lblNbrEmployees.Text = BLL.OnlineQuote.CheckWebCartCount(renew.cartId, 0);
            int signatureId = BLL.Employer.getSigntureId(renew.renewalId, 1, null);
            imgSignature.ImageUrl = "/Employer/renewalSign.ashx?signatrue=" + HttpUtility.UrlEncode(Common.Utilities.Encrypt(signatureId.ToString()));
            lblCrName.Text = renew.name;
            lblCrTitle.Text = renew.title;
            lblDate.Text = DateTime.Now.ToShortDateString();
            if (renew.isPercent == "Y")
            {
                perPlanType.Visible = true;
                if (renew.isOverAll == "Y")
                {
                    int[] percent = BLL.OnlineQuote.getPercent(renew.cartId);
                    for (int i = 1; i < 6; i++)
                    {
                        (perPlanType.FindControl("top_" + i) as System.Web.UI.WebControls.TextBox).Text = percent[0].ToString();
                        (perPlanType.FindControl("bot_" + i) as System.Web.UI.WebControls.TextBox).Text = percent[1].ToString();
                    }
                }
                else
                {
                    DataTable dt = BLL.OnlineQuote.getERPlanTypeConts(renew.cartId);
                    for (int i = 1; i < 6; i++)
                    {
                        (perPlanType.FindControl("top_" + i) as System.Web.UI.WebControls.TextBox).Text = dt.Rows[i - 1].ItemArray[0].ToString();
                        (perPlanType.FindControl("bot_" + i) as System.Web.UI.WebControls.TextBox).Text = dt.Rows[i - 1].ItemArray[1].ToString();
                    }
                }
            }
            else
            {
                dollar.Visible = true;
                decimal[] dollarAmounts = BLL.OnlineQuote.getDollars(renew.cartId);
                lbEEDollar.Text = dollarAmounts[0].ToString();
                lbDepDollar.Text = dollarAmounts[1].ToString();
            }
            
            DataTable dt2 = BLL.OnlineQuote.getRenewalPlanPt(renew.cartId);
            foreach (DataRow dr in dt2.Rows)
            {
                object ct = masterPanel.FindControl("radgrid_" + dr.ItemArray[0].ToString());
                if (ct != null)
                {
                    RadGrid type = (ct as RadGrid);
                    type.Visible = true;
                }
            }
        }

        protected void med_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            radgrid_1.DataSource = BLL.OnlineQuote.GetRenewalPlans(renew.cartId, 1);
        }

        protected void den_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            radgrid_2.DataSource = BLL.OnlineQuote.GetRenewalPlans(renew.cartId, 2);
        }

        protected void vis_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            radgrid_3.DataSource = BLL.OnlineQuote.GetRenewalPlans(renew.cartId, 3);
        }

        protected void chiro_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            radgrid_4.DataSource = BLL.OnlineQuote.GetRenewalPlans(renew.cartId, 4);
        }

        protected void vtl_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            radgrid_6.DataSource = BLL.OnlineQuote.GetRenewalPlans(renew.cartId, 6);
        }

        protected void mtl_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            radgrid_7.DataSource = BLL.OnlineQuote.GetRenewalPlans(renew.cartId, 7);
        }

        protected void mh_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            radgrid_8.DataSource = BLL.OnlineQuote.GetRenewalPlans(renew.cartId, 8);
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            if (saveToRenewal(--renew.state) )
                Response.Redirect("/Employer/RenewalTerms.aspx");
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (saveToRenewal(renew.state))
                Response.Redirect("/Employer/BusinessInfo.aspx");
        }

        protected void Continue_Click(object sender, EventArgs e)
        {
            if ( BLL.OnlineQuote.completePlanTransfer(renew.cartId, User.Identity.Name, EmployerId, renew.effectiveDate) &&
                    BLL.OnlineQuote.updateToComplete(renew.renewalId, renew.state, "Y"))
            {
                UserCacheInfo userInfo = CurrentUserInfo;
                MembershipUser user = Membership.GetUser(userInfo.LoginName);
                BizAdditionalInfo erAddi = BLL.Employer.GetBizInfoDetails2(EmployerId);
                RKDetails rk = BLL.RK.GetRKDetailsById(erAddi.RKId);
                string from = ApplicationConfiguration.SystemMailSender;
                string to = BLL.User.GetWebUserEmail(EmployerId);
                string subject = EmployerId+ " "+ Utilities.Us() + "Renewal Process Completed";
                string body = "This message confirms that the form was successfully submitted. If further information is required you will be contacted by " +
                    Utilities.Us() + ". If you are not contacted for additional information, please consider it completed. If you have any questions contact " +
                    Utilities.Us() + " at 1 (323) 728-9500 or 1 (800) 449-4898 Outside the Los Angeles Area<br/><br/>" +
                    Utilities.Us() + "<br/><br/>" + disclaimer;
                Utilities.SendMail(from, to,"", rk.EmailAddress, subject, body);
                Response.Redirect("/Employer/RenewalFinished.aspx");
            }
        }

        protected void startOver_Click(object sender, EventArgs e)
        {
            if (BLL.OnlineQuote.TransferErToQuote(renew.cartId, EmployerId) &&
                BLL.OnlineQuote.updateRenewal(renew.renewalId, 1, null, null))
                Response.Redirect("/Employer/RenewalAtoA.aspx");
        }

        public bool saveToRenewal(int state)
        {
            return BLL.OnlineQuote.updateRenewal(renew.renewalId, state, renew.isPercent, renew.isOverAll);
        }

        protected void terminatedPlans_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            terminatedPlans.DataSource = BLL.OnlineQuote.getRenewalTermPlans(EmployerId, renew.cartId);
        }
    }
}