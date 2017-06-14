using System;

using Telerik.Web.UI;
using System.Web;
using Pibt.Model;
using Pibt.BLL;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Pibt.UserControl
{
    public partial class CtlBizInfo : System.Web.UI.UserControl
    {
        public UserRoles Role { get; set; }
        public string EmployerId { get; set; }
        public string Username { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                PopulateControls1();
            }
            lblMsg.Text = "";
        }

        private void PopulateControls1()
        {
            if (!string.IsNullOrEmpty(EmployerId))
            {
                BizInfoDetails bizInfoDetails = BLL.Employer.GetBizInfoDetails(EmployerId);

                if (bizInfoDetails == null)
                {
                    HttpContext.Current.ClearError();
                    Response.Redirect("/Oooops.aspx", false);
                    return;
                }

                tbCompanyName.Text = bizInfoDetails.CompanyName;
                tbMailingStreetAddress1.Text = bizInfoDetails.MailingStreetAddress1;
                tbMailingCity.Text = bizInfoDetails.MailingCity;
                tbMailingState.Text = bizInfoDetails.MailingState;
                tbMailingPostCode.Text = bizInfoDetails.MailingPostCode;
                tbMailingContact.Text = bizInfoDetails.MailingContact;
                tbMailingEmail.Text = bizInfoDetails.MailingEmail;
                tbPhsicalStreetAddress1.Text = bizInfoDetails.PhsicalStreetAddress1;
                tbPhsicalCity.Text = bizInfoDetails.PhsicalCity;
                tbPhsicalState.Text = bizInfoDetails.PhsicalState;
                tbPhsicalPostCode.Text = bizInfoDetails.PhsicalPostCode;
                tbPhsicalContact.Text = bizInfoDetails.PhsicalContact;
                tbPhsicalEmail.Text = bizInfoDetails.PhsicalEmail;
                if(!string.IsNullOrEmpty(bizInfoDetails.Phonenbr))
                    tbPhoneNumber.Text = string.Format("{0:(###) ###-####}", Int64.Parse(bizInfoDetails.Phonenbr));

                if (Role == UserRoles.Administrator || Role == UserRoles.Agent || Role == UserRoles.RK || Role == UserRoles.Broker)
                {
                    pStatus.Visible=true;
                    lbStartDate.Text = bizInfoDetails.StartDate;
                    lbEndDate.Text = bizInfoDetails.EndDate;
                }
            }
        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string employerId = EmployerId;
                if (!string.IsNullOrEmpty(employerId))
                {
                    BizInfoDetails bizInfoDetails = new BizInfoDetails();
                    bizInfoDetails.EmployerId = employerId;
                    bizInfoDetails.CompanyName = tbCompanyName.Text;
                    bizInfoDetails.MailingStreetAddress1 = tbMailingStreetAddress1.Text;
                    bizInfoDetails.MailingCity = tbMailingCity.Text;
                    bizInfoDetails.MailingState = tbMailingState.Text;
                    bizInfoDetails.MailingPostCode = tbMailingPostCode.Text;
                    bizInfoDetails.MailingContact = tbMailingContact.Text;
                    bizInfoDetails.MailingEmail = tbMailingEmail.Text;
                    bizInfoDetails.PhsicalStreetAddress1 = tbPhsicalStreetAddress1.Text;
                    bizInfoDetails.PhsicalCity = tbPhsicalCity.Text;
                    bizInfoDetails.PhsicalState = tbPhsicalState.Text;
                    bizInfoDetails.PhsicalPostCode = tbPhsicalPostCode.Text;
                    bizInfoDetails.PhsicalContact = tbPhsicalContact.Text;
                    bizInfoDetails.PhsicalEmail = tbPhsicalEmail.Text;                  
                    if (BLL.Employer.UpdateEmployer(bizInfoDetails, Page.User.Identity.Name) && BLL.User.ChangeEmail(Username, tbMailingEmail.Text))
                    {
                        if (Role == UserRoles.Employer)
                        {
                            MembershipUser user = Membership.GetUser(Page.User.Identity.Name);
                            if (user != null)
                            {
                                user.Email = tbMailingEmail.Text;
                                Membership.UpdateUser(user);
                            }

                        }
                        Logger.WriteAuditLog(string.Format("{0} updated employer {1}.", Page.User.Identity.Name, employerId), EventCode.UpdateEmployer);
                        lblMsg.Text = Common.Utilities.FormatAlertInfo("Update successful.");
                    }
                    else
                    {
                        lblMsg.Text = Common.Utilities.FormatError("Update employer failed! Try again or call Tech support!");
                    }
                }
            }
        }
    }
}