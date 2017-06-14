<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="SignPlan.aspx.cs" Inherits="Pibt.OE.SignPlan" %>

<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <a href="/">Home</a> / Enroller Form / Signature
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <asp:Panel ID="panel1" runat="server" DefaultButton="BtNext">
        <div class="customer-info-box">
            <div class="section-title">
                Signature:
            </div>
            <div class="section-body">
                <asp:Label ID="SignatureReq" runat="server">Your signature indicates that you have completed all requested information as accurately as possible and that you have read the Plan information including the information listed in the Legal Documents sections and understand all agreements, including your agreement to submit disputes to binding arbitration.
                </asp:Label>
            <center>
                <cc1:MouseSignature ID="ctlSignature" runat="server" SignImageScaleFactor="0.50"
                    SignPenSize="2" BorderStyle="Dotted" BorderWidth="2" BorderColor="#DDDDDD" SignRequired="false"
                    SignRequiredPoints="50" SignHeight="160" SignBackGroundImage="/img/sign-here.png"
                    SignWidth="600" SignPenColor="red" SignStatusBar="true" />
            </center>
            </div>
        </div>
        <div class="customer-info-box">
            <div class="section-title">
                Please print full name here:
            </div>
            <div class="section-body">
                <asp:TextBox runat="server" ID="printName" Width="400" Height="40" Font-Size="16" MaxLength="38" BorderStyle="Solid" BorderWidth="1" BorderColor="Black"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="printName" ID="printNameValidator" ErrorMessage="*Your full name is required" CssClass="required-info" SetFocusOnError="true" ValidationGroup="goForward"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" Display="Dynamic" ControlToValidate="printName" ID="minValidator" ValidationExpression="^[\s\S]{3,38}$" ErrorMessage="Minimum 3 characters required" CssClass="required-info " SetFocusOnError="true"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="note-list">
            Note: Click on refresh icon to clear signature and re-sign.
        </div>
        <div id="OEAlertDialog">
            <asp:Literal ID="lblMsg" runat="server" EnableViewState="false"></asp:Literal>
        </div>
        <div class="div">
            <div class="col-lg-4">
                <asp:Button runat="server" ID="BtBack" CssClass="btn" Text="Previous" OnClick="BtBack_Click" Width="98px" />
            </div>
            <div class="col-lg-4">
                <asp:Button runat="server" CssClass="btn" Style="padding-right: 10px;" ID="startOver" Text="Start Over" OnClick="startOver_Click" />
                <asp:Button runat="server" ID="btnSaveAndExit" CssClass="btn btn-danger" Text="Save For Later" OnClick="btnSaveAndExit_Click" />
            </div>
            <div class="col-lg-4">
                <asp:Button runat="server" ID="BtNext" CssClass="btn" Text="Continue" OnClientClick="if(!CheckValidity()) return false;" OnClick="BtNext_Click" Width="98px" ValidationGroup="goForward" />
            </div>
        </div>
    </asp:Panel>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
        <script language="javascript" type="text/javascript">
            var selectedControlID = "<%= ctlSignature.uID %>";
            function ShowPoints() {
                var x = SignatureTotalPoints(selectedControlID);
                return x >= 50;
            }
            function ClearSign() {
                ClearSignature('<%= ctlSignature.uID %>');
            }
            function CheckValidity() {
                var x = SignatureTotalPoints(selectedControlID);
                var valid = x >= 50;
                if (!valid) {
                    var msg = ErrorMsgHTML(x == 0
                        ? "Please sign before continuing"
                        : "Total points captured are " + x + ". You need to have at least 50.");
                    $('#OEAlertDialog').html(msg);
                    PopupMsgDialog("OEAlertDialog");
                }
                return valid;
            }
        </script>
    </telerik:RadCodeBlock>
</asp:Content>
