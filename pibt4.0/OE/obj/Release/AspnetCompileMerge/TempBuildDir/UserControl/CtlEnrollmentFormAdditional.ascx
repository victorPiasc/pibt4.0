<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEnrollmentFormAdditional.ascx.cs"
    Inherits="Pibt.UserControl.CtlOEAdditional" %>
<asp:Panel ID="PanelPCP" runat="server">
    <p>
        Office will be auto assigned, if provider information is not completed.
    </p>
    <div class="customer-info-box">
        <div class="section-title">
            Provider information:
        </div>
        <div class="section-body">
            <asp:GridView ID="GridViewPCP" runat="server" AutoGenerateColumns="False" PageSize="13" SkinID=""
                AllowSorting="True" AllowPaging="True" ShowStatusBar="True" DataSourceID="OdsPCPGridView"
                DataKeyNames="ID">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID"
                        Visible="False" />
                    <asp:BoundField DataField="OEID" HeaderText="OEID" SortExpression="OEID" Visible="False" />
                    <asp:BoundField DataField="MEMBERID" HeaderText="MEMBERID" Visible="False" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" />
                    <asp:BoundField DataField="PLANNAME" HeaderText="PLAN NAME" />
                    <asp:TemplateField HeaderText="PCP Name">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice1" runat="server" Text='<%# Eval("Planoffice1") %>'
                                MaxLength="40"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PCP #">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice2" runat="server" Text='<%# Eval("Planoffice2") %>'
                                MaxLength="30"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="required-info"
                                Display="Dynamic" runat="server" ErrorMessage="* Required Field !" ControlToValidate="tbPlanoffice2"></asp:RequiredFieldValidator>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="MEDICAL GROUP NAME">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice3" runat="server" Text='<%# Eval("Planoffice3") %>'
                                MaxLength="40"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IPA/MEDICAL GROUP #">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice4" runat="server" Text='<%# Eval("Planoffice4") %>'
                                MaxLength="40"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="required-info"
                                Display="Dynamic" runat="server" ErrorMessage="* Required Field !" ControlToValidate="tbPlanoffice4"></asp:RequiredFieldValidator>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="OdsPCPGridView" runat="server" SelectMethod="GetEnrollmentFormPlans"
                TypeName="Pibt.BLL.EnrollmentForm">
                <SelectParameters>
                    <asp:SessionParameter Name="oeId" SessionField="OeId" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="planTypeId" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Panel>
<asp:Panel ID="PanelDental" runat="server">
    <p>
        Office will be auto assigned, if provider information is not completed.
    </p>
    <div class="customer-info-box">
        <div class="section-title">
            Dental information:
        </div>
        <div class="section-body">
            <asp:GridView ID="GridViewDental" runat="server" AutoGenerateColumns="False" PageSize="13"
                AllowSorting="True" AllowPaging="True" ShowStatusBar="True" DataSourceID="OdsDentalGridView"
                DataKeyNames="ID">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID"
                        Visible="False" />
                    <asp:BoundField DataField="OEID" HeaderText="OEID" SortExpression="OEID" Visible="False" />
                    <asp:BoundField DataField="MEMBERID" HeaderText="MEMBERID" Visible="False" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" />
                    <asp:BoundField DataField="PLANNAME" HeaderText="PLAN NAME" />
                    <asp:TemplateField HeaderText="DENTAL OFFICE">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice1" runat="server" Text='<%# Eval("Planoffice1") %>'
                                MaxLength="40"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="rfvPlanoffice1" CssClass="required-info" Display="Dynamic"
                                runat="server" ErrorMessage="* Required Field !" ControlToValidate="tbPlanoffice1"></asp:RequiredFieldValidator>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OFFICE #">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice3" runat="server" Text='<%# Eval("Planoffice3") %>'
                                MaxLength="40"></asp:TextBox>
                            <%--<asp:RequiredFieldValidator ID="rfvPlanoffice2" CssClass="required-info" Display="Dynamic"
                                runat="server" ErrorMessage="* Required Field !" ControlToValidate="tbPlanoffice3"></asp:RequiredFieldValidator>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Alternate Dental Office Name">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice2" runat="server" Text='<%# Eval("Planoffice2") %>'
                                MaxLength="30"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="OFFICE #">
                        <ItemTemplate>
                            <asp:TextBox ID="tbPlanoffice4" runat="server" Text='<%# Eval("Planoffice4") %>'
                                MaxLength="40"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="OdsDentalGridView" runat="server" SelectMethod="GetEnrollmentFormPlans"
                TypeName="Pibt.BLL.EnrollmentForm">
                <SelectParameters>
                    <asp:SessionParameter Name="oeId" SessionField="OeId" Type="String" />
                    <asp:Parameter DefaultValue="2" Name="planTypeId" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Panel>
