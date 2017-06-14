﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlInvoice.ascx.cs"
    Inherits="Pibt.UserControl.CtlInvoice" %>
<telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="InvoiceDetailsGrid">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="InvoiceDetailsGrid" />
            </UpdatedControls>
        </telerik:AjaxSetting>
        <telerik:AjaxSetting AjaxControlID="InvoiceGrid">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="RadTabStrip1" />
                <telerik:AjaxUpdatedControl ControlID="RadMultiPage1" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="InvoiceGrid" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManagerProxy>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
<div class="dontprint">
    <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage1" Skin="MetroTouch" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab runat="server" ImageUrl="/img/plans.png" Text="Current Invoice" PageViewID="PageView1"/>
        </Tabs>
    </telerik:RadTabStrip>
</div>
<telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" RenderSelectedPageOnly="false">
    <telerik:RadPageView runat="server" ID="RadPageView1" BorderColor="Black" BorderWidth="1px">
        <div class="contactWrap">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:DetailsView ID="InvoiceSummaryDetailsView" AllowPaging="True" GridLines="None" Font-Size="Larger" Font-Names="Open Sans"
                            Width="100%" runat="server" Font-Italic="True" AutoGenerateRows="False" EnableModelValidation="True">
                            <Fields>
                                <asp:BoundField DataFormatString="{0:MM/dd/yyyy}" HeaderText="Invoice Date:" DataField="invoiceDate"
                                    HeaderStyle-Font-Italic="false" SortExpression="invoiceDate" />
                                <asp:BoundField HeaderText="Invoice #:" DataField="invoiceNbr" HeaderStyle-Font-Italic="false"
                                    SortExpression="invoiceNbr" />
                                <asp:BoundField DataFormatString="{0:MM/dd/yyyy}" HeaderText="Due Date:" DataField="dueDate"
                                    HeaderStyle-Font-Italic="false" SortExpression="dueDate" />
                                <asp:BoundField DataFormatString="{0:C}" HeaderText="Total Other Charges:" DataField="otherChargeAmount"
                                    HeaderStyle-Font-Italic="false" SortExpression="otherChargeAmount" />
                                <asp:BoundField DataFormatString="{0:C}" HeaderText="Total Current Month Invoice:"
                                    DataField="totalInvoiceAmount" HeaderStyle-Font-Italic="false"
                                    SortExpression="totalInvoiceAmount" />
                                <asp:BoundField DataFormatString="{0:C}" HeaderText="Balance Forward:" DataField="balanceforward"
                                    HeaderStyle-Font-Italic="false" SortExpression="balanceforward" />
                                <asp:BoundField DataFormatString="{0:C}" HeaderText="Total Due Now:" DataField="totalAmountDue"
                                    HeaderStyle-Font-Italic="false" SortExpression="totalAmountDue" />
                            </Fields>
                        </asp:DetailsView>
                    </td>
                </tr>
            </table>
        </div>
    </telerik:RadPageView>
</telerik:RadMultiPage>
<br />
<telerik:RadGrid ID="InvoiceGrid" runat="server" AutoGenerateColumns="False" AllowSorting="True"
    AllowMultiRowSelection="False" AllowPaging="True" PageSize="7" GridLines="None" Skin="MetroTouch"
    ShowStatusBar="True" Style="margin-bottom: 20px;" OnNeedDataSource="InvoiceGrid_NeedDataSource"
    OnDataBound="InvoiceGrid_DataBound">
    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
    <ClientSettings EnablePostBackOnRowClick="true">
        <Selecting AllowRowSelect="true" />
    </ClientSettings>
    <MasterTableView DataKeyNames="EmployeeID" AllowMultiColumnSorting="True">
        <Columns>
            <telerik:GridBoundColumn SortExpression="EMPLOYEEID" HeaderText="Employee ID" DataField="EMPLOYEEID" UniqueName="EMPLOYEEID" DataType="System.Decimal">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn SortExpression="LASTNAME" HeaderText="Last Name" DataField="LASTNAME" UniqueName="LASTNAME">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn SortExpression="FIRSTNAME" HeaderText="First Name" DataField="FIRSTNAME" UniqueName="FIRSTNAME">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn SortExpression="GENDER" HeaderText="Gender" DataField="GENDER" UniqueName="GENDER">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn SortExpression="BIRTHDATE" HeaderText="Birthdate" DataField="BIRTHDATE" UniqueName="BIRTHDATE">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="AGE" DataType="System.Decimal" HeaderText="Age" SortExpression="AGE" UniqueName="AGE">
            </telerik:GridBoundColumn>
            <telerik:GridNumericColumn DataField="AMOUNTTOTAL" DataFormatString="{0:C}" DataType="System.Decimal"
                HeaderText="Amount Total" SortExpression="AMOUNTTOTAL" UniqueName="AMOUNTTOTAL">
            </telerik:GridNumericColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
