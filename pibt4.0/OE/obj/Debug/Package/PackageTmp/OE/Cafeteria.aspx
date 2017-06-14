<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="Cafeteria.aspx.cs" Inherits="Pibt.OE.Cafeteria" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> / Enroller Form /Cafeteria
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
   <script>
      function redirect() {
         location.href = '/Employer/BusinessInfo.aspx';
      }
   </script>
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <br />
    <fieldset>
        <legend>Cafeteria Premium Only Plan:</legend>
        <div class="customer-info-box">
            <div class="section-body">
                <asp:CheckBox ID="CkCafeteria" Text="I want my portion of eligible insurance premiums paid on a pre-tax basis."
                    runat="server" Checked="false" OnCheckedChanged="CkCafeteria_CheckedChanged" AutoPostBack="True" />
            </div>
        </div>
    </fieldset>
    <div class="bottom-center-buttons">
        <asp:Button runat="server" ID="BtBack" CssClass="btn" Text="Previous" OnClick="BtBack_Click"
            Width="98px" />
        <asp:Button runat="server" ID="BtNext" CssClass="btn" Text="Continue" OnClick="BtNext_Click"
            Width="98px" />
       <input id="btnSaveAndExit" type="button" class="btn btn-danger" value="Save and Exit" onclick="redirect();" />
    </div>
    <div id="OEAlertDialog" class="message-error" >
        <asp:Literal ID="lblStatus" ViewStateMode="Disabled" runat="server"></asp:Literal>
    </div>
<%--    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function customResponseEnd(sernder, args) {
                if ($("#<%=BtNext.ClientID %>").attr("disabled0") == "disabled") {
                    $("#<%=BtNext.ClientID %>").addClass("btn-disabled");
                } else {
                    $("#<%=BtNext.ClientID %>").removeClass("btn-disabled");
                }
            }


            function customRequestStart(sernder, args) {
            }

            function customResponseEnd(sernder, args) {
                if (args.EventTarget != "<%=BtBack.UniqueID %>") {
                    if ($("#OEAlertDialog .error-list").length > 0 || $("#OEAlertDialog .alert-list").length > 0) {
                        PopupMsgDialog("OEAlertDialog");
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>--%>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
