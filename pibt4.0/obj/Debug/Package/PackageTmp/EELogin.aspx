<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeBehind="EELogin.aspx.cs" Inherits="Pibt.EELogin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">
                <h1>Welcome to Your PIBT Portal</h1>
                <hr />
            </div>
        </div>
        <div class="row" style="margin-bottom: 60px;">
            <div class="column-3">&nbsp;</div>
            <div class="column-6">
                <div style="font-size: 14px; font-family: Open Sans; font-weight: bold; color: Black; padding-bottom: 10px;">
                    <span>The portal is your private spot to manage your benefits. Did you know that you can do the following?</span>
                    <ul style="padding-left: 40px; list-style: circle">
                        <li>Manage your information</li>
                        <li>Add Dependents</li>
                        <li>Enroll in the benefit plans that your employer offers</li>
                    </ul>
                </div>
                <table class="table-container">
                    <tbody>
                        <tr class="row">
                            <td class="item-name">Username:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="UserName" runat="server" CssClass="form-control" MaxLength="20" autofocus="autofocus" Width="227px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="UserNameOrEmailRequired" Display="Dynamic" runat="server" ControlToValidate="UserName" ErrorMessage="*Username is required." CssClass="required-info" ValidationGroup="LoginForm"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:CheckBox ID="RememberMe" Text="Remember&nbsp;me&nbsp;next&nbsp;time" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Password:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" MaxLength="50" Style="display: inline;" Width="227px"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="PasswordRequired" Display="Dynamic" runat="server" ControlToValidate="Password" ErrorMessage="*Password Required" CssClass="required-info" ValidationGroup="LoginForm"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:HyperLink ID="hlForgotPassword" CssClass="link" runat="server" NavigateUrl="/passwordrecovery.aspx" Text="Forgot Password"></asp:HyperLink>
                            </td>
                        </tr>
                        <tr class="row">
                            <td colspan="2">
                                <span class="required-info">
                                    <asp:Literal ID="lbl_failureText" runat="server" EnableViewState="false"></asp:Literal></span>&nbsp;
                                    <asp:CustomValidator ID="termsValidator" runat="server" ErrorMessage="*You&nbsp;must&nbsp;accept&nbsp;the&nbsp;Terms&nbsp;&&nbsp;Conditions&nbsp;and&nbsp;Privacy&nbsp;Statement." ClientValidationFunction="checkBoxRequired" CssClass="required-info" ValidationGroup="LoginForm" EnableClientScript="true" ></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:CheckBox ID="terms" Text='I&nbsp;accept&nbsp;the&nbsp;<a href="/Documents/Terms_and_Conditions.pdf" style="text-decoration:underline;" target="_blank">Terms & Conditions</a>&nbsp;and&nbsp;<a href="/Documents/Privacy _Statement.pdf" style="text-decoration:underline;" target="_blank">Privacy Statement</a>' runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr class="row">
                            <td colspan="2">
                                <asp:Button ID="LoginButton" class="btn" runat="server" CommandName="Login" Text="Sign in" ValidationGroup="LoginForm" OnClick="LoginButton_Click" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="column-12 simpleText">
                Please email the <a href="/Documents/Terms_and_Conditions.pdf" style="text-decoration: underline;" target="_blank">Terms & Conditions</a> and <a href="/Documents/Privacy _Statement.pdf" style="text-decoration: underline;" target="_blank">Privacy Statement</a> to 
                <asp:TextBox ID="email" runat="server" MaxLength="60" Style="display: inline" CssClass="form-control" Width="25%" ValidationGroup="send"></asp:TextBox>
                <asp:Button ID="sendEmail" runat="server" CssClass="btn" Text="Send" OnClick="sendEmail_Click" ValidationGroup="send" />
                <br />
                <asp:RequiredFieldValidator ID="requiredEmail" runat="server" ErrorMessage="*Required email addreess" CssClass="required-info" ControlToValidate="email" ValidationGroup="send" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="validateEmail" runat="server" ErrorMessage="*Incorrect Email format" CssClass="required-info" ClientValidationFunction="validateEmail" Style="text-align: right;" ControlToValidate="email" ValidationGroup="send" Display="Dynamic"></asp:CustomValidator>
                <asp:Label ID="sent" runat="server" Style="color: green;"></asp:Label>
            </div>
        </div>
        <div class="simpleText" style="position: absolute; bottom: 30px; left: 30%; font-size: 12px">
            <table>
                <tbody>
                    <tr>
                        <td>If you have difficulties, please contact customer service at &nbsp;
                        </td>
                        <td>(800) 449-4898 ext 259<br />
                            <a href="mailto:OnlineHelpDesk@piasc.org">OnlineHelpDesk@piasc.org</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <script src="js/validation.js"></script>
    <script type="text/javascript">
        function checkBoxRequired(sender, e) {
            var checkBox = document.getElementById('<%= terms.ClientID %>');
            e.IsValid = checkBox.checked;
        }
    </script>
</asp:Content>
