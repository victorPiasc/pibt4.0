﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="EnrollmentForms.aspx.cs" Inherits="Pibt.Employer.EnrollmentForms" %>
<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenuLevel2" TagPrefix="uc1" %>
<%@ Register src="../UserControl/CtlEnrollmentHistoryList.ascx" tagname="CtlEnrollmentHistoryList" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenuLevel2 ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <a href="/">Home</a> / Enrollment Forms
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc3:CtlEnrollmentHistoryList ID="CtlEnrollmentHistoryList1"  runat="server" />
</asp:Content>
