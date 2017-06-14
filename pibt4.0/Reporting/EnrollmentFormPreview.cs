namespace Pibt.Reporting
{
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using Telerik.Reporting;
    using Telerik.Reporting.Drawing;
    using System.IO;
    using System.Data;
    using Pibt.BLL;
    using System.Text.RegularExpressions;
    using Pibt.Class;
    using System.Web;

    /// <summary>
    /// Summary description for Report1.
    /// </summary>
    public partial class EnrollmentFormPreview : Telerik.Reporting.Report
    {
        public EnrollmentFormPreview()
        {
            //
            // Required for telerik Reporting designer support
            //
            InitializeComponent();

        }

        public void BindControls(string oeId)
        {
            // Get LegalDocDetails
            htmlTextBox14.Value = LegalDocuments.getLegalDocs(oeId);
        }

        private void textBox99_ItemDataBound(object sender, EventArgs e)
        {
            Telerik.Reporting.Processing.TextBox tx = sender as Telerik.Reporting.Processing.TextBox;
            tx.Value = (bool)tx.Value ? "Yes" : "No";
        }

        private void textBox62_ItemDataBound(object sender, EventArgs e)
        {
            Telerik.Reporting.Processing.TextBox tx = sender as Telerik.Reporting.Processing.TextBox;
            switch (tx.Text)
            {
                case "2":
                    tx.Value = "Semi-annual";
                    break;
                case "4":
                    tx.Value = "Quarterly";
                    break;
                case "12":
                    tx.Value = "Monthly";
                    break;
                case "24":
                    tx.Value = "Semi-monthly";
                    break;
                case "26":
                    tx.Value = "Bi-weekly";
                    break;
                case "52":
                    tx.Value = "Weekly";
                    break;
                case "260":
                    tx.Value = "Daily";
                    break;
                case "2080":
                    tx.Value = "Daily";
                    break;
                default:
                    tx.Value = "";
                    break;
            }
        }

        private void pictureBox2_ItemDataBound(object sender, EventArgs e)
        {
            int signatureId = BLL.Employer.getSigntureId(this.ReportParameters["oeId"].Value.ToString(),0, null);
            byte[] buffer = BLL.Employer.getSignature(signatureId);
            Telerik.Reporting.Processing.PictureBox pic = (Telerik.Reporting.Processing.PictureBox)sender;
            if (buffer != null)
            {
                using (MemoryStream ms = new MemoryStream(buffer))
                {
                    ms.Position = 0;
                    Image img = Image.FromStream(ms);
                    Bitmap bmp = new Bitmap(img);
                    pic.Image = img;
                }
            }
        }

        private void textBox14_ItemDataBound(object sender, EventArgs e)
        {
            Telerik.Reporting.Processing.TextBox tx = sender as Telerik.Reporting.Processing.TextBox;
            tx.Value = tx.Text.Contains("-") ? "Pending" : tx.Text;
        }
    }
}