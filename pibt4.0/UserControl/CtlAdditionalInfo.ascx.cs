using System;

using Telerik.Web.UI;
using System.Web;
using Pibt.Model;
using Pibt.BLL;
using Pibt.Common;

namespace Pibt.UserControl
{
    public partial class CtlAdditionalInfo : System.Web.UI.UserControl
    {
        public string EmployerId { get; set; }
        public RadAjaxManager AjaxManager { get; set; }
        public UserCacheInfo CurrentUserInfo { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PopulateControls1();
            }
        }

        private void PopulateControls1()
        {
            if (!string.IsNullOrEmpty(EmployerId))
            {
                ddlWaitingPeriod.DataSource = BLL.Employer.GetWaitingPeriodList();
                ddlWaitingPeriod.DataTextField = "Description";
                ddlWaitingPeriod.DataValueField = "WaitingPeriodId";
                ddlWaitingPeriod.DataBind();

                ddlTerms.DataSource = BLL.Employer.GetTerms();
                ddlTerms.DataTextField = "Description";
                ddlTerms.DataValueField = "TermId";
                ddlTerms.DataBind();

                ddlEnroller.DataSource = BLL.Agent.GetEnrollersByErId(Utilities.ToInt(EmployerId));
                ddlEnroller.DataTextField = "Name";
                ddlEnroller.DataValueField = "ENROLLERID";
                ddlEnroller.DataBind();

                ddlRK.DataSource = BLL.RK.SearchRKs("");
                ddlRK.DataTextField = "RK";
                ddlRK.DataValueField = "CSRID";
                ddlRK.DataBind();

                UserCacheInfo userInfo = CurrentUserInfo;
                if (userInfo.UserRole == UserRoles.Administrator || userInfo.UserRole == UserRoles.Agent || userInfo.UserRole == UserRoles.RK ||
                    userInfo.UserRole == UserRoles.Broker)
                {
                    ddlEnroller.Enabled = true;
                    ddlRK.Enabled = true;
                    // TODO Why aren't the rest of these enabled here?
                }
                else
                {
                    ddlWaitingPeriod.Enabled = false;
                    ddlEnroller.Enabled = false;
                    ddlRK.Enabled = false;
                    ddlTerms.Enabled = false;
                    tbEEContribution.ReadOnly = true;
                    tbDepContribution.ReadOnly = true;
                    tbTaxID.ReadOnly = true;
                    tbSic.ReadOnly = true;
                    tbNaBiz.ReadOnly = true;
                }

                BizAdditionalInfo bizInfoDetails = BLL.Employer.GetBizInfoDetails2(EmployerId);
                if (!string.IsNullOrEmpty(bizInfoDetails.WaitingPeriodId))
                {
                    ddlWaitingPeriod.SelectedValue = bizInfoDetails.WaitingPeriodId.ToString();
                }
                if (!string.IsNullOrEmpty(bizInfoDetails.EnrollerId))
                {
                    ddlEnroller.SelectedValue = bizInfoDetails.EnrollerId.ToString();
                }
                lblTeamLead.Text = bizInfoDetails.TeamLead;
                if (!string.IsNullOrEmpty(bizInfoDetails.RKId))
                {
                    ddlRK.SelectedValue = bizInfoDetails.RKId.ToString();
                }
                if (!string.IsNullOrEmpty(bizInfoDetails.TermId))
                {
                    ddlTerms.SelectedValue = bizInfoDetails.TermId.ToString();
                }
                tbEEContribution.Text = bizInfoDetails.EeContribution;
                tbDepContribution.Text = bizInfoDetails.Depcontribution;
                tbTaxID.Text = bizInfoDetails.Taxid;
                tbSic.Text = bizInfoDetails.Sic;
                tbNaBiz.Text = bizInfoDetails.NatureOfBiz;
            }
        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (!string.IsNullOrEmpty(EmployerId))
                {
                    BizAdditionalInfo bizInfoDetails = new BizAdditionalInfo();
                    bizInfoDetails.EmployerId = Utilities.ToString(EmployerId);
                    bizInfoDetails.WaitingPeriodId = Utilities.ToString(ddlWaitingPeriod.SelectedValue);
                    bizInfoDetails.EnrollerId = Utilities.ToString(ddlEnroller.SelectedValue);
                    bizInfoDetails.RKId = Utilities.ToString(ddlRK.SelectedValue);
                    bizInfoDetails.TermId = Utilities.ToString(ddlTerms.SelectedValue);
                    bizInfoDetails.EeContribution = Utilities.ToString(tbEEContribution.Text);
                    bizInfoDetails.Depcontribution = Utilities.ToString(tbDepContribution.Text);
                    bizInfoDetails.Taxid = Utilities.ToString(tbTaxID.Text);
                    bizInfoDetails.Sic = tbSic.Text;
                    bizInfoDetails.NatureOfBiz = tbNaBiz.Text;

                    bool success = BLL.Employer.UpdateEmployer(bizInfoDetails, Page.User.Identity.Name);
                    if (success)
                    {
                        Logger.WriteAuditLog(string.Format("{0} updated employer {1}.", Page.User.Identity.Name, EmployerId), EventCode.UpdateEmployer);
                        lblError.Text = "Update employer successful.";
                    }
                    else
                    {
                        lblError.Text = "Update employer failed! Try again or call " + Utilities.Us() + ".";
                        Logger.InsertLog(new WebSiteLog
                        {
                            LogType = LogType.Error,
                            EventCode = EventCode.AppError,
                            EventDetails = "Update failed in CtlAdditionalInfo.ascx.cs",
                            UserName = Page.User.Identity.Name,
                            FromIP = HttpContext.Current.Request.UserHostAddress
                        });
                    }
                    AjaxManager.Alert(lblError.Text);
                }
            }
        }

        protected void ddlRK_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            string teamLead = BLL.Employer.GetRelationshipKeeperTeamLead(ddlRK.SelectedValue);
            lblTeamLead.Text = teamLead;
        }
    }
}