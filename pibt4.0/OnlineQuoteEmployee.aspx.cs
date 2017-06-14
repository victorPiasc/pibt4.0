using Pibt.Common;
using System;
using System.Web;
using System.Web.UI.WebControls;
using Pibt.Model;
using Telerik.Web.UI;
using Pibt.BLL;
using System.IO;
using System.Text.RegularExpressions;

namespace Pibt
{
    public partial class OnlineQuote : SortaBasePage
    {
        string counter { get { return BLL.OnlineQuote.CheckWebCartCount(BLL.OnlineQuote.QQCartId, 0);}}
        int cartId { get { return BLL.OnlineQuote.QQCartId; } }
        int familyId
        {
            get
            {
                if (ViewState["familyId"] == null)
                    ViewState["familyId"] = BLL.OnlineQuote.getLastFamilyId(cartId) + 1;
                return (int)ViewState["familyId"];
            }
            set { ViewState["familyId"] = value;}
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            eeCount.Text = counter;
            lblCreationMessage.Text = "";
            if (!IsPostBack && counter == "0")
                add_Click(null, null);
        }

        protected void add_Click(object sender, EventArgs e)
        {
            if (int.Parse(counter) < 50 )
            {
                if (!BLL.OnlineQuote.InsertWebQQCart(cartId, "Employee " + familyId, 0, "Employee", 'Y', DateTime.Now.AddYears(-32), familyId, null, null, null, null))
                {
                    Logger.InsertLog(new WebSiteLog
                    {
                        LogType = LogType.Error,
                        EventCode = EventCode.AppError,
                        EventDetails = "Failed to insert employee in OnlineQuoteEmployee.aspx",
                        UserName = !string.IsNullOrEmpty(Page.User.Identity.Name) ? Page.User.Identity.Name : "null",
                        FromIP = HttpContext.Current.Request.UserHostAddress
                    });
                    oops();
                }
                familyId++;
                eeCount.Text = counter;
                employeeRadGrid.Rebind();
            }
            else
                lblCreationMessage.Text = Utilities.FormatError("Census is limited to a maximum of 50 employees per quote");
        }

        protected void employeeGrid_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            employeeRadGrid.DataSource = BLL.OnlineQuote.GetWebQQCart(cartId);
        }

        protected void employeeRadGrid_DeleteCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            string rowID = (e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["ROWID"].ToString();
            string employeeTypeID = (e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EMPLOYEETYPEID"].ToString();
            if (BLL.OnlineQuote.DeleteFromWebQQCart(rowID, employeeTypeID))
            {
                eeCount.Text = counter;
                employeeRadGrid.Rebind();
            }
            else
                oops();
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (int.Parse(counter) >= 2)
                Response.Redirect("/OnlineQuoteRates.aspx");
            lblCreationMessage.Text = Common.Utilities.FormatError("You must add 2 or more employees in order to continue.");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {

            string missing = uploadGeneric(fuCensus, "/UploadFiles/", cartId, familyId, null, true);
            if(missing=="nofile")//if this is returned then no file found
            {
                lblCreationMessage.Text = Utilities.FormatError("No file found");
                return;
            }
            if (!string.IsNullOrEmpty(missing))//if a string is returned but not no file then it about people not added. 
                lblCreationMessage.Text = Utilities.FormatError(missing);
            employeeRadGrid.Rebind();
            eeCount.Text = BLL.OnlineQuote.CheckWebCartCount(cartId, 0);
        }

        protected void employeeRadGrid_BatchEditCommand(object sender, GridBatchEditingEventArgs e)
        {
            foreach (GridBatchEditingCommand command in e.Commands)
            {
                if(command.Type == GridBatchEditingCommandType.Update)
                {
                    DateTime bday = DateTime.Parse(command.NewValues["birthdate"].ToString());
                    if (command.OldValues["EMPLOYEETYPEID"].ToString() == "2" && checkAge(bday) >= 260000)
                    {
                       lblCreationMessage.Text = Utilities.FormatError("Child dependent cannot be 26 years of age or over.");
                       return;
                    }
                    BLL.OnlineQuote.UpdateFromWebQQCart(command.NewValues["ROWID"].ToString(), command.NewValues["gender"].ToString()=="Male"? 'Y':'N', bday, command.NewValues["employeeName"].ToString());
                }
            }
            employeeRadGrid.Rebind();
        }

        protected void employeeRadGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "addDep" && e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                System.Web.UI.DataBoundLiteralControl lit = (System.Web.UI.DataBoundLiteralControl) item["employeeName"].Controls[0];
                string name = lit.Text.Remove(0, 111);
                name = name.Replace("</span>\r\n", "");
                eeName.Text = name.Trim();
                hFamId.Value = item["familyId"].Text;
                popup1.Style.Add("display", "inline");
                foreach (GridDataItem it in employeeRadGrid.Items)
                    if (item["familyId"].Text == it["familyId"].Text && it["employeeTypeId"].Text == "1")
                    {
                        spouseBtn.Visible = false;
                        break;
                    }
            }
        }

        protected void dep_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string typename = btn.CommandName=="1" ? "Spouse/Domestic Partner": "Child";
            DateTime dt =  DateTime.Now.AddYears(btn.CommandName=="1" ? -32 : -12);
            int c = 1;
            if(btn.CommandName=="2")
                foreach (GridDataItem it in employeeRadGrid.Items)
                    if (it["familyId"].Text == hFamId.Value && it["employeeTypeId"].Text == "0")
                        c++;
            if (btn.CommandName != "cancel")
                BLL.OnlineQuote.InsertWebQQCart(cartId, eeName.Text + (btn.CommandName == "1" ? " SP" : " CH"+c), int.Parse(btn.CommandName), typename, 'Y', dt, int.Parse(hFamId.Value), null, null, null, null);
            eeName.Text = "";
            hFamId.Value = "";
            popup1.Style.Add("display", "none");
            employeeRadGrid.Rebind();
            spouseBtn.Visible = true;
        }

        protected void employeeRadGrid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                Button btn = (Button)item["addDep"].Controls[0];
                btn.Visible = item["employeeTypeId"].Text == "0";
            }
        }
    }
}