<div class="dontprint">
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" Skin="MetroTouch" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab runat="server" Text="Employee Details" PageViewID="PageView1" Selected="True" />
            <telerik:RadTab runat="server" Text="Employee Information" PageViewID="PageView2" />
        </Tabs>
    </telerik:RadTabStrip>
</div>
<telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" RenderSelectedPageOnly="false">
    <telerik:RadPageView runat="server" ID="PageView1">
        <telerik:RadGrid runat="server" ID="InvoiceDetailsGrid" ShowFooter="True" AllowSorting="True"
            EnableLinqExpressions="False" ShowStatusBar="True" Style="margin-bottom: 20px;" Skin="MetroTouch"
            DataSourceID="ObjectDataSource2">
            <MasterTableView ShowHeader="true" AutoGenerateColumns="False" AllowPaging="true"
                DataKeyNames="EmployeeID" PageSize="8" HierarchyLoadMode="ServerOnDemand" DataSourceID="ObjectDataSource2">
                <CommandItemSettings ExportToPdfText="Export to PDF" />
                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                </RowIndicatorColumn>
                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="NAME" HeaderText="Name" SortExpression="NAME" UniqueName="NAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GENDER" HeaderText="Gender" SortExpression="GENDER" UniqueName="GENDER">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AGE" DataType="System.Decimal" HeaderText="Age" SortExpression="AGE" UniqueName="AGE">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CHARGESTATUS" HeaderText="Charge Status" SortExpression="CHARGESTATUS" UniqueName="CHARGESTATUS">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="COVERAGETYPE" HeaderText="Coverage Type" SortExpression="COVERAGETYPE" UniqueName="COVERAGETYPE">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="Plan Name" SortExpression="PLANNAME" UniqueName="PLANNAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridNumericColumn DataField="AMOUNTDUE" DataFormatString="{0:C}" DataType="System.Decimal"
                        HeaderText="Amount Due" SortExpression="AMOUNTDUE" UniqueName="AMOUNTDUE" Aggregate="Sum"
                        FooterAggregateFormatString="TOTAL AMOUNT: {0:C}">
                    </telerik:GridNumericColumn>
                </Columns>
                <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                    </EditColumn>
                </EditFormSettings>
                <PagerStyle PageSizeControlType="RadComboBox" />
            </MasterTableView>
            <PagerStyle PageSizeControlType="RadComboBox" />
            <FilterMenu EnableImageSprites="False">
            </FilterMenu>
        </telerik:RadGrid>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetInvoiceDetailsByEmployee"
            TypeName="Pibt.BLL.Invoice" OnSelecting="ObjectDataSource2_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="InvoiceGrid" DefaultValue="-1" Name="employeeId"
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </telerik:RadPageView>
    <telerik:RadPageView runat="server" ID="PageView2" Width="360px" BorderColor="#666666"
        BorderWidth="1px" Style="margin-bottom: 20px;">
        <div class="contactWrap">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <asp:DetailsView ID="EmployeeDetailsView1" AllowPaging="True" GridLines="None" Width="100%" Font-Size="Larger" Font-Names="Open Sans"
                            DataSourceID="ObjectDataSource1" runat="server" Font-Italic="True" AutoGenerateRows="False">
                            <Fields>
                                <asp:BoundField HeaderText="Employee ID" DataField="EmployeeId" HeaderStyle-Font-Italic="false" SortExpression="EmployeeId" />
                                <asp:BoundField HeaderStyle-Font-Italic="false" HeaderText="Name" DataField="UserName" SortExpression="UserName" />
                                <asp:BoundField HeaderText="Employee Type" DataField="EemployeeType" HeaderStyle-Font-Italic="false"
                                    SortExpression="EemployeeType" />
                                <asp:BoundField HeaderText="Gender" DataField="Gender" SortExpression="Gender" />
                                <asp:BoundField HeaderText="Birthdate" DataField="BirthDate" SortExpression="BirthDate" />
                                <asp:BoundField DataField="MarriageDate" HeaderText="Marriage Date" SortExpression="MarriageDate" />
                                <asp:BoundField DataField="HireDate" HeaderText="Hire Date" SortExpression="HIREDATE" />
                                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                <asp:BoundField DataField="City" HeaderText="City" SortExpression="CITY" />
                                <asp:BoundField DataField="State" HeaderText="State" SortExpression="STATE" />
                                <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="ZIP" />
                                <asp:BoundField DataField="HomePhoneNbr" HeaderText="Home Phone" SortExpression="HOMEPHONENBR" />
                                <asp:BoundField DataField="WorkPhoneNbr" HeaderText="Work Phone" SortExpression="WORKPHONENBR" />
                                <asp:BoundField DataField="MobilePhoneNbr" HeaderText="Mobile Phone" SortExpression="MOBILEPHONENBR" />
                                <asp:BoundField DataField="EmailAddress" HeaderText="EMail" SortExpression="EMAILADDRESS" />
                            </Fields>
                        </asp:DetailsView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetMemberDetails"
                            TypeName="Pibt.BLL.Employee">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="InvoiceGrid" DefaultValue="-1" Name="memberId" PropertyName="SelectedValue"
                                    Type="String" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </telerik:RadPageView>
