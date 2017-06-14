<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="SignPlan.aspx.cs" Inherits="Pibt.OE.SignPlan" %>

<%@ Register Assembly="SuperSignature" Namespace="SuperSignature" TagPrefix="cc1" %>
<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> / Enroller Form / Signature
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <div class="customer-info-box">
        <div class="section-title">
            Please sign here:
        </div>
        <div class="section-body">
           <asp:Label ID="SignatureReq" runat="server"  >
              Your signature indicates that you have completed all requested information as accuarately as possible and that you have read the Plan information including the information listed on legal documents sections of this form and understand all agreements, including your agreement to submit disputes to binding arbitration. EMPLOYEE TERMINATION REQUIRES EMPLOYER SIGNATURE ONLY.
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
          <asp:TextBox runat="server" ID="printName" Width="400" Height="40" Font-Size="16" MaxLength="38"  BorderStyle="Solid" BorderWidth="1" BorderColor="Black"   ></asp:TextBox>
          <asp:RequiredFieldValidator runat="server" ControlToValidate="printName" ID="printNameValidator" ErrorMessage="*Your full name is required"  CssClass="required-info" SetFocusOnError="true" ></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator runat="server" Display="Dynamic" ControlToValidate="printName" ID="minValidator" ValidationExpression="^[\s\S]{3,38}$" ErrorMessage="Minimum 3 characters required" CssClass="required-info " SetFocusOnError="true"></asp:RegularExpressionValidator>
       </div>
    </div>
    <div class="note-list">
        Note: Click on refresh icon to clear signature and re-sign.
    </div>
    <div class="bottom-center-buttons">
        <asp:Button runat="server" ID="BtBack" CssClass="btn" Text="Previous" OnClick="BtBack_Click"
            Width="98px" />
        <asp:Button runat="server" ID="BtNext" CssClass="btn" Text="Continue" OnClientClick="if(!CheckValidity()) return false;"
            OnClick="BtNext_Click" Width="98px" />
       <input id="btnSaveAndExit" type="button" class="btn btn-danger" value="Save and Exit" onclick="redirect();" />
    </div>
    <div id="OEAlertDialog">
        <asp:Literal ID="lblMsg" runat="server" EnableViewState="false"></asp:Literal>
    </div>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
        <script language="javascript" type="text/javascript">
            var selectedControlID = "<%= ctlSignature.uID %>";
            function ShowPoints() {
                var x = SignatureTotalPoints(selectedControlID);
                if (x < 50) {
                    return false;
                }
                return true;
            }
            function ClearSign() {
                ClearSignature('<%= ctlSignature.uID %>');
            }
            function CheckValidity() {
                var valid = false;
                var x = SignatureTotalPoints(selectedControlID);
                var msg = '';
                valid = x >= 50;
                if (!valid) {
                    if (x == 0) {
                        msg = ErrorMsgHTML("Please sign here");
                        $('#OEAlertDialog').html(msg);

                    } else {
                        msg = ErrorMsgHTML("Total points captured are " + x + ", you need to have at least 50!");
                        $('#OEAlertDialog').html(msg);
                    }
                    PopupMsgDialog("OEAlertDialog");
                }
                return valid;
            }
            function redirect() {
               location.href = '/Employer/BusinessInfo.aspx';
            }
              
        </script>
    </telerik:RadCodeBlock>
</asp:Content>
