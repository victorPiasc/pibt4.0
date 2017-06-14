<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.master" AutoEventWireup="true" CodeBehind="UhOh.aspx.cs" Inherits="Pibt.UhOh" %>
<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Uh Oh! Something Went Wrong!
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
&gt; <span>Error</span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
    <div class="titleRight">
        <div class="titleLeft clear">
            <h1>
                <input type="button" class="ImgWarning" value=" " />
                <a href="">Home</a> / UhOh!
            </h1>
        </div>
    </div>
    <h1>Something is wrong here!</h1>
    <fieldset>
        <div class="customer-info-box">
            <div class="section-body">
                Landing on this page generally means that something went wrong in our internal processing. Please:
                <ul class="login-page" style="width: auto;">
                    <li>Report the steps that got you here to <a href="mailto:OnlineHelpDesk@piasc.org"><u>our webmaster</u></a>, and</li>
                    <li>Use your browser's Back button to get you back where you were.</li>
                </ul>
                <br />
                <span style="font-weight: bold; font-size: 12px; color: red; text-indent: 20px; font-style: italic;">
                    Sorry for any inconvenience this may have caused you. Please contact your relationship
                    keeper with any questions.</span>
            </div>
        </div>
    </fieldset>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
