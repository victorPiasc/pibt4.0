<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="Plans.aspx.cs" Inherits="Pibt.OE.Plans" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlEnrollmentFormPlans.ascx" TagName="CtlEnrollmentFormPlans"
    TagPrefix="uc2" %>
<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc3" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> / Enroller Form / Coverages
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
   <script>
      function redirect() {
         location.href = '/Employer/BusinessInfo.aspx';
      }
   </script>
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <fieldset>
        <legend>
            <asp:Label ID="lblFunctionName" runat="server">:</asp:Label>
          </legend>
        <uc2:CtlEnrollmentFormPlans ID="CtlEnrollmentFormPlans1" runat="server" />
    </fieldset>
    <div class="bottom-center-buttons">
        <asp:Button runat="server" ID="BtBack" CssClass="btn" Text="Previous" OnClick="BtBack_Click"
            Width="98px" />
        <asp:Button runat="server" ID="BtNext" CssClass="btn" Text="Continue" OnClick="BtNext_Click"
            Width="98px" />
       <input id="btnSaveAndExit" type="button" class="btn btn-danger" value="Save and Exit" onclick="redirect();" />
    </div> 
<%--    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function customRequestStart(sernder, args) {
            }
            function customResponseEnd(sernder, args) {
                if (args.EventTarget == "<%=BtNext.UniqueID %>") {
                    if ($("#OEAlertDialog .error-list").length > 0 || $("#OEAlertDialog .alert-list").length > 0) {
                        PopupMsgDialog("OEAlertDialog");
                    }
                } else {
                    btnAdd_click(sernder, args);
                }
            }
        </script>
    </telerik:RadCodeBlock>--%>
   <script>
         $('a.title').tooltip({
            splitTitle: '|',
            arrow: true,
            width: '300px',
            height: '300px',
            closePosition: 'title',
            closeText: '<img src="pibtlogo.png" alt="" />',
            sticky: true,
         });
   </script>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc3:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
