<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEditAdministrator.ascx.cs"
    Inherits="Pibt.UserControl.CtlEditAdministrator" %>
<fieldset>
    <div class="customer-info-box">
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <tr class="row">
                        <td class="item-name">
                            Web User Name:
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblLoginName" Text="{unassigned}" CssClass="form-control" runat="server"></asp:Label>
                            <asp:CheckBox ID="chkLockUser" Text="Lockout" AutoPostBack="true" runat="server"
                                OnCheckedChanged="chkLockUser_CheckedChanged" />
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            User Name:
                        </td>
                        <td class="item-value">
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" Height="26px" MaxLength="20"></asp:TextBox>
                        </td>
                       <td>
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName"
                            CssClass="required-info" ErrorMessage="User Name Is Required" ValidationGroup="EditForm" />
                       </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Email:
                        </td>
                        <td class="item-value">
                            <asp:TextBox ID="txtEmailAddress" runat="server" CssClass="form-control" Height="26px" Text="" MaxLength="256"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtEmailAddress"
                                CssClass="required-info" ErrorMessage="Email Is Required" ValidationGroup="EditForm"
                                Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revEmail" ControlToValidate="txtEmailAddress"
                                ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                                CssClass="required-info" Display="Dynamic" ValidationGroup="EditForm" runat="server"
                                ErrorMessage="Enter valid Email address!"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                        </td>
                        <td class="item-value">
                            <asp:Button ID="btnUpdateUser" runat="server" Text="Update" ValidationGroup="EditForm"  CssClass="btn"
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
