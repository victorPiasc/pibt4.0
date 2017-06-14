<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlSpecialPlans.ascx.cs"
    Inherits="Pibt.UserControl.CtlSpecialPlans" %>
<div class="customer-info-box">
    <div class="section-title">
        Business Custom Plans:
    </div>
    <div class="section-body">
        <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="odsSpecialPlans" AllowSorting="True"
            AllowPaging="True" PageSize="10" GridLines="None" ShowStatusBar="True" Style="margin-bottom: 20px;">
            <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
            <MasterTableView AutoGenerateColumns="False" DataSourceID="odsSpecialPlans">
                <CommandItemSettings ExportToPdfText="Export to PDF"/>
                <RowIndicatorColumn>
                    <HeaderStyle Width="20px" />
                </RowIndicatorColumn>
                <ExpandCollapseColumn>
                    <HeaderStyle Width="20px" />
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="PLANID" DataType="System.Decimal" HeaderText="Plan ID" SortExpression="PLANID" UniqueName="PLANID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="Plan Name" SortExpression="PLANNAME" UniqueName="PLANNAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="EFFECTIVE" DataType="System.DateTime" HeaderText="Effective Date"
                        SortExpression="EFFECTIVE" UniqueName="EFFECTIVE">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="EXPIRY" DataType="System.DateTime" HeaderText="Expiry Date"
                        SortExpression="EXPIRY" UniqueName="EXPIRY">
                    </telerik:GridBoundColumn>
                </Columns>
            </MasterTableView>
        </telerik:RadGrid>
    </div>
</div>
<asp:ObjectDataSource ID="odsSpecialPlans" runat="server" 
    SelectMethod="GetErCustomePlans" TypeName="Pibt.BLL.Plan">
    <SelectParameters>
        <asp:Parameter Name="employerId" Type="String" />
        <asp:Parameter DefaultValue="p" Name="side" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>

