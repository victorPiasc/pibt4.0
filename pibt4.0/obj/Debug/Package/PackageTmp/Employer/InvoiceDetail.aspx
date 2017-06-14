<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InvoiceDetail.aspx.cs" Inherits="Pibt.Employer.InvoiceDetail" MasterPageFile="~/Content.master" %>

<%@ Register Src="/UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>

<asp:Content ID="frame" runat="server" ContentPlaceHolderID="FrameHeaderPlaceHolder">
    Invoice Detail 
</asp:Content>
<asp:Content ID="leftMenu" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="main" runat="server" ContentPlaceHolderID="MainContentPlaceHolder">
    <div class="customer-info-box">
        <div class="row simpleText" style="padding-bottom: 20px;">
            <div class="col-md-4">
                <div style="border: 1px solid #000000; padding: 10px;">
                    <div>
                        <table>
                            <tbody>
                                <tr>
                                    <td><%= employerName %></td>
                                </tr>
                                <tr>
                                    <td><%= address %> </td>
                                </tr>
                                <tr>
                                    <td><%= city %>, <%= state %> <%= zip %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td>Primary Contact:</td>
                                <td><%= contact %></td>
                            </tr>
                            <tr>
                                <td>Phone Number: </td>
                                <td><%= phoneNbr %></td>
                            </tr>
                            <tr>
                                <td>EMail Address:</td>
                                <td><%= email %></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div style="border: 1px solid #000000; padding: 10px;">
                    <table style="width: 60%;">
                        <tbody>
                            <tr>
                                <td>Account: </td>
                                <td><%= EmployerId %></td>
                            </tr>
                            <tr>
                                <td>Invoice Date: </td>
                                <td><%= invoiceDate.ToShortDateString() %></td>
                            </tr>
                            <tr>
                                <td>Invoice Number:</td>
                                <td><%= invoiceNbr %></td>
                            </tr>
                            <tr>
                                <td>Due Date: </td>
                                <td><%= dueDate.ToShortDateString() %></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <fieldset>
                    <legend>Employee/Dependent Detail:</legend>
                    <div style="height: 350px; overflow: auto">
                        <telerik:RadGrid ID="details" runat="server" Skin="MetroTouch" AutoGenerateColumns="false" EnableLinqExpressions="false" OnSortCommand="details_SortCommand">
                            <MasterTableView DataKeyNames="memberId">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="memberId" UniqueName="memberId" SortExpression="memberId" HeaderText="Member ID">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="lastName" UniqueName="lastName" SortExpression="lastName" HeaderText="Last Name">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="firstName" UniqueName="firstName" SortExpression="firstName" HeaderText="First Name">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="type" UniqueName="type" SortExpression="type" HeaderText="Type">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="effectiveDate" UniqueName="effectiveDate" SortExpression="effectiveDate" HeaderText="Eff Date" DataFormatString="{0:d}">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="planName" UniqueName="planName" SortExpression="planName" HeaderText="Plan">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="description" UniqueName="description" SortExpression="description" HeaderText="Benefit">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="amount" UniqueName="amount" SortExpression="amount" HeaderText="Premium" DataFormatString="{0:C}" DataType="System.Decimal">
                                        <HeaderStyle Width="110px" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="commissionAmount" UniqueName="commissionAmount" SortExpression="commissionAmount" HeaderText="Commission" DataFormatString="{0:C}" DataType="System.Decimal">
                                        <HeaderStyle Width="110px" />
                                        <ItemStyle HorizontalAlign="Right" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                     <div style="padding-right:10px;">
                            <table style="float: right; font-size: 16px;">
                                <tbody>
                                    <tr>
                                        <td><b>Plans Total:</b></td>
                                        <td style="width: 110px; text-align: right;"><%= premTotal.ToString("c") %></td>
                                        <td style="width: 110px; text-align: right;"><%= commTotal.ToString("c") %></td>
                                    </tr>
                                    <tr style="border-bottom:solid 1px #000000">
                                        <td><b>Adujstment:</b></td>
                                        <td style="width: 110px; text-align: right;"><%= adjustment.ToString("c") %> </td>
                                        <td style="width: 110px; text-align: right;"></td>
                                    </tr>
                                    <tr>
                                        <td><b>Grand Total:</b></td>
                                        <td style="width: 110px; text-align: right;"><%= grandTotal.ToString("c") %></td>
                                        <td style="width: 110px; text-align: right;"><%= commTotal.ToString("c") %></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                </fieldset>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <fieldset>
                    <legend>Summary:</legend>
                    <div style="height: 10%; overflow: auto">
                        <telerik:RadGrid ID="summary" runat="server" Skin="MetroTouch" EnableLinqExpressions="false" OnSortCommand="summary_SortCommand" AutoGenerateColumns="false" ShowFooter="true" Width="50%">
                            <MasterTableView DataKeyNames="PlanName">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="PlanName" UniqueName="planName" HeaderText="Plan Name" SortExpression="planName"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="premium" UniqueName="premium" HeaderText="Premium" SortExpression="premium" DataFormatString="{0:C}" FooterAggregateFormatString="{0:C}" Aggregate="Sum">
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle HorizontalAlign="Right" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="commission" UniqueName="commission" HeaderText="Commission" SortExpression="commission" DataFormatString="{0:C}" FooterAggregateFormatString="{0:C}" Aggregate="Sum">
                                        <ItemStyle HorizontalAlign="Right" />
                                        <FooterStyle HorizontalAlign="Right" />
                                    </telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>
