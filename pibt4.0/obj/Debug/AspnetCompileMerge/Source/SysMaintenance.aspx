<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.Master" AutoEventWireup="true"
    CodeBehind="SysMaintenance.aspx.cs" Inherits="Pibt.SysMaintenance" %>

<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PlaceHolderPageTitle">
    System Maintenance
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
    <div class="titleRight">
        <div class="titleLeft clear">
            <h1>
                <input type="button" class="ImgMaintenance" value=" " />
                System Maintenance
            </h1>
        </div>
    </div>
    <center>
        <img src="/images/maintenance.png" />
        <h1>
            <div>
                This Site is currently in maintenance mode.</div>
            <div>
                Please check back here later.</div>
        </h1>
    </center>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PlaceHolderBreadcrumbs">
    &gt;<span>System Maintenance</span>
</asp:Content>
