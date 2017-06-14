<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="Plans.aspx.cs" Inherits="Pibt.OE.Plans" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlEnrollmentFormPlans.ascx" TagName="CtlEnrollmentFormPlans"
    TagPrefix="uc2" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc3" %>

<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Enrollment Form
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <a href="/">Home</a> > My Family > Begin Enrollment > Select Plans
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <uc2:CtlEnrollmentFormPlans ID="CtlEnrollmentFormPlans1" runat="server" />
    <div class="row">
        <div class="col-lg-4">
            <asp:Button runat="server" ID="BtBack" CssClass="btn" Text="Previous" OnClick="BtBack_Click" Width="98px" />
        </div>
        <div class="col-lg-4">
            <asp:Button runat="server" CssClass="btn" style="padding-right:10px;" ID="startOver" Text="Start Over" OnClick="startOver_Click" />
            <asp:Button runat="server" ID="Button1" CssClass="btn btn-danger" Text="Save For Later" OnClick="Button1_Click" />
        </div>
        <div class="col-lg-4">
            <asp:Button runat="server" ID="BtNext" CssClass="btn" Text="Continue" OnClick="BtNext_Click" Width="98px" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc3:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
