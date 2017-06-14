<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlBrokerInvoiceHistory.ascx.cs" Inherits="Pibt.UserControl.CtlBrokerInvoiceHistory" %>
<%@ Register Src="/UserControl/CtlQuickViewEr.ascx" TagName="QuickView" TagPrefix="uc1" %>
<%@ Register Src="/UserControl/CtlQuickViewInvoice.ascx" TagName="qvInvoice" TagPrefix="uc2"  %>
<div id="qvPopUp" class="quickPopUp" >
    <uc1:QuickView id="quickView" runat="server" ></uc1:QuickView>
</div>
<div id="qvInvoice" class="quickPopUp">
    <uc2:qvInvoice ID="qvInvoice1" runat="server" />
</div>
<div class="row">
    <div class="col-md-12">
        <fieldset>
            <legend>Filter</legend>
            <asp:Panel ID="panel1" runat="server" DefaultButton="btnSearch">
                <div class="row">
                    <div class="col-md-6">
                        <table style="width:100%">
                            <tr>
                                <td style="width:100px;">Search:</td>
                                <td><asp:TextBox ID="tbSearch" runat="server" CssClass="form-control" MaxLength="60"></asp:TextBox></td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click" />
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn-red" OnClick="btnClear_Click" />
                    </div>
                </div>
            </asp:Panel>
        </fieldset>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <fieldset>
            <telerik:RadGrid ID="invoiceHist" runat="server" Skin="MetroTouch" AutoGenerateColumns="false" EnableLinqExpressions="false" OnNeedDataSource="invoiceHist_NeedDataSource" AllowMultiRowSelection="false" AllowPaging="true">
                <PagerStyle  PageSizes="10" Mode="NextPrevAndNumeric" PageSizeControlType="None"/>
                <ClientSettings>
                    <ClientEvents OnCommand="OnCommand" />
                </ClientSettings>
                <MasterTableView DataKeyNames="employerId" ClientDataKeyNames="employerId" >
                    <Columns>
                        <telerik:GridBoundColumn DataField="employerid" UniqueName="employerid" HeaderText="Employer ID"></telerik:GridBoundColumn>
                        <telerik:GridButtonColumn DataTextField="name" Text="{0}" ButtonType="LinkButton" UniqueName="name" HeaderText="Name" CommandName="open" ItemStyle-Font-Underline="true"></telerik:GridButtonColumn>
                        <telerik:GridBoundColumn DataField="address" UniqueName="address" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="city" UniqueName="city" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="state" UniqueName="state" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="zip" UniqueName="zip" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="contact" UniqueName="contact" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="phoneNbr" UniqueName="phoneNbr" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="email" UniqueName="email" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridHyperLinkColumn DataTextField="invoiced" UniqueName="invoiced" HeaderText="Premium Invoiced" SortExpression="invoiced" DataNavigateUrlFields="employerId, invoiceNbr" DataNavigateUrlFormatString="/Employer/invoiceDetail.aspx?erId={0}&invId={1}" Target="true" Text="{0}" DataTextFormatString="{0:C}" >
                            <ItemStyle HorizontalAlign="Right" Font-Underline="true" />
                        </telerik:GridHyperLinkColumn>
                        <telerik:GridBoundColumn DataField="paid" UniqueName="paid" HeaderText="Premium Paid" DataFormatString="{0:C}" DataType="System.Decimal" SortExpression="paid">
                            <ItemStyle HorizontalAlign="Right" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="invoiceDate" UniqueName="invoiceDate" HeaderText="Invoice Date" SortExpression="invoiceDate" DataType="System.DateTime" DataFormatString="{0:d}">
                            <ItemStyle HorizontalAlign="Center" />
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="invoiceNbr" UniqueName="invoiceNbr" Display="false"></telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </fieldset>
    </div>
</div>