namespace Pibt.Reporting
{
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Windows.Forms;
    using Telerik.Reporting;
    using Telerik.Reporting.Drawing;
    using Pibt.Model;
    using System.Data;


    /// <summary>
    /// Summary description for EnrollmentFormFilled.
    /// </summary>
    public partial class EnrollmentFormFilled : Telerik.Reporting.Report
    {
        public EnrollmentFormFilled( string employerId)
        {
            //
            // Required for telerik Reporting designer support
            //
            InitializeComponent();
            //
            // TODO: Add any constructor code after InitializeComponent call
            //
            fillOutForm(employerId);
            addPlans(employerId);
        }

        public void fillOutForm(string employerId)
        {
            BizInfoDetails info = BLL.Employer.GetBizInfoDetails(employerId);
            cName.Value = info.CompanyName;
            cPhoneNbr.Value = info.Phonenbr;
            cEmployerId.Value = info.EmployerId;
            cAddress.Value = info.PhsicalStreetAddress1 + " " + info.PhsicalStreetAddress2+" "+info.PhsicalCity+","+" "+info.PhsicalState+" "+info.PhsicalPostCode;
        }

        public void addPlans(string employerId)
        {
            DataTable dt = BLL.Plan.getFormPlans(employerId); //get plans for the form
            string name="";
            Telerik.Reporting.CheckBox ch;
            Telerik.Reporting.TextBox tb;
            int countCh=0;
            //coordinates will be based off upper left corner of panel. 
            Unit ylocation= new Unit(0, UnitType.Inch);
            Unit xLocation = new Unit(0, UnitType.Inch);
            bool hasMTL=false;

            foreach (DataRow dr in dt.Rows)
            {
                if (!name.Equals(dr.ItemArray[2].ToString())) //creates the titles for each plan section
                {
                    xLocation = new Unit(0, UnitType.Inch);//reset x coordinate to 0
                    if (countCh > 0)
                        ylocation += new Unit(0.3, UnitType.Inch);//reset y to new line
                    countCh = 0;//reset count of check boxes
                    name = dr.ItemArray[2].ToString();
                    tb = newBox(name+(dr.ItemArray[3].ToString().Equals("6") ? " (fill out separate form)" : ""), xLocation, ylocation); 
                    plans.Items.AddRange(new ReportItemBase[] { tb });
                    ylocation += tb.Size.Height + new Unit(0.05, UnitType.Inch);
                    switch (dr.ItemArray[3].ToString())
                    {
                        case "1":
                            medicalPanel.Visible = true;
                            break;
                        case "2":
                            DentalPanel.Visible = true;
                            break;
                        case"3":
                            visionPanel.Visible = true;
                            break;
                        case"4":
                            ChiroPanel.Visible = true;
                            break;
                        default:
                            //cannot last one to default because there are other plantypes that i do not need to turn true
                            break;
                    }
                }
                if(countCh==3)//if there are 3 checkboxes on a line create a new line
                {
                    countCh = 0;
                    xLocation = new Unit(0, UnitType.Inch);
                    ylocation += new Unit(0.3, UnitType.Inch);
                }
                ch = newCheckBox(dr.ItemArray[1].ToString(), xLocation, ylocation);
                plans.Items.AddRange(new ReportItemBase[] { ch });
                ++countCh;
                xLocation += ch.Size.Width;
                if (!hasMTL && dr.ItemArray[3].ToString() == "7")
                   hasMTL = true;
            }

            //empty box created for space between last checkmarks and new section
            tb = new Telerik.Reporting.TextBox();
            tb.Value = "=Null";
            tb.Size = new SizeU(new Unit(7.98, UnitType.Inch), new Unit(0.1, UnitType.Inch));
            ylocation += new Unit(0.2, UnitType.Inch);
            tb.Location = new PointU(new Unit(0, UnitType.Inch), ylocation);
            plans.Items.AddRange(new ReportItemBase[] { tb });

            Section2a.Visible = hasMTL;
            ylocation = hasMTL? Section2a.Location.Y + Section2a.Height : Section2.Location.Y + Section2.Height;
            Section3.Location = new PointU(new Unit("0"), ylocation);
            Section4.Location = new PointU(new Unit("0"), Section3.Location.Y + Section3.Height);
            if (Section4.Location.Y + Section4.Height > Section5.Location.Y)
                Section5.Location = new PointU(new Unit("0"), Section4.Location.Y + Section4.Height);
            if (Section5.Location.Y + Section5.Height > Section6.Location.Y)
                Section6.Location = new PointU(new Unit("0"), Section5.Location.Y + Section5.Height);
            if (Section6.Location.Y + Section6.Height > Section7.Location.Y)
                Section7.Location = new PointU(new Unit("0"), Section6.Location.Y + Section6.Height);
            if (Section7.Location.Y + Section7.Height > Section8.Location.Y)
                Section8.Location = new PointU(new Unit("0"), Section7.Location.Y + Section7.Height);
            if (Section8.Location.Y + Section8.Height > Section9.Location.Y)
                Section9.Location = new PointU(new Unit("0"), Section8.Location.Y + Section8.Height);
            if (Section9.Location.Y + Section9.Height > Section10.Location.Y)
                Section10.Location = new PointU(new Unit("0"), Section9.Location.Y + Section9.Height);
            if (Section10.Location.Y + Section10.Height > Section11.Location.Y)
                Section11.Location = new PointU(new Unit("0"), Section10.Location.Y + Section10.Height);
            if (Section11.Location.Y + Section11.Height > Section12.Location.Y)
                Section12.Location = new PointU(new Unit("0"), Section11.Location.Y + Section11.Height);
            if (Section12.Location.Y + Section12.Height > Section13.Location.Y)
                Section13.Location = new PointU(new Unit("0"), Section12.Location.Y + Section12.Height);
            if (Section13.Location.Y + Section13.Height > Section14.Location.Y)
                Section14.Location = new PointU(new Unit("0"), Section13.Location.Y + Section13.Height);
        }

        public Telerik.Reporting.TextBox newBox(string name, Unit x, Unit y) //add textbox styles in here
        {
            Telerik.Reporting.TextBox tb = new Telerik.Reporting.TextBox();
            tb.Value = name;
            tb.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(4, UnitType.Inch), new Telerik.Reporting.Drawing.Unit(0.3, UnitType.Inch));
            tb.Style.BorderStyle.Bottom = BorderType.Solid;
            tb.Style.VerticalAlign = VerticalAlign.Bottom;
            tb.Location = new Telerik.Reporting.Drawing.PointU(x, y);
            return tb;
        }

        public Telerik.Reporting.CheckBox newCheckBox(string text, Unit x, Unit y) //add checkbox styles in here
        {
            Telerik.Reporting.CheckBox ch = new Telerik.Reporting.CheckBox();
            ch.Value = false;
            ch.Text = text;
            ch.Style.Font.Size = new Telerik.Reporting.Drawing.Unit(8, UnitType.Point);
            //ch.Style.TextAlign = HorizontalAlign.Center;
            ch.Style.VerticalAlign = VerticalAlign.Middle;
            ch.Size = new Telerik.Reporting.Drawing.SizeU(new Telerik.Reporting.Drawing.Unit(2.5, UnitType.Inch), new Telerik.Reporting.Drawing.Unit(.3, UnitType.Inch));
            ch.Location = new Telerik.Reporting.Drawing.PointU(x, y);
            return ch;
        }
    }
}