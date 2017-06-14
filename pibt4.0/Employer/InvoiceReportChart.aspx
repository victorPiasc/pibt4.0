<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeBehind="InvoiceReportChart.aspx.cs" Inherits="Pibt.Employer.InvoiceReportChart" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc10" %>



<%@ Register Assembly="Telerik.ReportViewer.WebForms, Version=8.0.14.225, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" Namespace="Telerik.ReportViewer.WebForms" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
 Report Chart
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc10:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
 <input type="button" class="ImgHome" value=" " />
        <u><a href="/">Home</a></u>
        &gt; Report Chart
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <telerik:ReportViewer ID="ReportViewer1" runat="server"  Height="900" ToolbarVisible="false"  ParametersAreaVisible="true" 
    Width="100%" OnLoad="ReportViewer1_Load" >
<typereportsource 
        typename="Pibt.Reporting.InvoiceReportChart, Pibt, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null"></typereportsource>
</telerik:ReportViewer>
</asp:Content>
