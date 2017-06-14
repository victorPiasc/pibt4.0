using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Pibt.BLL;
using Pibt.Model;
using System.Data;
using Pibt.Common;
using System.Web.UI.HtmlControls;

namespace Pibt.UserControl
{
    public partial class CtlEnrollmentFormPlans : BaseUserControl
    {
        public string EmployeeId;
        public string EmployerId;
        public int oeType;
        public string agencyId;
        public string oeId;
        public bool isOeNewHire { get { return oeType == 1 || oeType == 4; } }

        public int medType
        {
            get
            {
                if (ViewState["type"] == null)
                    return 1;
                return int.Parse(ViewState["type"].ToString());
            }
            set{ ViewState["type"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                setCart();
                int cartId=BLL.OnlineQuote.QQCartId;
                if (oeType == 4 || oeType==2 || oeType==5 )
                {
                    BLL.OnlineQuote.setUpAtoA(cartId, EmployerId, EmployeeId, oeType);
                    currentCoverage.DataSource = BLL.EnrollmentForm.getEeCurrent(cartId, EmployeeId, EmployerId, oeId);
                    currentCoverage.DataBind();
                    current.Visible = oeType == 4;
                }
                PlansGrid.Columns[4].Visible = isOeNewHire;
                lvFamily.DataSource = EnrollmentForm.GetOeEnrollers(EmployeeId, oeType);
                lvFamily.DataBind();
                addToCart();
                BindNotes();
                setMedType(0, true);

                DataTable dt = BLL.Plan.GetPlanTypes(EmployerId);
                Control ct;
                foreach (DataRow dr in dt.Rows)
                {
                    ct = typeList.FindControl("l" + dr.ItemArray[0].ToString());
                    if (ct != null)
                        ct.Visible = true;
                }
                //If mtl is provided add automatically unless employer is in Nor Cal
                if (agencyId != "2" && isOeNewHire)
                    BLL.EnrollmentForm.AddMtl(EmployeeId, EmployerId, oeId, Page.User.Identity.Name);
                currCovBtn.Visible = oeType!=1;
            }
            CtlCurrentCov1.EmployerId = EmployerId;
            CtlCurrentCov1.EmployeeId = EmployeeId;
            CtlCurrentCov1.oeId = oeId;
            CtlCurrentCov1.isOeNewHire = isOeNewHire;
            CtlCurrentCov1.type = 2;
            lblMsg.Text = "";
        }

        //sets a new cartid for this enrollment process
        public void setCart()
        {
            int cartId = BLL.EnrollmentForm.getCartId(oeId);
            if (cartId==0)
            {
                cartId = BLL.OnlineQuote.ForceNewCartId();
                if (!BLL.EnrollmentForm.setCartId(cartId, oeId) || !BLL.EnrollmentForm.TransferERForOe(cartId, EmployerId))
                {
                    Response.Redirect("/UhOh.aspx", false);
                }
            }
            BLL.OnlineQuote.SetCookie(cartId);
            HttpContext.Current.Session["QQ_CartID"] = cartId;
        }

        public void setMedType(int oldPlanType, bool insert)
        {
            medType = BLL.EnrollmentForm.GetPlanType(oeId, oeType, EmployerId);
            tab_command(typeList, medType.ToString());
            if (oldPlanType != 0)
            {
                Control ct = typeList.FindControl("l" + oldPlanType);
                LinkButton lb = ct.Controls[0] as LinkButton;
                lb.Enabled = !insert;
                if(insert)
                    lb.Style.Add("background", "#006dbb");
                else
                    lb.Style.Remove("background");
            }

            Plans.Visible = medType != 0;
        }

        //adds the existing employer and dependets to the cart. 
        public void addToCart()
        {
            int cartid = BLL.OnlineQuote.QQCartId;
            if (BLL.OnlineQuote.DeleteAllWebQQCart(cartid))
            {
                foreach (RadListViewItem item in lvFamily.Items)
                {
                    CheckBox ch = item.FindControl("cbMember") as CheckBox;
                    if (ch.Checked)
                    {
                        Label memberid = item.FindControl("memberId") as Label;
                        if (!BLL.EnrollmentForm.InsertMemberToQuote(cartid, memberid.Text))
                        {
                            lblMsg.Text = Common.Utilities.FormatError("Error when processing clicked");
                            return;
                        }
                    }
                }
                if (medType != 0 && !isOeNewHire)
                    BLL.EnrollmentForm.InsertDepFamilytoQuote(EmployeeId, BLL.OnlineQuote.QQCartId, medType);
            }
        }

        protected void AvailablePlansGrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            if (medType > 0 && oeType != 0)
                AvailablePlansGrid.DataSource = BLL.EnrollmentForm.GetOeQuote(BLL.OnlineQuote.QQCartId, EmployeeId, EmployerId, oeType, medType);
            else
                AvailablePlansGrid.DataSource = "";
        }

