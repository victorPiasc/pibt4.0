using System;
using System.Web.UI;

using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Web;
using Pibt.Model;
using Pibt.BLL;
using System.Data;

namespace Pibt.UserControl
{
    public partial class CtlContacts : System.Web.UI.UserControl
    {
        public string EmployerId { get; set; }
        public string[] textboxes = new string[] {"txtFirstName","txtMiddleName","txtLastName","tbTitle","tbMobileNo","tbPhoneNo1","tbExt1","tbFaxNo","tbEmail1"};
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btAdd_Click(object sender, EventArgs e)
        {
            RadListViewContacts.ShowInsertItem(Telerik.Web.UI.RadListViewInsertItemPosition.FirstItem);
        }

        protected void RadListViewContacts_ItemCommand(object sender, RadListViewCommandEventArgs e)
        {
            string rowId = e.CommandArgument.ToString();
            if (e.CommandName == RadListView.PerformInsertCommandName || e.CommandName == RadListView.UpdateCommandName)
            {
                RadListViewEditableItem insertedItem = (RadListViewEditableItem)e.ListViewItem;
                TextBox tb;
                RadMaskedTextBox rTb;
                for (int i = 0; i < textboxes.Length; i++)
                {
                    if (insertedItem.FindControl(textboxes[i]) is TextBox)
                    {
                        tb = insertedItem.FindControl(textboxes[i]) as TextBox;
                        textboxes[i] = tb.Text;
                    }

                    if(insertedItem.FindControl(textboxes[i]) is RadMaskedTextBox)
                    {
                        rTb = insertedItem.FindControl(textboxes[i]) as RadMaskedTextBox;
                        textboxes[i] = rTb.Text;
                    }
                }

                BizContact contact = new BizContact()
                {
                    Id = rowId,
                    EmployerId = EmployerId,
                    FirstName = textboxes[0].ToUpper(),
                    MiddleName = (string.IsNullOrEmpty(textboxes[1]) ? "" : textboxes[1].ToUpper()),
                    LastName = textboxes[2].ToUpper(),
                    Title = textboxes[3].ToUpper(),
                    Mobile = textboxes[4],
                    Phone = "",
                    BizPhone1 = textboxes[5],
                    BizExt1 = textboxes[6],
                    BizPhone2 = "",
                    BizExt2 = "",
                    Fax = textboxes[7],
                    Email = textboxes[8],
                    Email2 = "",
                    UpdatedBy = Page.User.Identity.Name
                };

                if (e.CommandName == RadListView.PerformInsertCommandName && BLL.Employer.InsertBizContact(contact))
                    Logger.WriteAuditLog(string.Format("{0} added a new contact {1} for Employer #{2}.", Page.User.Identity.Name, textboxes[3], EmployerId), EventCode.AddEmployerContact);
                if (e.CommandName == RadListView.UpdateCommandName && BLL.Employer.UpdateBizContact(contact))
                    Logger.WriteAuditLog(string.Format("{0} updated contact {1} for Employer #{2}.", Page.User.Identity.Name, textboxes[3], EmployerId), EventCode.UpdateEmployerContact);

                RadListViewContacts.InsertItemPosition = RadListViewInsertItemPosition.None;
                RadListViewContacts.IsItemInserted = false;
                RadListViewContacts.Rebind();
            }

            if (e.CommandName == RadListView.DeleteCommandName)
               if (BLL.Employer.DeleteEmployerContact(rowId))
                    RadListViewContacts.Rebind();

            if (e.CommandName == RadListView.CancelCommandName)
                RadListViewContacts.InsertItemPosition = RadListViewInsertItemPosition.None;
        }

        protected void RadListViewContacts_NeedDataSource(object sender, RadListViewNeedDataSourceEventArgs e)
        {
           RadListViewContacts.DataSource = BLL.Employer.GetBizContacts(EmployerId);
        }
    }
}