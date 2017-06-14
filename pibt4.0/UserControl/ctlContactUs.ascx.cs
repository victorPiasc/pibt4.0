using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Common;
using Pibt.Model;
using Pibt.BLL;

namespace Pibt.UserControl
{
    public partial class ctlContactUs : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnContactUs_Click(object sender, EventArgs e)
        {

            // Test
            if (!txtEmail.Text.Contains("@") || !txtEmail.Text.Contains(".")) {
                lblMessage.Text = "The eMail address is not valid.  Please fix that.";
                return;
            }

            // Send
            try
            {
                Utilities.SendMail(ApplicationConfiguration.SystemMailSender, ApplicationConfiguration.CustomerServiceEmail, "New Enquiry",
                    string.Format("{0} ({1}) has an enquiry:<br/>{2}", txtFullName.Text, txtEmail.Text, txtEnquiry.Text));
                lblMessage.Text = "Your Email has been sent. Thank You<br/><br/>";
                txtFullName.Text = "";
                txtEmail.Text = "";
                txtEnquiry.Text = "";
            }
            catch (Exception exc)
            {
                lblMessage.Text = "Send failure: " + exc.ToString();
                Logger.InsertLog(new WebSiteLog
                {
                    LogType = LogType.Error,
                    EventCode = EventCode.AppError,
                    EventDetails = exc.Message,
                    UserName = Page.User.Identity.Name,
                    FromIP = HttpContext.Current.Request.UserHostAddress
                });
            }
        }
    }
}