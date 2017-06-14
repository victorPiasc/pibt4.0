<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlCurrentPlans.ascx.cs"
    Inherits="Pibt.UserControl.CtlCurrentPlans" %>
<div class="customer-info-box">
    <div class="section-body">
        <fieldset>
        <legend>Current Plans (at <asp:Label ID="today" runat="server"></asp:Label>)</legend> 
        <div>
            <nav>
                <ul id="typeList" runat="server">
                    <li id="l1" runat="server" style="margin-bottom:0px" class="tablinks selected"><asp:LinkButton ID="medical" CssClass="tab" runat="server" Text="Medical" CommandName="1" OnCommand="type_Command"></asp:LinkButton></li>
                    <li id="l2" runat="server" style="margin-bottom:0px" class="tablinks" ><asp:LinkButton ID="dental" CssClass="tab" runat="server" Text="Dental" CommandName="2" OnCommand="type_Command"></asp:LinkButton></li>
                    <li id="l3" runat="server" style="margin-bottom:0px" class="tablinks"><asp:LinkButton ID="vision" CssClass="tab" runat="server" Text="Vision" CommandName="3" OnCommand="type_Command"></asp:LinkButton></li>
                    <li id="l4" runat="server" style="margin-bottom:0px" class="tablinks"><asp:LinkButton ID="chiro" CssClass="tab" runat="server" Text="Chiropractic" CommandName="4" OnCommand="type_Command"></asp:LinkButton></li>
                    <li id="l6" runat="server" style="margin-bottom:0px" class="tablinks"><asp:LinkButton ID="vtl" CssClass="tab" runat="server" Text="Voluntary Term Life" CommandName="6" OnCommand="type_Command"></asp:LinkButton></li>
                    <li id="l7" runat="server" style="margin-bottom:0px" class="tablinks"><asp:LinkButton ID="mtl" CssClass="tab" runat="server" Text="Medical Term Life" CommandName="7" OnCommand="type_Command"></asp:LinkButton></li>
                    <li id="l8" runat="server" style="margin-bottom:0px" class="tablinks"><asp:LinkButton ID="mental_health" CssClass="tab" runat="server" Text="Mental Health" CommandName="8" OnCommand="type_Command"></asp:LinkButton></li>
                </ul>
            </nav>
        </div>
        <div class="content">
            <telerik:RadGrid ID="CurrentPlanGrid" DataKeyNames="planId" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
            ShowStatusBar="True" Skin="MetroTouch" CssClass="papersize" OnNeedDataSource="CurrentPlanGrid_NeedDataSource">
                <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                <MasterTableView AllowMultiColumnSorting="True">
                    <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
                    <Columns>
                        <telerik:GridBoundColumn SortExpression="CARRIERNAME" HeaderText="Carrier Name" DataField="CARRIERNAME"
                        UniqueName="CARRIERNAME" ItemStyle-Width="250px" ShowSortIcon="true">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="PLANID" DataType="System.Decimal" HeaderText="Plan ID"
                        SortExpression="PLANID" UniqueName="PLANID" Display="false">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn SortExpression="PLANNAME" HeaderText="Plan Name" DataField="PLANNAME" UniqueName="PLANNAME">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="ee" DataField="ee" HeaderText="Employee Count" SortExpression="ee" ItemStyle-HorizontalAlign="Center">
                        </telerik:GridBoundColumn>
                        <telerik:GridCalculatedColumn UniqueName="SO" DataFields="spouse, dp" HeaderText="Spouse Count" ItemStyle-HorizontalAlign="Center" Expression="{0}+{1}" SortExpression="spouse"></telerik:GridCalculatedColumn>
                        <telerik:GridBoundColumn UniqueName="children" DataField="children" HeaderText="Child Count" SortExpression="children" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                        <telerik:GridBoundColumn UniqueName="actExp" DataField="actExp" HeaderText="Active/Expire" ItemStyle-HorizontalAlign="Center" SortExpression="actExp"></telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>
        </div>
        <br />
        <div>
            
        </div>
        </fieldset>
    </div>
</div>
