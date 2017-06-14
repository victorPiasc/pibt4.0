<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="UsersLog.aspx.cs" Inherits="Pibt.Admin.UsersLog" %>

<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <h1>
        <input type="button" class="ImgHome" value=" " />
        <a href="/">Home</a> > Operation Log
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
        <fieldset>
            <table class="table-container">
                <tr class="row">
                    <td class="item-name">
                        Start Date
                    </td>
                    <td class="item-value" colspan="6">
                        <telerik:RadDatePicker ID="dtPickerStart" runat="server">
                        </telerik:RadDatePicker>
                        To
                        <telerik:RadDatePicker ID="dtPickerEnd" runat="server">
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">
                        Event Code
                    </td>
                    <td class="item-value">
                        <asp:DropDownList ID="ddlEventCodes" runat="server" DataTextField="EventCode" DataValueField="Id">
                        </asp:DropDownList>
                    </td>
                    <td class="item-name">
                        Operator
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">
                        Search Key Words
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtWords" runat="server"></asp:TextBox>
                    </td>
                    <td>
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="btnSearch" CssClass="btn" Text="Search" runat="server" OnClick="btnSearch_Click" />
                        <asp:Button ID="btnClear" CssClass="btn" Text="Clear" runat="server" OnClick="btnClear_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </asp:Panel>
    <br />
    <asp:Label ID="lblGridHeader" runat="server"></asp:Label>
    <telerik:RadGrid ID="LogGrid" runat="server" AllowPaging="True" Height="100%" AllowSorting="true"
        AutoGenerateColumns="False" GridLines="None" CellSpacing="0" OnNeedDataSource="LogGrid_NeedDataSource">
        <PagerStyle Mode="NextPrevAndNumeric" />
        <GroupingSettings CaseSensitive="false" />
        <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="LogId" CommandItemDisplay="Top"
            AllowSorting="true" Height="100%" PageSize="16">
            <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
            <Columns>
                <telerik:GridBoundColumn DataField="LogId" SortExpression="LogId" UniqueName="LogId" HeaderText="Log ID" DataType="System.Int32" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="UserName" HeaderText="Operator" SortExpression="UserName"
                    UniqueName="UserName" DataType="System.String">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="EventCode" HeaderText="Event Code" SortExpression="EventCode"
                    UniqueName="EventCode" DataType="System.String">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="EventDetails" HeaderText="Event Details" SortExpression="EventDetails"
                    UniqueName="EventDetails" DataType="System.String">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="EventTime" HeaderText="Event Time" SortExpression="EventTime" DataFormatString="{0:MM/dd/yyyy HH:mm:ss}"
                    UniqueName="EventTime" DataType="System.DateTime">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="FromIP" HeaderText="From IP" SortExpression="FromIP"
                    UniqueName="FromIP" DataType="System.String">
                </telerik:GridBoundColumn>
            </Columns>
            <CommandItemTemplate>
            </CommandItemTemplate>
            </MasterTableView>
        <SortingSettings SortedBackColor="Azure" EnableSkinSortStyles="false" />
    </telerik:RadGrid>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
