﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="OEWindowManagement.aspx.cs" Inherits="Pibt.Admin.OEWindowManagement" %>

<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <a href="/">Home</a> > OE Window Management
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
        <fieldset>                     
            <legend>Quick Search</legend>
            <table class="table-container">
                <tr class="row">
                    <td class="item-name">
                        Employer ID
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtERID" runat="server" ValidationGroup="vSearch" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvERID" CssClass="red" runat="server" ErrorMessage="ID required"
                            ControlToValidate="txtERID" ValidationGroup="vSearch" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rvERID" CssClass="red" runat="server" MaximumValue="99999999" MinimumValue="0"
                            ControlToValidate="txtERID" ErrorMessage="The range must be 0-99999999." ValidationGroup="vSearch"
                            Display="Dynamic"></asp:RangeValidator>
                    </td>
                    <td class="item-name">
                    </td>
                    <td class="item-value">
                    </td>
                    <td>
                        <asp:Button ID="btnSearch" CssClass="btn" Text="Search" runat="server" ValidationGroup="vSearch"
                            OnClick="btnSearch_Click" />
                        <asp:Button ID="btnClear" CssClass="btn" Text="Clear" runat="server" CausesValidation="false"
                            OnClick="btnClear_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </asp:Panel>
    <br />
    <asp:Label ID="lblGridHeader" runat="server"></asp:Label>
    <telerik:RadGrid ID="RadGridOEWindow" runat="server" Height="100%"
        AutoGenerateColumns="False" GridLines="None" AllowSorting="True" CellSpacing="0" Skin="MetroTouch" AllowAutomaticInserts="true"
        AllowAutomaticDeletes="True" AllowAutomaticUpdates="True" OnItemCommand="RadGridOEWindow_ItemCommand" DataSourceID="odsOEWindow"
        OnItemInserted="RadGridOEWindow_ItemInserted"
        OnItemUpdated="RadGridOEWindow_ItemUpdated">
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings AllowKeyboardNavigation="false"  >
            <KeyboardNavigationSettings AllowSubmitOnEnter="false"  />
        </ClientSettings>
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" AllowSorting="true"
            Height="100%" CommandItemDisplay="Top" CommandItemSettings-ShowAddNewRecordButton="true"
            DataSourceID="odsOEWindow">
            <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
            <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
            </RowIndicatorColumn>
            <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
            </ExpandCollapseColumn>
            <Columns>
                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                    <ItemStyle CssClass="MyImageButton"></ItemStyle>
                </telerik:GridEditCommandColumn>
                <telerik:GridBoundColumn DataField="ID" SortExpression="ID" UniqueName="ID" HeaderText="ID" Display="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="EMPLOYERID" SortExpression="EMPLOYERID" UniqueName="EMPLOYERID" HeaderText="Employer ID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="EMPLOYERNAME" SortExpression="EMPLOYERNAME" UniqueName="EMPLOYERNAME" HeaderText="Employer Name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="OEFROMMONTH" SortExpression="OEFROMMONTH" UniqueName="OEFROMMONTH"
                    HeaderText="From Date">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="OETOMONTH" SortExpression="OETOMONTH" UniqueName="OETOMONTH"
                    HeaderText="To Date">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="PLANEFFECTIVEDATE"
                    SortExpression="PLANEFFECTIVEDATE" UniqueName="PLANEFFECTIVEDATE" HeaderText="Plan Effective Date">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="MODIFIED" HeaderText="Modified Date" SortExpression="MODIFIED"
                    UniqueName="MODIFIED">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MODIFIEDBY" HeaderText="Modified By" SortExpression="MODIFIEDBY"
                    UniqueName="MODIFIEDBY">
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn ConfirmText="Are you sure to delete this record?" ConfirmDialogType="Classic"
                    ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                    UniqueName="DeleteColumn">
                </telerik:GridButtonColumn>
            </Columns>
            <CommandItemTemplate>
                <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Add" CommandName="InitInsert"/>
            </CommandItemTemplate>
            <EditFormSettings EditFormType="Template" InsertCaption="Insert">
                <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                </EditColumn>
                <FormTemplate>
                    <asp:TextBox ID="tbID" runat="server" Text='<%# Eval( "ID" ) %>' Visible="False">
                    </asp:TextBox>
                    <table class="table-container">
                        <tr class="row">
                            <td class="item-name">
                                Employer ID:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbErID" Text='<%# Bind( "EMPLOYERID" ) %>' runat="server" MaxLength="8" Width="150"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvERId" runat="server" ControlToValidate="tbErID" CssClass="required-info"
                                    ErrorMessage="Employer ID is required" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rvErId" runat="server" ControlToValidate="tbErID" MaximumValue="99999999" MinimumValue="0"
                                    CssClass="required-info" ErrorMessage="The range is 1-99999999." Display="Dynamic"></asp:RangeValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                From Date:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="TextBox1" Text='<%# Bind("OEFROMMONTH","{0:MM/dd/yyyy}") %>' runat="server" MaxLength="10" Width="100">
                                </asp:TextBox>&nbsp;<label>e.g., 06/01/2016</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbToMonth" CssClass="required-info"
                                    ErrorMessage="OE From Date is required" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                To Date:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbToMonth" Text='<%# Bind("OETOMONTH","{0:MM/dd/yyyy}") %>' runat="server" MaxLength="10" Width="100">
                                </asp:TextBox>&nbsp;<label>e.g., 06/01/2016</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbToMonth"
                                    CssClass="required-info" ErrorMessage="OE To Date is required" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                Plan Effective Date:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbEffectiveDate" Text='<%# Bind("PLANEFFECTIVEDATE","{0:MM/dd/yyyy}") %>' runat="server" MaxLength="10"
                                    Width="100"></asp:TextBox>&nbsp;<label>e.g., 06/01/2016</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbEffectiveDate"
                                    CssClass="required-info" ErrorMessage="Plan Effective Date is required" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="lblErrorMsg" runat="server" CssClass="red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnUpdate" runat="server" CssClass="btn" CausesValidation="True"
                                    CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                    Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' />
                                &nbsp;
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" CommandName="Cancel" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </FormTemplate>
            </EditFormSettings>
        </MasterTableView>
        <FilterMenu EnableImageSprites="False">
        </FilterMenu>
    </telerik:RadGrid>
    <asp:ObjectDataSource ID="odsOEWindow" runat="server" DeleteMethod="DeleteOEWindow"
        SelectMethod="GetOEWindow" TypeName="Pibt.BLL.EnrollmentForm" UpdateMethod="UpdateOEWindow"
        InsertMethod="InsertOEWindow" OnInserting="odsOEWindow_Inserting" OnUpdating="odsOEWindow_Updating"
        OnSelecting="odsOEWindow_Selecting">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="employerId" Type="String" />
            <asp:Parameter Name="oeFromMonth" Type="DateTime" />
            <asp:Parameter Name="oeToMonth" Type="DateTime" />
            <asp:Parameter Name="planEffectiveDate" Type="DateTime" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:Parameter Name="employerId" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="String" />
            <asp:Parameter Name="employerId" Type="String" />
            <asp:Parameter Name="oeFromMonth" Type="DateTime" />
            <asp:Parameter Name="oeToMonth" Type="DateTime" />
            <asp:Parameter Name="planEffectiveDate" Type="DateTime" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
