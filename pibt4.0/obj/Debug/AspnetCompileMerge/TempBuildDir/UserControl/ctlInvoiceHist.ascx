<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlInvoiceHist.ascx.cs"
    Inherits="Pibt.UserControl.CtlInvoiceHist" %>
<telerik:RadGrid ID="InvoiceHistGrid" DataKeyNames="invoiceNbr" runat="server" AutoGenerateColumns="False"
    AllowSorting="True" AllowPaging="True" PageSize="10" GridLines="None" ShowStatusBar="True" Skin="MetroTouch"
    Style="margin-bottom: 20px;" OnDataBound="InvoiceHistGrid_DataBound" OnNeedDataSource="InvoiceHistGrid_NeedDataSource"
    CellSpacing="0" OnSelectedIndexChanged="InvoiceHistGrid_SelectedIndexChanged">
    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
    <MasterTableView DataKeyNames="INVOICENBR" AllowMultiColumnSorting="True">
        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
        <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
        </RowIndicatorColumn>
        <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
        </ExpandCollapseColumn>
        <Columns>
            <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" SortExpression="INVOICEDATE"
                HeaderText="Invoice Date" DataField="INVOICEDATE" UniqueName="INVOICEDATE" DataType="System.DateTime">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" SortExpression="DUEDATE"
                HeaderText="Due Date" DataField="DUEDATE" UniqueName="DUEDATE" DataType="System.DateTime">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn SortExpression="INVOICENBR" HeaderText="Invoice #" DataField="INVOICENBR" UniqueName="INVOICENBR" DataType="System.Decimal">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataFormatString="{0:C}" DataField="OTHERCHARGEAMOUNT" DataType="System.Decimal"
                HeaderText="Other Charge Amount" SortExpression="OTHERCHARGEAMOUNT" UniqueName="OTHERCHARGEAMOUNT">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataFormatString="{0:C}" DataField="TOTALINVOICEAMOUNT"
                DataType="System.Decimal" HeaderText="Total Invoice Amount" SortExpression="TOTALINVOICEAMOUNT" UniqueName="TOTALINVOICEAMOUNT">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataFormatString="{0:C}" SortExpression="BALANCEFORWARD"
                HeaderText="Balance Forward" DataField="BALANCEFORWARD" UniqueName="BALANCEFORWARD" DataType="System.Decimal">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataFormatString="{0:C}" SortExpression="TOTALAMOUNTDUE"
                HeaderText="Total Amount Due" DataField="TOTALAMOUNTDUE" UniqueName="TOTALAMOUNTDUE" DataType="System.Decimal">
            </telerik:GridBoundColumn>
        </Columns>
        <EditFormSettings>
            <EditColumn FilterControlAltText="Filter EditCommandColumn column">
            </EditColumn>
        </EditFormSettings>
        <PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
    </MasterTableView>
    <ClientSettings EnablePostBackOnRowClick="true">
        <Selecting AllowRowSelect="true" />
    </ClientSettings>
    <FilterMenu EnableImageSprites="False">
    </FilterMenu>
</telerik:RadGrid>
<asp:HiddenField ID="SelectedInvoiceNbr" runat="server" />
<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">
        var invoiceId = "<%=SelectedInvoiceNbr.Value %>";
        function customResponseEnd(sernder, args) {
            invoiceId = $("#<%=SelectedInvoiceNbr.ClientID %>").val(); 
        }
    </script>
</telerik:RadCodeBlock>
<div class="dontprint">
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage1" Skin="MetroTouch" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab runat="server" Text="Invoice Details" PageViewID="PageView1" />
        </Tabs>
    </telerik:RadTabStrip>
