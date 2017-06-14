<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
   CodeBehind="TerminateForm.aspx.cs" Inherits="Pibt.OE.TerminateForm" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
   TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
   <script>
      function SelectMasterTableItems(o) {
         var masterTable = $find("<%= RadGridPlans.ClientID %>").get_masterTableView();
           if (o == true) {

              <%-- select all master table items --%>
              masterTable.selectAllItems();
           }
           else {
              masterTable.clearSelectedItems();
           }
        }

        function OnClientSelectedIndexChanged(sender, eventArgs) {
        }
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
   <uc3:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
   <input type="button" class="ImgHome" value=" " />
   <a href="/">Home</a> / Enroller Form / Terminate Plans
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
   <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
   <br />
   <fieldset>
      <div class="customer-info-box">
         <div class="section-title">
            Termination Reason:
         </div>
         <div class="section-body">
            <telerik:RadComboBox ID="dpReason" Width="500" runat="server" OnClientSelectedIndexChanged="OnClientSelectedIndexChanged" Skin="MetroTouch"
               DataSourceID="OdsTReason" DataTextField="Reason" DataValueField="TReasonId" OnDataBound="dpReason_DataBound" EmptyMessage="Select Reason...">
            </telerik:RadComboBox>
            <asp:ObjectDataSource ID="OdsTReason" runat="server" SelectMethod="GetTReason" TypeName="Pibt.BLL.EnrollmentForm">
               <SelectParameters>
                  <asp:SessionParameter DefaultValue="3" Name="specialReasonId" SessionField="OETypeId" Type="Int32" />
               </SelectParameters>
            </asp:ObjectDataSource>
         </div>
      </div>
      <div class="customer-info-box">
         <div class="section-title">
            Available Plan(s):
         </div>
         <div class="section-body">
            <telerik:RadGrid ID="RadGridPlans" DataKeyNames="Memberplanid" AllowMultiRowSelection="True" Skin="MetroTouch"
               CssClass="EnrollmentPlanGrid" runat="server" AutoGenerateColumns="False" AllowSorting="True"
               AllowPaging="True" Width="100%" ShowStatusBar="True" OnNeedDataSource="RadGridPlans_NeedDataSource"
               OnSelectedIndexChanged="RadGridPlans_SelectedIndexChanged" OnPreRender="RadGridPlans_PreRender">
               <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
               <ClientSettings EnablePostBackOnRowClick="true">
                  <Selecting AllowRowSelect="true" />
               </ClientSettings>
               <MasterTableView AllowMultiColumnSorting="True" DataKeyNames="Memberplanid,employeeType,description">
                  <Columns>
                     <telerik:GridBoundColumn SortExpression="firstname" HeaderText="Name" DataField="firstname" UniqueName="firstname">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn SortExpression="employeeType" HeaderText="Type" DataField="employeeType" UniqueName="employeeType">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn SortExpression="description" HeaderText="Plan Type" DataField="description" UniqueName="plantype">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="planname" HeaderText="Plan Name" SortExpression="planname" UniqueName="planname">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="memberplanid" HeaderText="Plan ID" SortExpression="memberplanid" UniqueName="memberplanid" Display="false">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="effectivedate" HeaderText="Effective Date" SortExpression="effectivedate" DataType="System.DateTime"
                        UniqueName="effectivedate" DataFormatString="{0:MM/dd/yyyy}">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="expirydate" HeaderText="Expiry Date" SortExpression="expirydate" DataType="System.DateTime"
                        UniqueName="expirydate" DataFormatString="{0:MM/dd/yyyy}">
                     </telerik:GridBoundColumn>
                  </Columns>
               </MasterTableView>
            </telerik:RadGrid>
         </div>
      </div>
      <div class="customer-info-box">
         <div class="section-title">
            Expiry Date:
         </div>
         <div class="section-body">
            <telerik:RadComboBox ID="dtExpiryDate" runat="server" Skin="MetroTouch">
            </telerik:RadComboBox>
         </div>
      </div>
      <div class="note-list">
         <ul class="items">
            <li><span class="Required">If further documentation is required you will be contacted by <%=Pibt.Common.Utilities.Us()%>.</span></li>
            <li><span class="Required">If the termination is considered a "COBRA Qualifying Event", COBRA will be mailed within the next 14-days.  To verify COBRA
                eligibility, please contact <%=Pibt.Common.Utilities.Us()%>.</span></li>
            <li><span class="Required">Contact <%=Pibt.Common.Utilities.Us()%> for further assistance on terminatin options.</span></li>
         </ul>
      </div>
      <div class="bottom-center-buttons">
         <asp:Button runat="server" CssClass="btn" ID="BtNext" Text="Next" OnClick="BtNext_Click"
            Width="98px" />
      </div>
      <div id="OEAlertDialog" class="message-error">
         <asp:Literal ID="lblMsg" ViewStateMode="Disabled" runat="server"></asp:Literal>
      </div>
   </fieldset>
</asp:Content>
