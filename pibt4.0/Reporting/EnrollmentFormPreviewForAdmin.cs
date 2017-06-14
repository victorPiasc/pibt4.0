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

    /// <summary>
    /// Summary description for Report1.
    /// </summary>
    public partial class EnrollmentFormPreviewForAdmin : Telerik.Reporting.Report
    {
        public EnrollmentFormPreviewForAdmin()
        {
            //
            // Required for telerik Reporting designer support
            //
            InitializeComponent();

        }

        private void detail_ItemDataBound(object sender, EventArgs e)
        {
            //Telerik.Reporting.Processing.DetailSection procDetail = sender as Telerik.Reporting.Processing.DetailSection;
            //Model.OeDetails row = procDetail.DataObject.RawData as Model.OeDetails;
        }

        private void pictureBox2_ItemDataBound(object sender, EventArgs e)
        {

        }

        private void pictureBox2_ItemDataBinding(object sender, EventArgs e)
        {
            int signatureId = BLL.Employer.getSigntureId(this.ReportParameters["oeId"].Value.ToString(), 0, null);
            byte[] buffer = BLL.Employer.getSignature(signatureId);
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

        private void EnrollmentFormPreview_ItemDataBound(object sender, EventArgs e)
        {

        }
         
    }
}