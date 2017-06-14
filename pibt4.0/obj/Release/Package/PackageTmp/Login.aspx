<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pibt.Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">
                <h1>Welcome!</h1>
                <hr />
            </div>
        </div>
        <div class="row">
            <div class="column-12">
                <table class="table-container" style="width: 60%; margin-bottom: 20px;">
                    <tbody>
                        <tr class="row">
                            <td>&nbsp;</td>
                            <td class="item-name">Username:
                            </td>
                            <td class="item-name">Password:
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="simpleText" style="color: #006DBB; font-weight: bold;">Registered&nbsp;User:
                            </td>
                            <td class="item-value" style="padding-right: 40px;">
                                <asp:TextBox ID="UserName" runat="server" CssClass="form-control" MaxLength="20" Width="100%" autofocus="autofocus"></asp:TextBox>
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" Width="100%" MaxLength="50"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="row">
                            <td>&nbsp;</td>
                            <td>
                                <asp:CheckBox ID="RememberMe" Text="Remember&nbsp;My&nbsp;Username" runat="server" />
                            </td>
                            <td>
                                <asp:HyperLink ID="hlForgotPassword" CssClass="link" runat="server" NavigateUrl="/passwordrecovery.aspx" Text="Forgot Password"></asp:HyperLink>
                            </td>
                        </tr>
                        <tr class="row">
                            <td>&nbsp;</td>
                            <td>
                                <asp:RequiredFieldValidator ID="UserNameOrEmailRequired" Display="Dynamic" runat="server" ControlToValidate="UserName" ErrorMessage="*Username is required." CssClass="required-info" ValidationGroup="LoginForm"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="PasswordRequired" Display="Dynamic" runat="server" ControlToValidate="Password" ErrorMessage="*Password Required" CssClass="required-info" ValidationGroup="LoginForm"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td>&nbsp;</td>
                            <td colspan="2">
                                <asp:CheckBox ID="terms" Text='I&nbsp;accept&nbsp;the&nbsp;<a href="/Documents/Terms_and_Conditions.pdf" style="text-decoration:underline;" target="_blank">Terms & Conditions</a>&nbsp;and&nbsp;<a href="/Documents/Privacy _Statement.pdf" style="text-decoration:underline;" target="_blank">Privacy Statement</a>' runat="server" />
                            </td>
                        </tr>
                        <tr class="row">
                            <td>&nbsp;</td>
                            <td colspan="2">
                                <span class="required-info"><asp:Literal ID="lbl_failureText" runat="server" EnableViewState="false"></asp:Literal></span>
                                <asp:CustomValidator ID="termsValidator" runat="server" ErrorMessage="*You must accept the Terms & Conditions and Privacy Statement." ClientValidationFunction="checkBoxRequired" CssClass="required-info" ValidationGroup="LoginForm" EnableClientScript="true" ></asp:CustomValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="LoginButton" class="btn" runat="server" Width="100px" CommandName="Login" Text="Sign in" ValidationGroup="LoginForm" OnClick="LoginButton_Click" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row" style="margin-bottom: 60px;">
            <div class="column-12" style="padding-top: 50px;">
                <hr style="margin-left: 140px;" />
                <table class="table-container" style="margin-left: 140px; margin-bottom: 20px">
                    <tbody>
                        <tr class="row">
                            <td class="simpleText" style="padding-right: 10px; color: #006DBB; font-weight: bold;">Are you a:
                            </td>
                            <td class="simpleText bold">PIASC member
                            </td>
                            <td class="simpleText bold " style="color: #006DBB; padding-left: 33px;">If so, <a href="/EmployerRegistration.aspx" style="text-decoration: underline">click here</a> to register
                            </td>
                        </tr>
                        <tr class="row">
                            <td>&nbsp;</td>
                            <td class="simpleText bold">PIBT participant
                            </td>
                        </tr>
                        <tr class="row">
                            <td>&nbsp;</td>
                            <td class="simpleText" style="color: #8D9396;">No online account
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <%--        <div class="row">
            <div class="column-12">
                <hr style="margin-left:390px"/>
                <table class="table-container" style="margin-left:390px">
                    <tbody>
                        <tr class="row">
                            <td class="simpleText" style="padding-right:10px; color:#006DBB; font-weight:bold">
                                Are you a:
                            </td>
                            <td class="simpleText bold">
                                PIASC member
                            </td>
                            <td class="simpleText bold " style="color:#006DBB; padding-left:33px;" >
                                If so, <a href="OnlineQuoteEmployer.aspx" style="text-decoration:underline">click here</a>
                            </td>
                        </tr>
                        <tr class="row">
                            <td>&nbsp;</td>
                            <td class="simpleText" style="color:#8D9396;">
                                Not PIBT participant
                            </td>
                        </tr>
                        <tr class="row">
                            <td>&nbsp;</td>
                            <td class="simpleText" style="color:#8D9396;">
                                No online account
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>--%>
        <%--        <div class="row" style="padding-top:40px;">
            <div class="column-12" style="text-align:center;" >
                <span class="simpleText" style="color:#006DBB; font-weight:bold">If you are in the printing industry but not a member of the PIASC, <a href="OnlineQuoteEmployer.aspx" style="text-decoration:underline">click here</a> to obtain a quick quote.</span><br />
                <span>(Note: participation in PIBT is limited to the printing and graphics arts industry through membership in the PIASC.)</span>
            </div>
        </div>--%>
        <div class="row">
            <div class="column-12 simpleText">
                Please email the <a href="/Documents/Terms_and_Conditions.pdf" style="text-decoration: underline;" target="_blank">Terms & Conditions</a> and <a href="/Documents/Privacy _Statement.pdf" style="text-decoration: underline;" target="_blank">Privacy Statement</a> to 
                <asp:TextBox ID="email" runat="server" MaxLength="60" Style="display: inline" CssClass="form-control" Width="25%" ValidationGroup="send" ></asp:TextBox>
                <asp:Button ID="sendEmail" runat="server" CssClass="btn" Text="Send" OnClick="sendEmail_Click" ValidationGroup="send" />
                <br />
                <asp:RequiredFieldValidator ID="requiredEmail" runat="server" ErrorMessage="*Required email addreess" CssClass="required-info" ControlToValidate="email" ValidationGroup="send" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="validateEmail" runat="server" ErrorMessage="*Incorrect Email format" CssClass="required-info" ClientValidationFunction="validateEmail" style="text-align:right;" ControlToValidate="email" ValidationGroup="send" Display="Dynamic"></asp:CustomValidator>
                <asp:Label ID="sent" runat="server" style="color:green;"></asp:Label>
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
