<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlQQ8.ascx.cs" Inherits="Pibt.UserControl.CtlQQ8" %>
<div class="row">
    <div class="column-12">
        <asp:Literal ID="message2" runat="server"></asp:Literal>
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
    </div>
</div>