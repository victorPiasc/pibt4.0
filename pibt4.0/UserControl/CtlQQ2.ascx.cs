using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using System.Data;

namespace Pibt.UserControl
{
    public partial class CtlQQ2 : System.Web.UI.UserControl
    {
        public int cartId { get { return BLL.OnlineQuote.QQCartId; } }
        public BizInfoDetails pUser { get; set; }
        public BizAdditionalInfo addl { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            message.Text = "";
        }

        public void pageSetup(BizInfoDetails arg)
        {
            pUser = arg;
            wPeriod.DataSource = BLL.Employer.GetWaitingPeriodList();
            wPeriod.DataTextField = "Description";
            wPeriod.DataValueField = "WaitingPeriodId";
            wPeriod.DataBind();
            if (pUser.EmployerId == null) //if employer does not exist yet then load from temp data 
            {
                DataTable dt = BLL.OnlineQuote.getQQEmployer(cartId);
                if (dt.Rows.Count > 0)
                {
                    companyName.Text = dt.Rows[0].ItemArray[1].ToString();
                    pAddress1.Text = dt.Rows[0].ItemArray[2].ToString();
                    pCity.Text = dt.Rows[0].ItemArray[3].ToString();
                    pState.Text = dt.Rows[0].ItemArray[4].ToString();
                    pZip.Text = dt.Rows[0].ItemArray[5].ToString();
                    fax.Text = dt.Rows[0].ItemArray[6].ToString();
                    string[] name = dt.Rows[0].ItemArray[7].ToString().Split(' ');
                    cFname.Text = name[0].Trim();
                    if(name.Length>1)
                        cLname.Text = name[1].Trim();
                    phone.Text = dt.Rows[0].ItemArray[8].ToString();
                    cEmail.Text = dt.Rows[0].ItemArray[9].ToString();
                }
            }
            else
            {
                companyName.Text = pUser.CompanyName;
                pAddress1.Text = pUser.PhsicalStreetAddress1.Trim();
                pCity.Text = pUser.PhsicalCity;
                pState.Text = pUser.PhsicalState;
                pZip.Text = pUser.PhsicalPostCode;
                fax.Text = pUser.Faxnbr;
                mAddress1.Text = pUser.MailingStreetAddress1.Trim();
                mCity.Text = pUser.MailingCity;
                mState.Text = pUser.MailingState.ToUpper();
                mZip.Text = pUser.MailingPostCode;
                string[] name = pUser.MailingContact.Split(' ');
                cFname.Text = name[0].Trim();
                cLname.Text = name[1].Trim();
                cEmail.Text = pUser.MailingEmail;
                phone.Text = pUser.Phonenbr;
                addl = BLL.Employer.GetBizInfoDetails2(pUser.EmployerId);
                taxId.Text = addl.Taxid;
                sic.Text = addl.Sic;
                wPeriod.SelectedValue = addl.WaitingPeriodId;
            }
        }

        public bool validatePage(string brokerId)
        {
            if (string.IsNullOrEmpty(brokerId))
                pUser = new BizInfoDetails();
            pUser.CompanyName = companyName.Text;
            pUser.PhsicalStreetAddress1 = pAddress1.Text+ (string.IsNullOrEmpty(pAddress2.Text) ? " " : pAddress2.Text);
            pUser.PhsicalCity = pCity.Text;
            pUser.PhsicalState = pState.Text.ToUpper();
            pUser.PhsicalPostCode = pZip.Text;
            pUser.Phonenbr = phone.Text;
            pUser.MailingContact = cFname.Text + " " + cLname.Text;
            pUser.MailingEmail = cEmail.Text;
            pUser.Faxnbr = string.IsNullOrEmpty(fax.Text)? "" : fax.Text;
            pUser.MailingStreetAddress1 = string.IsNullOrEmpty(mAddress1.Text)? pUser.PhsicalStreetAddress1 : mAddress1.Text.Trim() + (string.IsNullOrEmpty(mAddress2.Text)? " " : mAddress2.Text.Trim());
            pUser.MailingCity = string.IsNullOrEmpty(mCity.Text) ? pUser.PhsicalCity : mCity.Text;
            pUser.MailingState = string.IsNullOrEmpty(mState.Text) ? pUser.PhsicalState : mState.Text;
            pUser.MailingPostCode = string.IsNullOrEmpty(mZip.Text) ? pUser.PhsicalPostCode : mZip.Text;

            addl = new BizAdditionalInfo();
            addl.Taxid = taxId.Text;
            addl.WaitingPeriod = wPeriod.SelectedItem.Text;
            addl.WaitingPeriodId = wPeriod.SelectedValue;
            addl.Sic = sic.Text;
            int nbrPartTime = string.IsNullOrEmpty(partee.Text) ? 0 : int.Parse(partee.Text);
            //pUser.EmployerId = BLL.Employer.insertEmployer(cartId, pUser, addl, nbrPartTime);
            pUser.EmployerId = string.IsNullOrEmpty(brokerId) ? BLL.Employer.insertEmployer(cartId, pUser, addl, nbrPartTime) : BLL.Broker.insertEmployer(brokerId, pUser, addl, nbrPartTime) ;
            if (string.IsNullOrEmpty(pUser.EmployerId))
            {
                message.Text = Common.Utilities.FormatError("Could not add employer");
                return false;
            }
            return true;
        }

        protected void sameAddress_SelectedIndexChanged(object sender, EventArgs e)
        {
            mailInfo.Visible = sameAddress.SelectedIndex == 1;
        }

        public void reset()
        {
            companyName.Text = pAddress1.Text = pCity.Text = pState.Text = pZip.Text = fax.Text = mAddress1.Text = mCity.Text = mState.Text = mZip.Text = cFname.Text = cLname.Text = cEmail.Text = phone.Text = taxId.Text = sic.Text = "";
            wPeriod.SelectedIndex = 0;
        }
    }
}