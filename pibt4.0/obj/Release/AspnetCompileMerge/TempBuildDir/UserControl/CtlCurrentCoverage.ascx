<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlCurrentCoverage.ascx.cs" Inherits="Pibt.UserControl.CtlCurrentCoverage" %>
<telerik:RadGrid ID="summary" runat="server" AutoGenerateColumns="false" AllowSorting="True" AllowPaging="True" Skin="MetroTouch" CssClass="ChoosePlanGrid" GridLines="None" ShowStatusBar="True" OnNeedDataSource="summary_NeedDataSource">
    <MasterTableView DataKeyNames="memberId">
        <Columns>
            <telerik:GridBoundColumn DataField="name" UniqueName="name" HeaderText="Name"></telerik:GridBoundColumn>
            <telerik:GridTemplateColumn DataField="medCount" UniqueName="col_1" ItemStyle-HorizontalAlign="Center" HeaderText="Medical" Display="false">
                <ItemTemplate>
                    <span class="halflings halflings-ok"></span>
                    <asp:CheckBox ID="cb_1" runat="server" Checked='<%# Eval("medCount").ToString() != "0"%>' Enabled="false" />
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn DataField="denCount" UniqueName="col_2" ItemStyle-HorizontalAlign="Center" HeaderText="Dental" Display="false">
                <ItemTemplate>
                    <asp:CheckBox ID="cb_2" runat="server" Checked='<%# Eval("denCount").ToString() != "0"%>' Enabled="false" />
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn DataField="visCount" UniqueName="col_3" ItemStyle-HorizontalAlign="Center" HeaderText="Vision" Display="false">
                <ItemTemplate>
                    <asp:CheckBox ID="cb_3" runat="server" Checked='<%# Eval("visCount").ToString() != "0"%>' Enabled="false" />
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn DataField="chiroCount" UniqueName="col_4" ItemStyle-HorizontalAlign="Center" HeaderText="Chiropractic" Display="false">
                <ItemTemplate>
                    <asp:CheckBox ID="cb_4" runat="server" Checked='<%# Eval("chiroCount").ToString() != "0"%>' Enabled="false" />
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn DataField="vtlCount" UniqueName="col_6" ItemStyle-HorizontalAlign="Center" HeaderText="Voluntary Term Life"
                Display="false">
                <ItemTemplate>
                    <asp:CheckBox ID="cb_6" runat="server" Checked='<%# Eval("vtlCount").ToString() != "0"%>' Enabled="false" />
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn DataField="mtlCount" UniqueName="col_7" ItemStyle-HorizontalAlign="Center" HeaderText="Medical Term Life" Display="false">
                <ItemTemplate>
                    <asp:CheckBox ID="cb_7" runat="server" Checked='<%# Eval("mtlCount").ToString() != "0"%>' Enabled="false" />
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn DataField="mhCount" UniqueName="col_8" ItemStyle-HorizontalAlign="Center" HeaderText="Mental Health" Display="false">
                <ItemTemplate>
                    <asp:CheckBox ID="cb_8" runat="server" Checked='<%# Eval("mhCount").ToString() != "0"%>' Enabled="false" />
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn DataField="mtlGaCount" UniqueName="col_10" ItemStyle-HorizontalAlign="Center"
                HeaderText="Medical Term Life GA" Display="false">
                <ItemTemplate>
                    <asp:CheckBox ID="cb_10" runat="server" Checked='<%# Eval("mtlGaCount").ToString() != "0"%>' Enabled="false" />
                </ItemTemplate>
            </telerik:GridTemplateColumn>
            <telerik:GridTemplateColumn DataField="mtMtlCount" UniqueName="col_11" ItemStyle-HorizontalAlign="Center" HeaderText="Multi Tier MTL" Display="false">
                <ItemTemplate>
                    <asp:CheckBox ID="cb_11" runat="server" Checked='<%# Eval("mtMtlCount").ToString() != "0"%>' Enabled="false" />
                </ItemTemplate>
            </telerik:GridTemplateColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>