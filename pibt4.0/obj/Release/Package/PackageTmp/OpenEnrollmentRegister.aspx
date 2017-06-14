<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OpenEnrollmentRegister.aspx.cs" Inherits="Pibt.OpenEnrollmentRegister" MasterPageFile="~/Website.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="contentWrapper">
        <div class="row">           
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Height="100%">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadFormDecorator ID="RadFormDecorator2" DecoratedControls="All" ControlsToSkip="Fieldset,CheckBoxes"
                DecorationZoneID="mainzone" runat="server" />
            <telerik:RadAjaxPanel ID="RadAjaxPanel1" EnableAJAX="true" ClientEvents-OnRequestStart="onRequestStart"
                ClientEvents-OnResponseEnd="OnResponseEnd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1" HorizontalAlign="Center" Height="100%">
                <!-- content start -->
                <div class="column-12">
                    <h1>Annual Benefits Meeting Registration</h1>
                    <hr />
                    <asp:Literal runat="server" ID="message" Visible="false"></asp:Literal>
                    <div class="column-6">
                        <h2>Personal Attendee Information</h2>
                        <hr />
                        <br />
                        <table class="table-container">
                            <tbody>
                                <tr class="row">
                                    <td class="item-name" style="vertical-align: middle;">Date and Location:</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-value">
                                        <asp:DropDownList ID="dnl" runat="server" CssClass="form-control">
                                            <asp:ListItem Text="--Select--" Selected="True" Value="0"></asp:ListItem>
                                            <%--<asp:ListItem Text="Oct 4th  -10:30am- Crown Plaza Hotel 1221 Chess Drive, Foster City, CA" Value="1" Enabled="true"></asp:ListItem>
                                            <asp:ListItem Text="Oct 6th  -9:00 am- Embassy Suites Brea 900 East Birch Street, Brea, CA 92821" Value="3" Enabled="true"></asp:ListItem>--%>
                                            <asp:ListItem Text="Oct 11th  -9:00 am- Hilton  100 W. Glenoaks Blvd., Glendale, CA 91202" Value="2" Enabled="true"></asp:ListItem>
                                            <asp:ListItem Text="Oct 13th  -9:00 am- Courtyard Marriott 8651 Spectrum Center Blvd., San Diego, CA 92123" Value="4" Enabled="true"></asp:ListItem>
                                            <asp:ListItem Text="Oct 25th -9:00 am- PIASC Conference Room 5800 S Eastern Ave. Suite 400, Commerce, CA 90040 " Value="6" Enabled="true"></asp:ListItem>
                                            <asp:ListItem Text="Oct 25th -1:00 pm- PIASC Conference Room 5800 S Eastern Ave. Suite 400, Commerce, CA 90040" Value="7" Enabled="true"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td style="vertical-align: middle;">
                                        <asp:RequiredFieldValidator ID="dnlValid" runat="server" CssClass="required-info" ErrorMessage="* Date and Location must be selected" SetFocusOnError="true" ControlToValidate="dnl" InitialValue="0" ValidationGroup="Pinfo"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">First Name:
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-value">
                                        <asp:TextBox ID="fname" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td>
                                        <asp:RequiredFieldValidator ID="fnameValid" runat="server" CssClass="required-info" ErrorMessage="* First Name required" SetFocusOnError="true" ControlToValidate="fname" ValidationGroup="Pinfo"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">Last Name:</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-value">
                                        <asp:TextBox ID="lname" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td>
                                        <asp:RequiredFieldValidator ID="lnameValid" runat="server" CssClass="required-info" ErrorMessage="* Last Name required" SetFocusOnError="true" ControlToValidate="lname" ValidationGroup="Pinfo"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">Company Name:
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-value">
                                        <asp:TextBox ID="company" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="required-info" ErrorMessage="* Company Name required" SetFocusOnError="true" ControlToValidate="company" ValidationGroup="Pinfo"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">Email Address:</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-value">
                                        <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td>
                                        <asp:RequiredFieldValidator ID="emailValid" runat="server" CssClass="required-info" ErrorMessage="* Email Address required" SetFocusOnError="true" ControlToValidate="email" ValidationGroup="Pinfo"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="emailExp" runat="server" CssClass="required-info" ErrorMessage="* Valid email required" SetFocusOnError="true" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Pinfo"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">Confirmation Email Address:</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-value">
                                        <asp:TextBox ID="ConfEmail" runat="server" CssClass="form-control"></asp:TextBox></td>
                                </tr>
                                <tr class="row">
                                    <td>
                                        <asp:CompareValidator ID="cvEmail" runat="server" CssClass="required-info" ErrorMessage="* Email addresses do not match" SetFocusOnError="true" ControlToValidate="ConfEmail" ControlToCompare="email" ValidationGroup="Pinfo"></asp:CompareValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="required-info" ErrorMessage="* Valid email required" SetFocusOnError="true" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="Pinfo"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">Phone:</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-value">
                                        <telerik:RadMaskedTextBox ID="phone" runat="server" Mask="(###) ### - ####" Height="36" Width="100%" CssClass="form-control" BorderColor="LightGray" FocusedStyle-BorderColor="SkyBlue"></telerik:RadMaskedTextBox>
                                        <%--<asp:TextBox ID="phone" runat="server" CssClass="form-control" ></asp:TextBox>--%>
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td>
                                        <asp:RequiredFieldValidator ID="phoneValid" runat="server" CssClass="required-info" ErrorMessage="* Phone number required" SetFocusOnError="true" ControlToValidate="phone" ValidationGroup="Pinfo"></asp:RequiredFieldValidator>
                                        <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="required-info" ErrorMessage="* Valid phone number required" SetFocusOnError="true" ControlToValidate="phone" ValidationExpression="\(?\d{3}\)?-? *\d{3}-? *-?\d{4}" ValidationGroup="Pinfo"></asp:RegularExpressionValidator>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="column-6">
                        <h2>Additional Guest Information</h2>
                        <hr />
                        <p>(Optional)</p>
                        <table class="table-container">
                            <tbody>
                                <tr class="row">
                                    <td class="item-name">First Name:
                                    </td>
                                    <td>&nbsp;</td>
                                    <td class="item-name">Last Name:
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-value">
                                        <asp:TextBox ID="fname1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td class="item-value">
                                        <asp:TextBox ID="lname1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">First Name:
                                    </td>
                                    <td>&nbsp;</td>
                                    <td class="item-name">Last Name:
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-value">
                                        <asp:TextBox ID="fname2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td class="item-value">
                                        <asp:TextBox ID="lname2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">First Name:
                                    </td>
                                    <td>&nbsp;</td>
                                    <td class="item-name">Last Name:
                                    </td>
                                </tr>
                                <tr class="row">
                                    <td class="item-value">
                                        <asp:TextBox ID="fname3" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                    <td class="item-value">
                                        <asp:TextBox ID="lname3" runat="server" CssClass="form-control"></asp:TextBox>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <asp:Button ID="Register" Text="Register" runat="server" CssClass="btn" ValidationGroup="Pinfo" OnClick="Register_Click" />
                        <asp:ValidationSummary ID="vSummary" runat="server" ValidationGroup="Pinfo" CssClass="required-info" />
                    </div>
                </div>
                <div class="row">
                    <div class="column-12">
                        &nbsp;
                    </div>
                </div>
                <!-- content end -->
            </telerik:RadAjaxPanel>
            <telerik:RadCodeBlock runat="server">
                <script type="text/javascript" language="javascript">
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
    </div>
</asp:Content>


