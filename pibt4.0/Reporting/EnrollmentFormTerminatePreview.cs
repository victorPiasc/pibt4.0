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

    /// <summary>
    /// Summary description for Report1.
    /// </summary>
    public partial class EnrollmentFormTerminatePreview : Telerik.Reporting.Report
    {
        public EnrollmentFormTerminatePreview()
        {
            //
            // Required for telerik Reporting designer support
            //
            InitializeComponent();

        }

        public void BindControls(string oeId)
        {
            string legalContent = "<p>" + BLL.LegalDoc.GetLegalDocDetails(0, false) + "</p>";
            using (DataTable dt = EnrollmentForm.GetOEPlansCarriers(oeId))
            {
                foreach (DataRow row in dt.Rows)
                {
                    legalContent += "<p>" + BLL.LegalDoc.GetLegalDocDetails(Common.Utilities.ToInt(row["Carrierid"]), false) + "</p>";
                }
            }
            legalContent += "<p>" + BLL.LegalDoc.GetLegalDocDetails(999, false) + "</p>";

            htmlTextBox14.Value = legalContent;

        }

        private void pictureBox2_ItemDataBinding(object sender, EventArgs e)
        {
            byte[] buffer = BLL.EnrollmentForm.GetSignatrue(this.ReportParameters["oeId"].Value.ToString());
            if (buffer != null)
            {
                using (MemoryStream ms = new MemoryStream(buffer))
                {
                    ms.Position = 0;
                    Image img = Image.FromStream(ms);
                    Bitmap bmp = new Bitmap(img);
                    pictureBox2.Value = bmp;
                }
            }
        }

    }
}