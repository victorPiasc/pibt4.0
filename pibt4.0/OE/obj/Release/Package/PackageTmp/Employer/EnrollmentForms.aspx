<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="EnrollmentForms.aspx.cs" Inherits="Pibt.Employer.EnrollmentForms" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<%@ Register src="../UserControl/CtlEnrollmentHistoryList.ascx" tagname="CtlEnrollmentHistoryList" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
  <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> / Enrollment Forms
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
   
    <uc3:CtlEnrollmentHistoryList ID="CtlEnrollmentHistoryList1"  runat="server" />
   
</asp:Content>
