<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployerAssign.aspx.cs" Inherits="Pibt.Broker.EmployerAssign" MasterPageFile="~/Content.master" %>

<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="FrameHeaderPlaceHolder">
    <a href="/">Home</a> > Brokers > Employer List
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content" runat="server" ContentPlaceHolderID="MainContentPlaceHolder">
    <asp:Panel ID="newRecord" runat="server" >
        <asp:Literal ID="message" runat="server" ></asp:Literal>
        <fieldset>
            <legend>Assign Employer to Broker</legend>
            <table class="table-container">
                <tr class="row">
                    <td class="item-name">Employer List:</td>
                    <td class="item-value" colspan="3">
                        <asp:TextBox ID="tbEmployerId" runat="server" MaxLength="9" CssClass="form-control" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="requiredDdlEmployer" runat="server" Display="Dynamic" ErrorMessage="*Employer required" CssClass="required-info" ControlToValidate="tbEmployerId" ValidationGroup="assignGroup" ></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr class="row">
                    <td class="item-name">Start Date:</td>
                    <td class="item-value">
                        <telerik:RadDatePicker ID="dpStart" runat="server" MinDate="1900/1/1" CssClass="form-control"></telerik:RadDatePicker>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="requiredDpStart" runat="server" Display="Dynamic" ErrorMessage="*Start date required"  CssClass="required-info" ControlToValidate="dpStart" ValidationGroup="assignGroup"></asp:RequiredFieldValidator>
                    </td>
                    <td class="item-name">&nbsp;End Date:</td>
                    <td class="item-value">
                        <telerik:RadDatePicker ID="dpEnd" runat="server" MinDate="1900/1/1" CssClass="form-control"></telerik:RadDatePicker>
                    </td>
                </tr>
                <tr class="row">
                    <td>&nbsp;</td>
                    <td class="item-name" colspan="4">
                        <asp:Button ID="assign" runat="server" Text="Assign" CssClass="btn"  ValidationGroup="assignGroup" OnClick="assign_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </asp:Panel>
    <br />
    <asp:Panel ID="search" runat="server" DefaultButton="btnSearch">
        <fieldset>
            <legend>Search:</legend>
            <div class="row">
                <div class="col-md-6">
                    <table style="width:50%">
                        <tr>
                            <td >Search:</td>
                            <td>
                                <asp:TextBox ID="tbSearch" runat="server" CssClass="form-control" MaxLength="60"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-6">
                    <table style="width:50%">
                        <tr>
                            <td >Status:</td>
                            <td>
                                <asp:DropDownList ID="status" runat="server" CssClass="form-control" OnSelectedIndexChanged="status_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Text="All" Value="ALL"></asp:ListItem>
                                    <asp:ListItem Text="Active" Value="ACTIVE"></asp:ListItem>
                                    <asp:ListItem Text="Inactive" Value="INACTIVE"></asp:ListItem>
                                    <asp:ListItem Text="Pending" Value="PENDING"></asp:ListItem>
                                    <asp:ListItem Text="Incomplete" Value="INCOMPLETE"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn-red" OnClick="btnClear_Click" />
                </div>
            </div>
        </fieldset>
    </asp:Panel>
    <br />
    <asp:Panel ID="Grid" runat="server">
        <telerik:RadGrid ID="employerList" runat="server" Skin="MetroTouch" OnNeedDataSource="employerList_NeedDataSource" AutoGenerateColumns="false" AllowSorting="true" OnItemCommand="employerList_ItemCommand">
            <MasterTableView DataKeyNames="EMPLOYERID">
                <Columns>
                    <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                        <ItemStyle CssClass="MyImageButton"></ItemStyle>
                    </telerik:GridEditCommandColumn>
                    <telerik:GridHyperLinkColumn ItemStyle-HorizontalAlign="Left" HeaderStyle-Font-Bold="false" HeaderStyle-Wrap="false" DataNavigateUrlFields="BROKERID,EMPLOYERID" DataNavigateUrlFormatString="/Employer/BusinessInfo.aspx?bid={0}&erId={1}" HeaderText="View Employer ID" DataTextField="EMPLOYERID" DataTextFormatString="{0}" SortExpression="EMPLOYERID" UniqueName="EMPLOYERID">
                        <HeaderStyle Wrap="False" Font-Bold="False" Width="20px"></HeaderStyle>
                        <ItemStyle Wrap="True" Font-Underline="true" />
                    </telerik:GridHyperLinkColumn>                
                    <telerik:GridBoundColumn DataField="NAME" HeaderText="Employer Name" UniqueName="NAME" SortExpression="NAME"></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EFFECTIVE" HeaderText="Start Date" UniqueName="EFFECTIVE" DataFormatString="{0:MM/dd/yyyy}" SortExpression="EFFECTIVE" ></telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EXPIRY" HeaderText="End Date" UniqueName="EXPIRY" DataFormatString="{0:MM/dd/yyyy}" SortExpression="Expiry" ></telerik:GridBoundColumn>
                    <telerik:GridButtonColumn ConfirmText="Delete this employer?" ConfirmDialogType="Classic" ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete" UniqueName="DeleteColumn">
                    </telerik:GridButtonColumn>
                </Columns>
                <EditFormSettings EditFormType="Template" InsertCaption="update">
                    <EditColumn UniqueName="EditCommnatColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                    <FormTemplate>
                        <table class="table-container">
                            <tr class="row">
                                <td class="item-name">Start Date:</td>
                                <td class="item-value">
                                    <telerik:RadDatePicker ID="editStart" runat="server" MinDate="1900/1/1" CssClass="form-control" SelectedDate='<%# Bind("Effective") %>'></telerik:RadDatePicker>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="requiredDpStart" runat="server" Display="Dynamic" ErrorMessage="*Start date required"  CssClass="required-info" ControlToValidate="editStart" ValidationGroup="updateGroup"></asp:RequiredFieldValidator>
                                </td>
                                <td class="item-name">&nbsp;End Date:</td>
                                <td class="item-value">
                                    <telerik:RadDatePicker ID="editEnd" runat="server" MinDate="1900/1/1" CssClass="form-control" ></telerik:RadDatePicker>
                                </td>
                            </tr>
                            <tr class="row">
                                <td>&nbsp;</td>
                                <td class="item-name" colspan="4">
                                    <asp:Button ID="update" runat="server" Text="Update" CssClass="btn" ValidationGroup="updateGroup" OnCommand="update_Command" CommandName='<%# Bind("employerId") %>'/>
                                    <asp:Button ID="cancel" runat="server" Text="Cancel" CssClass="btn" OnClick="cancel_Click"/>
                                </td>
                            </tr>
                        </table>
                    </FormTemplate>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
    </asp:Panel>
</asp:Content>
