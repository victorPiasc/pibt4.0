<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEditAgentDetails.ascx.cs"
    Inherits="Pibt.UserControl.CtlEditAgentDetails" %>
<fieldset>
    <div class="customer-info-box">
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <tr class="row">
                        <td class="item-name">
                            Agent#:
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblAgentID" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Login Name:
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblLoginName" Text="{unassigned}" runat="server"></asp:Label>
                            <asp:CheckBox ID="chkLockUser" Text="Lockout" AutoPostBack="true" runat="server"
                                OnCheckedChanged="chkLockUser_CheckedChanged" />
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            User Name:
                        </td>
                        <td class="item-value">
                            <asp:TextBox ID="txtUserName" runat="server" MaxLength="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName"
                                CssClass="required-info" ErrorMessage="User Name Is Required" ValidationGroup="EditAgent" />
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Email:
                        </td>
                        <td class="item-value">
                            <asp:TextBox ID="txtEmailAddress" runat="server" Text="" MaxLength="256"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtEmailAddress"
                                CssClass="required-info" ErrorMessage="Email Is Required" ValidationGroup="EditAgent" />
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                        </td>
                        <td class="item-value">
                            <asp:Button ID="btnUpdateUser" runat="server" Text="Update" ValidationGroup="EditAgent"  CssClass="btn"
                                OnClick="btnUpdateUser_Click" />
                            <br />
                            <asp:Label ID="lblMessage" CssClass="required-info" runat="server" Text="" EnableViewState="false"></asp:Label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</fieldset>
