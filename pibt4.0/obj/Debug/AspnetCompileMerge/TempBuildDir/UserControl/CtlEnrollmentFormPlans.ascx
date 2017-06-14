<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEnrollmentFormPlans.ascx.cs"
    Inherits="Pibt.UserControl.CtlEnrollmentFormPlans" %>
<asp:Panel ID="AddButtonPlaceHolder" runat="server">
    <div class="customer-info-box">
        <div class="section-body">
            <fieldset>
                <legend>Coverage Type:</legend>
                <asp:DropDownList ID="PlanTypesComb" runat="server" Width="456px" CssClass="form-control" autofocus="autofocus" Height="34px"
                    DataTextField="DESCRIPTION" DataValueField="PLANTYPEID" AutoPostBack="True" OnSelectedIndexChanged="PlanTypesComb_SelectedIndexChanged" />
            </fieldset>
            <div class="section-title">
            </div>
         <asp:PlaceHolder ID="CurrentPlanPlaceHolder" runat="server">
             <fieldset>
                <legend>Current Plan(s):</legend>
                <telerik:RadGrid ID="InsuredPlansGrid" runat="server" DataKeyNames="planId" OnNeedDataSource="InsuredPlansGrid_NeedDataSource"
                    CssClass="ChoosePlanGrid" AutoGenerateColumns="False" AllowSorting="True" Skin="MetroTouch" 
                    AllowPaging="True" CellSpacing="0" GridLines="None">
                    <MasterTableView AllowMultiColumnSorting="true">
                        <Columns> 
                            <telerik:GridBoundColumn DataField="NAME" HeaderText="Carrier Name" SortExpression="NAME" UniqueName="NAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="planname" HeaderText="Plan Name" SortExpression="PLANNAME" UniqueName="PLANNAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="MEMBERID" HeaderText="Member ID" DataField="MEMBERID"
                                UniqueName="MEMBERID" DataType="System.Decimal">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="fullname" HeaderText="Name" SortExpression="NAME" UniqueName="NAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EFFECTIVEDATE" HeaderText="Plan Effective Date"
                                SortExpression="EFFECTIVEDATE" UniqueName="EFFECTIVEDATE" DataFormatString="{0:MM/dd/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="expirydate" HeaderText="Expiry Date" SortExpression="expirydate"
                                UniqueName="expirydate" DataFormatString="{0:MM/dd/yyyy}">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
                </fieldset>
               <br />
         </asp:PlaceHolder>
            <fieldset>
                <legend>Plan Choice: (Select One)</legend>
                <telerik:RadGrid ID="AvailablePlansGrid" DataKeyNames="planId" AllowMultiRowSelection="False"
                    runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" Skin="MetroTouch" 
                    CssClass="ChoosePlanGrid" GridLines="None" ShowStatusBar="True" OnNeedDataSource="AvailablePlansGrid_NeedDataSource">
                    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                    <MasterTableView AllowMultiColumnSorting="True">
                        <Columns>
                            <telerik:GridClientSelectColumn UniqueName="CheckboxSelectColumn" HeaderText="Select" ItemStyle-HorizontalAlign="center" >
                              <HeaderStyle Width="70px" />
                               <ItemStyle Width="70px" />
                            </telerik:GridClientSelectColumn>
                            <telerik:GridBoundColumn SortExpression="CARRIERNAME" HeaderText="Carrier Name" DataField="CARRIERNAME" UniqueName="CARRIERNAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="PLANID" HeaderText="Plan ID" DataField="PLANID"
                                UniqueName="PLANID" DataType="System.Decimal">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="Plan Name" SortExpression="PLANNAME" UniqueName="PLANNAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="CARRIERID" DataField="CARRIERID" UniqueName="CARRIERID" Display="false" DataType="System.Int32" ></telerik:GridBoundColumn>
                        </Columns>
                        <NoRecordsTemplate>
                            There is no available plan.
                        </NoRecordsTemplate>
                    </MasterTableView>
                    <ClientSettings EnableRowHoverStyle="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                </telerik:RadGrid>
            </fieldset>
            <div class="section-title">
            </div>
            <fieldset>
                <legend>Eligible Enrollee(s):</legend>
                <telerik:RadGrid ID="RadGridEnrollers" DataKeyNames="memberId" AllowMultiRowSelection="True"
                    runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" Skin="MetroTouch" 
                    CssClass="ChoosePlanGrid" GridLines="None" ShowStatusBar="True">
                    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <MasterTableView AllowMultiColumnSorting="True">
                        <Columns>
                            <telerik:GridClientSelectColumn UniqueName="CheckboxSelectColumn">
                            </telerik:GridClientSelectColumn>
                            <telerik:GridBoundColumn SortExpression="EMPLOYEEID" HeaderText="Family ID" DataField="EMPLOYEEID"
                                UniqueName="EMPLOYEEID" DataType="System.Decimal">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="MEMBERID" HeaderText="Member ID" DataField="MEMBERID"
                                UniqueName="MEMBERID" DataType="System.Decimal">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NAME" HeaderText="Name" SortExpression="NAME" UniqueName="NAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EMPLOYEETYPE" HeaderText="Type" SortExpression="EMPLOYEETYPE" UniqueName="EMPLOYEETYPE">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="BIRTHDATE" HeaderText="Birthdate" SortExpression="BIRTHDATE"
                                UniqueName="BIRTHDATE" DataFormatString="{0:MM/dd/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="HIREDATE" HeaderText="Hire Date" SortExpression="HIREDATE"
                                UniqueName="HIREDATE" DataFormatString="{0:MM/dd/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="MARRIAGEDATE" HeaderText="Marriage Date" SortExpression="MARRIAGEDATE"
                                UniqueName="MARRIAGEDATE" DataFormatString="{0:MM/dd/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EFFECTIVEDATE" HeaderText="Plan Effective Date"
                                SortExpression="EFFECTIVEDATE" UniqueName="EFFECTIVEDATE" DataFormatString="{0:MM/dd/yyyy}">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </fieldset>
        </div>
    </div>
    <div id="OEAlertDialog" class="message-error">
    <asp:Literal ID="lblMsg" ViewStateMode="Disabled" runat="server"></asp:Literal>
