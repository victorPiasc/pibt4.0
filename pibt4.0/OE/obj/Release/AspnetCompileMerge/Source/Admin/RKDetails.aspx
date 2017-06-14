<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="RKDetails.aspx.cs" Inherits="Pibt.Admin.RKDetails" %>

<%@ Register Src="../UserControl/CtlCreateWebUser.ascx" TagName="CtlCreateWebUser"
    TagPrefix="uc3" %>
<%@ Register Src="../UserControl/CtlChangePassword.ascx" TagName="CtlChangePassword"
    TagPrefix="uc4" %>
<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlEditRKDetails.ascx" TagName="CtlEditRKDetails"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <h1>
        <input type="button" class="ImgHome" value=" " />
        <a href="/">Home</a>
        <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
            <RoleGroups>
                <asp:RoleGroup Roles="Administrator">
                    <ContentTemplate>
                        &nbsp;>&nbsp;<a href="RKs.aspx">RKs</a>&nbsp;>&nbsp;RK#<%=Request["uid"]%>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
            <RoleGroups>
                <asp:RoleGroup Roles="RK">
                    <ContentTemplate>
                        &nbsp;>&nbsp;RK#<%=CurrentUserInfo.UserId %></ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="MetroTouch" MultiPageID="RadMultiPage1"
        ReorderTabsOnSelect="true" Orientation="HorizontalTop" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab ImageUrl="/img/customerInfo.png" Text="General Info">
            </telerik:RadTab>
            <telerik:RadTab ImageUrl="/img/password1.png" Text="Change Password">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" SelectedIndex="0" ID="RadMultiPage1" CssClass="multiPage">
        <telerik:RadPageView runat="server" ID="RadPageView1" CssClass="productsPageView">
            <uc2:CtlEditRKDetails ID="CtlEditRKDetails1" runat="server" />
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView2">
            <uc3:CtlCreateWebUser ID="CtlCreateWebUser1" Role="RK" runat="server" />
            <uc4:CtlChangePassword ID="CtlChangePassword1" Role="RK" runat="server" />
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function customResponseEnd(sernder, args) {
                if (typeof (btnChangePassword_click) != 'undefined') {
                    btnChangePassword_click(sernder, args);
                }
                if (typeof (btnCreateUser_click) != 'undefined') {
                    btnCreateUser_click(sernder, args);
                }
                if (typeof (btnUpdateRKDetails_click) != 'undefined') {
                    btnUpdateRKDetails_click(sernder, args);
                }
            }
        </script>
    </telerik:RadCodeBlock>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
