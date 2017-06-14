<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEditBrokerDetails.ascx.cs" Inherits="Pibt.UserControl.CtlEditBrokerDetails" %>
    <div class="customer-info-box">
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <tr class="row">
                        <td class="item-name">
                            Broker #:
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblBrokerID" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Web Username:
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblLoginName" runat="server"></asp:Label>
                            <asp:CheckBox ID="chkLockUser" Text="Lockout" AutoPostBack="true" runat="server" OnCheckedChanged="chkLockUser_CheckedChanged" />
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            User:
                        </td>
                        <td class="item-value">
                            <asp:TextBox ID="txtUserName" runat="server" MaxLength="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" CssClass="required-info"
                                ErrorMessage="User name is required" ValidationGroup="EditBroker" />
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            EMail:
                        </td>
                        <td class="item-value">
                            <asp:TextBox ID="txtEmailAddress" runat="server" Text="" MaxLength="256"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtEmailAddress" Display="Dynamic"
                                CssClass="required-info" ErrorMessage="EMail is required" ValidationGroup="EditBroker" />
                            <asp:RegularExpressionValidator ID="revEmail" ControlToValidate="txtEmailAddress" Display="Dynamic"
                                ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" CssClass="required-info" ValidationGroup="EditBroker" runat="server"
                                ErrorMessage="Enter valid eMail address."></asp:RegularExpressionValidator>
                        </td>
                    </tr>                    
                    <tr class="row">
                        <td class="item-value" colspan="2">
                            <asp:Button ID="btnUpdateUser" runat="server" Text="Update" ValidationGroup="EditBroker" CssClass="btn" OnClick="btnUpdateUser_Click" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div id="EditBrokerDialog" class="message-error">
    <asp:Literal ID="lblMessage" runat="server" EnableViewState="false"></asp:Literal>
    </div>
