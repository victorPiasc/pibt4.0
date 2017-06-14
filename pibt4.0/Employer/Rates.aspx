<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rates.aspx.cs" Inherits="Pibt.Employer.Rates" MasterPageFile="~/Content.master" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc2" %>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Literal ID="message" runat="server" Visible="false"></asp:Literal>            
    <div class="customer-info-box">        
        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="current" runat="server" Font-Bold="true" Font-Size="Large" >Current Plans </asp:Label>
                <telerik:RadGrid ID="currentPlans" runat="server" Skin="MetroTouch" AutoGenerateColumns="false" OnNeedDataSource="currentPlans_NeedDataSource">
                    <MasterTableView>
                        <Columns>
                            <telerik:GridBoundColumn DataField="PLANNAME" UniqueName="PLANNAME" HeaderText="Plan Name"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DESCRIPTION" UniqueName="DESCRIPTION" HeaderText="Benefit Type"></telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                <br /><br />
            </div>
            <div class="col-md-12">
                <asp:Label ID="plans" runat="server" Font-Bold="true" Font-Size="Large">Available Plans </asp:Label>
                <telerik:RadGrid ID="plansList" runat="server" Skin="MetroTouch" AutoGenerateColumns="false" OnItemDataBound="plansList_ItemDataBound" EnableLinqExpressions="false" AllowMultiRowSelection="true"> 
                    <MasterTableView DataKeyNames="PLANID" ShowGroupFooter="true">
                        <CommandItemSettings ShowAddNewRecordButton="false" />
                        <Columns>
                            <telerik:GridClientSelectColumn UniqueName="SELECT"></telerik:GridClientSelectColumn>
                            <telerik:GridBoundColumn DataField="PLANID" UniqueName="PLANID" Visible="true" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PLANNAME" UniqueName="PLANNAME" HeaderText="Plan Name" ></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="DESCRIPTION" UniqueName="DESCRIPTION" HeaderText="Benefit Type"></telerik:GridBoundColumn>
                            <telerik:GridCalculatedColumn HeaderText="Employee Pays" UniqueName="EEPAYS" DataType="System.Decimal" Aggregate="Sum" DataFields="DEPRATES,RATES,SUBSIDY,SUBSIDYDEP" Expression="{0}+{1}-{2}-{3}" FooterText="Total:" DataFormatString="{0:C}" FooterAggregateFormatString="{0:C}" ItemStyle-HorizontalAlign="Center"></telerik:GridCalculatedColumn>
                        </Columns>
                    </MasterTableView>
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                    </ClientSettings>
                </telerik:RadGrid>
            </div>
            <div class="col-md-4">
                <asp:Button ID="planComparison" runat="server" Text="Compare" OnClick="planComparison_Click" CssClass="btn" />
            </div>
        </div>
    </div>
</asp:Content>
