<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Pibt.Logout" %>
<%@ Register src="UserControl/CtlLeftMenu.ascx" tagname="CtlLeftMenu" tagprefix="uc1" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
  Logged Out
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
&gt;<span>Logged out</span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server">
        <table summary="content table" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="titleRight">
                        <div class="titleLeft clear">
                            <h1>
                                <input type="button" class="ImgLogin" value=" " />
                                <a href="/">Home</a> / Logged out  !
                            </h1>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="clear">
                        <div class="clear">
                        &nbsp;
                            <!-- content start -->
                            <div style="width: 100%;">
                                <div class="login-page" style="width: 100%;">
                                    <div class="page-title">
                                        <h1>
                                           You are logged out ! </h1>
                                    </div>
                                    <div class="clear">
                                    </div>
                                    <div class="wrapper">
                                        <div class="new-wrapper">
                                            <fieldset>
                                                <legend><span class="register-title">Could be one of following reasons :</span></legend>
                                                <div class="register-block" runat="server" id="pnlRegisterBlock">
                                                    <table>
                                                        <tbody>
                                                            <tr>
                                                                <td align="left" style="padding-right: 5px; padding-top: 10px;">
                                                                    <ul>
                                                                        <li>You are logged out ! Please, Click here
                                                                            <asp:HyperLink ID="HyperLink2" CssClass="red" runat="server" NavigateUrl="/login.aspx">Login</asp:HyperLink> again !
                                                                        </li>
                                                                        <li>Your current "<span style="color: red; font-weight: bold;">session</span>"time may be out. Please ! Click here
                                                                                <asp:HyperLink ID="HyperLink1" CssClass="red" runat="server" NavigateUrl="/login.aspx">Login</asp:HyperLink> again !
                                                                        </li>
                                                                        <li>Or check the Web address you entered to make sure if it's correct.</li>
                                                                        <li>Or try to access the page directly from the Home page, instead of using a bookmark.</li>
                                                                        <li>If the page has moved, reset your bookmark.</li>
                                                                        <li>Report this technical issue to <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="http:\\www.pibt.org\contactus.aspx">PIBT.org</asp:HyperLink></li></ul>
                                                                    <br />
                                                                    <span style="font-weight: bold; font-size: 12px; color: red; text-indent: 20px; font-style: italic;">
                                                                        Sorry for any inconvenience this may have caused you, please contact your relationshop keeper for any questions.</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" style="padding-right: 20px; padding-top: 20px;">
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </fieldset>
                                        </div>
                                    </div>
                                    <div class="clear">
                                    </div>
                                </div>
                            </div>
                            <!-- content end -->
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </telerik:RadAjaxPanel>
</asp:Content>
<asp:Content ID="Content2" runat="server" 
    contentplaceholderid="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>

