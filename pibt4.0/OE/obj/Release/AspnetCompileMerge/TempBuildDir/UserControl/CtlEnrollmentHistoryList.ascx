<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEnrollmentHistoryList.ascx.cs"
    Inherits="Pibt.UserControl.CtlEnrollmentHistoryList" %>
<fieldset>
    <legend>Quick Search</legend>
    <table class="table-container">
        <tr class="row">
            <td class="item-name">
                Enrollment Status :
            </td>
            <td class="item-value">
                <telerik:RadComboBox ID="StatusCombo" Skin="MetroTouch" Width="400" runat="server">
                    <Items>
                        <telerik:RadComboBoxItem runat="server" Text="All" />
                        <telerik:RadComboBoxItem runat="server" Text="Incomplete" Value="0" />
                        <telerik:RadComboBoxItem runat="server" Text="Completed" Value="1" />
                        <telerik:RadComboBoxItem runat="server" Text="Pending" Value="2" />
                        <telerik:RadComboBoxItem runat="server" Text="Rejected" Value="3" />
                        <telerik:RadComboBoxItem runat="server" Text="Canceled" Value="4" />
                    </Items>
                </telerik:RadComboBox>
            </td>

            <td>
            </td>
        </tr>
        <tr class="row">
            <td class="item-name">
                Enrollment Types :
            </td>
           
           <td class="item-value">
                <telerik:RadComboBox ID="OETypesCombo" Width="400" runat="server" DataSourceID="odsTypes" 
                    Skin="MetroTouch" DataTextField="Description" MaxLength="70"
                    DataValueField="Id">
                    <DefaultItem Text="All" />
                </telerik:RadComboBox>
            </td>
        </tr>
        <asp:PlaceHolder ID="PlaceHolder1" runat="server">
            <tr class="row">
                <asp:PlaceHolder ID="PlaceHolder2" runat="server">
                    <td class="item-name">
                        Employer ID:
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtEmployerId" runat="server" CssClass="form-control" Height="26px" MaxLength="8" ValidationGroup="vgId"></asp:TextBox>
                        <asp:RangeValidator ID="rvId" runat="server" ControlToValidate="txtEmployerId" Display="Dynamic"
                            ValidationGroup="vgId" CssClass="red" ErrorMessage="It must be 1-99999999" MinimumValue="1"
                            MaximumValue="99999999"></asp:RangeValidator>
                    </td>
                </asp:PlaceHolder>
                <td class="item-name">
                    Employee ID:
                </td>
                <td class="item-value">
                    <asp:TextBox ID="txtEmployeeId" runat="server" CssClass="form-control" Height="26px" MaxLength="8" ValidationGroup="vgId"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtEmployeeId"
                        Display="Dynamic" ValidationGroup="vgId" CssClass="red" ErrorMessage="It must be 1-99999999"
                        MinimumValue="1" MaximumValue="99999999"></asp:RangeValidator>
                </td>
                <td>
                </td>
            </tr>
        </asp:PlaceHolder>
        <tr class="row">
            <td class="item-name">
                Search by Dates :
            </td>
            <td class="item-value" colspan="6">
                <telerik:RadDatePicker ID="dtPickerStart" CssClass="form-control" runat="server">
                </telerik:RadDatePicker>
                To
                <telerik:RadDatePicker ID="dtPickerEnd" CssClass="form-control" runat="server">
                </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:Button ID="btnSearch" CssClass="btn" Text="Search" runat="server" ValidationGroup="vgId" OnClick="btnSearch_Click" />
                <asp:Button ID="btnClear" CssClass="btn" Text="Clear" runat="server" CausesValidation="false" OnClick="btnClear_Click" />
            </td>
        </tr>
    </table>
