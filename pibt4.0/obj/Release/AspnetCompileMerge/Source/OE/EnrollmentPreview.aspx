<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="EnrollmentPreview.aspx.cs" Inherits="Pibt.OE.EnrollmentPreview" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormPreview.ascx" TagName="CtlEnrollmentFormPreview"
    TagPrefix="uc3" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
    <link rel="stylesheet" href="/styles/enrollmentformview.css" type="text/css" />
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <a href="/">Home</a> / Enroller Form Plan Preview 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="required-info" style="text-align: center; font-weight:bold; font-size:16px;">
        Note: You are not finished yet. Please review all information below. If correct, click "Submit" to finish your application.
    </div>
    <br />
    <uc3:CtlEnrollmentFormPreview ID="CtlEnrollmentFormPreview1" runat="server" />
    <div class="row">
        <div class="col-lg-4">
            <asp:Button runat="server" CssClass="btn btn-primary" ID="BtBack" Text="Previous" OnClick="BtBack_Click" Width="98" />
        </div>
        <div class="col-lg-4">
            <asp:Button runat="server" CssClass="btn" style="padding-right:10px;" ID="startOver" Text="Start Over" OnClick="startOver_Click" />
            <asp:Button runat="server" ID="Button4" CssClass="btn btn-danger" text="Save For Later" OnClick="btnSaveAndExit_Click" />
        </div>
        <div class="col-lg-4">
            <asp:Button runat="server" CssClass="btn" ID="BtNext" Text="Submit" OnClick="BtNext_Click" Width="98" />
        </div>
    </div>
</asp:Content>
