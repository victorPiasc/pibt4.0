<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="LegalDocs.aspx.cs" Inherits="Pibt.OE.LegalDocs" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
        <a href="/">Home</a> / Enroller Form / Legal Documents
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <br />
    <fieldset>
        <legend>Your Legal Acknowledgement:</legend>
        <div class="customer-info-box">
            <div class="section-body">
                <div class="legal-content">
                    <asp:Literal ID="GeneralLegalContent" runat="server"></asp:Literal>
                </div>
            </div>
            <div style="width:100%; text-align:center; padding:15px;">
                <asp:CheckBox ID="CkLegal" Checked="false"
                    runat="server" AutoPostBack="True" OnCheckedChanged="CkLegal_CheckedChanged" /> 
                <span class="simpleText bold"> I have read and understand the policy.</span>
            </div>
        </div>
           <div class="note-list" style="color:#ff0000">
        Note: Please do not continue until you have read this agreement carefully.
    </div>
    </fieldset>
    <div class="row">
        <div class="col-lg-4">
            <asp:Button runat="server" ID="BtBack" CssClass="btn" Text="Previous" OnClick="BtBack_Click" Width="98px" />
        </div>
        <div class="col-lg-4">
            <asp:Button runat="server" CssClass="btn" style="padding-right:10px;" ID="startOver" Text="Start Over" OnClick="startOver_Click" />
            <asp:Button runat="server" ID="Button1" CssClass="btn btn-danger" text="Save For Later" OnClick="Button1_Click" />
        </div>
        <div class="col-lg-4">
            <asp:Button runat="server" ID="BtNext" CssClass="btn" Text="Continue" OnClick="BtNext_Click" Width="98px" />
        </div>
    </div>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            $(function () {
                if ($("#<%=BtNext.ClientID %>").attr("disabled") == "disabled") {
                    $("#<%=BtNext.ClientID %>").addClass("btn-disabled");
                } else {
                    $("#<%=BtNext.ClientID %>").removeClass("btn-disabled");
                }
            });

            function customResponseEnd(sernder, args) {
                if ($("#<%=BtNext.ClientID %>").attr("disabled") == "disabled") {
                    $("#<%=BtNext.ClientID %>").addClass("btn-disabled");
                } else {
                    $("#<%=BtNext.ClientID %>").removeClass("btn-disabled");
                }

            }
        </script>
    </telerik:RadCodeBlock>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
