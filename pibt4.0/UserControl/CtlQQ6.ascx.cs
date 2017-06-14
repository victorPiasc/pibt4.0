using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.UserControl
{
    public partial class CtlQQ6 : BaseUserControl
    {
        public int cartId { get { return BLL.OnlineQuote.QQCartId; } }

        public decimal minTotal //the cost of 50% of the lowest priced plan
        {
            get
            {
                if (ViewState["minTotal"] == null)
                    ViewState["minTotal"] = BLL.OnlineQuote.minRequirement(cartId);
                return (decimal)ViewState["minTotal"];
            }
            set { ViewState["minTotal"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void pageSetup()
        {
            object edate = Session["effectiveDate"];
            int zipNum = BLL.OnlineQuote.GetEmployerZip(cartId);
            if (edate == null || zipNum == 0)
                oops();
            zip.Text = zipNum.ToString();
            effectiveDate.Text = edate.ToString();
            eeCount.Text = BLL.OnlineQuote.CheckWebCartCount(cartId, 0); //number of employees
            int depTmp = int.Parse(BLL.OnlineQuote.CheckWebCartCount(cartId, 1)) + int.Parse(BLL.OnlineQuote.CheckWebCartCount(cartId, 2)); //number of dependents
            depCount.Text = depTmp.ToString();
            string[] arr = BLL.OnlineQuote.web_setUpPage(cartId);//page setup 

            basis.Text = arr[3] =="Y"
                ? "Dollar Amount"
                :arr[2] == "Y"
                    ? "Base Plans"
                    : arr[1] == "Y"
                        ? "Lowest Cost Plan"
                        : "Any Plan";

            radgrid_1.Columns[6].Display = radgrid_2.Columns[6].Display = radgrid_3.Columns[6].Display =
                radgrid_4.Columns[6].Display = radgrid_8.Columns[6].Display = arr[2] == "Y" && arr[3] == "N";
            if (arr[3] == "Y")
            {
                Decimal[] dollar = BLL.OnlineQuote.getDollars(cartId);
                dollarCont.Text = dollar[0].ToString();
                dollarDepCont.Text = dollar[1].ToString();
                overallDollar.Visible = true;
                overallContribution.Visible = perPlanType.Visible = false;
            }
            else if (arr[0] == "Y")
            {
                DataTable tmp = BLL.OnlineQuote.getERPlanTypeConts(cartId);
                Label tb1, tb2;
                for (int i = 1; i < 6; i++)
                {
                    tb1 = perPlanType.FindControl("top_" + i) as Label;
                    tb1.Text = tmp.Rows[i - 1].ItemArray[0] != null ? tmp.Rows[i - 1].ItemArray[0].ToString() : "";
                    tb2 = perPlanType.FindControl("bot_" + i) as Label;
                    tb2.Text = tmp.Rows[i - 1].ItemArray[1] != null ? tmp.Rows[i - 1].ItemArray[1].ToString() : "";
                }
                perPlanType.Visible = true;
                overallContribution.Visible = overallDollar.Visible = false;
            }
            else
            {
                int[] percent = BLL.OnlineQuote.getPercent(cartId);
                overAllContEE.Text = percent[0].ToString();
                overAllContDep.Text = percent[1].ToString();
                overallContribution.Visible = true;
                overallDollar.Visible = perPlanType.Visible = false;
            }
            BLL.OnlineQuote.setSubsidy(cartId);

            DataTable dt = BLL.OnlineQuote.getRenewalPlanPt(cartId);
            RadGrid grid;
            foreach (DataRow dr in dt.Rows)
            {
                Control ct = masterPanel.FindControl("type_" + dr.ItemArray[0].ToString());
                if (ct != null)
                {
                    Panel type = ct as Panel;
                    type.Visible = true;
                    grid = type.FindControl("radgrid_" + dr.ItemArray[0].ToString()) as RadGrid;
                    grid.Rebind();
                }
            }
        }

        public string minRequirement()
        {
            return (minTotal / decimal.Parse(BLL.OnlineQuote.CheckWebCartCount(cartId, 0))).ToString("0.00");
        }

        protected void radgrid_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                string[] arr = BLL.OnlineQuote.web_setUpPage(cartId);
                RadGrid tmp = (RadGrid)sender;
                GridDataItem item = e.Item as GridDataItem;
                string type = tmp.ID;
                type = type.Substring(8, type.Length - 8);
                if (arr[3] == "N" && arr[2] == "Y")
                {
                    string basePlan = BLL.OnlineQuote.getBasePlanId(cartId, type);
                    Button btn = (Button)item["btn"].Controls[0];
                    if (item["planId"].Text.Equals(basePlan))
                    {
                        btn.Enabled = false;
                        btn.BackColor = System.Drawing.Color.Red;
                        btn.Text = "Base Plan";
                    }
                    else
                        btn.Visible = false;
                }

                if (arr[3] == "Y")
                {
                    decimal excess = decimal.Parse(dollarCont.Text) - decimal.Parse(minRequirement());
                    if (excess > 0 && int.Parse(type) != 6 && int.Parse(type) != 7)
                    {
                        decimal aggr = excess * (BLL.OnlineQuote.getMinPerPlanType(cartId, int.Parse(type)) / minTotal) * decimal.Parse(BLL.OnlineQuote.CheckWebCartCount(cartId, 0));
                        decimal cAmount = decimal.Parse(item["erPays"].Text.Remove(0, 1));
                        cAmount += aggr;
                        item["erPays"].Text = cAmount.ToString("C");
                        cAmount = decimal.Parse(item["eePays"].Text.Remove(0, 1));
                        cAmount -= aggr;
                        item["eePays"].Text = cAmount.ToString("C");
                    }
                }
            }
        }

        protected void radgrid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            RadGrid tmp = (RadGrid)sender;
            int type = int.Parse(tmp.ID[8].ToString());
            tmp.DataSource = overallDollar.Visible && type != 6 && type != 7
                 ? BLL.OnlineQuote.getQQDollar(cartId, type)
                 : BLL.OnlineQuote.Web_QuickQuote(cartId, type, 'Y');
        }

        protected void radgrid_1_PdfExporting(object sender, GridPdfExportingArgs e)
        {
            RadGrid tmp = (RadGrid)sender;
            DataTable dt = BLL.OnlineQuote.getQQEmployer(cartId);
            tmp.Columns[6].Visible = false;
            tmp.ExportSettings.Pdf.PageHeader.LeftCell.Text = "Name: " + dt.Rows[0].ItemArray[1].ToString();
            tmp.ExportSettings.Pdf.PageHeader.MiddleCell.Text = "Effective:" + Session["effectiveDate"].ToString();
            tmp.ExportSettings.Pdf.PageHeader.RightCell.Text = "Benefit Type: ";
            switch (tmp.ID)
            {
                case "radgrid_1":
                    tmp.ExportSettings.Pdf.PageHeader.RightCell.Text += "Medical";
                    break;
                case "radgrid_2":
                    tmp.ExportSettings.Pdf.PageHeader.RightCell.Text += "Dental";
                    break;
                case "radgrid_3":
                    tmp.ExportSettings.Pdf.PageHeader.RightCell.Text += "Vision";
                    break;
                case "radgrid_4":
                    tmp.ExportSettings.Pdf.PageHeader.RightCell.Text += "Chiro";
                    break;
                case "radgrid_6":
                    tmp.ExportSettings.Pdf.PageHeader.RightCell.Text += "Voluntary Life";
                    break;
                case "radgrid_7":
                    tmp.ExportSettings.Pdf.PageHeader.RightCell.Text += "Medical Term Life";
                    break;
                case "radgrid_8":
                    tmp.ExportSettings.Pdf.PageHeader.RightCell.Text += "Mental Health";
                    break;
            }
            foreach (GridColumn c in tmp.Columns)
            {
                if (c.ColumnType == "GridCalculatedColumn")
                {
                    c.HeaderStyle.HorizontalAlign = HorizontalAlign.Left;
                    c.ItemStyle.HorizontalAlign = HorizontalAlign.Left;
                }
            }
        }
    }
}