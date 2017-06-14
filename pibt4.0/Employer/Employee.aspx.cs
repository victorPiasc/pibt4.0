using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Pibt.Common;
using Pibt.Model;
using System.Windows.Forms;


namespace Pibt.Employer
{
    public partial class Employee : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlOptions.SelectedIndex = EmployerId.Contains("-") ? 0 : 1;
                btnSearch_Click(sender, e);
            }
            else 
                BLL.Employee.SynMemberToWebUsersTable(EmployerId, Page.User.Identity.Name);// TODO Alleviate the need to do this ever by redesigning the log-in database
            message1.Text = "";
            btnRegister.Visible = BLL.Employer.countActiveWebAccount(EmployerId) > 0;
            Utilities.TieButton(Page, txtClue, btnSearch);
        }

        protected void binder(object sender, GridItemEventArgs e) {
            binderLow(e, RadGridEmployees, "View this employee");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
                RadGridEmployees.Rebind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtClue.Text = "";
            RadGridEmployees.Rebind();
        }

        protected void RadGridEmployees_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            RadGridEmployees.DataSource = BLL.Employee.SearchEmployees(EmployerId, ddlOptions.SelectedValue, txtClue.Text.Trim());
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            //create new thread
            //MethodInvoker simpleDelegate = new MethodInvoker(sendRegistrationEmails);
            //simpleDelegate.BeginInvoke(null, null);
            string uniqueLink;
            string eeId;
            bool success=false;
            foreach (GridDataItem item in RadGridEmployees.SelectedItems)
            {
                //if they enter here create a new process 
                if (item["LoginName"].Text.Equals("&nbsp;") && !item["emailAddress"].Text.Equals("&nbsp;")) //if no login name and has email 
                {
                    uniqueLink = Guid.NewGuid().ToString("N"); //uniqueLink
                    eeId = item["eeId"].Text; 
                    BLL.Employer.InsertRegistrationLink(uniqueLink, eeId);
                    string subject = Utilities.Us() + " Web Account Registration";
                    string body = "<table><tr><td>" + item["NAME"].Text + ",</td></tr><tr><td><p>We now offer an easy way for you to enroll in the benefit plans we offer. Enrollment is now done through a secure internet portal.</p><p>The first step is for you to create your own personal account. Start by clicking on the link below which will take you to an internet page that asks you to create a user name and a password. Once your account is created, the system will you through enrollment and help you to choose plans that are consistent with your personal situation.</p><p>Click here <a href=\""+(ApplicationConfiguration.IsTestServer?"test.": "https://")+"pibt.org/Registration.aspx?uid=" + uniqueLink + "\">https://pibt.org/Registration.aspx</a></p><p>If you run into any trouble or have any questions, please contact customer service at (800) 449-4898 ext. 259 or <a href=\"maileto:onlinehelpdesk@piasc.org\">onlinehelpdesk@piasc.org<a>. We wanto to make the enrollment process as simple and easy as possible</p><p>" + BasePage.disclaimer + "</p></td></tr></table>";
                    Utilities.SendMail(ApplicationConfiguration.SystemMailSender, item["emailAddress"].Text, subject, body);
                    success = true;
                }
            }
            if(success)
                message1.Text = Utilities.FormatNote("Registration for online access was sent to all the selected employees with email addresses on file");
        }

        protected void RadGridEmployees_DataBound(object sender, EventArgs e)
        {
            foreach (GridDataItem item in RadGridEmployees.Items)
            {
                if (!item["LoginName"].Text.Equals("&nbsp;"))
                {
                    System.Web.UI.WebControls.CheckBox chk = (System.Web.UI.WebControls.CheckBox)item["ClientSelectColumn"].Controls[0];
                    chk.Enabled = false;
                    chk.Checked = false;
                    chk.Visible = false;
                }
            }
        }
    }
}