using System;
using System.Data;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt
{
    public partial class PlanDescription: SortaBasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["date"]))
            {
                HttpContext.Current.ClearError();
                Response.Redirect("/Oooops.aspx", false);
                return;
            }
            if (!IsPostBack)
            {
                planType.DataSource= BLL.OnlineQuote.getPlanTypes(BLL.OnlineQuote.QQCartId);
                planType.DataTextField = "description";
                planType.DataValueField = "planTypeId";
                planType.DataBind();
                excelDownload.Visible = Common.ApplicationConfiguration.IsTestServer;
            }
        }

        protected DataTable createDataTable(DataTable dt, DataTable names)
        {           
            DataTable bh = new DataTable();
            string[] rowArray = new string[names.Rows.Count + 1];
      
            //table begin
            bh.Columns.Add(new DataColumn("Plan Name", typeof(string)));

            //displays the plan names in the first row
            foreach (DataRow r in names.Rows)
            {
                foreach (var name in r.ItemArray)
                {
                    bh.Columns.Add(new DataColumn(name.ToString(), typeof(string)));
                }

            }

            //displays the benefits 
            int y = bh.Columns.Count;
            int x = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var items = dt.Rows[i].ItemArray; //size of 6
                if (i == 0)
                {
                    rowArray[x++] = items[2] is System.DBNull ? "" : (string)items[2];
                }
                else if (rowArray.Length <= x && i != dt.Rows.Count)
                {                        
                    bh.Rows.Add(rowArray);
                    x = 0;
                    rowArray[x++] = items[2] is System.DBNull ? "" : (string)items[2];
                }
                rowArray[x++] = items[4] is System.DBNull? "" : (string)items[4];

            }
            bh.Rows.Add(rowArray);
            return bh;
        }

        protected void test_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            string date = Request.QueryString["date"];
            int cartid = BLL.OnlineQuote.QQCartId;

            DataTable names = BLL.OnlineQuote.getPDName(cartid, planType.SelectedValue);
            DataTable data = BLL.OnlineQuote.getPD(cartid, date, planType.SelectedValue);
            if (data.Rows.Count == 0 || names.Rows.Count == 0)
            {
                placeholder.Visible = true;
                dt.Visible = false;
                dt.DataSource = null;
            }
            else
            {
                placeholder.Visible = false;
                dt.Visible = true;
                dt.DataSource = createDataTable(data, names);
            }
        }

        protected void dt_PreRender(object sender, EventArgs e)
        {
            GridDataItem row = null;
            TableCell cell = null;
            string[] words;
            for (int rowIndex = 0; rowIndex < dt.Items.Count; rowIndex++)
            {
                row = dt.Items[rowIndex];
                for (int cellIndex = 0; cellIndex < row.Cells.Count; cellIndex++)
                {
                    cell = row.Cells[cellIndex];
                    if (cell.Text.Contains("<SPLIT>"))
                    {
                        words = Regex.Split(cell.Text, "<SPLIT>");
                        cell.Text = words[0] + " | " + words[1];
                    }
                    if (cell.Text.Contains("<b>") )
                    {
                        row.CssClass = "bhBlue";
                    }
                    if (cellIndex>2)
                    {
                        cell.HorizontalAlign = HorizontalAlign.Center;
                    }
                }
            }
        }

        protected void planType_SelectedIndexChanged(object sender, EventArgs e)
        {
            dt.Rebind();
        }

        protected void excelDownload_Click(object sender, EventArgs e)
        {
            string date = Request.QueryString["date"];
            int cartid = BLL.OnlineQuote.QQCartId;
            using (RadGrid tmp = new RadGrid())
            {
                tmp.ID = "exportOnly";
                tmp.DataSource = createDataTable(BLL.OnlineQuote.getPD(cartid, date, planType.SelectedValue), BLL.OnlineQuote.getPDName(cartid, planType.SelectedValue));
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
    }
}