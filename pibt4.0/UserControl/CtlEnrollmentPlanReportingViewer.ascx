<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEnrollmentPlanReportingViewer.ascx.cs"
    Inherits="Pibt.UserControl.CtlEnrollmentPlanReportingViewer" %>








<%@ Register Assembly="Telerik.ReportViewer.WebForms" Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>
<telerik:ReportViewer ID="ReportViewer1" ShowHistoryButtons="False" runat="server"
    ToolbarVisible="false" ShowParametersButton="false" ShowNavigationGroup="False"
    Width="100%" Height="800px" OnLoad="ReportViewer1_Load" ParametersAreaVisible="False"
    BorderStyle="Solid" BorderWidth="1px" ShowPrintPreviewButton="False">
<typereportsource 
        typename="Pibt.Reporting.EnrollmentFormPreview, Pibt, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null">
        </typereportsource>
</telerik:ReportViewer>
<script>
    var viewer = <%=ReportViewer1.ClientID%>;
    function exportPdf(){
        if(viewer!=null){
            viewer.ExportReport("pdf");
        }
    }
</script>
