using Pibt.Common;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt
{
    public partial class InHouseQuote : SortaBasePage
    {
        int familyId
        {
            get
            {
                if (ViewState["familyId"] == null)
                    ViewState["familyId"] = BLL.OnlineQuote.getLastFamilyId(BLL.OnlineQuote.QQCartId) + 1;
                return (int)ViewState["familyId"];
            }
            set
            {
                ViewState["familyId"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem li = new ListItem();
                for (int i = 1; i < 4; i++)
                {
                    li = new ListItem(DateTime.Parse(DateTime.Now.Date.AddMonths(i).ToString("MM/01/yyyy")).ToString("MM/dd/yyyy"));
                    effectiveDate.Items.Add(li);
                }
                eeCount.Text = BLL.OnlineQuote.CheckWebCartCount(BLL.OnlineQuote.ForceNewCartId(), 0);
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //change census to take in last name, first name instead of one column for name 
            string missing = uploadGeneric(fuCensus, "/UploadFiles/",  BLL.OnlineQuote.QQCartId, familyId, null, true);
            if (missing == "nofile")//if this is returned then no file found
            {
                lblCreationMessage.Text = Utilities.FormatError("No file found");
                return;
            }
            if (!string.IsNullOrEmpty(missing))//if a string is returned but not no file then it about people not added. 
                lblCreationMessage.Text = Utilities.FormatError(missing);
            eeCount.Text = BLL.OnlineQuote.CheckWebCartCount(BLL.OnlineQuote.QQCartId, 0);
        }

        protected void getQuote_Click(object sender, EventArgs e)
        {
            BLL.OnlineQuote.insertQQemployer(BLL.OnlineQuote.QQCartId, "test", "address", "city", "st", int.Parse(zipCode.Text), "fax", "name", "phone", "email@email.com", "N");
            BLL.OnlineQuote.setQuickQuoteRates(BLL.OnlineQuote.QQCartId, effectiveDate.SelectedIndex, 'N', 1);
            using (RadGrid tmp = new RadGrid())
            {
                tmp.ID = "exportOnly";
                tmp.DataSource = createDataTable(BLL.OnlineQuote.exportQQtoExcel(BLL.OnlineQuote.QQCartId));
                tmp.DataBind();
                tmp.EnableLinqExpressions = false;
                tmp.ExportSettings.IgnorePaging = true;
                tmp.ExportSettings.ExportOnlyData = true;
                tmp.ExportSettings.FileName = "Rates";
                tmp.ExportSettings.OpenInNewWindow = true;
                tmp.ExportSettings.HideStructureColumns = true;
                tmp.ExportSettings.Excel.Format = GridExcelExportFormat.Biff;
                exportPh.Controls.Add(tmp);
                tmp.MasterTableView.ExportToExcel();
            }
        }

        protected void deleteAll_Click(object sender, EventArgs e)
        {
            int cartid = BLL.OnlineQuote.QQCartId;
            if (BLL.OnlineQuote.DeleteAllWebQQCart(cartid))
            {
                eeCount.Text = BLL.OnlineQuote.CheckWebCartCount(BLL.OnlineQuote.QQCartId, 0);
            }
        }

        public DataTable createDataTable(DataTable data)
        {
            DataTable ee = new DataTable();
            ee.Columns.Add(new DataColumn("Name", typeof(string)));
            ee.Columns.Add(new DataColumn("Tier", typeof(string)));
            ee.Columns.Add(new DataColumn("Birthdate", typeof(string)));
            ee.Columns.Add(new DataColumn("Age", typeof(string)));
            string planName = data.Rows[0].ItemArray[3].ToString();
            foreach (DataRow r in data.Rows)
            {
                if (r == data.Rows[0] || ("Employee".Equals(r.ItemArray[2].ToString()) && !planName.Equals(r.ItemArray[3].ToString())))
                    ee.Columns.Add(new DataColumn(r.ItemArray[3].ToString(), typeof(string)));
                else
                    break;
            }
            string[] eeArray = new string[ee.Columns.Count];
            string familyId = "";
            int x = 0, depCount = 0;
            bool isDep = false;
            DataRow dr = null;

            for (int i = 0; i < data.Rows.Count; i++)
            {
                dr = data.Rows[i];
                if (x >= ee.Columns.Count || i == 0)
                {
                    if (i != 0)
                        ee.Rows.Add(eeArray);
                    if (isDep)
                        dr = data.Rows[--i];
                    x = 0;
                    familyId = dr.ItemArray[0].ToString();
                    isDep = !dr.ItemArray[2].ToString().Equals("Employee");
                    depCount = isDep ? depCount + 1 : 0;
                    eeArray[x++] = dr.ItemArray[1].ToString();
                    eeArray[x++] = dr.ItemArray[2].ToString();
                    DateTime tmp;
                    DateTime.TryParse(dr.ItemArray[6].ToString(),out tmp);
                    eeArray[x++] = tmp.ToShortDateString();
                    eeArray[x++] = dr.ItemArray[7].ToString();
                }
                if (isDep && !ee.Columns[x].ColumnName.Equals(dr.ItemArray[3].ToString()))
                {
                    foreach (DataRow d in data.Rows)
                    {
                        if (d.ItemArray[0].ToString().Equals(familyId) && ee.Columns[x].ColumnName.Equals(d.ItemArray[3].ToString()) && "Employee".Equals(d.ItemArray[2].ToString()))
                            eeArray[x++] = depCount < 2 ? "$" + d.ItemArray[5].ToString() : " ";
                        if (x >= ee.Columns.Count - 1 || ee.Columns[x].ColumnName.Equals(dr.ItemArray[3].ToString()))
                            break;
                    }
                }
                if (x < ee.Columns.Count)
                    eeArray[x++] = "$" + dr.ItemArray[isDep ? 5 : 4].ToString();
            }
            ee.Rows.Add(eeArray);
            return ee;
        }
    }
}