        protected void PlansGrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            PlansGrid.DataSource = BLL.EnrollmentForm.GetOEAvailablePlans(oeId, oeType,'N');
        }

        private void BindNotes()
        {
            List<string> noteList = new List<string>();
            switch (oeType)
            {
                // New Hire
                case 1:
                    noteList.Add("Medical Term Life applies to employee only.");
                    break;

                // Newborn
                case 2:
                    noteList.Add("Medical Term Life coverage for employee only.");
                    noteList.Add("If further documentation is required you will be contacted by " + Utilities.Us() + ".");
                    break;
                // Open Enrollment
                case 4:
                    noteList.Add("Medical Term Life applies to employee only.");
                    break;

                // New Marriage
                case 5:
                    noteList.Add("Medical Term Life coverage for employee only.");
                    break;
            }
            noteList.Add("By declining coverage, I acknowledge that my dependents and I may have to wait to be enrolled until next Open Enrollment period or Qualifying Event period.");
            noteList.Add("\"Total\" for Voluntary Term Life assumes minimum coverage of $10,000-employee, $10,000-spouse, and $5,000-child. High coverage is available and will be on subsequent page.");
            lblNote.Text = Common.Utilities.FormatNoteList(noteList.ToArray());
        }

        protected void PlansGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Delete"))
            {
                GridDataItem gdi = (GridDataItem)e.Item;
                deleteEnroller(gdi);
                foreach (GridDataItem item in currentCoverage.Items)
                    if(gdi["planId"].Text == item["planId"].Text)
                    {
                        CheckBox cb = (CheckBox)item["keep"].Controls[1];
                        cb.Checked = false;
                        break;
                    }
            }
        }

        protected void member_CheckedChanged(object sender, EventArgs e)
        {
            int cartid = BLL.OnlineQuote.QQCartId;
            CheckBox checkbox = (CheckBox)sender;
            RadListViewItem item = (RadListViewItem)checkbox.NamingContainer;
            Label memberid = item.FindControl("memberId") as Label;
            if (checkbox.Checked)
                BLL.EnrollmentForm.InsertMemberToQuote(cartid, memberid.Text);
            else
                BLL.EnrollmentForm.DeleteMemberFromQuote(cartid, memberid.Text);
            AvailablePlansGrid.Rebind();
        }

        protected void AvailablePlansGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "add":
                    GridDataItem gdi2 = (GridDataItem)e.Item;
                    insertEnroller(gdi2, "N");
                    break;
                case "":
                    int cartId = BLL.OnlineQuote.QQCartId;
                    BLL.OnlineQuote.DeleteAllCompareCart(cartId);
                    foreach (GridDataItem gdi in AvailablePlansGrid.Items)
                    {
                        CheckBox cb = gdi["compare2"].Controls[1] as CheckBox;
                        if (cb.Checked)
                        {
                            BLL.OnlineQuote.InsertCompareCart(cartId, gdi["planId"].Text);
                            cb.Checked = false;
                        }
                    }
                    string js = "window.open('/PlanDescription.aspx?date=" + DateTime.Now.ToShortDateString() + "', 'popup_window', 'width=1200, height=700, left=100, top=50, resizable=yes');";
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "script", js, true);
                    break;
                default:
                    break;
            }
        }

        public bool IsValid()
        {
            //checks for plans to be selected 
            if (PlansGrid.Items.Count == 0)
            {
                lblMsg.Text = Common.Utilities.FormatError("Please choose a plan for the enrollment, and click the Select button to add.");
                return false;
            }

            string errorMsg="";
            switch (BLL.EnrollmentForm.plansPageCheck(oeId, EmployerId, oeType))
            {
                case 1:
                    errorMsg = "Only one spouse/domestic partner allowed for enrollment";
                    break;
                case 2:
                    errorMsg = "You must add or waive a plan of each Benefit Type.";
                    break;
                case 3:
                    errorMsg = "Employee is required to select both Medical Term Life coverage and Medical coverage.";
                    break;
                default:
                    //no error
                    break;
            };
            if (!string.IsNullOrEmpty(errorMsg))
            {
                lblMsg.Text = Common.Utilities.FormatError(errorMsg);
                return false;
            }
            return true;
        }

        protected void PlansGrid_DataBound(object sender, EventArgs e)
        {
            foreach (GridFooterItem item in PlansGrid.MasterTableView.GetItems(GridItemType.Footer))
            {
                item["planName"].Visible = false;
                item["planType"].Visible = false;
                item["eeCount"].Visible = false;
                item["depCount"].Visible = false;
                item["effectiveDate"].Visible = false;
                item["price"].ColumnSpan = 5;
            }
        }

        protected void PlansGrid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if(e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                if (item["planTypeId"].Text.Equals("7"))
                    item["btnColumn"].Visible = false;
                Control ct = typeList.FindControl("l" + item["planTypeId"].Text);
                if(ct != null)
                {
                    LinkButton lb = ct.Controls[0] as LinkButton;
                    lb.Style.Add("background", "#006dbb");
                    lb.Enabled = false;
                }
            }
        }

        protected void cbKeep_CheckedChanged(object sender, EventArgs e)
        { 
            CheckBox cb = (CheckBox)sender;
            GridDataItem gdi = (GridDataItem) cb.NamingContainer;
            if (cb.Checked)
                insertEnroller(gdi, "Y");
            else
                deleteEnroller(gdi);
        }

        public void insertEnroller( GridDataItem gdi, string keepCur)
        {
            string planId = gdi["planId"].Text;
            string result = EnrollmentForm.InsertEnrollerFormPlans(oeId, BLL.OnlineQuote.QQCartId, EmployeeId, planId, Page.User.Identity.Name, keepCur);
            if (!result.Equals("null"))
            {
                lblMsg.Text = Utilities.FormatError(result);
                return;
            }

            Logger.WriteAuditLog(string.Format("{0} added plan #{1} from OE #{2}.", Page.User.Identity.Name, planId, oeId), EventCode.ModifyEnrollment);

            setMedType(medType, true);
            addToCart();
            AvailablePlansGrid.Rebind();
            PlansGrid.Rebind();
        }

        public void deleteEnroller(GridDataItem gdi)
        {
            string planId = gdi["planId"].Text;
            int plantype = int.Parse(gdi["planTypeId"].Text);
            if (EnrollmentForm.DeleteEnrollerFormPlans(oeId, planId))
            {
                Logger.WriteAuditLog(string.Format("{0} removed plan #{1} from OE #{2}.", Page.User.Identity.Name, planId, oeId), EventCode.ModifyEnrollment);
                setMedType(plantype, false);
                addToCart();
                AvailablePlansGrid.Rebind();
                PlansGrid.Rebind();
            }
        }

        protected void PlansGrid_ItemCreated(object sender, GridItemEventArgs e)
        {
            foreach (GridDataItem i in currentCoverage.Items)
            {
                CheckBox cb = (CheckBox)i["keep"].Controls[0].FindControl("cbKeep");
                foreach (GridDataItem j in PlansGrid.Items)
                {
                    cb.Enabled=i["description"].Text != j["planType"].Text;
                    if (!cb.Enabled)
                        break;
                }
            }
        }

        //only during new dependent will we alter the rates 
        protected void AvailablePlansGrid_DataBound(object sender, EventArgs e)
        {
            if (!isOeNewHire)
            {
                double current, costNew;
                foreach (GridDataItem gdi in currentCoverage.Items)
                {
                    foreach (GridDataItem gdj in AvailablePlansGrid.Items)
                    {
                        if (gdi["planId"].Text == gdj["planId"].Text)
                        {
                            current = costNew = 0;
                            //current is what the employee is currently paying 
                            current = double.Parse(gdi["eePrice"].Text.Substring(1, gdi["eePrice"].Text.Length - 1))
                                + double.Parse(gdi["depPrice"].Text.Substring(1, gdi["depPrice"].Text.Length - 1));
                            //costNew is what the employee will be paying with new dependent
                            costNew = double.Parse(gdj["eePrice"].Text.Substring(1, gdj["eePrice"].Text.Length - 1))
                                + double.Parse(gdj["depPrice"].Text.Substring(1, gdj["depPrice"].Text.Length - 1));
                            //set current premium equal to this value 
                            gdj["depPrice"].Text = current.ToString("C");
                            //costNew minus current is equal to the rate increase of the plan
                            current = costNew-current;
                            //set addtional cost column equal to this value
                            gdj["eePrice"].Text = current.ToString("C");
                            break;
                        }
                    }
                }
            }
        }

        protected void AvailablePlansGrid_PreRender(object sender, EventArgs e)
        {
            if (!isOeNewHire)
            {
                GridHeaderItem ghi = AvailablePlansGrid.MasterTableView.GetItems(GridItemType.Header)[0] as GridHeaderItem;
                ghi["eePrice"].Text = "Additional Cost";
                ghi["depPrice"].Text = "Current Premium";
                ghi["grossPrice"].Text = "Total Premium";
            }
        }

        protected void type_Command(object sender, CommandEventArgs e)
        {
            tab_command(typeList, e.CommandName);
            medType = int.Parse(e.CommandName);
            AvailablePlansGrid.Rebind();
        }
    }
}