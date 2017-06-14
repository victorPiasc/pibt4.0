<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEnrollmentFormPlans.ascx.cs"
    Inherits="Pibt.UserControl.CtlEnrollmentFormPlans" %>
<asp:Panel ID="AddButtonPlaceHolder" runat="server">
    <div class="customer-info-box">
        <div class="section-body">
            <fieldset>
                <legend>Plan Type: (Select One)</legend>
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
                            <telerik:GridBoundColumn DataField="NAME" HeaderText="CARRIER NAME" SortExpression="NAME" ItemStyle-Width="180"
                                UniqueName="NAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="planname" HeaderText="PLAN NAME" SortExpression="PLANNAME"
                                UniqueName="PLANNAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="MEMBERID" HeaderText="MEMBER ID" DataField="MEMBERID"
                                UniqueName="MEMBERID" DataType="System.Decimal">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="fullname" HeaderText="NAME" SortExpression="NAME"
                                UniqueName="NAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EFFECTIVEDATE" HeaderText="PLAN EFFECTIVE DATE"
                                SortExpression="EFFECTIVEDATE" UniqueName="EFFECTIVEDATE" DataFormatString="{0:M/d/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="expirydate" HeaderText="EXPIRY DATE" SortExpression="expirydate"
                                UniqueName="expirydate" DataFormatString="{0:M/d/yyyy}">
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
                            <telerik:GridClientSelectColumn UniqueName="CheckboxSelectColumn" HeaderText="SELECT" ItemStyle-HorizontalAlign="center" >
                              <HeaderStyle Width="70px" />
                               <ItemStyle Width="70px" />
                            </telerik:GridClientSelectColumn>
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
                <legend>Eligible Enroller(s):</legend>
                <telerik:RadGrid ID="RadGridEnrollers" DataKeyNames="memberId" AllowMultiRowSelection="True"
                    runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" Skin="MetroTouch" 
                    CssClass="ChoosePlanGrid" GridLines="None" ShowStatusBar="True" OnItemCreated="RadGridEnrollers_ItemCreated"
                    OnPreRender="RadGridEnrollers_PreRender">
                    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <MasterTableView AllowMultiColumnSorting="True">
                        <Columns>
                            <telerik:GridClientSelectColumn UniqueName="CheckboxSelectColumn">
                            </telerik:GridClientSelectColumn>
                            <telerik:GridBoundColumn SortExpression="EMPLOYEEID" HeaderText="FAMILY ID" DataField="EMPLOYEEID"
                                UniqueName="EMPLOYEEID" DataType="System.Decimal">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="MEMBERID" HeaderText="MEMBER ID" DataField="MEMBERID"
                                UniqueName="MEMBERID" DataType="System.Decimal">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="NAME" HeaderText="NAME" SortExpression="NAME" ItemStyle-Width="200"
                                UniqueName="NAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EMPLOYEETYPE" HeaderText="TYPE" SortExpression="EMPLOYEETYPE"
                                UniqueName="EMPLOYEETYPE">
                            </telerik:GridBoundColumn>
<%--                            <telerik:GridBoundColumn DataField="GENDER" HeaderText="GENDER" SortExpression="GENDER"
                                UniqueName="GENDER">
                            </telerik:GridBoundColumn>--%>
                            <telerik:GridBoundColumn DataField="BIRTHDATE" HeaderText="BIRTH DATE" SortExpression="BIRTHDATE"
                                UniqueName="BIRTHDATE" DataFormatString="{0:M/d/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="HIREDATE" HeaderText="HIRE DATE" SortExpression="HIREDATE"
                                UniqueName="HIREDATE" DataFormatString="{0:M/d/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="MARRIAGEDATE" HeaderText="MARRIAGE DATE" SortExpression="MARRIAGEDATE"
                                UniqueName="MARRIAGEDATE" DataFormatString="{0:M/d/yyyy}">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="EFFECTIVEDATE" HeaderText="PLAN EFFECTIVE DATE"
                                SortExpression="EFFECTIVEDATE" UniqueName="EFFECTIVEDATE" DataFormatString="{0:MM/d/yyyy}">
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
        Selected Plans:
    </div>
    <div class="section-body">
        <telerik:RadGrid ID="PlansGrid" DataSourceID="odsOEPlans" DataKeyNames="Id" CssClass="EnrollmentPlanGrid"
            AllowAutomaticDeletes="True" OnItemDeleted="PlansGrid_ItemDeleted" OnDataBound="PlansGrid_DataBound"
            runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True" Skin="MetroTouch" 
            GridLines="None" ShowStatusBar="True" Style="margin-bottom: 20px;" CellSpacing="0">
            <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
            <MasterTableView DataSourceID="odsOEPlans" AllowMultiColumnSorting="True" CommandItemSettings-ShowAddNewRecordButton="false"
                CommandItemDisplay="TopAndBottom" DataKeyNames="ID">
                <Columns>