</telerik:RadMultiPage>
<div class="dontprint">
    <telerik:RadTabStrip runat="server" ID="RadTabStrip3" MultiPageID="RadMultiPage1" Skin="MetroTouch" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab runat="server" Text="Other Charges" PageViewID="PageView1" />
        </Tabs>
    </telerik:RadTabStrip>
</div>
<telerik:RadMultiPage runat="server" ID="RadMultiPage3" SelectedIndex="0" RenderSelectedPageOnly="false">
    <telerik:RadPageView runat="server" ID="RadPageView2">
        <telerik:RadGrid runat="server" ID="OtherChargeDetailsGrid" ShowFooter="True" AllowSorting="True" Skin="MetroTouch"
            EnableLinqExpressions="False" ShowStatusBar="True" Style="margin-bottom: 20px;"
            DataSourceID="ObjectDataSource3">
            <MasterTableView ShowHeader="true" AutoGenerateColumns="False" AllowPaging="true"
                PageSize="8" HierarchyLoadMode="ServerOnDemand" DataSourceID="ObjectDataSource3">
                <CommandItemSettings ExportToPdfText="Export to PDF" />
                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                </RowIndicatorColumn>
                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="DESCRIPTION" HeaderText="Description" SortExpression="DESCRIPTION" UniqueName="DESCRIPTION">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataFormatString="{0:C}" DataField="CHARGEAMOUNT" DataType="System.Decimal"
                        HeaderText="Charge Amount" SortExpression="CHARGEAMOUNT" UniqueName="CHARGEAMOUNT">
                    </telerik:GridBoundColumn>
                </Columns>
                <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                    </EditColumn>
                </EditFormSettings>
                <PagerStyle PageSizeControlType="RadComboBox" />
            </MasterTableView>
            <PagerStyle PageSizeControlType="RadComboBox" />
            <FilterMenu EnableImageSprites="False">
            </FilterMenu>
        </telerik:RadGrid>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetOtherChargeByEmployer"
            TypeName="Pibt.BLL.Invoice">
            <SelectParameters>
                <asp:Parameter Name="employerId" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </telerik:RadPageView>
</telerik:RadMultiPage>
<asp:HiddenField ID="invoiceNbr" runat="server" />
<div class="bottom-center-buttons">
    <input id="btnExportPdf" type="button" class="btn" value="Export to PDF" onclick="exportPdf();" />
</div>
<script>
    function exportPdf() {
        var link = "/download/ExportInvoiceHistory.aspx?erId=<%=EmployerId %>&invoiceNbr=<%=invoiceNbr.Value %>";
        window.open(link, 'newwindow', 'height=100,width=50,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
    }
</script>