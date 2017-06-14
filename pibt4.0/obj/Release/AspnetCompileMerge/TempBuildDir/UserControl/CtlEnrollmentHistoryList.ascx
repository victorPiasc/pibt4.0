<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEnrollmentHistoryList.ascx.cs"
    Inherits="Pibt.UserControl.CtlEnrollmentHistoryList" %>
<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
<fieldset>
    <legend>Quick Search</legend>
    <table class="table-container">
        <tr class="row">
            <td class="item-name">
                Enrollment Status:
            </td>
            <td class="item-value">
                <telerik:RadComboBox ID="StatusCombo" Skin="MetroTouch" Width="400" runat="server" AutoPostBack="true">
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
        </tr>
        <tr class="row">
            <td class="item-name">
                Enrollment Type:
            </td>
           <td class="item-value">
                <telerik:RadComboBox ID="OETypesCombo" Width="400" runat="server" DataSourceID="odsTypes" Skin="MetroTouch" DataTextField="Description"
                    MaxLength="70" DataValueField="Id" AutoPostBack="true">
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
                        <asp:RangeValidator ID="rvId" runat="server" ControlToValidate="txtEmployerId" Display="Dynamic" ValidationGroup="vgId" CssClass="red"
                            ErrorMessage="Employer ID must be 1-99999999" MinimumValue="1" MaximumValue="99999999"></asp:RangeValidator>
                    </td>
                </asp:PlaceHolder>
                <td class="item-name">
                    Employee ID:
                </td>
                <td class="item-value">
                    <asp:TextBox ID="txtEmployeeId" runat="server" CssClass="form-control" Height="26px" MaxLength="8" ValidationGroup="vgId"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtEmployeeId" Display="Dynamic" ValidationGroup="vgId"
                        CssClass="red" ErrorMessage="Employee ID must be 1-99999999" MinimumValue="1" MaximumValue="99999999"></asp:RangeValidator>
                </td>
            </tr>
        </asp:PlaceHolder>
        <tr class="row">
            <td class="item-name">
                Search by Dates:
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
</asp:Panel>
<br />
<asp:Label ID="lblGridHeader" runat="server"></asp:Label>
<br />
<telerik:RadGrid ID="EnrollmentHistoryGrid" runat="server" AllowPaging="True" OnItemDataBound="binder" AllowSorting="True" AutoGenerateColumns="False"
    GridLines="None" AllowMultiRowSelection="true" ShowStatusBar="true" CellSpacing="0" OnNeedDataSource="EnrollmentHistoryGrid_NeedDataSource"
    Skin="MetroTouch" >
    <PagerStyle Mode="NextPrevAndNumeric" />
    <GroupingSettings CaseSensitive="false" />
    <MasterTableView AutoGenerateColumns="False" DataKeyNames="Id,Status" CommandItemDisplay="TopAndBottom" AllowSorting="true" Width="100%" Height="100%" PageSize="16" >
        <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton="false" />
        <%-- ANY CHANGE TO THIS LIST WILL LIKELY REQUIRE A CHANGE IN CODE--%>
        <Columns>
            <%-- 1 --%>
            <telerik:GridHyperLinkColumn ItemStyle-HorizontalAlign="Left" SortExpression="Id" UniqueName="Id" HeaderText="View Form ID"
                HeaderStyle-Font-Bold="false" Target="_blank" DataNavigateUrlFields="Id,EmployerId, memberId"
                DataNavigateUrlFormatString="/Employer/EnrollmentFromPlanPreview.aspx?oeid={0}&erId={1}&eeId={2}" DataTextField="Id" DataTextFormatString="{0}">
                <ItemStyle Wrap="True" Font-Underline="true" />
            </telerik:GridHyperLinkColumn>
            <%-- 2:  Affected in code by this index # --%>
            <telerik:GridBoundColumn DataField="Employerid" UniqueName="Employerid" HeaderText="Employer ID">
            </telerik:GridBoundColumn>
            <%-- 3:  Affected in code by this index # --%>
            <telerik:GridBoundColumn DataField="CompanyName" SortExpression="CompanyName" UniqueName="CompanyName" HeaderText="Employer Name">
            </telerik:GridBoundColumn>
            <%-- 4:  Affected in code by this index # --%>
            <telerik:GridBoundColumn DataField="Memberid" HeaderText="Employee ID" SortExpression="Memberid" UniqueName="Memberid">
            </telerik:GridBoundColumn>
            <%-- 5:  Affected in code by this index # --%>
            <telerik:GridBoundColumn DataField="MemberName" SortExpression="MemberName" UniqueName="MemberName" HeaderText="Employee Name">
            </telerik:GridBoundColumn>
            <%-- 6 --%>
            <telerik:GridBoundColumn DataField="TypeName" HeaderText="Type" SortExpression="TypeName" UniqueName="TypeName">
            </telerik:GridBoundColumn>
            <%-- 7 --%>
            <telerik:GridBoundColumn DataField="Created" HeaderText="Created" SortExpression="Created" DataFormatString="{0:MM/dd/yyyy}" UniqueName="Created">
            </telerik:GridBoundColumn>
            <%-- 8 --%>
            <telerik:GridBoundColumn DataField="UpdatedBy" HeaderText="Updated By" SortExpression="UpdatedBy" UniqueName="UpdatedBy">
            </telerik:GridBoundColumn>
            <%-- 9 --%>
            <telerik:GridBoundColumn DataField="Updated" HeaderText="Updated" SortExpression="Updated" DataFormatString="{0:MM/dd/yyyy}" UniqueName="Updated">
            </telerik:GridBoundColumn>
            <%-- 10 --%>
            <telerik:GridBoundColumn DataField="Status" HeaderText="Status" SortExpression="Status" UniqueName="Status">
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
    <FilterMenu EnableImageSprites="False">
    </FilterMenu>
</telerik:RadGrid>
<asp:Label ID="lblMessage" runat="server" CssClass="required-info"></asp:Label>
<asp:ObjectDataSource ID="odsTypes" runat="server" SelectMethod="GetOETypes" TypeName="Pibt.BLL.EnrollmentForm">
</asp:ObjectDataSource>
