<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlInvoiceAR.ascx.cs" Inherits="Pibt.UserControl.CtlInvoiceAR" %>

<telerik:RadGrid ID="InvoiceGrid" runat="server" Width="100%"
    AutoGenerateColumns="False" AllowSorting="True" Skin="MetroTouch"
    AllowPaging="True" PageSize="15" GridLines="None" ShowStatusBar="True"
    onneeddatasource="InvoiceGrid_NeedDataSource">
    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
    <MasterTableView AllowMultiColumnSorting="True">
        <Columns>
            <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" SortExpression="TRANSDATE" HeaderText="Transaction Date" DataField="TRANSDATE"
                UniqueName="TRANSDATE" DataType="System.DateTime">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn SortExpression="LASTCHECK" HeaderText="Check #" DataField="LASTCHECK" UniqueName="LASTCHECK" DataType="System.Decimal">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataFormatString="{0:C}" SortExpression="PAYMENTAMT" HeaderText="Payment Amount" DataField="PAYMENTAMT"
                UniqueName="PAYMENTAMT" DataType="System.Decimal">
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
 
