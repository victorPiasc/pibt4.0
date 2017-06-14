namespace Pibt.Reporting
{
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Drawing;
    using System.Text.RegularExpressions;
    using System.Windows.Forms;
    using Telerik.Reporting;
    using Telerik.Reporting.Drawing;

    /// <summary>
    /// Summary description for BenefitsDescReport.
    /// </summary>
    public partial class BenefitsDescReport : Telerik.Reporting.Report
    {
        public BenefitsDescReport()
        {
            //
            // Required for telerik Reporting designer support
            //
            InitializeComponent();                       

        }

        private void table1_NeedDataSource(object sender, EventArgs e)
        {
            Telerik.Reporting.Processing.Table processingTable = (sender as Telerik.Reporting.Processing.Table);
            object cartid = processingTable.Report.Parameters["cartid"].Value;
            object date = processingTable.Report.Parameters["date"].Value;

            DataSet ds = new DataSet();
            ds.Tables.Add(createDataTable((string)cartid, (string)date));
            processingTable.DataSource = ds.Tables[0];

            Telerik.Reporting.HtmlTextBox textboxGroup;
            Telerik.Reporting.HtmlTextBox textBoxTable;

            //we do not clear the Rows collection, since we have a details row group and need to create columns only
            this.table1.ColumnGroups.Clear();
            this.table1.RowGroups.Clear();
            this.table1.Body.Columns.Clear();
            this.table1.Body.Rows.Clear();
            int i = 0;
            this.table1.ColumnHeadersPrintOnEveryPage = true;

            foreach (DataColumn dc in ds.Tables[0].Columns)
            {
                Telerik.Reporting.TableGroup tableGroupColumn = new Telerik.Reporting.TableGroup();
                this.table1.ColumnGroups.Add(tableGroupColumn);
                this.table1.Body.Columns.Add(new Telerik.Reporting.TableBodyColumn(Unit.Inch(1)));

                textboxGroup = new Telerik.Reporting.HtmlTextBox();
                textboxGroup.Style.BorderColor.Default = Color.Black;
                textboxGroup.Style.BorderStyle.Default = BorderType.Solid;
                textboxGroup.Value = dc.ColumnName.ToString();
                textboxGroup.Size = new SizeU(Unit.Inch(1.1), Unit.Inch(0.3));
                tableGroupColumn.ReportItem = textboxGroup;

                textBoxTable = new Telerik.Reporting.HtmlTextBox();
                textBoxTable.Style.BorderColor.Default = Color.Black;
                textBoxTable.Style.BorderStyle.Default = BorderType.Solid;
                textBoxTable.Value = "=Fields." + dc.ColumnName.ToString();
                textBoxTable.Size = new SizeU(Unit.Inch(1.1), Unit.Inch(0.3));
                this.table1.Body.SetCellContent(0, i++, textBoxTable);
                this.table1.Items.AddRange(new ReportItemBase[] { textBoxTable, textboxGroup }); 
               // this.table1.Items.AddRange(new ReportItemBase[] { textboxGroup });
            }            

        }
        protected DataTable createDataTable(string cartid, string date)
        {
            DataTable bh = new DataTable();

            DataTable names = BLL.OnlineQuote.getPDName(cartid, date);
            DataTable dt = BLL.OnlineQuote.getPD(cartid, date);

            string[] rowArray = new string[names.Rows.Count + 1];

            //table begin
            bh.Columns.Add(new DataColumn("BenefitName", typeof(string)));
            //displays the plan names in the first row
            string tmp = "";
            foreach (DataRow r in names.Rows)
            {
                foreach (var name in r.ItemArray)
                {
                   // tmp = Regex.Replace(name.ToString(), "[^a-zA-Z0-9_.]+", "", RegexOptions.Compiled);
                    tmp = Regex.Replace(name.ToString(), @"\s+", "");
                    bh.Columns.Add(new DataColumn(tmp, typeof(string)));
                }

            }

            //placeHolder.Text += "<tr>";
            //displays the benefits 
            int y = bh.Columns.Count;
            int x = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var items = dt.Rows[i].ItemArray; //size of 6
                if (i == 0)
                {
                    rowArray[x] = (string)items[2];
                    x++;
                    rowArray[x] = (string)items[4];
                    x++;
                }
                else if (rowArray.Length <= x && i != dt.Rows.Count)
                {
                    bh.Rows.Add(rowArray);
                    x = 0;
                    rowArray[x] = (string)items[2];
                    x++;
                    rowArray[x] = (string)items[4];
                    x++;
                }
                else
                {
                    rowArray[x] = (string)items[4];
                    x++;
                }

            }
            bh.Rows.Add(rowArray);
            //return bh;

            return bh;

        }

    }
}