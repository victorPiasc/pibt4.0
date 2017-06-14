<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="EmployeeInfo.aspx.cs" Inherits="Pibt.OE.EmployeeInfo" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlEmployeeDetails.ascx" TagName="CtlEmployeeDetails"
    TagPrefix="uc2" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> / Enroller Form / Employee Details
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <br />
    <uc2:CtlEmployeeDetails ID="CtlEmployeeDetails1" runat="server" />
    <div class="bottom-center-buttons">

    </div>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc3:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
