<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="Beneficiary.aspx.cs" Inherits="Pibt.OE.Beneficiary" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc3" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <a href="/">Home</a> / Enroller Form / Beneficiaries
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <!--Content Start -->
    <div class="customer-info-box">
        <div class="section-body" style="border:none;">
            <fieldset>
                <legend><asp:Literal ID="lifeType" runat="server"></asp:Literal> Beneficiaries:</legend>
                <asp:Label ID="lbNoCoverage" runat="server"/>
                <telerik:RadGrid id="beneficiaries" runat="server" Skin="MetroTouch" AutoGenerateColumns="false" AllowSorting="true" OnNeedDataSource="beneficiaries_NeedDataSource" OnItemCommand="beneficiaries_ItemCommand" EnableLinqExpressions="false">
                    <MasterTableView DataKeyNames="rId" ShowFooter="true">
                        <CommandItemSettings />
                        <Columns>
                            <telerik:GridButtonColumn ButtonType="PushButton" CommandName="edit1" Text="Edit" ButtonCssClass="btn"></telerik:GridButtonColumn>
                            <telerik:GridBoundColumn DataField="LASTNAME" HeaderText="Last Name" SortExpression="LASTNAME" UniqueName="LASTNAME"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="FIRSTNAME" HeaderText="First Name" SortExpression="FIRSTNAME" UniqueName="FIRSTNAME"></telerik:GridBoundColumn>
                            <telerik:GridDropDownColumn ColumnEditorID="GridDropDownColumnEditor2" DataField="RELATIONSHIPID" DataSourceID="odsDsBeneficiaryTypes" HeaderText="Relationship" ListTextField="DESCRIPTION" ListValueField="RELATIONSHIPID" UniqueName="RELATIONSHIPID">
                            </telerik:GridDropDownColumn>
                            <telerik:GridBoundColumn DataField="PERCENTAGE" DataType="System.Decimal" HeaderText="Percentage" SortExpression="PERCENTAGE" UniqueName="percentage" Aggregate="Sum" FooterAggregateFormatString="{0}%" FooterStyle-Font-Bold="true"></telerik:GridBoundColumn>
                            <telerik:GridButtonColumn ButtonType="PushButton"  CommandName="delete" ConfirmDialogType="RadWindow" ConfirmText="Delete this beneficiary?" ConfirmTitle="Delete" Text="Delete" UniqueName="DeleteColumn" HeaderText="Remove" ButtonCssClass="btn" ItemStyle-HorizontalAlign="Center">
                            </telerik:GridButtonColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </fieldset>
            <asp:Panel ID="addUpdate" runat="server">
                <style >
                    td{
                        padding:2px;
                    }
                </style>
                <fieldset>
                    <legend>Beneficiary Information</legend>
                    <asp:HiddenField ID="benId" runat="server" />
                    <div class="row">
                        <div class="col-lg-6">
                            <table class="table-container">
                                <tr class="row">
                                    <td class="item-name">First Name:</td>
                                    <td class="item-value"><asp:TextBox ID="tbFirstName" runat="server" MaxLength="15" Width="200px" CssClass="form-control" ValidationGroup="add" ></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbFirstName" CssClass="required-info" Display="Dynamic" ErrorMessage="*Required" ValidationGroup="add"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">Middle Initial:</td>
                                    <td class="item-value"><asp:TextBox ID="tbMiddle" runat="server" MaxLength="1" Width="25px" CssClass="form-control" ValidationGroup="add"></asp:TextBox></td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">Last Name:</td>
                                    <td class="item-value"><asp:TextBox ID="tbLastName" runat="server" MaxLength="20" Width="200px" CssClass="form-control" ></asp:TextBox></td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbLastName" CssClass="required-info" Display="Dynamic" ErrorMessage="*Required" ValidationGroup="add"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">SSN:</td>
                                    <td class="item-value"><telerik:RadMaskedTextBox ID="tbSSN" runat="server" MaxLength="9"  Mask="###-##-####" Width="80" CssClass="form-control" ></telerik:RadMaskedTextBox></td>
                                    <td></td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">Address:</td>
                                    <td class="item-value"><asp:TextBox ID="tbAddress1" runat="server" MaxLength="80" Width="200px" CssClass="form-control" ></asp:TextBox></td>
                                    <td></td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">City:</td>
                                    <td class="item-value"><asp:TextBox ID="tbCity" runat="server" MaxLength="20" Width="200px" CssClass="form-control" ></asp:TextBox></td>
                                    <td></td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">State:</td>
                                    <td class="item-value">
                                        <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" DataSourceID="odsState" DataTextField="NAME" DataValueField="STATEID">
                                            <asp:ListItem Selected="True" Text="-- Select --" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">Zip Code</td>
                                    <td class="item-value"><asp:TextBox ID="tbZip" runat="server" MaxLength="5" CssClass="form-control"  Width="80" ValidationGroup="add"></asp:TextBox></td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RangeExpress2" runat="server" ControlToValidate="tbZip" CssClass="required-info" ErrorMessage="*Number only" ValidationExpression="^\d+$" ValidationGroup="add"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-lg-6">
                            <table class="table-container">
                                <tr class="row">
                                    <td class="item-name">Relationship:</td>
                                    <td class="item-value">
                                        <asp:DropDownList ID="ddlRelationship" runat="server" DataSourceID="odsDsBeneficiaryTypes" DataTextField="DESCRIPTION" DataValueField="RELATIONSHIPID" AppendDataBoundItems="true" ValidationGroup="add">
                                            <asp:ListItem Selected="True" Text="-- Select --" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlRelationship" CssClass="required-info" Display="Static" ErrorMessage="*Required" InitialValue="0" ValidationGroup="add"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">Percentage:</td>
                                    <td class="item-value"><asp:TextBox ID="tbPercentage" runat="server" MaxLength="5" Width="122px" CssClass="form-control" style="display:inline;" ValidationGroup="add"></asp:TextBox>&nbsp;%</td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbPercentage" CssClass="required-info" Display="Dynamic" ErrorMessage="*Required" ValidationGroup="add"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="tbPercentage" CssClass="required-info" Display="Dynamic" ErrorMessage="*Number only" ValidationExpression="^\d{0,3}(\.\d{1,2})?$" ValidationGroup="add"></asp:RegularExpressionValidator>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbPercentage" CssClass="required-info" Display="Dynamic" ErrorMessage="*1-100" MaximumValue="100" MinimumValue="1" Type="Double" ValidationGroup="add"></asp:RangeValidator>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td>
                                        <asp:Button ID="btnUpdate" runat="server" CssClass="btn" Text="Add" OnClick="btnUpdate_Click" ValidationGroup="add" />
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td>
                                        <asp:Button ID="btnCancel" runat="server" CssClass="btn" Text="Cancel Add" OnClick="btnCancel_Click"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <asp:ObjectDataSource ID="odsDsBeneficiaryTypes" runat="server" SelectMethod="GetBeneficiaryrelationship" TypeName="Pibt.BLL.EnrollmentForm"></asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="odsState" runat="server" SelectMethod="GetState" TypeName="Pibt.BLL.User"></asp:ObjectDataSource>
                </fieldset>
            </asp:Panel>
         </div>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <asp:Button runat="server" CssClass="btn" CausesValidation="false" ID="BtBack" Text="Cancel" OnClick="BtBack_Click" Width="98px" />
        </div>
        <div class="col-lg-6">
            <asp:Button runat="server" ID="BtNext" style="background-color:#6aa84f;" CssClass="btn" Text="Finish" OnClick="BtNext_Click" Width="98px" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc3:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
