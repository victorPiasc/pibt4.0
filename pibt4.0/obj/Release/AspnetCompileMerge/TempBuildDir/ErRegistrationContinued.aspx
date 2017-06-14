<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErRegistrationContinued.aspx.cs" Inherits="Pibt.ErRegistrationContinued" MasterPageFile="~/Website.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"></telerik:RadAjaxLoadingPanel>
        <telerik:RadFormDecorator ID="RadFormDecorator2" DecoratedControls="All" ControlsToSkip="Fieldset,CheckBoxes"
        DecorationZoneID="mainzone" runat="server" />
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" EnableAJAX="true" ClientEvents-OnRequestStart="onRequestStart" ClientEvents-OnResponseEnd="OnResponseEnd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
            <asp:Panel ID="view1" runat="server" DefaultButton="validate">
                <div class="row">
                    <div class="column-12">
                        <h1>Portal Registration - Validation</h1>
                        <hr />
                        <asp:Literal ID="message1" runat="server"></asp:Literal>
                    </div>
                </div>
                <div class="row">
                    <div class="column-12">
                        <span class="simpleText">Enter the validation code to proceed with the portal registration (Case sensitive)</span>
                        <table class="table-container" style="margin:20px 0px 20px 0px">
                            <tbody>
                                <tr class="row">
                                    <td class="item-name" >
                                        Validation Code: 
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="validationInput" runat="server" CssClass="form-control" ValidationGroup="vCode" MaxLength="7" ></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rqfVcode" runat="server" CssClass="required-info" ErrorMessage="*required Input" ValidationGroup="vCode" ControlToValidate="validationInput" ></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:Button ID="validate" runat="server" CssClass="btn" Text="Validate" ValidationGroup="vCode" OnClick="validate_Click" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="view2" runat="server" Visible="false">
                <div class="row">
                    <div class="column-12">
                        <h1>Portal Registration - Create Account</h1>
                        <hr />
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
                                                <tr class="row">
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <asp:Button ID="submit" runat="server" CssClass="btn" Text="Create Account" OnClick="submit_Click" ValidationGroup="user" /> &nbsp;&nbsp;
                                                        <asp:Button ID="cancel" runat="server" CssClass="btn" Text="Cancel" OnClick="cancel_Click" />
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
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="view3" runat="server" Visible="false">
                <div class="row">
                    <div class="column-12">
                        <h1>Portal Registration - Attempts failed</h1>
                        <hr />
                    </div>
                </div>
                <div class="row">
                    <div class="column-12">
                        <span class="simpleText">You have exceeded the number of attempts to input a valid code.</span>
                    </div>
                </div>
            </asp:Panel>
<%--            <asp:Panel ID="view4" runat="server" Visible="false">
                <div class="row">
                    <div class="column-12">
                        <h1>Portal Registration - Finished</h1>
                        <hr />
                    </div>
                </div>
                <div class="row">
                    <div class="column-12">
                        <span class="simpleText">
                            Congratulations, you have successfully registered.<br />
                        </span>
                        <asp:LinkButton ID="login" runat="server" Text="Sign In" CssClass="btn" PostBackUrl="/Login.aspx" style="padding-top:5px; margin-top:20px; margin-left:145px;" />
                    </div>
                </div>
            </asp:Panel>--%>
            <div class="row simpleText" style="position:absolute; bottom:30px; left:30%; font-size:12px"">
                <div class="column-12">
                    <table style="width:100%">
                        <tbody>
                            <tr>
                                <td style="padding-top:20px;">
                                    If you have difficulties, please contact customer service at &nbsp;
                                </td>
                                <td>
                                    (800) 449-4898 ext 259<br />
                                    <a href="mailto:OnlineHelpDesk@piasc.org">OnlineHelpDesk@piasc.org</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            </telerik:RadAjaxPanel>
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script src="/js/verify.js" type="text/javascript"></script>
            <script type="text/javascript">
                var ajaxObjectId = "<%= RadAjaxPanel1.ClientID%>";
                var ajaxObject = null;
                function disableAjax() 
                {
                    ajaxObject = $find(ajaxObjectId);
                    if (ajaxObject != null && ajaxObject.get_enableAJAX()) 
                    {
                        ajaxObject.set_enableAJAX(false);
                    }
                }
                function enableAjax() 
                {
                    ajaxObject = $find(ajaxObjectId);
                    if (ajaxObject != null && !ajaxObject.get_enableAJAX()) 
                    {
                        ajaxObject.set_enableAJAX(true);
                    }
                }
                function onRequestStart(sender, args) 
                {
                    ajaxObject = sender;
                    try 
                    {
                        if (typeof (customRequestStart) != 'undefined') 
                        {
                            customRequestStart(sender, args);
                        }
                    } 
                    catch (ex) 
                    {
                    }
                    if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                        args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                        args.get_eventTarget().indexOf("ExportToPdfButton") >= 0) 
                    {
                        args.set_enableAjax(false);
                    }
                }

                function OnResponseEnd(sender, args) 
                {
                    try 
                    {
                        if (typeof (customResponseEnd) != 'undefined') 
                        {
                            customResponseEnd(sender, args);
                        }
                    } 
                    catch (ex) 
                    {
                    }
                }
            </script>
        </telerik:RadCodeBlock>
    </div>
</asp:Content>
