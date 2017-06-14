<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Pibt.Registration" MasterPageFile="~/Website.Master" %>

<asp:Content ID="Content7" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">
                <fieldset>
                    <asp:Label ID="errorMessage" runat="server" CssClass="required-info"></asp:Label>
                    <asp:Panel ID="firstView" runat="server" DefaultButton="btnSSN">
                     <legend style="font-size: x-large"><b>Create Personal Account - Validation</b></legend>
                        <hr />
                        <div class="row">
                            <div class="col-md-6">
                                <p>
                                    For your safety and security, the first step is personal verification. 
                                </p>
                             </div>
                            <div class="col-md-6">
                                <p>
                                    Please enter the last four digits of your social security number (SSN):
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <table class="table-container" >
                                    <tbody>
                                        <tr class="row">
                                            <td class="item-name" style="text-align: right;">Last four of SSN:</td>
                                            <td class="item-value">
                                                <asp:TextBox ID="tbSSN" runat="server" CssClass="form-control" MaxLength="4" ValidationGroup="ssn" Width="25%"></asp:TextBox>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="rfvSSN" ControlToValidate="tbSSN" runat="server" ErrorMessage="*Required Field" CssClass="required-info" Display="Dynamic" ValidationGroup="ssn"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="revSSN" ControlToValidate="tbSSN" runat="server" ErrorMessage="*Digits only" CssClass="required-info" Display="Dynamic" ValidationExpression="^\d+$" ValidationGroup="ssn"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr class="row">
                                            <td colspan="3" style="text-align: center">
                                                <asp:Button ID="btnSSN" runat="server" Text="Submit SSN" OnClick="btnSSN_Click" ValidationGroup="ssn" CssClass="btn" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <p>If this is not <asp:Label ID="regName" runat="server"></asp:Label>, please contact your administrator.</p>
                            </div>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="secondView" runat="server" DefaultButton="submit">
                        <legend style="font-size: x-large"><b>Create Personal Account</b></legend>
                        <hr />
                       <table "table-container">
                            <tbody>
                                <tr class="row">
                                    <td>
                                        <table class="table-container" >
                                            <tbody>
                                                <tr class="row">
                                                    <td class="item-name" style="width:15%">
                                                        Create&nbsp;Username:
                                                    </td>
                                                    <td class="item-value" colspan="2">
                                                        <asp:TextBox ID="tbUserName" runat="server" CssClass="form-control" MaxLength="10" ValidationGroup="user" Width="235px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td >
                                                        <asp:RequiredFieldValidator ID="rfvUserName" ControlToValidate="tbUserName" runat="server" ErrorMessage="*Required Field" CssClass="required-info" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr class="row">
                                                    <td class="item-name" style="width:15%">
                                                        Create&nbsp;Password:
                                                    </td>
                                                    <td class="item-value">
                                                        <asp:TextBox ID="tbPassWordOne" runat="server" CssClass="form-control" TextMode="Password" MaxLength="20" ValidationGroup="user" Width="150px"></asp:TextBox>
                                                    </td>
                                                    <td>
                                                        <span>Password Strength</span>
                                                        <table width="100px">
                                                            <tr style="height: 15px">
                                                                <td id="tdBad"></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="rfvPassWordOne" ControlToValidate="tbPassWordOne" runat="server" ErrorMessage="*Required Field" CssClass="required-info" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="revPassWordOne" ControlToValidate="tbPassWordOne" runat="server" ErrorMessage="*Must be at least 6 characters long" CssClass="required-info" Display="Dynamic" ValidationExpression="^.{6,20}$"
                                                            ValidationGroup="user"></asp:RegularExpressionValidator>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr class="row">
                                                    <td class="item-name style="width:15%"">Confirm&nbsp;Password:</td>
                                                    <td class="item-value">
                                                        <asp:TextBox ID="tbPassWordTwo" runat="server" CssClass="form-control" TextMode="Password" MaxLength="50" ValidationGroup="user" Width="150px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:RequiredFieldValidator ID="rfvPassWordTwo" ControlToValidate="tbPassWordTwo" runat="server" ErrorMessage="*Required Field" CssClass="required-info" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
                                                        <asp:CompareValidator ID="cv" ControlToValidate="tbPassWordTwo" ControlToCompare="tbPassWordOne" runat="server" CssClass="required-info" ErrorMessage="*password does not match" ValidationGroup="user" Display="Dynamic"></asp:CompareValidator>
                                                        &nbsp;
                                                    </td>
                                                </tr>
                                                <tr class="row">
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Button ID="submit" runat="server" CssClass="btn" Text="Create Account" OnClick="submit_Click" ValidationGroup="user" /> &nbsp;&nbsp;
                                                        <asp:LinkButton ID="cancelLink" runat="server" CssClass="btn" Text="Cancel" PostBackUrl="/Login.aspx"></asp:LinkButton>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td style="padding-left:50px">
                                        <table class="table-container">
                                            <tbody>
                                                <tr class="row">
                                                    <td class="item-name" >
                                                        Username is limited to 10 characters and/or symbols.<br />
                                                        Password Requirements
                                                        <ul style="list-style:inherit; padding-left:20px;">
                                                            <li>At least 6 characters or longer</li>
                                                            <li>At least one uppercase letter (A_Z)</li>
                                                            <li>At least one lowercase letter (a-z)</li>
                                                            <li>At least one number (0-9)</li>
                                                            <li>At least one non-alphanumberic character (e.g.,!,$,#,%)</li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
<%--                    <asp:Panel ID="thirdView" runat="server">
                        <p>
                            Congratulations, you have successfully registered. <a href="Login.aspx">Click Here</a> to login. 
                        </p>
                    </asp:Panel>--%>
                    <p>
                        If you have difficulties signing in, please contact customer service at (800) 449-4898 ext. 259 or <a href="mailto:onlinehelpdesk@piasc.org">onlinehelpdesk@piasc.org</a>
                    </p>
                </fieldset>
            </div>
        </div>
    </div>
    <script src="/js/verify.js" type="text/javascript"></script>
</asp:Content>