</div>
<telerik:RadMultiPage runat="server" ID="RadMultiPage1" SelectedIndex="0" RenderSelectedPageOnly="false">
    <telerik:RadPageView runat="server" ID="PageView1">
        <telerik:RadGrid runat="server" ID="InvoiceHistDetailGrid" DataKeyNames="EMPLOYEEID" Skin="MetroTouch"
            ShowFooter="True" AllowSorting="True" ShowStatusBar="True" Style="margin-bottom: 20px;"
            CellSpacing="0" GridLines="None" OnNeedDataSource="InvoiceHistDetailGrid_NeedDataSource">
            <MasterTableView ShowHeader="true" AutoGenerateColumns="False" DataKeyNames="EMPLOYEEID"
                AllowPaging="true" PageSize="8" HierarchyLoadMode="ServerOnDemand">
                <Columns>
                    <telerik:GridBoundColumn DataField="INVOICENBR" DataType="System.Decimal" HeaderText="Invoice #"
                        SortExpression="INVOICENBR" UniqueName="INVOICENBR">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EMPLOYEEID" DataType="System.Decimal" HeaderText="Employee ID"
                        SortExpression="EMPLOYEEID" UniqueName="EMPLOYEEID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="LASTNAME" HeaderText="Last Name" SortExpression="LASTNAME" UniqueName="LASTNAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="FIRSTNAME" HeaderText="First Name" SortExpression="FIRSTNAME" UniqueName="FIRSTNAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GENDER" HeaderText="Gender" SortExpression="GENDER" UniqueName="GENDER">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="BIRTHDATE" HeaderText="Birthdate" SortExpression="BIRTHDATE" UniqueName="BIRTHDATE">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AGE" DataType="System.Decimal" HeaderText="Age" SortExpression="AGE" UniqueName="AGE">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataFormatString="{0:C}" DataField="AMOUNTTOTAL" DataType="System.Decimal"
                        HeaderText="Amount Total" SortExpression="AMOUNTTOTAL" UniqueName="AMOUNTTOTAL">
                    </telerik:GridBoundColumn>
                </Columns>
                <DetailTables>
                    <telerik:GridTableView AutoGenerateColumns="false" DataKeyNames="Employeeid" DataSourceID="odsInvoiceHistDetails"
                        Width="100%">
                        <ParentTableRelation>
                            <telerik:GridRelationFields DetailKeyField="Employeeid" MasterKeyField="EMPLOYEEID" />
                        </ParentTableRelation>
                        <Columns>
                            <telerik:GridBoundColumn DataField="COVERAGETYPE" HeaderText="Coverage Type" SortExpression="COVERAGETYPE" UniqueName="COVERAGETYPE">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="CHARGESTATUS" HeaderText="Charge Status" SortExpression="CHARGESTATUS" UniqueName="CHARGESTATUS">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="Plan Nane" SortExpression="PLANNAME" UniqueName="PLANNAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridNumericColumn Aggregate="Sum" DataField="AMOUNTDUE" DataFormatString="{0:C}"
                                FooterAggregateFormatString="TOTAL AMOUNT: {0:C}" HeaderText="Amount Due" SortExpression="AMOUNTDUE" UniqueName="AMOUNTDUE">
                            </telerik:GridNumericColumn>
                        </Columns>
                    </telerik:GridTableView>
                </DetailTables>
                <PagerStyle PageSizeControlType="RadComboBox" />
            </MasterTableView>
            <PagerStyle PageSizeControlType="RadComboBox" />
            <FilterMenu EnableImageSprites="False">
            </FilterMenu>
        </telerik:RadGrid>
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
            CellSpacing="0" GridLines="None" OnNeedDataSource="OtherChargeDetailsGrid_NeedDataSource">
            <MasterTableView ShowHeader="true" AutoGenerateColumns="False" AllowPaging="true"
                PageSize="8" HierarchyLoadMode="ServerOnDemand">
                <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                </RowIndicatorColumn>
                <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="DESCRIPTION" HeaderText="Description" SortExpression="DESCRIPTION" UniqueName="DESCRIPTION">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CHARGEAMOUNT" DataFormatString="{0:C}" DataType="System.Decimal"
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
    </telerik:RadPageView>
</telerik:RadMultiPage>
<div class="dontprint">
    <telerik:RadTabStrip runat="server" ID="RadTabStrip2" MultiPageID="RadMultiPage1" Skin="MetroTouch" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab runat="server" Text="Invoice Summary" PageViewID="PageView1" />
        </Tabs>
    </telerik:RadTabStrip>
</div>
<telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0" RenderSelectedPageOnly="false">
    <telerik:RadPageView runat="server" ID="RadPageView1" BorderWidth="1px">
        <asp:DetailsView ID="InvoiceSummaryView1" AllowPaging="True" GridLines="None" runat="server" 
            Font-Italic="True" AutoGenerateRows="False" Font-Size="Larger" Font-Names="Open Sans">
            <Fields>
                <asp:BoundField DataFormatString="{0:MM/dd/yyyy}" HeaderText="Invoice Date:" DataField="invoiceDate"
                    HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true" SortExpression="invoiceDate" />
                <asp:BoundField HeaderText="Invoice #:" DataField="invoiceNbr" HeaderStyle-Font-Italic="false"
                    HeaderStyle-Font-Bold="true" SortExpression="invoiceNbr" />
                <asp:BoundField DataFormatString="{0:MM/dd/yyyy}" HeaderText="Due Date:" DataField="dueDate"
                    HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true" SortExpression="dueDate" />
                <asp:BoundField DataFormatString="{0:C}" HeaderText="Total Other Charges:" DataField="otherChargeAmount"
                    HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true" SortExpression="otherChargeAmount" />
                <asp:BoundField DataFormatString="{0:C}" HeaderText="Total Current Month Invoice:"
                    DataField="totalInvoiceAmount" HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true"
                    SortExpression="totalInvoiceAmount" />
                <asp:BoundField DataFormatString="{0:C}" HeaderText="Balance Forward:" DataField="balanceforward"
                    HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true" SortExpression="balanceforward" />
                <asp:BoundField DataFormatString="{0:C}" HeaderText="Total Due Now:" DataField="totalAmountDue"
                    HeaderStyle-Font-Italic="false" HeaderStyle-Font-Bold="true" SortExpression="totalAmountDue" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="GetInvoiceHistSummary"
            TypeName="Pibt.BLL.Invoice">
            <SelectParameters>
                <asp:ControlParameter ControlID="InvoiceHistGrid" Name="invoiceNbr" PropertyName="SelectedValue"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </telerik:RadPageView>
</telerik:RadMultiPage>
<asp:ObjectDataSource ID="odsInvoiceHistDetails" runat="server" SelectMethod="GetInvoiceHistoryDetails"
    TypeName="Pibt.BLL.Invoice">
    <SelectParameters>
        <asp:ControlParameter ControlID="InvoiceHistGrid" Name="invoiceNbr" DefaultValue="-1"
            PropertyName="SelectedValue" Type="String" />
        <asp:ControlParameter ControlID="InvoiceHistDetailGrid" Name="employeeId" DefaultValue="-1"
            PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