</fieldset>
<br />
<asp:Label ID="lblGridHeader" runat="server"></asp:Label>
<br />
<telerik:RadGrid ID="EnrollmentHistoryGrid" runat="server" AllowPaging="True" Skin="MetroTouch"
    AllowSorting="True" AutoGenerateColumns="False" GridLines="None" AllowMultiRowSelection="true"
    ShowStatusBar="true" CellSpacing="0" OnNeedDataSource="EnrollmentHistoryGrid_NeedDataSource"
    OnItemCommand="EnrollmentHistoryGrid_ItemCommand">
    <PagerStyle Mode="NextPrevAndNumeric" />
    <GroupingSettings CaseSensitive="false" />
    <ClientSettings>
        <Selecting AllowRowSelect="true" />
    </ClientSettings>
    <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id,Isexpiry,Status" CommandItemDisplay="TopAndBottom"
        AllowSorting="true" Width="100%" Height="100%" PageSize="16">
        <Columns>
            <telerik:GridClientSelectColumn UniqueName="CheckboxSelectColumn">
            </telerik:GridClientSelectColumn>
            <telerik:GridBoundColumn DataField="Id" SortExpression="Id" UniqueName="Id" HeaderText="OE ID">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="CompanyName" SortExpression="CompanyName" UniqueName="CompanyName"
                HeaderText="EMPLOYER">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Memberid" HeaderText="EMPLOYEE ID" SortExpression="Memberid"
                UniqueName="Memberid">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="MemberName" SortExpression="MemberName" UniqueName="MemberName"
                HeaderText="EMPLOYEE NAME">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TypeName" HeaderText="TYPE" SortExpression="TypeName"
                UniqueName="TypeName">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Created" HeaderText="CREATED" SortExpression="Created" DataFormatString="{0:M/d/yyyy}"
                UniqueName="Created">
            </telerik:GridBoundColumn>
<%--            <telerik:GridBoundColumn DataField="Isexpiry" HeaderText="TIMED OUT" SortExpression="Isexpiry"
                UniqueName="Isexpiry">
            </telerik:GridBoundColumn>--%>
            <telerik:GridBoundColumn DataField="UpdatedBy" HeaderText="UPDATED BY" SortExpression="UpdatedBy"
                UniqueName="UpdatedBy">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Updated" HeaderText="UPDATED" SortExpression="Updated" DataFormatString="{0:M/d/yyyy}"
                UniqueName="Updated">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Status" HeaderText="STATUS" SortExpression="Status"
                UniqueName="Status">
            </telerik:GridBoundColumn>
            <telerik:GridHyperLinkColumn ItemStyle-HorizontalAlign="Left" UniqueName="" HeaderStyle-Font-Bold="false"
                Target="_blank" HeaderStyle-Wrap="false" DataNavigateUrlFields="Id,EmployerId,MemberId"
                DataNavigateUrlFormatString="/Employer/EnrollmentFromPlanPreview.aspx?oeid={0}"
                HeaderStyle-Width="20px" Text="View">
                <ItemStyle Wrap="True" Font-Underline="true" />
            </telerik:GridHyperLinkColumn>
        </Columns>
        <DetailTables>
            <telerik:GridTableView DataKeyNames="Id" DataSourceID="odsRejectHistory">
                <ParentTableRelation>
                    <telerik:GridRelationFields DetailKeyField="oeId" MasterKeyField="Id" />
                </ParentTableRelation>
                <Columns>
                    <telerik:GridBoundColumn DataField="Rejectionreason" HeaderText="Reason" UniqueName="Rejectionreason">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Rejectedby" HeaderText="Rejected By" UniqueName="Rejectedby">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="Rejecteddate" HeaderText="Rejected Date" UniqueName="Rejecteddate">
                    </telerik:GridBoundColumn>
                </Columns>
            </telerik:GridTableView>
        </DetailTables>
        <CommandItemTemplate>
            <asp:Button ID="btnApprove" CommandName="Approve" Text="Click Here To Approve The Selected Items" CssClass="btn"
                runat="server" />
        </CommandItemTemplate>
    </MasterTableView>
    <FilterMenu EnableImageSprites="False">
    </FilterMenu>
</telerik:RadGrid>
<asp:Button ID="btnRefresh" CssClass="btn" Text="Refresh" runat="server" OnClick="btnRefresh_Click" /><br />
<asp:Label ID="lblMessage" runat="server" CssClass="required-info"></asp:Label>
<asp:ObjectDataSource ID="odsRejectHistory" runat="server" SelectMethod="GetOERejectReason"
    TypeName="Pibt.BLL.EnrollmentForm">
    <SelectParameters>
        <asp:Parameter Name="oeId" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsTypes" runat="server" SelectMethod="GetOETypes" TypeName="Pibt.BLL.EnrollmentForm">
</asp:ObjectDataSource>
