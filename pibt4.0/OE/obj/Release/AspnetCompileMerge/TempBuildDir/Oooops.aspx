<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.master" AutoEventWireup="true"
    CodeBehind="Oooops.aspx.cs" Inherits="Pibt.Oooops" %>

<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Ooooops ! : Something Wrong !
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
&gt; <span>Error</span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
    <div class="titleRight">
        <div class="titleLeft clear">
            <h1>
                <input type="button" class="ImgWarning" value=" " />
                <a href="">Home</a> / Oooops !
            </h1>
        </div>
    </div>
    <!-- content start -->
    <h1>
        Something is wrong here !</h1>
    <fieldset>
       
        <div class="customer-info-box">
            <div class="section-body">
                <ul class="login-page" style="width: auto;">
                    <li>You are logged out ! Please, Click here
                        <asp:LoginStatus ID="LoginStatus1" LoginText="Login" CssClass="link" LogoutText="Login"
                            runat="server" LogoutAction="Redirect" LogoutPageUrl="~/Login.aspx" />
                        again ! </li>
                    <li>Your current "<span style="color: red; font-weight: bold;">session</span>"time may
                        be out. Please ! Click here
                        <asp:LoginStatus ID="LoginStatus2" LoginText="Login" CssClass="link" LogoutText="Login"
                            runat="server" LogoutAction="Redirect" LogoutPageUrl="~/Login.aspx" />
                        again ! </li>
                    <li>Or check the Web address you entered to make sure if it's correct.</li>
                    <li>Or try to access the page directly from the Home page, instead of using a bookmark.</li>
                    <li>If the page has moved, reset your bookmark.</li>
                    <li>Report this technical issue to webMaster@piasc.org
                    </li></ul>
                <br />
                <span style="font-weight: bold; font-size: 12px; color: red; text-indent: 20px; font-style: italic;">
                    Sorry for any inconvenience this may have caused you, please contact your relationshop
                    keeper for any questions.</span>
            </div>
        </div>
    </fieldset>
    <!-- content end -->
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
