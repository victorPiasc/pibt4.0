using System;
using System.Web;
using Pibt.Common;
using Pibt.BLL;
using Pibt.Model;

namespace Pibt
{
    public partial class OnlineQuoteEmployer : SortaBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void continue_Click(object sender, EventArgs e)
        {
            int zip;
            int cartid = BLL.OnlineQuote.QQCartId;
            string cname = companyName.Text;
            string address = companyAddress.Text;
            string city = companyCity.Text;
            string st = companyState.Text;
            string name = contactfName.Text + " " + contactlName.Text;
            string email = "";// contactEmail.Text;
            string isPC = Common.Utilities.Us().Contains("Private") ? "Y" : "N"; //if PIBT then flag is N for isPC
            string phone = "";// contactPhone.Text;
            string fax = "";

            if (!int.TryParse(companyZip.Text, out zip) || BLL.OnlineQuote.CheckZipcode(zip) == 0)
            {
                message.Text = Utilities.FormatError("Invalid zipcode");
                message.Visible = true;
                return;
            }
            //fax = String.IsNullOrEmpty(companyFax.Text) ? "0" : companyFax.Text;
            if (BLL.OnlineQuote.insertQQemployer(cartid, cname, address, city, st, zip, fax, name, phone, email, isPC))
                Response.Redirect("/OnlineQuoteEmployee.aspx");
            else
            {
                message.Text = Utilities.FormatError("Checking online quote failed, try again or contact " + Utilities.Us() + " support.");
                message.Visible = true;
                Logger.InsertLog(new WebSiteLog
                {
                    LogType = LogType.Error,
                    EventCode = EventCode.AppError,
                    EventDetails = " Error inserting into online quote",
                    UserName = !string.IsNullOrEmpty(Page.User.Identity.Name) ? Page.User.Identity.Name : "null",
                    FromIP = HttpContext.Current.Request.UserHostAddress
                });
            }
        }
    }
}