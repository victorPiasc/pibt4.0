<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlOnlineQuote.ascx.cs" Inherits="Pibt.UserControl.CtlOnlineQuote" %>

<table class="table-container">
    <tbody>        
        <tr class="row">
            <td class="item-name">Gender:
            </td>
            <td class="item-value">
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" Width="100">
                    <asp:ListItem Text="Select" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Male" Value="Y"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="N"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ddlGenderValidator" runat="server" ErrorMessage="*Please select gender" CssClass="required-info" ControlToValidate="ddlGender" ValidationGroup="updateGroup" InitialValue="4"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr class="row">
            <td class="item-name">Birthdate:
            </td>
            <td class="item-value">
                <telerik:RadDatePicker ID="dpBirthDate"  MinDate="1900/1/1" runat="server" SelectedDate='<%# DataBinder.Eval(Container,"DataItem.BIRTHDATE") %>' Height="34" >
                </telerik:RadDatePicker>
                (MM/DD/YYYY)

            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="required-info" SetFocusOnError="true"
                    ErrorMessage="*Birthdate is a required field" ControlToValidate="dpBirthDate" ValidationGroup="updateGroup">
                </asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <%--<tr class="row">
            <td class="item-name">Zip Code:
            </td>
            <td class="item-value">
                <telerik:RadTextBox ID="tbPostCode" runat="server" CssClass="form-control" MaxLength="9" Height="34px" Width="160" Text='<%# DataBinder.Eval(Container, "DataItem.ZIP") %>'></telerik:RadTextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ZipCodeValidator" runat="server" CssClass="required-info" SetFocusOnError="true"
                    ErrorMessage="*Zip code is a required field" ControlToValidate="tbPostCode" ValidationGroup="updateGroup" ></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="[0-9]{5,}" ControlToValidate="tbPostCode" ValidationGroup="updateGroup"
                    runat="server" ErrorMessage="*Please enter valid zip code" CssClass="required-info"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>--%>
        <%--<tr class="row">
            <td class="item-name">Smoker:
            </td>
            <td class="item-value">
                <asp:DropDownList ID="ddlSmoker" runat="server" CssClass="form-control" Width="100" >
                    <asp:ListItem Text="Select" Value="4"></asp:ListItem>
                    <asp:ListItem Text="No" Value="N"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="ddlSmokerValidator" runat="server" ErrorMessage="*Please choose smoker option" CssClass="required-info" ControlToValidate="ddlSmoker" ValidationGroup="updateGroup" InitialValue="4"></asp:RequiredFieldValidator>
            </td>
        </tr> --%>             
    </tbody>
</table>
<div style="text-align:center">
    <asp:Button ID="btnUpdate" Text="Update" runat="server" CssClass="btn" CommandName="Update" ValidationGroup="updateGroup" />
    &nbsp;
    <asp:Button ID="btnCancel" Text="Cancel" runat="server" CssClass="btn" CausesValidation="false" CommandName="Cancel" />
</div>

