<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEnrollmentFormPlans.ascx.cs"
Inherits="Pibt.UserControl.CtlEnrollmentFormPlans" %>
<%@ Register Src="../UserControl/CtlCurrentCoverage.ascx" TagName="CtlCurrentCov" TagPrefix="uc1" %>
<div class="customer-info-box">
    <div class="section-body" style="border:none;">
        <div style="padding-left:30px;">
            <asp:Literal ID="lblMsg" ViewStateMode="Disabled" runat="server"></asp:Literal>
        </div>
        <asp:Panel ID="current" runat="server" Visible="false" style="display:block;  padding-bottom:10px">
            <fieldset>
                <legend>Current Coverage</legend>
                <telerik:RadGrid ID="currentCoverage" runat="server"  AutoGenerateColumns="false" AllowSorting="True" AllowPaging="True" Skin="MetroTouch" CssClass="ChoosePlanGrid" GridLines="None" ShowStatusBar="True" >
                    <MasterTableView DataKeyNames="planId">
                        <Columns>
                            <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="name" UniqueName="name" HeaderText="Insured&nbsp;Name"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="planName" HeaderText="Current Plan" UniqueName="planName"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="description" HeaderText="Benefit Type" UniqueName="description"></telerik:GridBoundColumn>
                            <telerik:GridCalculatedColumn DataFields="rates, subsidy" HeaderText="Employee&nbsp;Premium" Expression="{0}-{1}" DataType="System.Double" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" UniqueName="eePrice"></telerik:GridCalculatedColumn>
                            <telerik:GridCalculatedColumn DataFields="depRates, subsidyDep" HeaderText="Dependent&nbsp;Premium" Expression="{0}-{1}" DataType="System.Double" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" UniqueName="depPrice"></telerik:GridCalculatedColumn>
                            <telerik:GridCalculatedColumn DataFields="rates, depRates" HeaderText="Gross&nbsp;Premium" Expression="{0}+{1}" DataType="System.Double" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" UniqueName="grossPrice"></telerik:GridCalculatedColumn>
                            <telerik:GridBoundColumn DataField="status"  HeaderText="Plan Status" UniqueName="status"></telerik:GridBoundColumn>
                            <telerik:GridTemplateColumn DataField="status" UniqueName="keep" ItemStyle-HorizontalAlign="Center" HeaderText="Keep Plan">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbKeep" runat="server" Visible='<%# !Eval("status").Equals("Expiring")%>' AutoPostBack="true" OnCheckedChanged="cbKeep_CheckedChanged" Checked='<%# int.Parse(Eval("keepCur").ToString())>0 %>'/>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </fieldset>
        </asp:Panel>
        <fieldset>
            <legend>Plan Selection</legend>
            <asp:panel ID="benefitTabs" runat="server">
                <nav>
                    <ul id="typeList" runat="server">
                        <li id="l1" runat="server" visible="false" style="margin-bottom:0px" class="tablinks selected"><asp:LinkButton ID="lb1" CssClass="tab" runat="server" Text="Medical" CommandName="1" OnCommand="type_Command"></asp:LinkButton></li>
                        <li id="l2" runat="server" visible="false" style="margin-bottom:0px" class="tablinks" ><asp:LinkButton ID="lb2" CssClass="tab" runat="server" Text="Dental" CommandName="2" OnCommand="type_Command"></asp:LinkButton></li>
                        <li id="l3" runat="server" visible="false" style="margin-bottom:0px" class="tablinks"><asp:LinkButton ID="lb3" CssClass="tab" runat="server" Text="Vision" CommandName="3" OnCommand="type_Command"></asp:LinkButton></li>
                        <li id="l4" runat="server" visible="false" style="margin-bottom:0px" class="tablinks"><asp:LinkButton ID="lb4" CssClass="tab" runat="server" Text="Chiropractic" CommandName="4" OnCommand="type_Command"></asp:LinkButton></li>
                        <li id="l8" runat="server" visible="false" style="margin-bottom:0px" class="tablinks"><asp:LinkButton ID="lb8" CssClass="tab" runat="server" Text="Mental Health" CommandName="8" OnCommand="type_Command"></asp:LinkButton></li>
                    </ul>
                </nav>
            </asp:panel>
            <div class="content">
                <asp:Panel ID="family" runat="server" style="padding-bottom:10px; border-left:1px solid #CDCDCD; border-right:1px solid #CDCDCD;  background-color:#fff">
                    <div class="sectionHeader" style="padding-left:10px;">Eligible Enrollees</div>
                    <div class="row">
                        <div class="col-lg-8">
                            <div style="padding-left:25px;">
                                <telerik:RadListView ID="lvFamily" runat="server" DataKeyNames="memberId" ItemPlaceholderID="memberContainer">
                                    <LayoutTemplate>
                                        <table class="table-container" style="width:100%;">
                                            <tr class="row" style="border-bottom: 1px solid #CDCDCD">
                                                <td class=" planEnrollTitle" >Name
                                                </td>
                                                <td class="planEnrollTitle" >Type
                                                </td>
                                                <td class="planEnrollTitle" >Select
                                                </td>
                                            </tr>
                                            <asp:PlaceHolder ID="memberContainer" runat="server"></asp:PlaceHolder>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr class="row">
                                            <td class="planEnrollValue">
                                                <asp:Label ID="name" runat="server" Text='<%#Eval("name") %>'></asp:Label> 
                                            </td>
                                            <td class="planEnrollValue" >
                                                <asp:Label ID="type" runat="server" Text='<%#Eval("employeeType") %>'></asp:Label>
                                            </td>
                                            <td class="planEnrollValue checkMark" >
                                                <asp:CheckBox ID="cbMember" runat="server" AutoPostBack="true" Checked="true" Enabled='<%# !Eval("employeeTypeId").ToString().Equals("0") %>' OnCheckedChanged="member_CheckedChanged" />
                                                <asp:Label ID="memberId" runat="server" Text='<%# Eval("memberId") %>' style="display:none"></asp:Label>
                                                <asp:Label ID="employeeTypeId" runat="server" Text='<%# Eval("employeeTypeId")%>' style="display:none"></asp:Label>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </telerik:RadListView>
                            </div>
                        </div>
                        <div class="col-lg-4">
                             <span id="currCovBtn" runat="server" aria-hidden="true" class="btn" onclick="Popup(this)">Click to view Current Coverage</span>
                        </div>
                    </div>
                    <div id="popUp" class="popup" style="display:none; z-index:1; position:absolute; background:#888888; border:solid 1px #000; width:100%; top:75px">
                        <div style="margin:10px;">
                            <uc1:CtlCurrentCov ID="CtlCurrentCov1" runat="server" style="margin:10px;"/>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Plans" runat="server" >
                        <telerik:RadGrid ID="AvailablePlansGrid" AllowMultiRowSelection="false" runat="server" AutoGenerateColumns="false" AllowSorting="True" AllowPaging="True" Skin="MetroTouch" CssClass="ChoosePlanGrid" GridLines="None" ShowStatusBar="True" OnNeedDataSource="AvailablePlansGrid_NeedDataSource" OnItemCommand="AvailablePlansGrid_ItemCommand" OnDataBound="AvailablePlansGrid_DataBound" OnPreRender="AvailablePlansGrid_PreRender" >
                            <PagerStyle Mode="NumericPages" ></PagerStyle>
                            <MasterTableView AllowMultiColumnSorting="True">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="carrierId" UniqueName="carrierId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="planTypeId" UniqueName="planTypeId" Display="false"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="planName" UniqueName="planName" SortExpression="planName" HeaderText="Plan&nbsp;Name"></telerik:GridBoundColumn>
                                    <telerik:GridButtonColumn UniqueName="addPlan" ButtonCssClass="btn" Text="Select" HeaderText="Select Plan" CommandName="add" ItemStyle-ForeColor="White" ItemStyle-HorizontalAlign="Center" HeaderTooltip="Click if coverage is desired" HeaderStyle-HorizontalAlign="Center">
                                    </telerik:GridButtonColumn>
                                    <telerik:GridCalculatedColumn DataFields="rates, subsidy" HeaderText="Employee&nbsp;Premium" Expression="{0}-{1}" DataType="System.Double" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" UniqueName="eePrice"></telerik:GridCalculatedColumn>
                                    <telerik:GridCalculatedColumn DataFields="depRates, subsidyDep" HeaderText="Dependent&nbsp;Premium" Expression="{0}-{1}" DataType="System.Double" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" UniqueName="depPrice"></telerik:GridCalculatedColumn>
                                    <telerik:GridCalculatedColumn DataFields="rates, depRates" HeaderText="Gross&nbsp;Premium" Expression="{0}+{1}" DataType="System.Double" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" UniqueName="grossPrice"></telerik:GridCalculatedColumn>
                                    <telerik:GridTemplateColumn UniqueName="compare2" ItemStyle-HorizontalAlign="Center" >
                                        <HeaderTemplate>
                                            <asp:LinkButton ID="lbCompare" runat="server" Text="Compare Benefits" Font-Underline="true" CssClass="btn" ForeColor="White"></asp:LinkButton>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbCompare" runat="server" Visible='<%# !Eval("planName").ToString().Contains("Declination") %>' />
                                        </ItemTemplate>
                                    </telerik:GridTemplateColumn>
                                </Columns>
                                <NoRecordsTemplate>
                                    There is no available plan.
                                </NoRecordsTemplate>
                            </MasterTableView>
                        </telerik:RadGrid>
                </asp:Panel>
            </div>
        </fieldset>
        <asp:Panel ID="Cart" runat="server">
            <fieldset>
                <legend>Plans Selected:</legend>
                <telerik:RadGrid ID="PlansGrid" CssClass="EnrollmentPlanGrid" OnNeedDataSource="PlansGrid_NeedDataSource" runat="server" AutoGenerateColumns="False" AllowSorting="True" Skin="MetroTouch" OnItemCommand="PlansGrid_ItemCommand" GridLines="None" Style="margin-bottom: 20px;" OnDataBound="PlansGrid_DataBound" OnItemDataBound="PlansGrid_ItemDataBound" Width="100%" OnItemCreated="PlansGrid_ItemCreated">
                    <MasterTableView AllowMultiColumnSorting="True" CommandItemSettings-ShowAddNewRecordButton="false"
                            DataKeyNames="planId" CommandItemSettings-ShowRefreshButton="false" ShowFooter="true">
                        <NoRecordsTemplate>
                            <asp:Label ID="noPlans" runat="server">No plans have been added yet.</asp:Label>
                        </NoRecordsTemplate>
                        <Columns>
                            <telerik:GridBoundColumn DataField="planId" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="planTypeId" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="planName" UniqueName="planName" SortExpression="planName" HeaderText="Plan&nbsp;Name" ></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="planType" UniqueName="planType" SortExpression="planType" HeaderText="Benefit&nbsp;Type"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="eeCount" UniqueName="eeCount" SortExpression="eeCount" HeaderText="Employee&nbsp;Count" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="depCount" UniqueName="depCount" SortExpression="depCount" HeaderText="Dependent&nbsp;Count" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="price" UniqueName="price" SortExpression="price" HeaderText="Total" ItemStyle-HorizontalAlign="Right" Aggregate="Sum" DataFormatString="{0:C}" FooterAggregateFormatString="Total Monthly Cost {0:C}" FooterStyle-Font-Bold="true" FooterStyle-HorizontalAlign="Right"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="effectiveDate" UniqueName="effectiveDate" HeaderText="Effective&nbsp;Date" DataType="System.DateTime" DataFormatString="{0:d}"></telerik:GridBoundColumn>
                            <telerik:GridButtonColumn ButtonCssClass="btn" Text="Remove" CommandName="Delete" HeaderText="Remove" ItemStyle-ForeColor="White" UniqueName="btnColumn"></telerik:GridButtonColumn>
                        </Columns>
                        <EditFormSettings>
                            <EditColumn FilterControlAltText="Filter EditCommandColumn column">
                            </EditColumn>
                        </EditFormSettings>
                    </MasterTableView>
                </telerik:RadGrid>
            </fieldset>
            <asp:Literal ID="lblNote" runat="server"></asp:Literal>
        </asp:Panel>
    </div>
</div>