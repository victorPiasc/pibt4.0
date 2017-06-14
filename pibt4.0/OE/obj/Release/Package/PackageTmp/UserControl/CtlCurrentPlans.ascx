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
                Select a Plan Type:
            </div>
            <telerik:RadGrid ID="PlanTypeGrid" DataKeyNames="planId" runat="server" AutoGenerateColumns="False"
                AllowSorting="True" AllowPaging="True" PageSize="10" GridLines="None" ShowStatusBar="True" Skin="MetroTouch"
                OnNeedDataSource="PlanTypeGrid_NeedDataSource" CssClass="AutoWidthGrid" OnDataBound="PlanTypeGrid_DataBound"
                OnSelectedIndexChanged="PlanTypeGrid_SelectedIndexChanged">
                <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                <MasterTableView AllowMultiColumnSorting="True" DataKeyNames="PLANTYPEID">
                    <CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
                    <Columns>
                        <telerik:GridBoundColumn SortExpression="DESCRIPTION" HeaderText="PLAN TYPE" DataField="DESCRIPTION"
                            UniqueName="DESCRIPTION">
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
                Current Covered Plans:
            </div>
            <div>
                <telerik:RadGrid ID="CurrentPlanGrid" DataKeyNames="planId" runat="server" AutoGenerateColumns="False"
                    AllowSorting="True" AllowPaging="True" ShowStatusBar="True" Skin="MetroTouch"
                    Width="895px" CssClass="AutoWidthGrid" OnNeedDataSource="CurrentPlanGrid_NeedDataSource">
                    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                    <MasterTableView AllowMultiColumnSorting="True">
                        <CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
                        <Columns>
                            <telerik:GridBoundColumn SortExpression="CARRIERNAME" HeaderText="CARRIER NAME" DataField="CARRIERNAME"
                                UniqueName="CARRIERNAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PLANID" DataType="System.Decimal" HeaderText="PLAN ID"
                                SortExpression="PLANID" UniqueName="PLANID">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="PLANNAME" HeaderText="PLAN NAME" DataField="PLANNAME"
                                UniqueName="PLANNAME">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    </div>
