<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlCreateWebUser.ascx.cs"
    Inherits="Pibt.UserControl.CtlCreateWebUser" %>
<fieldset>
<div class="customer-info-box">
    <div class="section-title">
        Create a web portal account for
        <%=Role.ToString() %>.</div>
    <div class="note-list" style="margin-bottom:10px;">
        This feature allows <%=Role.ToString() %> to view their specific coverage online.
    </div>
    <div class="section-body">
        <table class="table-container">
            <tbody>
                <tr class="row">
                    <td class="item-name">
                        Web Username:
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtLoginName" runat="server" Height="28px" Width="240" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLoginName" runat="server" ControlToValidate="txtLoginName"
                            CssClass="required-info" ErrorMessage="User Name Is Required" ValidationGroup="CreateUser" />
                    </td>
                </tr>
               <tr class="row"><td>&nbsp;</td></tr>
                <tr class="row">
                    <td class="item-name">
                        Password:
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtPassword" runat="server" MaxLength="50" Height="28px" Width="245" TextMode="Password"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                        <asp:CheckBox ID="chkAutoGeneratePwd" runat="server" Text="Auto Assign Password"  Checked="false"/>
                    </td>
                    <td>
                         <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                          CssClass="required-info" ErrorMessage="Password Is Required" ValidationGroup="CreateUser" />
                   </td>
                </tr>
                <tr class="row">
                    <td class="item-value">
                    </td>
                    <td class="item-value">
                        <div>
                            <span id="tdPwdStrength">Password Strength</span>
                            <table width="100px">
                                <tr style="height: 25px">
                                    <td id="tdBad">
                                    </td>
                                    <td id="tdWeak">
                                    </td>
                                    <td id="tdStrong">
                                    </td>
                                    <td id="tdBest">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
                <tr class="row">
                    <td class="item-name">
                    </td>
                    <td>
                        <asp:Button ID="btnCreateUser" CssClass="btn" runat="server" Text="Create" ValidationGroup="CreateUser"
                            OnClick="btnCreateUser_Click" />
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="clear">
    </div>
    <div id="CreateWebUserDialog" class="message-error">
        <asp:Literal ID="lblMessage" runat="server" EnableViewState="false"></asp:Literal>
    </div>
    <div class="note-list" style="list-style-type:circle">
        Username is limited to 10 characters and/or symbols.<br />
        Password Requirements
        <ul style="list-style:inherit; padding-left:20px;">
            <li>At least 6 characters or longer</li>
            <li>At least one uppercase letter (A_Z)</li>
            <li>At least one lowercase letter (a-z)</li>
            <li>At least one number (0-9)</li>
            <li>At least one non-alphanumberic character (e.g.,!,$,#,%)</li>
        </ul>
    </div>
</div>
</fieldset>
