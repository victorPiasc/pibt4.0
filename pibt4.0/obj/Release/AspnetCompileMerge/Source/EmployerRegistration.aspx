<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployerRegistration.aspx.cs" Inherits="Pibt.userfiles.EmployerRegistration" MasterPageFile="~/Website.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"></telerik:RadAjaxLoadingPanel>
        <telerik:RadFormDecorator ID="RadFormDecorator2" DecoratedControls="All" ControlsToSkip="Fieldset,CheckBoxes"
            DecorationZoneID="mainzone" runat="server" />
        <telerik:RadAjaxPanel ID="RadAjaxPanel1" EnableAJAX="true" ClientEvents-OnRequestStart="onRequestStart" ClientEvents-OnResponseEnd="OnResponseEnd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
            <!-- content start -->
            <asp:Panel ID="view1" runat="server" DefaultButton="submitForAccountNum">
                <div class="row">
                    <div class="column-12">
                        <h1>Portal Registration - Account Search</h1>
                        <hr />
                    </div>
                </div>
                <div class="row">
                    <div class="column-12">
                        <asp:Literal ID="message" runat="server"></asp:Literal>
                    </div>
                </div>
                <div class="row">
                    <div class="column-12" style="text-align:center">
                        <table class="table-container" style="width: 100%">
                            <tbody>
                                <tr class="row">
                                    <td class="item-name" style="text-align:right">
                                        PIBT Account Number: 
                                    </td>
                                    <td class="item-value">
                                        <asp:TextBox ID="accountNumber" runat="server" CssClass="form-control" MaxLength="10" ValidationGroup="num" Width="150px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rqfNum" runat="server" CssClass="required-info" ErrorMessage="*Account number required" ControlToValidate="accountNumber" Display="Dynamic" ValidationGroup="num"></asp:RequiredFieldValidator>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="revNum" runat="server" CssClass="required-info" ErrorMessage="*Numbers only" ControlToValidate="accountNumber" Display="Dynamic" ValidationGroup="num" ValidationExpression="^(\d+)$"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="column-12" style="text-align: center;">
                        <asp:Button ID="submitForAccountNum" runat="server" CssClass="btn" Text="Submit Account Number" OnClick="submitForAccountNum_Click" ValidationGroup="num" />
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="view2" runat="server" Visible="false" DefaultButton="submitForEmail">
                <div class="row">
                    <div class="column-12">
                        <h1>Portal Registration - Confirmation of Company</h1>
                        <hr />
                    </div>
                </div>
                 <div class="row">
                    <div class="column-12">
                        <asp:Literal ID="message2" runat="server"></asp:Literal>
                    </div>
                </div>
                <div class="row">
                    <div class="column-12 simpleText">
                        <span class="simpleText" style="display:block">Our records show the following:</span>
                        <table class="table-container">
                            <tbody>
                                <tr class="row">
                                    <td class="item-name">
                                        Company:
                                    </td>
                                    <td class="item-value">
                                        <asp:Label ID="companyName" CssClass="form-control" runat="server">[company name place holder]</asp:Label>
                                    </td>
                                </tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr class="row">
                                    <td class="item-name">
                                        Authorized representative:
                                    </td>
                                    <td class="item-value">
                                        <asp:Label ID="contactName" CssClass="form-control" runat="server">[name place holder]</asp:Label>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        <span class="simpleText" style="display:block">If the above information is not correct, please contact us at  (800) 449-4898 ext. 259 or email us at <a href="mailto:OnlineHelpDesk@piasc.org" style="padding: 0px;">OnlineHelpDesk@piasc.org</a></span>
                    </div>
                </div>
                <br /><br />
                <div class="row">
                    <div class="column-12" style="text-align: center;">
                        <span class="simpleText bold" style="color:#006DBB" >After clicking on CONTINUE, below, please check your email for an automated message containing your unique validation number.</span><br />
                        <asp:Button ID="submitForEmail" runat="server" CssClass="btn" Text="Continue" OnClick="submitForEmail_Click" ValidationGroup="accept" />
                    </div>
                </div>
                <div class="row">
                    <div class="column-12" style="text-align:center;">
                        <span class="simpleText">(Note: Depending on your email settings, you may need to check your junk folder.)</span>
                    </div>
                </div>
            </asp:Panel>
            <div class="simpleText" style="position:absolute; bottom:30px; left:30%; font-size:12px"">
                <table>
                    <tbody>
                        <tr>
                            <td>
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
        </telerik:RadAjaxPanel>
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
            <script type="text/javascript">
                var ajaxObjectId = "<%= RadAjaxPanel1.ClientID%>";
                var ajaxObject = null;
                function disableAjax() {
                    ajaxObject = $find(ajaxObjectId);
                    if (ajaxObject != null && ajaxObject.get_enableAJAX()) {
                        ajaxObject.set_enableAJAX(false);
                    }
                }
                function enableAjax() {
                    ajaxObject = $find(ajaxObjectId);
                    if (ajaxObject != null && !ajaxObject.get_enableAJAX()) {
                        ajaxObject.set_enableAJAX(true);
                    }
                }
                function onRequestStart(sender, args) {
                    ajaxObject = sender;
                    try {
                        if (typeof (customRequestStart) != 'undefined') {
                            customRequestStart(sender, args);
                        }
                    } catch (ex) {
                    }
                    if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                        args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                        args.get_eventTarget().indexOf("ExportToPdfButton") >= 0) {
                        args.set_enableAjax(false);
                    }
                }
                function OnResponseEnd(sender, args) {
                    try {
                        if (typeof (customResponseEnd) != 'undefined') {
                            customResponseEnd(sender, args);
                        }
                    } catch (ex) {
                    }
                }
            </script>
        </telerik:RadCodeBlock>
    </div>
</asp:Content>
