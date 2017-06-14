<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeBehind="AgentLookup.aspx.cs" Inherits="Pibt.Admin.AgentLookup" %>
<%@ Register src="../UserControl/CtlAgentLookup.ascx" tagname="CtlAgentLookup" tagprefix="uc1" %>
<%@ Register src="../UserControl/CtlLeftMenu.ascx" tagname="CtlLeftMenu" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc2:CtlLeftMenu ID="CtlLeftMenu2" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
<input type="image" src="/images/blank.png" class="ImgHome" />
<a href="/">Home</a> > Reports
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlAgentLookup ID="CtlAgentLookup1" runat="server" />
</asp:Content>
