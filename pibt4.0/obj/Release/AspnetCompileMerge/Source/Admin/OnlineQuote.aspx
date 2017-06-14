<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Content.master" CodeBehind="OnlineQuote.aspx.cs" Inherits="Pibt.Admin.OnlineQuote" %>
<%@ Register Src="~/UserControl/CtlOQGrid.ascx" TagName="CtlOQGrid" TagPrefix="uc2" %>
<%@ Register Src="~/UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Online Quote
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> > Online Quote
</asp:Content>
<asp:Content ID="LeftMenuContent" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc2:CtlOQGrid ID="CtlOQGrid1" Role="Administrator" runat="server"></uc2:CtlOQGrid>
</asp:Content>