<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="Type.aspx.cs" Inherits="Pibt.OE.Type" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <a href="/">Home</a> / Enroller Form
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <fieldset>
        <legend>Cannot Proceed:</legend>
        <div class="customer-info-box">
            <div class="section-body">
               <asp:Label ID="lb_Msg" runat="server" Font-Names="Open Sans"
                  Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
            </div>
        </div>
        <div class="bottom-center-buttons">
            <asp:Button runat="server" CssClass="btn" ID="BtBack" Text="Previous" OnClick="BtBack_Click"
                Width="98px" />
        </div>
    </fieldset>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
