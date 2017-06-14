<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEditRKDetails.ascx.cs"
    Inherits="Pibt.UserControl.CtlEditRKDetails" %>
<fieldset>
    <div class="customer-info-box">
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <tr class="row">
                        <td class="item-name">
                            RK #:
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblRKID" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Login Name:
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblLoginName" runat="server"></asp:Label>
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
                                CssClass="required-info" ErrorMessage="User Name Is Required" ValidationGroup="EditRK" />
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Email:
                        </td>
                        <td class="item-value">
                            <asp:TextBox ID="txtEmailAddress" runat="server" Text="" MaxLength="256"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtEmailAddress"
                                Display="Dynamic" CssClass="required-info" ErrorMessage="Email Is Required" ValidationGroup="EditRK" />
                            <asp:RegularExpressionValidator ID="revEmail" ControlToValidate="txtEmailAddress"
                                Display="Dynamic" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+"
                                CssClass="required-info" ValidationGroup="EditRK" runat="server" ErrorMessage="Enter valid Email address."></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            RK Full Name:
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblRKFullName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Cobrarep:
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblCobrarep" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Team Lead:
                        </td>
                        <td class="item-value">
                            <asp:Label ID="lblLeaderName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                        </td>
                        <td class="item-value">
                            <asp:Button ID="btnUpdateUser" runat="server" Text="Update" ValidationGroup="EditRK"
                                CssClass="btn" OnClick="btnUpdateUser_Click" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div id="EditRKDialog" class="message-error">
    <asp:Literal ID="lblMessage" runat="server" EnableViewState="false"></asp:Literal>
    </div>
</fieldset>
<%--<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">
        function btnUpdateRKDetails_click(sernder, args) {
            if (args.EventTarget == "<%=btnUpdateUser.UniqueID %>") {
                if ($("#EditRKDialog .error-list").length > 0 || $("#EditRKDialog .alert-list").length > 0) {
                    PopupMsgDialog("EditRKDialog");
                }
            }
        }
    </script>
</telerik:RadCodeBlock>--%>
