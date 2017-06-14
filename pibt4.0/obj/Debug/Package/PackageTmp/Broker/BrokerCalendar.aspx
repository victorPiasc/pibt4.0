<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BrokerCalendar.aspx.cs" Inherits="Pibt.Broker.BrokerCalendar" MasterPageFile="~/Content.master" %>

<%@ Register Src="/UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<%@ Register Src="/UserControl/CtlCalendar.ascx" TagName="page1" TagPrefix="p1" %>
<asp:Content ID="header" runat="server" ContentPlaceHolderID="FrameHeaderPlaceHolder">
    Calendar
</asp:Content>
<asp:Content ID="menu" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlMenu" runat="server" />
</asp:Content>
<asp:Content ID="main" runat="server" ContentPlaceHolderID="MainContentPlaceHolder">
    <p1:page1 id="page1" runat="server"></p1:page1>
</asp:Content>