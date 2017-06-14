using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;
using System.Data;

namespace Pibt.Employer
{
    public partial class InvoiceDetail : BasePage
    {
        public string invoiceNbr{ get { return Request["invId"]; } }
        public string employerName { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string  zip { get; set; }
        public string contact { get; set; }
        public string phoneNbr { get; set; }
        public string email { get; set; }
        public decimal adjustment { get; set; }
        public decimal premTotal { get; set; }
        public decimal commTotal { get; set; }
        public decimal grandTotal { get; set; }
        public DateTime invoiceDate { get; set; }
        public DateTime dueDate { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(invoiceNbr))
                oops();
            if (!IsPostBack)
                pageSetup();
        }

        public void pageSetup()
        {
            DataTable dt = BLL.Invoice.singleInvoice(invoiceNbr, EmployerId);
            if (dt.Rows.Count < 1)
                oops();
            adjustment = dt.Rows[0].ItemArray[0]==DBNull.Value ? 0 : decimal.Parse(dt.Rows[0].ItemArray[0].ToString());
            employerName = dt.Rows[0].ItemArray[1].ToString();
            address = dt.Rows[0].ItemArray[2].ToString();
            city = dt.Rows[0].ItemArray[3].ToString();
            state = dt.Rows[0].ItemArray[4].ToString();
            zip = dt.Rows[0].ItemArray[5].ToString();
            contact = dt.Rows[0].ItemArray[6].ToString();
            phoneNbr = dt.Rows[0].ItemArray[7].ToString();
            email = dt.Rows[0].ItemArray[8].ToString();
            invoiceDate = DateTime.Parse(dt.Rows[0].ItemArray[9].ToString());
            dueDate = DateTime.Parse(dt.Rows[0].ItemArray[10].ToString());

            premTotal = commTotal = 0;
            string planName = "";
            decimal planAmount = 0, planComm = 0;

            DataTable planSum = new DataTable();
            planSum.Columns.Add(new DataColumn("PlanName", typeof(string)));
            planSum.Columns.Add(new DataColumn("Premium", typeof(decimal)));
            planSum.Columns.Add(new DataColumn("Commission", typeof(decimal)));

            foreach (DataRow r in dt.Rows)
            {
                if (planName != r.ItemArray[16].ToString())
                {
                    if (string.IsNullOrEmpty(planName))
                        planName = r.ItemArray[16].ToString();
                    else
                    {
                        planSum.Rows.Add( new object [] { planName, planAmount, planComm});
                        planAmount = planComm = 0;
                        planName = r.ItemArray[16].ToString();
                    }
                }
                planAmount += decimal.Parse(r.ItemArray[19].ToString());  //will be reset to 0
                planComm += decimal.Parse(r.ItemArray[20].ToString());    //will be reset to 0
                premTotal += decimal.Parse(r.ItemArray[19].ToString());   //keeps total of all plans
                commTotal += decimal.Parse(r.ItemArray[20].ToString());   //keeps total of all plans 
            }
            planSum.Rows.Add(new object[] { planName, planAmount, planComm });
            grandTotal = adjustment + premTotal;
            details.DataSource = dt;
            details.DataBind();
            summary.DataSource = planSum;
            summary.DataBind();
        }

        protected void details_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            pageSetup();
        }

        protected void summary_SortCommand(object sender, Telerik.Web.UI.GridSortCommandEventArgs e)
        {
            pageSetup();
        }
    }
}