<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlLogin.ascx.cs" Inherits="Pibt.UserControl.CtlLogin" %>
<%@ Register Src="CtlTopInfoMenu.ascx" TagName="CtlTopInfoMenu" TagPrefix="uc1" %>
<asp:LoginView ID="LoginViewLoginPart" runat="server">
    <AnonymousTemplate>

        <asp:Login ID="LoginForm" TitleText="" runat="server" OnLoggedIn="login1_LoggedIn"
            RememberMeSet="true">
            <LayoutTemplate>
                <table class="login-form">
                    <tbody>
                        <tr class="row">
                            <td class="item-name">
                                <label>
                                    Username</label>
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="UserName" Width="120" CssClass="text" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameOrEmailRequired" Display="Dynamic" runat="server"
                                    ControlToValidate="UserName" Text="*Required" ErrorMessage="Username is required." CssClass="red"
                                    ToolTip="Username is required." ValidationGroup="LoginForm"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                <label>
                                    Password</label>
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="Password" Width="120" CssClass="text" TextMode="Password" runat="server"
                                    MaxLength="50"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" Display="Dynamic" runat="server"
                                    ControlToValidate="Password" Text="*Required" ErrorMessage="Password Required" CssClass="red"
                                    ToolTip="Password Required" ValidationGroup="LoginForm"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-value" colspan="2">
                                <asp:CheckBox ID="RememberMe" Text="Remember me next time" runat="server"></asp:CheckBox>
                            </td>
                        </tr>
                        <tr class="row">
                            <td colspan="2">
                            </td>
                        </tr>
                        <tr class="row">
                            <td colspan="2">
                                <p>
                                </p>
                                <div>
                                    <asp:HyperLink ID="hlForgotPassword" CssClass="needhelp" runat="server" NavigateUrl="~/passwordrecovery.aspx"
                                        Text="Forgot Password"></asp:HyperLink>
                                </div>
                               <br />
                                <div>
                                    Not a <%=Pibt.Common.Utilities.Us()%> member? <a class="needhelp" href="/Register.aspx">Register</a></div>
                            </td>
                        </tr>
                        <tr class="row">
                            <td colspan="2" align="right">
                                <div>
                                    <asp:Button ID="LoginButton" class="login" runat="server" CommandName="Login" Text="Login"   
                                        ValidationGroup="LoginForm" />
                                </div>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="message-error" colspan="2">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </LayoutTemplate>
        </asp:Login>

    </AnonymousTemplate>
    <LoggedInTemplate>
        <uc1:CtlTopInfoMenu ID="CtlTopInfoMenu1" runat="server" />
       <div style="margin-bottom:6px;">
        <asp:LinkButton ID="btnLogout" CausesValidation="false" runat="server" CssClass="btn" 
            OnClick="btnLogout_Click">Sign out</asp:LinkButton>
        </div>
    </LoggedInTemplate>
</asp:LoginView>