<%--                    <telerik:GridBoundColumn SortExpression="ID" HeaderText="ID" DataField="ID" UniqueName="ID"
                        DataType="System.Decimal">
                    </telerik:GridBoundColumn>--%>
<%--                    <telerik:GridBoundColumn SortExpression="EMPLOYEEID" HeaderText="EMPLOYEE ID" DataField="EMPLOYEEID"
                        UniqueName="EMPLOYEEID" DataType="System.Decimal">
                    </telerik:GridBoundColumn>--%>
                    <telerik:GridBoundColumn SortExpression="MEMBERID" HeaderText="MEMBER ID" DataField="MEMBERID"
                        UniqueName="MEMBERID" DataType="System.Decimal">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="NAME" HeaderText="NAME" SortExpression="NAME" ItemStyle-Width="180"
                        UniqueName="NAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="TYPE" HeaderText="TYPE" SortExpression="TYPE"
                        UniqueName="TYPE">
                    </telerik:GridBoundColumn>
<%--                    <telerik:GridBoundColumn DataField="GENDER" HeaderText="GENDER" SortExpression="GENDER"
                        UniqueName="GENDER">
                    </telerik:GridBoundColumn>--%>
                    <telerik:GridBoundColumn DataField="PLANID" DataType="System.Decimal" HeaderText="PLANID"
                        SortExpression="PLANID" UniqueName="PLANID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="PLANNAME" SortExpression="PLANNAME" ItemStyle-Width="220"
                        UniqueName="PLANNAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EFFECTIVEDATE" HeaderText="EFFECTIVE DATE" SortExpression="EFFECTIVEDATE"
                        UniqueName="EFFECTIVEDATE" DataFormatString="{0:M/d/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="expirydate" HeaderText="EXPIRY DATE" SortExpression="expirydate"
                        UniqueName="expirydate" DataFormatString="{0:M/d/yyyy}">
                    </telerik:GridBoundColumn>
                    <telerik:GridButtonColumn ConfirmText="Delete this plan?" ConfirmDialogType="RadWindow"
                        ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"  
                        UniqueName="DeleteColumn" HeaderText="REMOVE">
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
<%--                        <telerik:GridBoundColumn SortExpression="EMPLOYEEID" HeaderText="EMPLOYEEID" DataField="EMPLOYEEID"
                            UniqueName="EMPLOYEEID" DataType="System.Decimal">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn SortExpression="MEMBERID" HeaderText="MEMBERID" DataField="MEMBERID" ItemStyle-Width="80"
                            UniqueName="MEMBERID" DataType="System.Decimal">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="NAME" HeaderText="NAME" SortExpression="NAME" ItemStyle-Width="180"
                            UniqueName="NAME">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="TYPE" HeaderText="TYPE" SortExpression="TYPE" ItemStyle-Width="80"
                            UniqueName="TYPE">
                        </telerik:GridBoundColumn>
<%--                        <telerik:GridBoundColumn DataField="GENDER" HeaderText="GENDER" SortExpression="GENDER"
                            UniqueName="GENDER">
                        </telerik:GridBoundColumn>--%>
                        <telerik:GridBoundColumn DataField="PLANID" DataType="System.Decimal" HeaderText="PLANID" ItemStyle-Width="60"
                            SortExpression="PLANID" UniqueName="PLANID">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="PLANNAME" SortExpression="PLANNAME" ItemStyle-Width="250"
                            UniqueName="PLANNAME">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="expirydate" HeaderText="EXPIRY DATE" SortExpression="expirydate" ItemStyle-Width="80"
                            UniqueName="expirydate" DataFormatString="{0:MM/d/yyyy}">
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
<%--<div id="OEAlertDialog" class="message-error">
    <asp:Literal ID="lblMsg" ViewStateMode="Disabled" runat="server"></asp:Literal>
</div>--%>
<%--<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">
        function btnAdd_click(sernder, args) {
            if (args.EventTarget == "<%=BtAdd.UniqueID %>") {
                if ($("#OEAlertDialog .error-list").length > 0 || $("#OEAlertDialog .alert-list").length > 0) {
                    PopupMsgDialog("OEAlertDialog");
                }
            }
        }
    </script>
</telerik:RadCodeBlock>--%>
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
