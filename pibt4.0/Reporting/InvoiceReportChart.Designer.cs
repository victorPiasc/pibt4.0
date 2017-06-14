namespace Pibt.Reporting
{
    partial class InvoiceReportChart
    {
        #region Component Designer generated code
        /// <summary>
        /// Required method for telerik Reporting designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            Telerik.Reporting.GraphGroup graphGroup1 = new Telerik.Reporting.GraphGroup();
            Telerik.Reporting.Drawing.ColorPalette colorPalette1 = new Telerik.Reporting.Drawing.ColorPalette();
            Telerik.Reporting.GraphGroup graphGroup4 = new Telerik.Reporting.GraphGroup();
            Telerik.Reporting.GraphTitle graphTitle1 = new Telerik.Reporting.GraphTitle();
            Telerik.Reporting.CategoryScale categoryScale1 = new Telerik.Reporting.CategoryScale();
            Telerik.Reporting.NumericalScale numericalScale1 = new Telerik.Reporting.NumericalScale();
            Telerik.Reporting.GraphGroup graphGroup2 = new Telerik.Reporting.GraphGroup();
            Telerik.Reporting.Drawing.ColorPalette colorPalette2 = new Telerik.Reporting.Drawing.ColorPalette();
            Telerik.Reporting.GraphGroup graphGroup3 = new Telerik.Reporting.GraphGroup();
            Telerik.Reporting.GraphGroup graphGroup5 = new Telerik.Reporting.GraphGroup();
            Telerik.Reporting.Drawing.ColorPalette colorPalette3 = new Telerik.Reporting.Drawing.ColorPalette();
            Telerik.Reporting.GraphGroup graphGroup8 = new Telerik.Reporting.GraphGroup();
            Telerik.Reporting.GraphTitle graphTitle2 = new Telerik.Reporting.GraphTitle();
            Telerik.Reporting.CategoryScale categoryScale2 = new Telerik.Reporting.CategoryScale();
            Telerik.Reporting.NumericalScale numericalScale2 = new Telerik.Reporting.NumericalScale();
            Telerik.Reporting.GraphGroup graphGroup6 = new Telerik.Reporting.GraphGroup();
            Telerik.Reporting.Drawing.ColorPalette colorPalette4 = new Telerik.Reporting.Drawing.ColorPalette();
            Telerik.Reporting.GraphGroup graphGroup7 = new Telerik.Reporting.GraphGroup();
            Telerik.Reporting.DateTimeScale dateTimeScale1 = new Telerik.Reporting.DateTimeScale();
            Telerik.Reporting.CategoryScale categoryScale3 = new Telerik.Reporting.CategoryScale();
            Telerik.Reporting.DateTimeScale dateTimeScale2 = new Telerik.Reporting.DateTimeScale();
            Telerik.Reporting.Group group1 = new Telerik.Reporting.Group();
            Telerik.Reporting.Group group2 = new Telerik.Reporting.Group();
            Telerik.Reporting.ReportParameter reportParameter1 = new Telerik.Reporting.ReportParameter();
            Telerik.Reporting.ReportParameter reportParameter2 = new Telerik.Reporting.ReportParameter();
            Telerik.Reporting.ReportParameter reportParameter3 = new Telerik.Reporting.ReportParameter();
            Telerik.Reporting.Drawing.StyleRule styleRule1 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule2 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule3 = new Telerik.Reporting.Drawing.StyleRule();
            Telerik.Reporting.Drawing.StyleRule styleRule4 = new Telerik.Reporting.Drawing.StyleRule();
            this.labelsGroupFooterSection = new Telerik.Reporting.GroupFooterSection();
            this.labelsGroupHeaderSection = new Telerik.Reporting.GroupHeaderSection();
            this.groupFooterSection = new Telerik.Reporting.GroupFooterSection();
            this.groupHeaderSection = new Telerik.Reporting.GroupHeaderSection();
            this.odsPlanTypes = new Telerik.Reporting.ObjectDataSource();
            this.sqlDataSource2 = new Telerik.Reporting.SqlDataSource();
            this.pageHeader = new Telerik.Reporting.PageHeaderSection();
            this.pageFooter = new Telerik.Reporting.PageFooterSection();
            this.currentTimeTextBox = new Telerik.Reporting.TextBox();
            this.reportHeader = new Telerik.Reporting.ReportHeaderSection();
            this.titleTextBox = new Telerik.Reporting.TextBox();
            this.reportFooter = new Telerik.Reporting.ReportFooterSection();
            this.detail = new Telerik.Reporting.DetailSection();
            this.graph1 = new Telerik.Reporting.Graph();
            this.cartesianCoordinateSystem1 = new Telerik.Reporting.CartesianCoordinateSystem();
            this.graphAxis5 = new Telerik.Reporting.GraphAxis();
            this.graphAxis2 = new Telerik.Reporting.GraphAxis();
            this.odsInvoiceChart = new Telerik.Reporting.ObjectDataSource();
            this.barSeries1 = new Telerik.Reporting.BarSeries();
            this.graph2 = new Telerik.Reporting.Graph();
            this.cartesianCoordinateSystem2 = new Telerik.Reporting.CartesianCoordinateSystem();
            this.graphAxis6 = new Telerik.Reporting.GraphAxis();
            this.graphAxis7 = new Telerik.Reporting.GraphAxis();
            this.objectDataSource1 = new Telerik.Reporting.ObjectDataSource();
            this.barSeries2 = new Telerik.Reporting.BarSeries();
            this.graphAxis1 = new Telerik.Reporting.GraphAxis();
            this.graphAxis3 = new Telerik.Reporting.GraphAxis();
            this.graphAxis4 = new Telerik.Reporting.GraphAxis();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // labelsGroupFooterSection
            // 
            this.labelsGroupFooterSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0D);
            this.labelsGroupFooterSection.Name = "labelsGroupFooterSection";
            this.labelsGroupFooterSection.Style.Visible = false;
            // 
            // labelsGroupHeaderSection
            // 
            this.labelsGroupHeaderSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0D);
            this.labelsGroupHeaderSection.Name = "labelsGroupHeaderSection";
            this.labelsGroupHeaderSection.PrintOnEveryPage = true;
            // 
            // groupFooterSection
            // 
            this.groupFooterSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0D);
            this.groupFooterSection.Name = "groupFooterSection";
            // 
            // groupHeaderSection
            // 
            this.groupHeaderSection.Height = Telerik.Reporting.Drawing.Unit.Inch(0D);
            this.groupHeaderSection.Name = "groupHeaderSection";
            // 
            // odsPlanTypes
            // 
            this.odsPlanTypes.DataMember = "GetPlanTypesWithDefault";
            this.odsPlanTypes.DataSource = typeof(Pibt.BLL.Plan);
            this.odsPlanTypes.Name = "odsPlanTypes";
            // 
            // sqlDataSource2
            // 
            this.sqlDataSource2.ConnectionString = "MaximumASPSqlServer";
            this.sqlDataSource2.Name = "sqlDataSource2";
            this.sqlDataSource2.SelectCommand = "dbo.Web_Months";
            this.sqlDataSource2.SelectCommandType = Telerik.Reporting.SqlDataSourceCommandType.StoredProcedure;
            // 
            // pageHeader
            // 
            this.pageHeader.Height = Telerik.Reporting.Drawing.Unit.Inch(0D);
            this.pageHeader.Name = "pageHeader";
            // 
            // pageFooter
            // 
            this.pageFooter.Height = Telerik.Reporting.Drawing.Unit.Inch(0.44166669249534607D);
            this.pageFooter.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.currentTimeTextBox});
            this.pageFooter.Name = "pageFooter";
            // 
            // currentTimeTextBox
            // 
            this.currentTimeTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D), Telerik.Reporting.Drawing.Unit.Inch(0.02083333395421505D));
            this.currentTimeTextBox.Name = "currentTimeTextBox";
            this.currentTimeTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(3.1979167461395264D), Telerik.Reporting.Drawing.Unit.Inch(0.40000000596046448D));
            this.currentTimeTextBox.StyleName = "PageInfo";
            this.currentTimeTextBox.Value = "=NOW()";
            // 
            // reportHeader
            // 
            this.reportHeader.Height = Telerik.Reporting.Drawing.Unit.Inch(0.35833334922790527D);
            this.reportHeader.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.titleTextBox});
            this.reportHeader.Name = "reportHeader";
            // 
            // titleTextBox
            // 
            this.titleTextBox.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0D), Telerik.Reporting.Drawing.Unit.Inch(0D));
            this.titleTextBox.Name = "titleTextBox";
            this.titleTextBox.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(8.1999607086181641D), Telerik.Reporting.Drawing.Unit.Inch(0.35833334922790527D));
            this.titleTextBox.StyleName = "Title";
            this.titleTextBox.Value = "Invoice Report Chart";
            // 
            // reportFooter
            // 
            this.reportFooter.Height = Telerik.Reporting.Drawing.Unit.Inch(0D);
            this.reportFooter.Name = "reportFooter";
            // 
            // detail
            // 
            this.detail.Height = Telerik.Reporting.Drawing.Unit.Inch(6.7416667938232422D);
            this.detail.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.graph1,
            this.graph2});
            this.detail.Name = "detail";
            // 
            // graph1
            // 
            graphGroup1.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.INVOICEDATE"));
            graphGroup1.Name = "graphGroupDate";
            graphGroup1.Sortings.Add(new Telerik.Reporting.Sorting("=Fields.INVOICEDATE", Telerik.Reporting.SortDirection.Asc));
            this.graph1.CategoryGroups.Add(graphGroup1);
            colorPalette1.Colors.Add(System.Drawing.Color.DodgerBlue);
            colorPalette1.Colors.Add(System.Drawing.Color.DarkCyan);
            colorPalette1.Colors.Add(System.Drawing.Color.DarkGoldenrod);
            colorPalette1.Colors.Add(System.Drawing.Color.DarkGray);
            colorPalette1.Colors.Add(System.Drawing.Color.DarkGreen);
            colorPalette1.Colors.Add(System.Drawing.Color.DarkKhaki);
            colorPalette1.Colors.Add(System.Drawing.Color.DarkMagenta);
            colorPalette1.Colors.Add(System.Drawing.Color.DarkOliveGreen);
            colorPalette1.Colors.Add(System.Drawing.Color.DarkOrange);
            colorPalette1.Colors.Add(System.Drawing.Color.DarkOrchid);
            colorPalette1.Colors.Add(System.Drawing.Color.DarkRed);
            this.graph1.ColorPalette = colorPalette1;
            this.graph1.CoordinateSystems.Add(this.cartesianCoordinateSystem1);
            this.graph1.DataSource = this.odsInvoiceChart;
            this.graph1.Legend.Style.LineColor = System.Drawing.Color.LightGray;
            this.graph1.Legend.Style.LineWidth = Telerik.Reporting.Drawing.Unit.Inch(0D);
            this.graph1.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.099999986588954926D), Telerik.Reporting.Drawing.Unit.Inch(0.14166665077209473D));
            this.graph1.Name = "graph1";
            this.graph1.PlotAreaStyle.LineColor = System.Drawing.Color.LightGray;
            this.graph1.PlotAreaStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Inch(0D);
            this.graph1.Series.Add(this.barSeries1);
            graphGroup4.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.PTYPENAME"));
            graphGroup4.Name = "graphGroupPlanType";
            graphGroup4.Sortings.Add(new Telerik.Reporting.Sorting("=Fields.PTYPENAME", Telerik.Reporting.SortDirection.Asc));
            this.graph1.SeriesGroups.Add(graphGroup4);
            this.graph1.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(8D), Telerik.Reporting.Drawing.Unit.Inch(3.2020835876464844D));
            graphTitle1.Style.LineColor = System.Drawing.Color.LightGray;
            graphTitle1.Style.LineWidth = Telerik.Reporting.Drawing.Unit.Inch(0D);
            graphTitle1.Text = "";
            this.graph1.Titles.Add(graphTitle1);
            // 
            // cartesianCoordinateSystem1
            // 
            this.cartesianCoordinateSystem1.Name = "cartesianCoordinateSystem1";
            this.cartesianCoordinateSystem1.XAxis = this.graphAxis5;
            this.cartesianCoordinateSystem1.YAxis = this.graphAxis2;
            // 
            // graphAxis5
            // 
            this.graphAxis5.LabelAngle = -35;
            this.graphAxis5.MajorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis5.MajorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis5.MinorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis5.MinorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis5.MinorGridLineStyle.Visible = false;
            this.graphAxis5.Name = "GraphAxis3";
            this.graphAxis5.Scale = categoryScale1;
            this.graphAxis5.Title = "Date Range";
            // 
            // graphAxis2
            // 
            this.graphAxis2.LabelFormat = "{0:C0}K";
            this.graphAxis2.MajorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis2.MajorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis2.MinorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis2.MinorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis2.MinorGridLineStyle.Visible = false;
            this.graphAxis2.Name = "GraphAxis2";
            this.graphAxis2.Scale = numericalScale1;
            this.graphAxis2.Title = "Amount";
            // 
            // odsInvoiceChart
            // 
            this.odsInvoiceChart.DataMember = "GetInvoiceChart";
            this.odsInvoiceChart.DataSource = typeof(Pibt.BLL.Invoice);
            this.odsInvoiceChart.Name = "odsInvoiceChart";
            this.odsInvoiceChart.Parameters.AddRange(new Telerik.Reporting.ObjectDataSourceParameter[] {
            new Telerik.Reporting.ObjectDataSourceParameter("employerId", typeof(string), "=Parameters.EmployerId.Value"),
            new Telerik.Reporting.ObjectDataSourceParameter("planTypeId", typeof(string), "=Parameters.PlanTypeId.Value"),
            new Telerik.Reporting.ObjectDataSourceParameter("months", typeof(string), "=Parameters.Months.Value")});
            // 
            // barSeries1
            // 
            graphGroup2.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.INVOICEDATE"));
            graphGroup2.Name = "graphGroupDate";
            graphGroup2.Sortings.Add(new Telerik.Reporting.Sorting("=Fields.INVOICEDATE", Telerik.Reporting.SortDirection.Asc));
            this.barSeries1.CategoryGroup = graphGroup2;
            colorPalette2.Colors.Add(System.Drawing.Color.DarkBlue);
            colorPalette2.Colors.Add(System.Drawing.Color.DarkCyan);
            colorPalette2.Colors.Add(System.Drawing.Color.DarkGoldenrod);
            colorPalette2.Colors.Add(System.Drawing.Color.DarkGray);
            colorPalette2.Colors.Add(System.Drawing.Color.DarkGreen);
            colorPalette2.Colors.Add(System.Drawing.Color.DarkKhaki);
            colorPalette2.Colors.Add(System.Drawing.Color.DarkMagenta);
            colorPalette2.Colors.Add(System.Drawing.Color.DarkOliveGreen);
            colorPalette2.Colors.Add(System.Drawing.Color.DarkOrange);
            colorPalette2.Colors.Add(System.Drawing.Color.DarkOrchid);
            colorPalette2.Colors.Add(System.Drawing.Color.DarkRed);
            this.barSeries1.ColorPalette = colorPalette2;
            this.barSeries1.CoordinateSystem = this.cartesianCoordinateSystem1;
            this.barSeries1.DataPointLabel = "= Sum(Fields.AMOUNT)/1000";
            this.barSeries1.DataPointLabelFormat = "{0:f2}";
            this.barSeries1.Legend = "= Fields.PTYPENAME";
            this.barSeries1.LegendFormat = "";
            graphGroup3.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.PTYPENAME"));
            graphGroup3.Name = "graphGroupPlanType";
            graphGroup3.Sortings.Add(new Telerik.Reporting.Sorting("=Fields.PTYPENAME", Telerik.Reporting.SortDirection.Asc));
            this.barSeries1.SeriesGroup = graphGroup3;
            this.barSeries1.Y = "= Sum(Fields.AMOUNT)/1000+100";
            // 
            // graph2
            // 
            graphGroup5.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.INVOICEDATE"));
            graphGroup5.Name = "graphGroupDate";
            graphGroup5.Sortings.Add(new Telerik.Reporting.Sorting("=Fields.INVOICEDATE", Telerik.Reporting.SortDirection.Asc));
            this.graph2.CategoryGroups.Add(graphGroup5);
            colorPalette3.Colors.Add(System.Drawing.Color.DodgerBlue);
            colorPalette3.Colors.Add(System.Drawing.Color.DarkCyan);
            colorPalette3.Colors.Add(System.Drawing.Color.DarkGoldenrod);
            colorPalette3.Colors.Add(System.Drawing.Color.DarkGray);
            colorPalette3.Colors.Add(System.Drawing.Color.DarkGreen);
            colorPalette3.Colors.Add(System.Drawing.Color.DarkKhaki);
            colorPalette3.Colors.Add(System.Drawing.Color.DarkMagenta);
            colorPalette3.Colors.Add(System.Drawing.Color.DarkOliveGreen);
            colorPalette3.Colors.Add(System.Drawing.Color.DarkOrange);
            colorPalette3.Colors.Add(System.Drawing.Color.DarkOrchid);
            colorPalette3.Colors.Add(System.Drawing.Color.DarkRed);
            this.graph2.ColorPalette = colorPalette3;
            this.graph2.CoordinateSystems.Add(this.cartesianCoordinateSystem2);
            this.graph2.DataSource = this.objectDataSource1;
            this.graph2.Legend.Style.LineColor = System.Drawing.Color.LightGray;
            this.graph2.Legend.Style.LineWidth = Telerik.Reporting.Drawing.Unit.Inch(0D);
            this.graph2.Location = new Telerik.Reporting.Drawing.PointU(Telerik.Reporting.Drawing.Unit.Inch(0.09375D), Telerik.Reporting.Drawing.Unit.Inch(3.441666841506958D));
            this.graph2.Name = "graph2";
            this.graph2.PlotAreaStyle.LineColor = System.Drawing.Color.LightGray;
            this.graph2.PlotAreaStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Inch(0D);
            this.graph2.Series.Add(this.barSeries2);
            graphGroup8.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.PTYPENAME"));
            graphGroup8.Name = "graphGroupPlanType";
            graphGroup8.Sortings.Add(new Telerik.Reporting.Sorting("=Fields.PTYPENAME", Telerik.Reporting.SortDirection.Asc));
            this.graph2.SeriesGroups.Add(graphGroup8);
            this.graph2.Size = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(8D), Telerik.Reporting.Drawing.Unit.Inch(3.2020835876464844D));
            graphTitle2.Style.LineColor = System.Drawing.Color.LightGray;
            graphTitle2.Style.LineWidth = Telerik.Reporting.Drawing.Unit.Inch(0D);
            graphTitle2.Text = "";
            this.graph2.Titles.Add(graphTitle2);
            // 
            // cartesianCoordinateSystem2
            // 
            this.cartesianCoordinateSystem2.Name = "cartesianCoordinateSystem1";
            this.cartesianCoordinateSystem2.XAxis = this.graphAxis6;
            this.cartesianCoordinateSystem2.YAxis = this.graphAxis7;
            // 
            // graphAxis6
            // 
            this.graphAxis6.LabelAngle = -35;
            this.graphAxis6.MajorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis6.MajorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis6.MinorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis6.MinorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis6.MinorGridLineStyle.Visible = false;
            this.graphAxis6.Name = "GraphAxis3";
            this.graphAxis6.Scale = categoryScale2;
            this.graphAxis6.Title = "Date Range";
            // 
            // graphAxis7
            // 
            this.graphAxis7.LabelFormat = "";
            this.graphAxis7.MajorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis7.MajorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis7.MinorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis7.MinorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis7.MinorGridLineStyle.Visible = false;
            this.graphAxis7.Name = "GraphAxis2";
            this.graphAxis7.Scale = numericalScale2;
            this.graphAxis7.Title = "Employee";
            // 
            // objectDataSource1
            // 
            this.objectDataSource1.DataMember = "GetInvoiceChart";
            this.objectDataSource1.DataSource = typeof(Pibt.BLL.Invoice);
            this.objectDataSource1.Name = "objectDataSource1";
            this.objectDataSource1.Parameters.AddRange(new Telerik.Reporting.ObjectDataSourceParameter[] {
            new Telerik.Reporting.ObjectDataSourceParameter("employerId", typeof(string), "=Parameters.EmployerId.Value"),
            new Telerik.Reporting.ObjectDataSourceParameter("planTypeId", typeof(string), "=Parameters.PlanTypeId.Value"),
            new Telerik.Reporting.ObjectDataSourceParameter("months", typeof(string), "=Parameters.Months.Value")});
            // 
            // barSeries2
            // 
            graphGroup6.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.INVOICEDATE"));
            graphGroup6.Name = "graphGroupDate";
            graphGroup6.Sortings.Add(new Telerik.Reporting.Sorting("=Fields.INVOICEDATE", Telerik.Reporting.SortDirection.Asc));
            this.barSeries2.CategoryGroup = graphGroup6;
            colorPalette4.Colors.Add(System.Drawing.Color.DarkBlue);
            colorPalette4.Colors.Add(System.Drawing.Color.DarkCyan);
            colorPalette4.Colors.Add(System.Drawing.Color.DarkGoldenrod);
            colorPalette4.Colors.Add(System.Drawing.Color.DarkGray);
            colorPalette4.Colors.Add(System.Drawing.Color.DarkGreen);
            colorPalette4.Colors.Add(System.Drawing.Color.DarkKhaki);
            colorPalette4.Colors.Add(System.Drawing.Color.DarkMagenta);
            colorPalette4.Colors.Add(System.Drawing.Color.DarkOliveGreen);
            colorPalette4.Colors.Add(System.Drawing.Color.DarkOrange);
            colorPalette4.Colors.Add(System.Drawing.Color.DarkOrchid);
            colorPalette4.Colors.Add(System.Drawing.Color.DarkRed);
            this.barSeries2.ColorPalette = colorPalette4;
            this.barSeries2.CoordinateSystem = this.cartesianCoordinateSystem2;
            this.barSeries2.DataPointLabel = "= Count(Fields.EmployeeId)";
            this.barSeries2.DataPointLabelFormat = "{0}";
            this.barSeries2.Legend = "= Fields.PTYPENAME";
            this.barSeries2.LegendFormat = "";
            graphGroup7.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.PTYPENAME"));
            graphGroup7.Name = "graphGroupPlanType";
            graphGroup7.Sortings.Add(new Telerik.Reporting.Sorting("=Fields.PTYPENAME", Telerik.Reporting.SortDirection.Asc));
            this.barSeries2.SeriesGroup = graphGroup7;
            this.barSeries2.Y = "=  Count(Fields.EmployeeId)";
            // 
            // graphAxis1
            // 
            this.graphAxis1.MajorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis1.MajorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis1.MinorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis1.MinorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis1.MinorGridLineStyle.Visible = false;
            this.graphAxis1.Name = "GraphAxis1";
            this.graphAxis1.Scale = dateTimeScale1;
            // 
            // graphAxis3
            // 
            this.graphAxis3.LabelAngle = -90;
            this.graphAxis3.LabelFormat = "{0:Y}";
            this.graphAxis3.MajorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis3.MajorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis3.MinorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis3.MinorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis3.MinorGridLineStyle.Visible = false;
            this.graphAxis3.Name = "GraphAxis3";
            this.graphAxis3.Scale = categoryScale3;
            this.graphAxis3.Title = "";
            this.graphAxis3.TitlePlacement = Telerik.Reporting.GraphAxisTitlePlacement.None;
            // 
            // graphAxis4
            // 
            this.graphAxis4.LabelFormat = "{0:Y}";
            this.graphAxis4.MajorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis4.MajorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis4.MinorGridLineStyle.LineColor = System.Drawing.Color.LightGray;
            this.graphAxis4.MinorGridLineStyle.LineWidth = Telerik.Reporting.Drawing.Unit.Pixel(1D);
            this.graphAxis4.MinorGridLineStyle.Visible = false;
            this.graphAxis4.Name = "GraphAxis1";
            this.graphAxis4.Scale = dateTimeScale2;
            // 
            // InvoiceReportChart
            // 
            group1.GroupFooter = this.labelsGroupFooterSection;
            group1.GroupHeader = this.labelsGroupHeaderSection;
            group1.Name = "labelsGroup";
            group2.GroupFooter = this.groupFooterSection;
            group2.GroupHeader = this.groupHeaderSection;
            group2.Name = "group";
            this.Groups.AddRange(new Telerik.Reporting.Group[] {
            group1,
            group2});
            this.Items.AddRange(new Telerik.Reporting.ReportItemBase[] {
            this.labelsGroupHeaderSection,
            this.labelsGroupFooterSection,
            this.groupHeaderSection,
            this.groupFooterSection,
            this.pageHeader,
            this.pageFooter,
            this.reportHeader,
            this.reportFooter,
            this.detail});
            this.Name = "InvoiceReportChart";
            this.PageSettings.Margins = new Telerik.Reporting.Drawing.MarginsU(Telerik.Reporting.Drawing.Unit.Inch(0.10000000149011612D), Telerik.Reporting.Drawing.Unit.Inch(0.10000000149011612D), Telerik.Reporting.Drawing.Unit.Inch(0.10000000149011612D), Telerik.Reporting.Drawing.Unit.Inch(0.10000000149011612D));
            this.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.Custom;
            this.PageSettings.PaperSize = new Telerik.Reporting.Drawing.SizeU(Telerik.Reporting.Drawing.Unit.Inch(8.5D), Telerik.Reporting.Drawing.Unit.Inch(11D));
            reportParameter1.Name = "EmployerId";
            reportParameter2.AutoRefresh = true;
            reportParameter2.AvailableValues.DataSource = this.odsPlanTypes;
            reportParameter2.AvailableValues.DisplayMember = "Description";
            reportParameter2.AvailableValues.Sortings.Add(new Telerik.Reporting.Sorting("SORTSEQ", Telerik.Reporting.SortDirection.Asc));
            reportParameter2.AvailableValues.ValueMember = "Plantypeid";
            reportParameter2.Name = "PlanTypeId";
            reportParameter2.Text = "PlanType";
            reportParameter2.Value = "0";
            reportParameter2.Visible = true;
            reportParameter3.AutoRefresh = true;
            reportParameter3.AvailableValues.DataSource = this.sqlDataSource2;
            reportParameter3.AvailableValues.DisplayMember = "months";
            reportParameter3.AvailableValues.ValueMember = "months";
            reportParameter3.Name = "Months";
            reportParameter3.Text = "In months";
            reportParameter3.Value = "6";
            reportParameter3.Visible = true;
            this.ReportParameters.Add(reportParameter1);
            this.ReportParameters.Add(reportParameter2);
            this.ReportParameters.Add(reportParameter3);
            this.Style.BackgroundColor = System.Drawing.Color.White;
            styleRule1.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Title")});
            styleRule1.Style.Color = System.Drawing.Color.Black;
            styleRule1.Style.Font.Bold = true;
            styleRule1.Style.Font.Italic = false;
            styleRule1.Style.Font.Name = "Tahoma";
            styleRule1.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(18D);
            styleRule1.Style.Font.Strikeout = false;
            styleRule1.Style.Font.Underline = false;
            styleRule2.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Caption")});
            styleRule2.Style.Color = System.Drawing.Color.Black;
            styleRule2.Style.Font.Name = "Tahoma";
            styleRule2.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(10D);
            styleRule2.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            styleRule3.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("Data")});
            styleRule3.Style.Font.Name = "Tahoma";
            styleRule3.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(9D);
            styleRule3.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            styleRule4.Selectors.AddRange(new Telerik.Reporting.Drawing.ISelector[] {
            new Telerik.Reporting.Drawing.StyleSelector("PageInfo")});
            styleRule4.Style.Font.Name = "Tahoma";
            styleRule4.Style.Font.Size = Telerik.Reporting.Drawing.Unit.Point(8D);
            styleRule4.Style.VerticalAlign = Telerik.Reporting.Drawing.VerticalAlign.Middle;
            this.StyleSheet.AddRange(new Telerik.Reporting.Drawing.StyleRule[] {
            styleRule1,
            styleRule2,
            styleRule3,
            styleRule4});
            this.Width = Telerik.Reporting.Drawing.Unit.Inch(8.1999998092651367D);
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }
        #endregion

        private Telerik.Reporting.GroupHeaderSection labelsGroupHeaderSection;
        private Telerik.Reporting.GroupFooterSection labelsGroupFooterSection;
        private Telerik.Reporting.PageHeaderSection pageHeader;
        private Telerik.Reporting.PageFooterSection pageFooter;
        private Telerik.Reporting.TextBox currentTimeTextBox;
        private Telerik.Reporting.ReportHeaderSection reportHeader;
        private Telerik.Reporting.ReportFooterSection reportFooter;
        private Telerik.Reporting.DetailSection detail;
        private Telerik.Reporting.Graph graph1;
        private Telerik.Reporting.GroupHeaderSection groupHeaderSection;
        private Telerik.Reporting.GroupFooterSection groupFooterSection;
        private Telerik.Reporting.CartesianCoordinateSystem cartesianCoordinateSystem1;
        private Telerik.Reporting.GraphAxis graphAxis1;
        private Telerik.Reporting.GraphAxis graphAxis2;
        private Telerik.Reporting.BarSeries barSeries1;
        private Telerik.Reporting.GraphAxis graphAxis3;
        private Telerik.Reporting.TextBox titleTextBox;
        private Telerik.Reporting.GraphAxis graphAxis5;
        private Telerik.Reporting.GraphAxis graphAxis4;
        private Telerik.Reporting.SqlDataSource sqlDataSource2;
        private Telerik.Reporting.ObjectDataSource odsInvoiceChart;
        private Telerik.Reporting.ObjectDataSource odsPlanTypes;
        private Telerik.Reporting.Graph graph2;
        private Telerik.Reporting.CartesianCoordinateSystem cartesianCoordinateSystem2;
        private Telerik.Reporting.GraphAxis graphAxis6;
        private Telerik.Reporting.GraphAxis graphAxis7;
        private Telerik.Reporting.ObjectDataSource objectDataSource1;
        private Telerik.Reporting.BarSeries barSeries2;

    }
}