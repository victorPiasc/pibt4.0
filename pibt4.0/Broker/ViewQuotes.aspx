<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewQuotes.aspx.cs" Inherits="Pibt.Broker.ViewQuotes" MasterPageFile="~/Content.master"  %>
<%@ Register Src="/UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<%@ Register Src="/UserControl/CtlQQ5.ascx" TagName="CtlDashboard" TagPrefix="uc2" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="FrameHeaderPlaceHolder">
    <a href="/">Home</a> > Brokers > Quote List
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content" runat="server" ContentPlaceHolderID="MainContentPlaceHolder">
    <div class="row">
        <div class="col-md-12">
            <telerik:RadGrid ID="quotes" runat="server" Skin="MetroTouch" AutoGenerateColumns="false" EnableLinqExpressions="false" OnNeedDataSource="quotes_NeedDataSource" OnItemCommand="quotes_ItemCommand" >
                <MasterTableView DataKeyNames="cart">
                    <Columns>
                        <telerik:GridBoundColumn DataField="cart" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="zip" Display="false"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="name" HeaderText="Employer" SortExpression="name"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="ee" HeaderText="No. of<br/>Employees" SortExpression="ee"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="dep" HeaderText="No. of<br/>Dependents" SortExpression="dep"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="dateGen" HeaderText="Date<br/>Generated" SortExpression="dep" DataFormatString="{0:d}" DataType="System.DateTime"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="isRenewal" HeaderText="New/Renewal" SortExpression="isRenewal"></telerik:GridBoundColumn>
                        <telerik:GridButtonColumn ButtonCssClass="btn" ButtonType="PushButton" Text="View" CommandName="view" HeaderText="View" ></telerik:GridButtonColumn>
                        <telerik:GridButtonColumn ButtonCssClass="btn-green" ButtonType="PushButton" Text="Accept" CommandName="accept" HeaderText="Employer<br/>Acceptance" ></telerik:GridButtonColumn>
                        <telerik:GridButtonColumn ButtonCssClass="btn-red" ButtonType="PushButton" Text="Reject" CommandName="reject" HeaderText="Employer<br/>Rejection"></telerik:GridButtonColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">

        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <uc2:CtlDashboard ID="ctlDashBoard1" runat="server" />
        </div>
    </div>

</asp:Content>