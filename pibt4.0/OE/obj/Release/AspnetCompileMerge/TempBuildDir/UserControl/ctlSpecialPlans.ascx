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
                <CommandItemSettings ExportToPdfText="Export to Pdf" />
                <RowIndicatorColumn>
                    <HeaderStyle Width="20px" />
                </RowIndicatorColumn>
                <ExpandCollapseColumn>
                    <HeaderStyle Width="20px" />
                </ExpandCollapseColumn>
                <Columns>
                    <telerik:GridBoundColumn DataField="PLANID" DataType="System.Decimal" HeaderText="PLAN ID"
                        SortExpression="PLANID" UniqueName="PLANID">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="PLAN NAME" SortExpression="PLANNAME"
                        UniqueName="PLANNAME">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataFormatString="{0:dd-MMM-yyyy}" DataField="EFFECTIVE"
                        DataType="System.DateTime" HeaderText="EFFECTIVE DATE" SortExpression="EFFECTIVE"
                        UniqueName="EFFECTIVE">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataFormatString="{0:dd-MMM-yyyy}" DataField="EXPIRY" DataType="System.DateTime"
                        HeaderText="EXPIRY DATE" SortExpression="EXPIRY" UniqueName="EXPIRY">
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

