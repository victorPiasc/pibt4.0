﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="RKs.aspx.cs" Inherits="Pibt.Admin.RKs" %>

<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <h1>
        <input type="button" class="ImgHome" value=" " />
        <a href="/">Home</a> > Relationship Keepers
    </h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
        <fieldset>
            <legend>Quick Search</legend>
            <table class="table-container">
                <tr class="row">
                    <td class="item-name">
                        Search For
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtClue" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr class="row">
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnSearch" CssClass="btn" Text="Search" runat="server" OnClick="btnSearch_Click" />
                        <asp:Button ID="btnClear" CssClass="btn" Text="Clear" runat="server" CausesValidation="false" OnClick="btnClear_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </asp:Panel>
    <br />
    <asp:Label ID="lblGridHeader" runat="server"></asp:Label>
    <telerik:RadGrid ID="RadGridRKs" runat="server" AllowPaging="True" Height="100%" OnItemDataBound="binder" AutoGenerateColumns="False" GridLines="None"
        AllowSorting="true" CellSpacing="0" OnNeedDataSource="RadGridRKs_NeedDataSource" OnItemCommand="RadGridRKs_ItemCommand" Skin="MetroTouch">
        <PagerStyle Mode="NextPrevAndNumeric" />
        <GroupingSettings CaseSensitive="false" />
        <MasterTableView AutoGenerateColumns="False" EditMode="InPlace" DataKeyNames="Id,UserId,Loginname,CSRID"
            AllowSorting="true" Height="100%" PageSize="16">
            <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
            <Columns>
                <telerik:GridHyperLinkColumn ItemStyle-HorizontalAlign="Left" UniqueName="" HeaderStyle-Font-Bold="false" HeaderStyle-Wrap="false"
                    DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="/Admin/RKDetails.aspx?uid={0}" HeaderText="View RK ID" DataTextField="CSRID"
                    DataTextFormatString="{0}">
                    <ItemStyle Wrap="True" Font-Underline="true" />
                </telerik:GridHyperLinkColumn>
                <telerik:GridBoundColumn DataField="LoginName" SortExpression="LoginName" UniqueName="LoginName"
                    HeaderText="Web Username" DataType="System.String">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="UserId" SortExpression="UserId" UniqueName="UserId" HeaderText="User ID" DataType="System.String">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="UserName" HeaderText="RK Name" SortExpression="UserName"
                    UniqueName="UserName" DataType="System.String">
                </telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn DataField="HasWebAccount" HeaderText="Active" SortExpression="HasWebAccount"
                    UniqueName="HasWebAccount">
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="IsLockout" HeaderText="Lockout" SortExpression="IsLockout"
                    UniqueName="IsLockout">
                </telerik:GridCheckBoxColumn>
                <telerik:GridBoundColumn DataField="Updatedby" HeaderText="Updated By" SortExpression="Updatedby"
                    UniqueName="Updatedby">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Updated" HeaderText="Updated" SortExpression="Updated" DataFormatString="{0:MM/dd/yyyy}" UniqueName="Updated">
                </telerik:GridBoundColumn>
                <telerik:GridHyperLinkColumn ItemStyle-HorizontalAlign="Left" UniqueName="" HeaderStyle-Font-Bold="false" HeaderStyle-Wrap="false"
                    DataNavigateUrlFields="UserId" DataNavigateUrlFormatString="/Employer/BusinessList.aspx?roletype=3&uid={0}" Text="Employers">
                    <ItemStyle Wrap="True" Font-Underline="true" />
                </telerik:GridHyperLinkColumn>
                <telerik:GridButtonColumn ConfirmText="Are you sure to remove the RK's web account?"
                    ConfirmDialogType="Classic" ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete"
                    Text="Delete" UniqueName="DeleteColumn">
                </telerik:GridButtonColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
