<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAdditionalInfo.ascx.cs"
    Inherits="Pibt.UserControl.CtlAdditionalInfo" %>
<div class="customer-info-box">
    <asp:PlaceHolder runat="server" ID="bizAddlInfo">
        <div class="section-title">
            Additional Infomation:
        </div>
        <div class="clear">
        </div>
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <asp:PlaceHolder runat="server" ID="phWaitingPeriod">
                        <tr class="row">
                            <td class="item-name">
                                Waiting Period:
                            </td>
                            <td class="item-value">
                                <asp:DropDownList ID="ddlWaitingPeriod" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phEnroller">
                        <tr class="row">
                            <td class="item-name">
                                Enroller:
                            </td>
                            <td class="item-value">
                                <asp:DropDownList ID="ddlEnroller" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phTeamLead">
                        <tr class="row">
                            <td class="item-name">
                                Team Lead:
                            </td>
                            <td class="item-value">
                                <asp:Label ID="lblTeamLead" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phRK">
                        <tr class="row">
                            <td class="item-name">
                                Relationship Keeper:
                            </td>
                            <td class="item-value">
                                <asp:DropDownList ID="ddlRK" AutoPostBack="true" OnSelectedIndexChanged="ddlRK_OnSelectedIndexChanged"
                                    runat="server">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvRK" runat="server" ControlToValidate="ddlRK" ErrorMessage="Account.RelationshipKeeperIsRequired"
                                    ToolTip="Account.Relationship Kepper" ValidationGroup="AddtionalInfo">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phTerms">
                        <tr class="row">
                            <td class="item-name">
                                Terms:
                            </td>
                            <td class="item-value">
                                <asp:DropDownList ID="ddlTerms" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phEEContribution">
                        <tr class="row">
                            <td class="item-name">
                                Employee Contribution:
                            </td>
                            <td class="item-value">
                                <telerik:RadNumericTextBox ID="tbEEContribution" EmptyMessage="Enter a number 50 to 100"
                                    NumberFormat-DecimalDigits="0" runat="server" MaxValue="100" MinValue="50" MaxLength="3"
                                    Width="200">
                                </telerik:RadNumericTextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phDepContribution">
                        <tr class="row">
                            <td class="item-name">
                                Dependent Contribution:
                            </td>
                            <td class="item-value">
                                <telerik:RadNumericTextBox ID="tbDepContribution" EmptyMessage="Enter a number" NumberFormat-DecimalDigits="0"
                                    runat="server" MaxLength="3" Width="200">
                                </telerik:RadNumericTextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phTaxID">
                        <tr class="row">
                            <td class="item-name">
                                Tax ID:
                            </td>
                            <td class="item-value">
                                <telerik:RadNumericTextBox ID="tbTaxID" EmptyMessage="Enter a number" NumberFormat-DecimalDigits="0"
                                    NumberFormat-GroupSeparator="" runat="server" MaxLength="9" Width="200">
                                </telerik:RadNumericTextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phSic">
                        <tr class="row">
                            <td class="item-name">
                                SIC #:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbSic" runat="server" MaxLength="10" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder runat="server" ID="phNaBiz">
                        <tr class="row">
                            <td class="item-name">
                                Nature of Business:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbNaBiz" runat="server" MaxLength="50" Width="200"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:PlaceHolder>
                </tbody>
            </table>
        </div>
        <div class="clear">
        </div>
    </asp:PlaceHolder>
    <asp:LoginView ID="LoginViewFunctionButtons" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Administrator,RK,Broker">
                <ContentTemplate>
                    <div class="bottom-center-buttons">
                        <asp:Button ID="btSave" CssClass="btn" ValidationGroup="AddtionalInfo" runat="server"
                            Text="Update" Width="100" OnClick="btSave_Click" />
                    </div>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
    <asp:Label ID="lblError" runat="server" Text="" CssClass="red"></asp:Label>
</div>
