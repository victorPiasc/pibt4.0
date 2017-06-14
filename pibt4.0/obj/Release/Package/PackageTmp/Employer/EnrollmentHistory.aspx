<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="EnrollmentHistory.aspx.cs" Inherits="Pibt.Employer.EnrollmentHistory" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc1" %>
<%@ Register src="../UserControl/CtlEnrollmentHistoryList.ascx" tagname="CtlEnrollmentHistoryList" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a>&nbsp;>&nbsp;Enrollment History
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc2:CtlEnrollmentHistoryList ID="CtlEnrollmentHistoryList1" Role="Employee" runat="server" />
</asp:Content>
