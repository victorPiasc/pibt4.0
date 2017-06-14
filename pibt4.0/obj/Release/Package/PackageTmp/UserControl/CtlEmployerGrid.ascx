<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEmployerGrid.ascx.cs"
    Inherits="Pibt.UserControl.CtlEmployerGrid" %>
<style type="text/css">
    .auto-style1 {
        width: 416px;
    }

    .auto-style2 {
        width: 423px;
    }
</style>
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
<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
    <fieldset>
        <legend>Quick Search</legend>
        <table class="table-container" width="100%">
            <tr class="row">
                <td class="item-name">Search For:
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtClue" runat="server" Height="27px" Width="300px" CssClass="form-control"></asp:TextBox>
                </td>
                <td class="item-name">Search By:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlTypes" CssClass="form-control" runat="server" AutoPostBack="true">
                        <asp:ListItem Text="All Accounts" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Web Registered Accounts" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Unregistered Accounts" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Active Accounts" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Inactive Accounts" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr class="row">
                <td class="item-name">&nbsp;
                </td>
                <td class="auto-style1" colspan="3">
                    <asp:Button ID="btnSearch" CssClass="btn" Text="Search" runat="server" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnClear" CssClass="btn" CausesValidation="false" Text="Clear" runat="server" OnClick="btnClear_Click" />
                    <asp:Label ID="lblSearchingMsg" runat="server" CssClass="red"></asp:Label>
                </td>
            </tr>
        </table>
    </fieldset>
</asp:Panel>
<br />
<br />
<telerik:RadGrid ID="EmployersGrid" runat="server" AllowPaging="True" AllowSorting="True" OnItemDataBound="binder" Height="100%" AutoGenerateColumns="False"
   AllowMultiRowSelection="True" OnNeedDataSource="EmployersGrid_NeedDataSource" Skin="MetroTouch">
    <PagerStyle Mode="NextPrevAndNumeric" />
    <GroupingSettings CaseSensitive="false" />
    <ClientSettings>
        <Selecting AllowRowSelect="True" />
    </ClientSettings>
    <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="Id,EMPLOYERID,Loginname" CommandItemDisplay="Bottom"
        AllowSorting="true" Width="100%" Height="100%" PageSize="16">
        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
        <Columns>
            <telerik:GridHyperLinkColumn ItemStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="false" HeaderStyle-Wrap="false" DataNavigateUrlFields="EMPLOYERID"
                DataNavigateUrlFormatString="/Employer/BusinessInfo.aspx?erId={0}" HeaderText="View Employer ID" DataTextField="EMPLOYERID"
                DataTextFormatString="{0}" SortExpression="EMPLOYERID" UniqueName="EMPLOYERID">
                <HeaderStyle Wrap="False" Font-Bold="False" Width="20px"></HeaderStyle>
                <ItemStyle Wrap="True" Font-Underline="true" />
            </telerik:GridHyperLinkColumn>
            <telerik:GridBoundColumn DataField="LoginName" HeaderText="Web Username" SortExpression="LoginName" UniqueName="LoginName">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="NAME" HeaderText="Name" SortExpression="NAME" UniqueName="NAME">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Address" HeaderText="Address" SortExpression="Address" UniqueName="Address">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="CITY" HeaderText="City" SortExpression="CITY" UniqueName="CITY">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="STATE" HeaderText="State" SortExpression="STATE" UniqueName="STATE">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="ZIP" HeaderText="Zip" SortExpression="ZIP" UniqueName="ZIP">
            </telerik:GridBoundColumn>
            <telerik:GridCheckBoxColumn DataField="HasWebAccount" HeaderText="Has Web Account" SortExpression="HasWebAccount" UniqueName="HasWebAccount">
            </telerik:GridCheckBoxColumn>
            <telerik:GridBoundColumn DataField="Lastlogintime" HeaderText="Last Login" SortExpression="Lastlogintime" DataFormatString="{0:MM/dd/yyyy}"
                UniqueName="Lastlogintime">
            </telerik:GridBoundColumn>          
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
<asp:Label ID="lblMessage" runat="server"></asp:Label>
