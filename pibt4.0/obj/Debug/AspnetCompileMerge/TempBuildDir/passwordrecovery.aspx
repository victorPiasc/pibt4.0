<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.Master" AutoEventWireup="true" CodeBehind="passwordrecovery.aspx.cs" Inherits="Pibt.passwordrecovery" %>

<%@ Register Src="~/UserControl/CtlPasswordRecovery.ascx" TagPrefix="uc1" TagName="CtlPasswordRecovery" %>
<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Register
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
    &gt;<span>Password Recovery  </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
          <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
    <div class="titleRight">
        <div class="titleLeft clear">
            <h1>
            <input type="button" class="ImgHome" value=" " />
                <a href="/">Home</a>&nbsp;>&nbsp;Forgot your Password?           
            </h1>
        </div>
    </div>
    <table summary="content table" cellpadding="0" cellspacing="0">
    </table>
        <h2>
            <uc1:CtlPasswordRecovery ID="CtlPasswordRecovery1" runat="server" /></h2>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PlaceHolderRightSide" runat="server">
</asp:Content>

