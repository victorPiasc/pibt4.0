<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAgentFavorites.ascx.cs" Inherits="Pibt.UserControl.CtlAgentFavorites" %>
<telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RadGridEmployers">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadGridEmployers" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManagerProxy>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
<telerik:RadGrid ID="AgentFavoriteListGrid" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="odsAgentFavorite"
    Height="100%" AutoGenerateColumns="False" OnItemCommand="EmployersGrid_ItemCommand" AllowMultiRowSelection="True" OnNeedDataSource="EmployersGrid_NeedDataSource">
    <PagerStyle Mode="NextPrevAndNumeric" />
    <GroupingSettings CaseSensitive="false" />
    <ClientSettings>
     <Selecting AllowRowSelect="True" />
    </ClientSettings>
    <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="Id,EMPLOYERID,Loginname" CommandItemDisplay="Bottom"
        AllowSorting="true" Width="100%" Height="100%" PageSize="16">
        <CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
        <Columns>
            <telerik:GridClientSelectColumn UniqueName="CheckboxSelectColumn">
            </telerik:GridClientSelectColumn>
            <telerik:GridHyperLinkColumn ItemStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="false"
                HeaderStyle-Wrap="false" DataNavigateUrlFields="EMPLOYERID" DataNavigateUrlFormatString="/Employer/BusinessInfo.aspx?erId={0}"
                HeaderStyle-Width="20px" Text="Select">
            <HeaderStyle Wrap="False" Font-Bold="False" Width="20px"></HeaderStyle>
                <ItemStyle Wrap="True" Font-Underline="true" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="WebUserID" SortExpression="EMPLOYERID" UniqueName="WEBUSERID"
                HeaderText="WEB USER ID">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="EMPLOYERID" SortExpression="EMPLOYERID" UniqueName="EMPLOYERID"
                HeaderText="EMPLOYER ID">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="EMPLOYERNAME" SortExpression="EMPLOYERNAME" UniqueName="EMPLOYERNAME"
                HeaderText="EMPLOYER NAME">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="UPDATED" SortExpression="UPDATED" UniqueName="UPDATED"
                HeaderText="UPDATED">
            </telerik:GridBoundColumn>
            <telerik:GridButtonColumn ConfirmText="Delete this ER?" ConfirmDialogType="Classic"
                ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                UniqueName="DeleteColumn">
            </telerik:GridButtonColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>

<asp:ObjectDataSource ID="odsAgentFavorite" runat="server" SelectMethod="GetAgentFavorites" TypeName="Pibt.BLL.Agent">
</asp:ObjectDataSource>