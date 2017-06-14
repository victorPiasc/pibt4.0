<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="Maintenance.aspx.cs" Inherits="Pibt.Admin.Maintenance" %>

<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Maintenance
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
    &nbsp;>&nbsp;<span>Maintenance</span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a>&nbsp;>&nbsp;Maintenance
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="customer-info-box">
        <div class="section-body">
            <center>
                <asp:Button ID="btnCloseSite" CssClass="btn" runat="server" Text="Disable logins" OnClick="btnCloseSite_Click" />
            </center>
        </div>
    </div>
</asp:Content>