<asp:Panel ID="PanelAdditional" runat="server">
    <div class="customer-info-box">
        <div class="section-title">
            Life Coverage information:<span style="color:red;">(If available select Insurance amount before continuing)</span>
        </div>
        <div class="section-body">
            <asp:GridView ID="GridViewAddl" runat="server" AutoGenerateColumns="False" PageSize="13"  Width="100%"
                AllowSorting="True" AllowPaging="True" ShowStatusBar="True" DataSourceID="OdsAddtionalGridView"
                DataKeyNames="ID" OnRowDataBound="GridViewAddl_RowDataBound">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID"
                        Visible="False" />
                    <asp:BoundField DataField="OEID" HeaderText="OEID" SortExpression="OEID" Visible="False" />
                    <asp:BoundField DataField="MEMBERID" HeaderText="MEMBERID" Visible="False" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" ControlStyle-Width="30" />
                    <asp:BoundField DataField="PLANNAME" HeaderText="PLAN NAME" />
                    <asp:TemplateField HeaderText="PAY PERIOD">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlPay" runat="server" SelectedValue='<%# Bind("RATETYPE") %>'
                                AppendDataBoundItems="True" DataTextField="DESCRIPTION" DataValueField="Ratetype"
                                DataSourceID="ObjectDataSource2">
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetMemberratetypes"
                                TypeName="Pibt.BLL.EnrollmentForm"></asp:ObjectDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SALARY">
                        <ItemTemplate>
                            <asp:TextBox ID="tbSALARY" runat="server" Text='<%# Eval("SALARY") %>' MaxLength="8"></asp:TextBox>
                         <%--   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" CssClass="required-info"
                                runat="server" ErrorMessage="* Required Field !" ControlToValidate="tbSALARY"></asp:RequiredFieldValidator>--%>
                            <asp:RangeValidator ID="RangeValidator_tbSALARY" Display="Dynamic" runat="server"
                                CssClass="required-info" ErrorMessage="* Range 1 ~ 99999999" ControlToValidate="tbSALARY"
                                MinimumValue="0" MaximumValue="99999999" Type="Currency"></asp:RangeValidator>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="INSURANCE AMOUNT">
                        <ItemTemplate>
                            <asp:Label ID="tbInsuranceAmount" runat="server" Text='<%# Eval("INSURANCEAMOUNT") %>'></asp:Label>
                            <asp:DropDownList ID="dpInsuranceAmount" Visible="false" runat="server">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="HOURS WORKED WEEKLY">
                        <ItemTemplate>
                            <asp:TextBox ID="tbHours" runat="server" Text='<%# Eval("HOURSWORKED") %>' MaxLength="3"></asp:TextBox>
                           <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" CssClass="required-info"
                                runat="server" ErrorMessage="* Required Field !" ControlToValidate="tbHours"></asp:RequiredFieldValidator>--%>
                            <asp:RangeValidator ID="RangeValidator_tbHours" Display="Dynamic" CssClass="required-info"
                                runat="server" ErrorMessage="* Range 0 ~ 168" ControlToValidate="tbHours" MinimumValue="0"
                                MaximumValue="168" Type="Integer"></asp:RangeValidator>
                        </ItemTemplate>
                    </asp:TemplateField>

                <%-- Disabled Column --%>
                <asp:TemplateField HeaderText="SMOKER" Visible="false">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlSmoker" runat="server" SelectedValue='<%# Bind("SMOKER") %>'
                                DataSource='<%# (new string[] { "Y", "N" }) %>' AppendDataBoundItems="True">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:PlaceHolder ID="placeMTLNoteList" Visible="false" runat="server">
                <div class="note-list">
                    <asp:Label ID="Label2" runat="server" Text="1. Smoker: Has smoked or used tobacco products in the last 12 months"></asp:Label>
                    <br />
                    <asp:Label ID="Label5" runat="server">2.<span style="color:red;">*</span> If a member wants to choose following insurance amount, he/she has to contact us!</asp:Label>
                    <table class="table">
                        <tr>
                            <th>
                                <span style="color:red;">*</span>Employee
                            </th>
                            <th>
                                <span style="color:red;">*</span>Spouse(Domestic partner)
                            </th>
                        </tr>
                        <tr>
                            <td>
                                $150,000<br />
                                $200,000<br />
                                $300,000<br />
                                $400,000<br />
                                $500,000<br />
                            </td>
                            <td>
                                $30,000<br />
                                $35,000<br />
                                $40,000<br />
                                $45,000<br />
                                $50,000<br />
                                $100,000<br />
                                $150,000<br />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:PlaceHolder>
            <asp:ObjectDataSource ID="OdsAddtionalGridView" runat="server" SelectMethod="GetEnrollmentFormLifePlans"
                TypeName="Pibt.BLL.EnrollmentForm">
                <SelectParameters>
                    <asp:SessionParameter Name="oeId" SessionField="OeId" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
</asp:Panel>
