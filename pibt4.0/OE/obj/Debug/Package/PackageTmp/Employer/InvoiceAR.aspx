<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="InvoiceAR.aspx.cs" Inherits="Pibt.Employer.InvoiceAR" %>

<%@ Register Src="../UserControl/CtlInvoiceAR.ascx" TagName="invoiceAR" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc2" %>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Account Receivable
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <u><a href="/">Home</a></u>
    <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Administrator,Agent,RK">
                <ContentTemplate>
                    &nbsp;>&nbsp;<u><a href="BusinessList.aspx">Employer List</a></u>
                    &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx?erid=<%=EmployerId %>">Employer#<%=EmployerId %></a></u>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Employer">
                <ContentTemplate>
                    &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx">Employer</a></u>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
    &nbsp;>&nbsp;Account Receivable
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel">
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="MetroTouch" MultiPageID="RadMultiPage1"
            SelectedIndex="0">
            <Tabs>
                <telerik:RadTab  Text="Account Receivable">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1" CssClass="multiPage">
            <telerik:RadPageView runat="server" ID="RadPageView1">
                <uc1:invoiceAR ID="invoiceAR" runat="server" />
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </telerik:RadAjaxPanel>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
