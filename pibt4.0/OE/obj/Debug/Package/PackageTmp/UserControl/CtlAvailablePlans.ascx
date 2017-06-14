<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAvailablePlans.ascx.cs"
    Inherits="Pibt.UserControl.CtlAvailablePlans" %>
<telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="RadComboBox1">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="AvailablePlansGrid" LoadingPanelID="RadAjaxLoadingPanel1" />
                <telerik:AjaxUpdatedControl ControlID="RadComboBox1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManagerProxy>
<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" />
    <div class="customer-info-box">
        <div class="section-body">
            <div class="section-title">
               <asp:Label ID="lb_PlanTypes" runat="server" Text="Select a Plan Type:" Font-Bold="True"></asp:Label>
                <telerik:RadComboBox ID="RadComboBox1" runat="server" Width="386px" CssClass="ComboBox_Continents" Skin="MetroTouch"
                    DataTextField="DESCRIPTION" DataValueField="PLANTYPEID" AutoPostBack="True" />
            </div>
            <div class="section-title">
                Available Plans:
            </div>
            <div id="PADialog">
                <asp:Label ID="LabelInvalid" runat="server" Font-Size="X-Large" Text="" Visible="False"></asp:Label>
            </div>
            <div>
                <telerik:RadGrid ID="AvailablePlansGrid" DataKeyNames="planId" runat="server" AutoGenerateColumns="False"
                    AllowSorting="True" AllowPaging="True" GridLines="None" ShowStatusBar="True" Skin="MetroTouch"
                    CssClass="AutoWidthGrid" CellSpacing="0" DataSourceID="ObjectDataSource1">
                    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                    <MasterTableView AllowMultiColumnSorting="True" DataSourceID="ObjectDataSource1">
                        <CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>
                        <RowIndicatorColumn FilterControlAltText="Filter RowIndicator column" Visible="True">
                        </RowIndicatorColumn>
                        <ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column" Visible="True">
                        </ExpandCollapseColumn>
                        <Columns>
                            <telerik:GridBoundColumn SortExpression="CARRIERNAME" HeaderText="CARRIER NAME" DataField="CARRIERNAME"
                                UniqueName="CARRIERNAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="PLANID" HeaderText="PLAN ID" DataField="PLANID"
                                UniqueName="PLANID" DataType="System.Decimal">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="PLAN NAME" SortExpression="PLANNAME"
                                UniqueName="PLANNAME">
                            </telerik:GridBoundColumn>
                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                            </EditColumn>
                        </EditFormSettings>
                        <PagerStyle PageSizeControlType="RadComboBox" />
                    </MasterTableView>
                </telerik:RadGrid>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetEmployerAvaliblePlansByPlanType"
                    TypeName="Pibt.BLL.Plan">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadComboBox1" Name="typeId" PropertyName="SelectedValue"
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
