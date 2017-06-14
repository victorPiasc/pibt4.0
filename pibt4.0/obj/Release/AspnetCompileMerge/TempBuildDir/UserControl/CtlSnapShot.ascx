<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlSnapShot.ascx.cs" Inherits="Pibt.UserControl.CtlSnapShot" %>
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
            <div class="row">
                <div class="col-md-6">
                    <table style="width:100%">
                        <tr>
                            <td style="width:100px;">Search:</td>
                            <td><asp:TextBox ID="tbSearch" runat="server" CssClass="form-control" MaxLength="60"></asp:TextBox></td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-6">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn-red" OnClick="btnClear_Click" />
                </div>
            </div>
        </fieldset>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <fieldset>
            <telerik:RadGrid ID="snapshot" runat="server" Skin="MetroTrouch" AutoGenerateColumns="false" OnNeedDataSource="snapshot_NeedDataSource" EnableLinqExpressions="false" AllowMultiRowSelection="false">
                <ClientSettings>
                    <ClientEvents OnCommand="OnCommand" />
                </ClientSettings>
                <MasterTableView DataKeyNames="employerId" ClientDataKeyNames="employerId">
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
                        <telerik:GridBoundColumn DataField="invoiced" UniqueName="invoiced" HeaderText="Premium Invoiced" SortExpression="invoiced"></telerik:GridBoundColumn>
                        <telerik:GridButtonColumn DataTextField="paid" UniqueName="paid" HeaderText="Premium Paid" ButtonType="LinkButton" Text="{0}" CommandName="snapshot" ItemStyle-Font-Underline="true"></telerik:GridButtonColumn>
                        <telerik:GridBoundColumn DataField="invoiceDate" UniqueName="invoiceDate" HeaderText="invoiceDate" SortExpression="invoiceDate"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="commission" UniqueName="commission" HeaderText="Commissions Earned" SortExpression="commission"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="month" UniqueName="month" HeaderText="Month Payable" SortExpression="month"></telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </fieldset>
    </div>
</div>