<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAddWebUser.ascx.cs"
    Inherits="Pibt.UserControl.CtlAddWebUser" %>
<fieldset>
    <legend>Add New <%=Role.ToString() %></legend>
    <table class="table-container">
        <tr class="row">
            <td class="item-name">
                Select User ID&nbsp;&nbsp;&nbsp;
            </td>
            <td class="item-value">
                <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control" Height="26px" Width="240px" MaxLength="30"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUserId" CssClass="message-error" ValidationGroup="vAddWebUser"
                    Display="Dynamic" ErrorMessage="It's required." runat="server" ControlToValidate="txtUserId"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
           <td></td>
           <td></td>
            <td>
                <asp:Button ID="btnAdd" Text="Add" CssClass="btn" runat="server" ValidationGroup="vAddWebUser" OnClick="btnAdd_Click" />
            </td>
        </tr>
    </table>
    <asp:Label ID="lblCheckResult" runat="server" CssClass="message-error"></asp:Label>
</fieldset>

