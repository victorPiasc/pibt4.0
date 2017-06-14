<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="AdminEdit.aspx.cs" Inherits="Pibt.Admin.AdminEdit" %>

<%@ Register Src="../UserControl/CtlCreateWebUser.ascx" TagName="CtlCreateWebUser"
    TagPrefix="uc3" %>
<%@ Register Src="../UserControl/CtlChangePassword.ascx" TagName="CtlChangePassword"
    TagPrefix="uc4" %>
<%@ Register Src="../UserControl/CtlEditAdministrator.ascx" TagName="CtlEditAdministrator"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Administrator
</asp:Content>
<asp:Content ID="LefeMenuContent" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> > <a href="Administrators.aspx">Administrators</a> >
    <asp:Label ID="lblUserInfo" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="dontprint">
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="MetroTouch" MultiPageID="RadMultiPage1"
            ReorderTabsOnSelect="true" Orientation="HorizontalTop" SelectedIndex="0">
            <Tabs>
                <telerik:RadTab ImageUrl="/img/customerInfo.png" Text="General Information">
                </telerik:RadTab>
                <telerik:RadTab ImageUrl="/img/password1.png" Text="Username & Password">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
    </div>
    <telerik:RadMultiPage runat="server" SelectedIndex="0" ID="RadMultiPage1" CssClass="multiPage">
        <telerik:RadPageView runat="server" ID="RadPageView1" CssClass="productsPageView">
            <uc1:CtlEditAdministrator ID="CtlEditAdministrator1" runat="server" />
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView2">
            <uc3:CtlCreateWebUser ID="CtlCreateWebUser1" Role="Administrator" runat="server" />
            <uc4:CtlChangePassword ID="CtlChangePassword1" Role="Administrator" runat="server" />
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
            }
        </script>
    </telerik:RadCodeBlock>
</asp:Content>
