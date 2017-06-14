<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="InvoiceHist.aspx.cs" Inherits="Pibt.Employer.InvoiceHist" %>

<%@ Register Src="../UserControl/CtlInvoiceHist.ascx" TagName="invoiceHist" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc2" %>
<asp:Content ID="ContentHead" ContentPlaceHolderID="PlaceHolderHead" runat="server">
    <script>
        function exportPdf() {
            var link = "/download/ExportInvoiceHistory.aspx?erId=<%=EmployerId %>&invoiceNbr=" + invoiceId;
            window.open(link, 'newwindow', 'height=100,width=50,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
        }
    </script>
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Invoice History
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <u><a href="/">Home</a></u>
    <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Administrator,Agent,RK,Broker">
                <ContentTemplate>
                    &nbsp;>&nbsp;<u><a href="BusinessList.aspx">Employer List</a></u>
                    &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx?erid=<%=EmployerId %>">Employer #<%=EmployerId %></a></u>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Employer">
                <ContentTemplate>
                    &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx">Employer</a></u>
                 </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
    &nbsp;>&nbsp;Invoice History
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="dontprint">
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="MetroTouch" MultiPageID="RadMultiPage1" SelectedIndex="0">
            <Tabs>
                <telerik:RadTab ImageUrl="/img/plans.png" Text="Invoice History">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
    </div>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" CssClass="multiPage">
        <telerik:RadPageView runat="server" ID="RadPageView1">
            <uc1:invoiceHist ID="invoiceHist" runat="server" Role="Employer" />
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <div class="bottom-center-buttons">
        <input id="btnExportPdf" type="button" class="btn" value="Export to PDF" onclick="exportPdf();" />
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
