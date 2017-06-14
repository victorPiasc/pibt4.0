<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEnrollmentFormAdditional.ascx.cs"
    Inherits="Pibt.UserControl.CtlOEAdditional" %>
<asp:Panel ID="PanelPCP" runat="server">
    <div class="customer-info-box">
        <div class="section-title">
            Medical Provider Information:
        </div>
        <div class="section-body">
            <asp:Literal ID="medMessage" runat="server"></asp:Literal>
            <asp:GridView ID="GridViewPCP" runat="server" AutoGenerateColumns="False" PageSize="13" SkinID="" AllowSorting="True" AllowPaging="True"
                DataSourceID="OdsPCPGridView" DataKeyNames="ID">
                <Columns >
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="NAME" HeaderText="Name" ItemStyle-Width="200" />
                    <asp:BoundField DataField="PLANNAME" HeaderText="Plan Name" ItemStyle-Width="250" />
                    <asp:TemplateField HeaderText="Doctor Name" ItemStyle-Width="170">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice1" runat="server" Text='<%# Eval("Planoffice1") %>' MaxLength="40"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Provider ID" ItemStyle-Width="170">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice2" runat="server" Text='<%# Eval("Planoffice2") %>' MaxLength="30" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="po2" runat="server" ErrorMessage="*" Display="Dynamic" ControlToValidate="tbPlanOffice2" ></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Medical Group/Enrollment ID" ItemStyle-Width="170">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice3" runat="server" Text='<%# Eval("Planoffice3") %>' MaxLength="40"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="po3" runat="server" ErrorMessage="*"  Display="Dynamic" ControlToValidate="tbPlanOffice3"></asp:RequiredFieldValidator>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbAuto" runat="server" Text="Auto assign provider" TextAlign="Right"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="OdsPCPGridView" runat="server" SelectMethod="GetEnrollmentFormPlans" TypeName="Pibt.BLL.EnrollmentForm">
                <SelectParameters>
                    <asp:SessionParameter Name="oeId" SessionField="OeId" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="planTypeId" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div>
                <asp:HyperLink ID="medSearch" runat="server" Text="Search for a provider here"></asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Panel>
<asp:Panel ID="PanelDental" runat="server">
    <div class="customer-info-box">
        <div class="section-title">
            Dental Provider Information:
        </div>
        <div class="section-body">
            <asp:Literal ID="denMessage" runat="server"></asp:Literal>
            <asp:GridView ID="GridViewDental" runat="server" AutoGenerateColumns="False" PageSize="13" AllowSorting="True" AllowPaging="True"
                DataSourceID="OdsDentalGridView" DataKeyNames="ID">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="NAME" HeaderText="Name" ItemStyle-Width="200" />
                    <asp:BoundField DataField="PLANNAME" HeaderText="Plan Name" ItemStyle-Width="250"/>
                    <asp:TemplateField HeaderText="Dental Office Name" ItemStyle-Width="170">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice1" runat="server" Text='<%# Eval("Planoffice1") %>' MaxLength="40"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Provider No." ItemStyle-Width="170">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice2" runat="server" Text='<%# Eval("Planoffice2") %>' MaxLength="30"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Facility No." ItemStyle-Width="170">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice3" runat="server" Text='<%# Eval("Planoffice3") %>' MaxLength="40"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:CheckBox ID="cbAuto" runat="server" Text="Auto assign provider" TextAlign="Right" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="OdsDentalGridView" runat="server" SelectMethod="GetEnrollmentFormPlans" TypeName="Pibt.BLL.EnrollmentForm">
                <SelectParameters>
                    <asp:SessionParameter Name="oeId" SessionField="OeId" Type="String" />
                    <asp:Parameter DefaultValue="2" Name="planTypeId" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <div>
                <asp:HyperLink ID="denSearch" runat="server" Text="Search for a provider here"></asp:HyperLink>
            </div>
        </div>
    </div>
</asp:Panel>
