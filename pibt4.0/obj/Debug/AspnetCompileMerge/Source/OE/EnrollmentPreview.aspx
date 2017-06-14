<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="EnrollmentPreview.aspx.cs" Inherits="Pibt.OE.EnrollmentPreview" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormPreview.ascx" TagName="CtlEnrollmentFormPreview"
    TagPrefix="uc3" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
    <link rel="stylesheet" href="/styles/enrollmentformview.css" type="text/css" />
    <script>
        function exportPdf() {
            window.open("<%=ExportLink %>", 'newwindow', 'height=100,width=50,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no');
        }
    </script>
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> / Enroller Form Plan Preview 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="note-list required-info" style="text-align: center;">
        Note: You are not finished yet. Please review all information below. If correct, you MUST click "Submit" to finish your application.
    </div>
    <br />
    <div class="top-center-buttons" style="text-align: center;">
        <asp:Button runat="server" CssClass="btn btn-primary" ID="Button1" Text="Previous" OnClick="BtBack_Click"
            Width="98" />
        <asp:Button runat="server" CssClass="btn btn-danger" ID="Button2" Text="Submit" OnClick="BtNext_Click"
            Width="98" />
        <input id="btnExportPdf1" type="button" class="btn btn-info" value="Export to PDF" onclick="exportPdf();" />
        <asp:Button runat="server" ID="btnSaveAndExit" CssClass="btn btn-danger" text="Save and Exit" OnClick="btnSaveAndExit_Click" />
        <asp:Button ID="Button3" CssClass="btn btn-primary" runat="server" Text="Cancel Enrollment Form"
            OnClick="btnCancel_Click" />
    </div>
    <uc3:CtlEnrollmentFormPreview ID="CtlEnrollmentFormPreview1" runat="server" />
    <div class="note-list required-info" style="text-align: center;">
        Note: You are not finished yet. Please review all information above. If correct, you MUST click "Submit" to finish your application.
    </div>
    <div class="bottom-center-buttons">
        <asp:Button runat="server" CssClass="btn btn-primary" ID="BtBack" Text="Previous" OnClick="BtBack_Click"
            Width="98" />
        <asp:Button runat="server" CssClass="btn btn-danger" ID="BtNext" Text="Submit" OnClick="BtNext_Click"
            Width="98" />
        <input id="btnExportPdf" type="button" class="btn btn-info" value="Export to PDF" onclick="exportPdf();" />
        <input id="btnSaveAndExit2" type="button" class="btn btn-danger" value="Save and Exit" onclick="redirect();" />
        <asp:Button ID="btnCancel" CssClass="btn btn-primary" runat="server" Text="Cancel Enrollment Form"
            OnClick="btnCancel_Click" />
    </div>
</asp:Content>
