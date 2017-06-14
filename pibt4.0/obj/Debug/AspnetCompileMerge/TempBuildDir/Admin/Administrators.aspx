<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="Administrators.aspx.cs" Inherits="Pibt.Admin.Administrators" %>

<%@ Register Src="../UserControl/CtlAdministrators.ascx" TagName="CtlAdministrators"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="ContentPageTitle" runat="server" ContentPlaceHolderID="PlaceHolderPageTitle">
Administrator
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> > Administrators
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
        <uc1:CtlAdministrators ID="CtlAdministrators1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
