<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.master" AutoEventWireup="true"
    CodeBehind="Oooops.aspx.cs" Inherits="Pibt.Oooops" %>

<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Ooooops! Something Went Wrong!
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
    <div class="titleRight">
        <div class="titleLeft clear">
            <h1>
                <input type="button" class="ImgWarning" value=" " />
                <a href="/index.aspx">Home</a> / Oooops!
            </h1>
        </div>
    </div>
    <h1>Something is wrong here!</h1>
    <div class="customer-info-box">
        <div class="section-body">
            <ul class="login-page" style="width: auto;">
                <li>You may be logged out or your current session time may be out. If so, please click <a href="/Login.aspx"><u>here</u></a> to log in again.</li>
                <li>You may have entered an invalid web-page address or used an invalid bookmark. Please access the page from our
                    <a href="/index.aspx"><u>Home page</u></a> instead.</li>
                <li>If you believe you've been redirected to this page in error, please report this technical issue to
                    <a href="mailto:OnlineHelpDesk@piasc.org"><u>our webmaster</u></a>.</li>
            </ul>
            <br />
            <span style="font-weight: bold; font-size: 12px; color: red; text-indent: 20px; font-style: italic;">
                Sorry for any inconvenience this may have caused you. Please contact your relationship keeper with any questions.</span>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
</asp:Content>
