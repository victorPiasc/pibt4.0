<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlCurrentPlans.ascx.cs"
    Inherits="Pibt.UserControl.CtlCurrentPlans" %>
<telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="PlanTypeGrid">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="CurrentPlanGrid" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="PlanTypeGrid" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManagerProxy>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    <div class="customer-info-box">
        <div class="section-body">
            <div class="section-title">
                Coverage Type:
            </div>
            <telerik:RadGrid ID="PlanTypeGrid" DataKeyNames="planId" runat="server" AutoGenerateColumns="False"
                AllowSorting="True" AllowPaging="True" PageSize="10" GridLines="None" ShowStatusBar="True" Skin="MetroTouch"
                OnNeedDataSource="PlanTypeGrid_NeedDataSource" CssClass="AutoWidthGrid" OnDataBound="PlanTypeGrid_DataBound"
                OnSelectedIndexChanged="PlanTypeGrid_SelectedIndexChanged">
                <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                <MasterTableView AllowMultiColumnSorting="True" DataKeyNames="PLANTYPEID">
                    <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
                    <Columns>
                        <telerik:GridBoundColumn SortExpression="DESCRIPTION" HeaderText="Plan Type" DataField="DESCRIPTION" UniqueName="DESCRIPTION">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
                <ClientSettings EnablePostBackOnRowClick="true">
                    <Selecting AllowRowSelect="true" />
                </ClientSettings>
            </telerik:RadGrid>
            <br />
            <br />
            <br />
            <div class="section-title">
                Current Plans:
            </div>
            <div>
                <telerik:RadGrid ID="CurrentPlanGrid" DataKeyNames="planId" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                        ShowStatusBar="True" Skin="MetroTouch" CssClass="papersize" OnNeedDataSource="CurrentPlanGrid_NeedDataSource">
                    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                    <MasterTableView AllowMultiColumnSorting="True">
                        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
                        <Columns>
                            <telerik:GridBoundColumn SortExpression="CARRIERNAME" HeaderText="Carrier Name" DataField="CARRIERNAME"
                                UniqueName="CARRIERNAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PLANID" DataType="System.Decimal" HeaderText="Plan ID"
                                SortExpression="PLANID" UniqueName="PLANID">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="PLANNAME" HeaderText="Plan Name" DataField="PLANNAME" UniqueName="PLANNAME">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    </div>
