<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlBMSLeftNav.ascx.cs"
    Inherits="Pibt.UserControl.CtlBMSLeftNav" %>
<telerik:RadPanelBar ID="ErMenuPanel" runat="server" Width="160">
    <Items>
        <telerik:RadPanelItem Text="Home" runat="server">
        </telerik:RadPanelItem>
        <telerik:RadPanelItem Text="Business Info" Expanded="true" runat="server">
            <Items>
                <telerik:RadPanelItem runat="server" Text="General Info">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Text="Additional Info">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Text="DBA Info">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Text="Departments">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Text="Special Plans">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Text="Business Contacts">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Text="Change Password">
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelItem>
    </Items>
</telerik:RadPanelBar>