</div>
                      <div style="text-align: center; margin: 17px; margin-top: 30px; margin-bottom: 20px;">
                <asp:Button ID="BtAdd" CssClass="btn btn-danger" runat="server" Height="40" Text="Add Selected Plan(s)" Width="200px" OnClick="BtAdd_Click" />
            </div>
</asp:Panel>
<div class="customer-info-box">
    <div class="section-title">
        Plan Selection:
    </div>
    <div class="section-body">
        <telerik:RadGrid ID="PlansGrid" DataSourceID="odsOEPlans" DataKeyNames="Id" CssClass="EnrollmentPlanGrid"
            AllowAutomaticDeletes="True" OnItemDeleted="PlansGrid_ItemDeleted"
            runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" Skin="MetroTouch" 
            GridLines="None" ShowStatusBar="True" Style="margin-bottom: 20px;" CellSpacing="0">
            <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
            <MasterTableView DataSourceID="odsOEPlans" AllowMultiColumnSorting="True" CommandItemSettings-ShowAddNewRecordButton="false"
                CommandItemDisplay="TopAndBottom" DataKeyNames="ID">
                <Columns>
                    <telerik:GridBoundColumn SortExpression="EMPLOYEEID" HeaderText="Employee ID" DataField="EMPLOYEEID"
                        UniqueName="EMPLOYEEID" DataType="System.Decimal" Display="false">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn SortExpression="MEMBERID" HeaderText="Member ID" DataField="MEMBERID"
                        UniqueName="MEMBERID" DataType="System.Decimal">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="NAME" HeaderText="Name" SortExpression="NAME" UniqueName="NAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TYPE" HeaderText="Type" SortExpression="TYPE" UniqueName="TYPE">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PLANID" DataType="System.Decimal" HeaderText="Plan ID" SortExpression="PLANID" UniqueName="PLANID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="Plan Name" SortExpression="PLANNAME" UniqueName="PLANNAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EFFECTIVEDATE" HeaderText="Effective Date" SortExpression="EFFECTIVEDATE" UniqueName="EFFECTIVEDATE"
                        DataFormatString="{0:MM/dd/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="expirydate" HeaderText="Expiry Date" SortExpression="expirydate"
                        UniqueName="expirydate" DataFormatString="{0:MM/dd/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridButtonColumn ConfirmText="Delete this plan?" ConfirmDialogType="RadWindow" ConfirmTitle="Delete" ButtonType="ImageButton"
                        CommandName="Delete" Text="Delete" UniqueName="DeleteColumn" HeaderText="Remove">
                        <ItemStyle HorizontalAlign="Center" CssClass="MyImageButton" />
                    </telerik:GridButtonColumn>
                </Columns>
                <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                    </EditColumn>
                </EditFormSettings>
                <PagerStyle PageSizeControlType="RadComboBox" />
            </MasterTableView>
            <FilterMenu EnableImageSprites="False">
            </FilterMenu>
        </telerik:RadGrid>
    </div>
    <asp:Panel ID="phTerminationPlan" CssClass="warning-list" runat="server">
        <div class="section-title">
            Note: Plan(s) below will be automatically terminated due to Open Enrollment plan transfer.
        <div class="section-body">
            <telerik:RadGrid ID="RadGridTerminatedPlans" DataSourceID="odsTerminatedPlans" CssClass="EnrollmentPlanGrid"
                AllowAutomaticDeletes="True" OnItemDeleted="PlansGrid_ItemDeleted" runat="server" Skin="MetroTouch"
                AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" GridLines="None"
                ShowStatusBar="True" Style="margin-bottom: 20px;" CellSpacing="0" OnDataBound="RadGridTerminatedPlans_DataBound">
                <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                <MasterTableView DataSourceID="odsTerminatedPlans" AllowMultiColumnSorting="True">
                    <Columns>
                        <telerik:GridBoundColumn SortExpression="MEMBERID" HeaderText="Member ID" DataField="MEMBERID" UniqueName="MEMBERID"
                            DataType="System.Decimal">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NAME" HeaderText="Name" SortExpression="NAME" UniqueName="NAME">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TYPE" HeaderText="Type" SortExpression="TYPE" UniqueName="TYPE">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PLANID" DataType="System.Decimal" HeaderText="Plan ID" SortExpression="PLANID" UniqueName="PLANID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="Plan Name" SortExpression="PLANNAME" UniqueName="PLANNAME">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expirydate" HeaderText="Expiry Date" SortExpression="expirydate" UniqueName="expirydate"
                            DataFormatString="{0:MM/dd/yyyy}">
                        </telerik:GridBoundColumn>
                    </Columns>
                    <EditFormSettings>
                        <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                        </EditColumn>
                    </EditFormSettings>
                    <PagerStyle PageSizeControlType="RadComboBox" />
                </MasterTableView>
                <FilterMenu EnableImageSprites="False">
                </FilterMenu>
            </telerik:RadGrid>
            <asp:ObjectDataSource ID="odsTerminatedPlans" runat="server" SelectMethod="GetOETerminatePlans"
                TypeName="Pibt.BLL.EnrollmentForm">
                <SelectParameters>
                    <asp:SessionParameter Name="oeId" SessionField="OeId" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </asp:Panel>
</div>
<asp:Literal ID="lblNote" runat="server"></asp:Literal>
<asp:ObjectDataSource ID="odsOEPlans" runat="server" SelectMethod="GetOEAvailablePlans"
    TypeName="Pibt.BLL.EnrollmentForm" DeleteMethod="DeleteEnrollerFormPlan" OnSelecting="odsOEPlans_Selecting">
    <DeleteParameters>
        <asp:ControlParameter ControlID="PlansGrid" Name="id" PropertyName="SelectedValue"
            Type="String" />
    </DeleteParameters>
    <SelectParameters>
        <asp:SessionParameter Name="oeId" SessionField="OeId" Type="String" />
        <asp:Parameter DefaultValue="0" Name="notIncludeTerminate" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
