using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt
{
    public partial class OnlineQuoteOverview : SortaBasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                page6.pageSetup();
            //submitResult.Text = "";
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            //string code = generateCode();
            //if (BLL.OnlineQuote.insertPotentialUser(BLL.OnlineQuote.QQCartId, code, email.Text))
            //{
            //    string subject = "Quick Quote Saved....Return soon to enroll"; //TODO ask for subject 
            //    string body = string.Format("<p>Your Quick Quote has been temporarily saved to our secure database. We will retain your information for 30 days after which it will be permanently deleted. </p><p>When you are ready to enroll, click on the following link. <a href=\"{0}/apply.aspx?vId={1}\">Click here to apply</a></p><p><b>Note: Enrollment is activated on the first of each month.</b> So if you submit your online enrollment on any day between the 2<sup>nd</sup> and end of month, your enrollment is active the as of the 1<sup>st</sup> of the following month.</p><p>We look forward to adding you to the long list of members whom enjoy the benefits of PIBT. At any time, should you have any questions or require additional help, please do not hesitate to contact us at (800) 449 - 4898</p>", (Common.ApplicationConfiguration.IsTestServer ? "test." : "") +"pibt.org", code);
            //    Common.Utilities.SendMail("onlineHelpDesk@piasc.org", email.Text, subject, body);
            //    submitResult.Text = Common.Utilities.FormatAlertInfo("Successfully saved your quote. It will be saved for 30 days.");
            //}
            //else
            //    submitResult.Text = Common.Utilities.FormatError("You have already saved this quote.");
        }
    }
}