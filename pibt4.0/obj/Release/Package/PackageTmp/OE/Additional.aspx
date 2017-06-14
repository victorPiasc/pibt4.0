<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="Additional.aspx.cs" Inherits="Pibt.OE.Additional" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc3" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <a href="/">Home</a> / Enroller Form / Provider Information
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <br />
    <fieldset>
        <legend>Provider Information:</legend>
        <asp:Panel ID="PanelPCP" runat="server">
            <asp:ValidationSummary ID="summary" runat="server" ValidationGroup="med" DisplayMode="List" CssClass="required-info" />
            <div class="customer-info-box">
                <div class="section-title">
                    Medical Provider Information:
                </div>
                <div class="section-body">
                    <asp:Literal ID="medMessage" runat="server"></asp:Literal>
                    <asp:GridView ID="GridViewPCP" runat="server" AutoGenerateColumns="False" PageSize="13" SkinID="" AllowSorting="True" AllowPaging="True"
                        DataSourceID="OdsPCPGridView" DataKeyNames="ID" HeaderStyle-Height="33" >
                        <Columns>
                            <asp:BoundField DataField="ID" Visible="False" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HiddenField ID="carrierId" runat="server" Value='<%# Eval("carrierId") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="NAME" HeaderText="Name" ItemStyle-Width="200" />
                            <asp:BoundField DataField="PLANNAME" HeaderText="Plan Name" ItemStyle-Width="250" />
                            <asp:TemplateField HeaderText="Doctor Name" ItemStyle-Width="170">
                                <ItemTemplate>
                                    <asp:TextBox ID="tbPlanoffice1" runat="server" Text='<%# Eval("Planoffice1") %>' MaxLength="40" Width="160"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Provider ID" ItemStyle-Width="170">
                                <HeaderTemplate>
                                    Provider ID
                                   <span aria-hidden="true" class="glyphicon glyphicon-info-sign" style="color:#000;" onmouseover="show('provider', 1)" onmouseout="unshow('provider',1)"></span>
                                    <div id="medProvider" style="display:none; z-index:1; background:#F9F9F9; position:absolute; border:solid 1px; margin-top:26px; right:30%;">
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="tbPlanoffice2" runat="server" Text='<%# Eval("Planoffice2") %>' MaxLength="10" Width="120"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="po2Reg" runat="server" ControlToValidate="tbPlanOffice2"  ValidationExpression="[A-Z a-z 0-9]+" Text="*" ErrorMessage='<%# Eval("name")+" has an error, no special characters allowed for Provider ID" %>' Display="Static" ForeColor="Red" Font-Size="Medium" ValidationGroup="med"></asp:RegularExpressionValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="210" HeaderText="Medical Group IPA<br/>Enrollment ID">
                                <HeaderTemplate>
                                    Medical Group IPA<br/>Enrollment ID
                                     <span aria-hidden="true" class="glyphicon glyphicon-info-sign" style="color:#000;" onmouseover="show('office', 1)" onmouseout="unshow('office',1)"></span>
                                    <div id="medOffice" style="display:none; z-index:1; background:#F9F9F9; position:absolute; border:solid 1px; margin-top:17px; right:10%;">
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="tbPlanoffice3" runat="server" Text='<%# Eval("Planoffice3") %>' MaxLength="10" Width="120"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="po3Reg" runat="server" ControlToValidate="tbPlanOffice3"  ValidationExpression="[A-Z a-z 0-9]+" Text="*" ErrorMessage='<%# Eval("name")+" has an error, no special characters allowed for Medical Group/Enrollment ID" %>' Display="Static" ForeColor="Red" Font-Size="Medium" ValidationGroup="med"></asp:RegularExpressionValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="170" ItemStyle-HorizontalAlign="Center" HeaderText="Auto assign provider">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbAuto" runat="server" TextAlign="Right" />&nbsp;
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
                    <div style="text-align:right;" >
                        <asp:HyperLink ID="medSearch" runat="server" Text="Search for a provider here" Target="_blank" Font-Underline="true"></asp:HyperLink>
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
                        DataSourceID="OdsDentalGridView" DataKeyNames="ID" HeaderStyle-Height="33" >
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HiddenField ID="carrierId" runat="server" Value='<%# Eval("carrierId") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ID" Visible="False" />
                            <asp:BoundField DataField="NAME" HeaderText="Name" ItemStyle-Width="200" />
                            <asp:BoundField DataField="PLANNAME" HeaderText="Plan Name" ItemStyle-Width="250" />
                            <asp:TemplateField HeaderText="Dental Office Name" ItemStyle-Width="170">
                                <ItemTemplate>
                                    <asp:TextBox ID="tbPlanoffice1" runat="server" Text='<%# Eval("Planoffice1") %>' MaxLength="40" Width="160" ></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Provider ID" ItemStyle-Width="170">
                                <HeaderTemplate>
                                    Provider ID
                                    <span aria-hidden="true" class="glyphicon glyphicon-info-sign" style="color:#000;" onmouseover="show('provider', 2)" onmouseout="unshow('provider',2)"></span>
                                    <div id="denProvider" style="display:none; z-index:1; background:#F9F9F9; position:absolute; border:solid 1px; margin-top:-460px; right:30%;">
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="tbPlanoffice2" runat="server" Text='<%# Eval("Planoffice2") %>' MaxLength="10" Width="120" ></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="po2Reg" runat="server" ControlToValidate="tbPlanOffice2"  ValidationExpression="[A-Z a-z 0-9]+" Text="*" ErrorMessage='<%# Eval("name")+" has an error, no special characters allowed for Provider No." %>' Display="Static" ForeColor="Red" Font-Size="Medium" ValidationGroup="med"></asp:RegularExpressionValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Dental Office ID" ItemStyle-Width="210">
                                <HeaderTemplate>
                                    Dental Office ID
                                    <span aria-hidden="true" class="glyphicon glyphicon-info-sign" style="color:#000;" onmouseover="show('office', 2)" onmouseout="unshow('office',2)"></span>
                                    <div id="denOffice" style="display:none; z-index:1; background:#F9F9F9; position:absolute;border:solid 1px; margin-top:-460px; right:10%;">
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:TextBox ID="tbPlanoffice3" runat="server" Text='<%# Eval("Planoffice3") %>' MaxLength="10" Width="120" ></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="po3Reg" runat="server" ControlToValidate="tbPlanOffice3"  ValidationExpression="[A-Z a-z 0-9]+" Text="*" ErrorMessage='<%# Eval("name")+" has an error, no special characters allowed for Provider No." %>' Display="Static" ForeColor="Red" Font-Size="Medium" ValidationGroup="med"></asp:RegularExpressionValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="150" ItemStyle-HorizontalAlign="Center" HeaderText="Auto assign provider">
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbAuto" runat="server" TextAlign="Right" />
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
                    <div style="text-align:right;">
                        <asp:HyperLink ID="denSearch" runat="server" Text="Search for a provider here" Target="_blank" Font-Underline="true" ></asp:HyperLink>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </fieldset>
    <div class="div">
        <div class="col-lg-4">
            <asp:Button runat="server" ID="BtBack" CssClass="btn" CausesValidation="false" Text="Previous" OnClick="BtBack_Click" Width="98px" />
        </div>
        <div class="col-lg-4">
            <asp:Button runat="server" CssClass="btn" Style="padding-right: 10px;" ID="startOver" Text="Start Over" OnClick="startOver_Click" />
            <asp:Button runat="server" ID="btnSaveAndExit" CssClass="btn btn-danger" Text="Save For Later" OnClick="btnSaveAndExit_Click" />
        </div>
        <div class="col-lg-4">
            <asp:Button runat="server" ID="BtNext" Text="Continue" CssClass="btn" OnClick="BtNext_Click" Width="98px"  ValidationGroup="med" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc3:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
