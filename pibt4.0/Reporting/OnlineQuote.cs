namespace Pibt.Reporting
{
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using Telerik.Reporting;
    using Telerik.Reporting.Drawing;

    /// <summary>
    /// Summary description for OnlineQuote.
    /// </summary>
    public partial class OnlineQuote : Telerik.Reporting.Report
    {
        public OnlineQuote()
        {
            //
            // Required for telerik Reporting designer support
            //
            InitializeComponent();
            
        }

        private void table1_NeedDataSource(object sender, EventArgs e)
        {
            //int MA;
            //if(int.TryParse(ReportParameters["monthsAhead"].Value.ToString(), out MA))
                //table1.DataSource = BLL.OnlineQuote.Web_QuickQuote(int.Parse(ReportParameters["cartId"].Value.ToString()), MA, 'Y');
        }

        private void table4_NeedDataSource(object sender, EventArgs e)
        {
            table4.DataSource = BLL.OnlineQuote.getQQEmployer(int.Parse(ReportParameters["cartId"].Value.ToString()));
        }

        private void textBox63_ItemDataBound(object sender, EventArgs e)
        {
            DateTime dt;
            Telerik.Reporting.Processing.TextBox tx = (Telerik.Reporting.Processing.TextBox)sender;
            if (DateTime.TryParse(tx.Value.ToString(), out dt))
            {
                tx.Value = dt.AddMonths(1).ToShortDateString();
            }
        }
     
    }
}