<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlOnlineQuote.ascx.cs" Inherits="Pibt.UserControl.CtlOnlineQuote" %>

<table class="table-container">
    <tbody>
        <tr class="row">
            <td class="item-name tcell-padding">Gender:
            </td>
            <td class="item-value tcell-padding">
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" Width="100">
                    <asp:ListItem Text="-- Select --" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Male" Value="Y"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="N"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ddlGenderValidator" runat="server" ErrorMessage="*Please select gender" CssClass="required-info" ControlToValidate="ddlGender" ValidationGroup="updateGroup" InitialValue="4"></asp:RequiredFieldValidator>
            </td>
            <td class="item-name tcell-padding">Birthdate:
            </td>
            <td class="item-value tcell-padding">
                <telerik:RadDatePicker ID="dpBirthDate" MinDate="1900/1/1" runat="server" SelectedDate='<%# DataBinder.Eval(Container,"DataItem.BIRTHDATE") %>'>
                </telerik:RadDatePicker>
                (MM/DD/YYYY)

            </td>
            <td class="tcell-padding">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="required-info" SetFocusOnError="true"
                    ErrorMessage="*Birthdate is a required field" ControlToValidate="dpBirthDate" ValidationGroup="updateGroup">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <asp:Panel ID="eeSection" runat="server" Visible="false">
            <tr class="row">
                <td class="item-name tcell-padding">Employee&nbsp;%:
                </td>
                <td class="item-value tcell-padding">
                    <asp:TextBox ID="tbcontribution" runat="server" CssClass="form-control" Text='<%# DataBinder.Eval(Container,"DataItem.CONTRIBUTION") %>'></asp:TextBox>
                </td>
                <td class="tcell-padding">
                    <asp:RegularExpressionValidator ID="contRegExp" runat="server" CssClass="required-info"
                        ErrorMessage="*Numbers (which may contain a decimal point) only" ControlToValidate="tbcontribution"
                        ValidationExpression="^\d{0,3}(\.\d{0,2})?">
                    </asp:RegularExpressionValidator>
                </td>
                <td class="item-name tcell-padding">Dependent&nbsp;%:
                </td>
                <td class="item-value tcell-padding">
                    <asp:TextBox ID="tbcontributionDep" runat="server" CssClass="form-control" Text='<%# DataBinder.Eval(Container,"DataItem.CONTRIBUTIONDEP") %>'></asp:TextBox>
                </td>
                <td class="tcell-padding">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="required-info"
                        ErrorMessage="*Numbers (which main contain a decimal point) only" ControlToValidate="tbcontributionDep"
                        ValidationExpression="^\d{0,3}(\.\d{0,2})?">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr class="row">
                <td class="item-name tcell-padding">
                    <asp:Label ID="periodLabel" runat="server">Pay&nbsp;Period:</asp:Label>
                </td>
                <td class="item-value tcell-padding">
                    <asp:DropDownList ID="tbPeriod" runat="server" CssClass="form-control" Width="100">
                        <asp:ListItem Text="-- Select --" Value=""></asp:ListItem>
                        <asp:ListItem Text="Annual" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Semi-annual" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Quarterly" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Monthly" Value="12"></asp:ListItem>
                        <asp:ListItem Text="Semi-monthly" Value="24"></asp:ListItem>
                        <asp:ListItem Text="Bi-weekly" Value="26"></asp:ListItem>
                        <asp:ListItem Text="Weekly" Value="52"></asp:ListItem>
                        <asp:ListItem Text="Daily" Value="260"></asp:ListItem>
                        <asp:ListItem Text="Hourly" Value="2080"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class=" tcell-padding">
                    <asp:RegularExpressionValidator ID="periodRegExp" runat="server" CssClass="required-info" ErrorMessage="*Nunbers only"
                        ControlToValidate="tbperiod" ValidationExpression="^\d{0,4}"></asp:RegularExpressionValidator>
                </td>
                <td class="item-name tcell-padding">
                    <asp:Label ID="salaryLabel" runat="server">Pay per Period:</asp:Label>
                </td>
                <td class="item-value tcell-padding">
                    <asp:TextBox ID="tbsalary" runat="server" CssClass="form-control" MaxLength="10" Text='<%# DataBinder.Eval(Container,"DataItem.SALARYPERPERIOD") %>'></asp:TextBox>
                </td>
                <td class=" tcell-padding">
                    <asp:RegularExpressionValidator ID="salaryRegExp" runat="server" CssClass="required-info"
                        ErrorMessage="*Numbers (which may contain a decimal point) only" ControlToValidate="tbsalary" ValidationExpression="^\d{0,7}(\.\d{0,2})?">
                    </asp:RegularExpressionValidator>
                </td>
            </tr>
        </asp:Panel>
    </tbody>
</table>
<div style="text-align: center">
    <asp:Button ID="btnUpdate" Text="Update" runat="server" CssClass="btn" CommandName="Update" ValidationGroup="updateGroup" />
    &nbsp;
    <asp:Button ID="btnCancel" Text="Cancel" runat="server" CssClass="btn" CausesValidation="false" CommandName="Cancel" />
</div>

