<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlRatesHopper.ascx.cs" Inherits="Pibt.UserControl.CtlRatesHopper" %>
<telerik:RadAjaxManagerProxy ID="AjaxMangerProxy1" runat="server">
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
            Select a Plan:
         </div>
         <telerik:RadGrid ID="PlanTypeGrid" DataKeyNames="planId" runat="server" AutoGenerateColumns="false"
            AllowSorting="true" AllowPaging="true" PageSize="10" GridLines="None" ShowStatusBar="true" Skin="MetroTouch"
            OnNeedDataSource="PlanTypeGrid_NeedDataSource" CssClass="AutoWidthGrid" OnDataBound="PlanTypeGrid_DataBound"
            OnSeletedIndexChanged="PlanTypeGrid_SelectedIndexChanged">
            <PagerStyle Mode="NextPrevAndNumeric" />
            <MasterTableView AllowMultiColumnSorting="True" DataKeyNames="PlanTypeId">
               <CommandItemSettings ExportToPdfText="Export to PDF" />
               <Columns>
                  <telerik:GridBoundColumn SortExpression="Description" HeaderText="Benefit Type" DataField="Description" UniqueName="Description">
                  </telerik:GridBoundColumn>
               </Columns>
            </MasterTableView>
         <ClientSettings EnablePostBackOnRowClick="true">
             <Selecting AllowRowSelect="true" />
         </ClientSettings>
         </telerik:RadGrid>
         <div class="section-title">
            Plans
         </div>
         <div>
            <telerik:RadGrid ID="CurrentPlanGrid" DataKeyNames="PlanId" runat="server" AutoGenerateColumns="false" AllowSorting="true" AllowPaging="true"
                   ShowStatusBar="true" Skin="MetroTouch" CssClass="papersize" OnNeedDataSource="CurrentPlanGrid_NeedDataSource">
               <PagerStyle Mode="NextPrevAndNumeric" />
               <MasterTableView AllowMultiColumnSorting="true">
                  <CommandItemSettings ExportToPdfText="Export to PDF" />
                  <Columns>
                      <telerik:GridBoundColumn SortExpression="CarrierName" HeaderText="Carrier Name" DataField="CARRIERNAME" UniqueName="PLANNAME">
                      </telerik:GridBoundColumn>
                  </Columns>
               </MasterTableView>
            </telerik:RadGrid>
         </div>
      </div>
   </div>
