<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="Additional.aspx.cs" Inherits="Pibt.OE.Additional" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlEnrollmentFormAdditional.ascx" TagName="CtlEnrollmentFormAdditional"
    TagPrefix="uc2" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc3" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <h1>
        <input type="button" class="ImgHome" value=" " />
        <a href="/">Home</a> / Enroller Form / PCP Information
    </h1>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <br />
    <fieldset>
        <legend>Additional Information:</legend>
        <uc2:CtlEnrollmentFormAdditional ID="CtlEnrollmentFormAdditional" runat="server" />
    </fieldset>
    <div class="bottom-center-buttons">
        <asp:Button runat="server" ID="BtBack" CssClass="btn" CausesValidation="false" Text="Previous"
            OnClick="BtBack_Click" Width="98px" />
        <asp:Button runat="server" ID="BtNext" Text="Continue" CssClass="btn" OnClick="BtNext_Click"
            Width="98px" />
       <asp:Button runat="server" ID="btnSaveAndExit" CssClass="btn btn-danger" text="Save and Exit" OnClick="btnSaveAndExit_Click" />
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc3:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
