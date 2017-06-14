<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmployerDashboard.aspx.cs" Inherits="Pibt.Broker.AddEmployerDashboard" MasterPageFile="~/Content.master" %>
<%@ Register Src="/UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<%@ Register Src="/UserControl/CtlQQ5.ascx" TagName="page5" TagPrefix="p5" %>
<asp:Content ID="header" runat="server" ContentPlaceHolderID="FrameHeaderPlaceHolder"></asp:Content>
<asp:Content ID="menu" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlMenu" runat="server" ViewStateMode="Disabled" />
</asp:Content>
<asp:Content ID="main" runat="server" ContentPlaceHolderID="MainContentPlaceHolder">
    <div class="row">
        <div class="col-md-12">
            <asp:Literal ID="message" runat="server"></asp:Literal>
        </div>
    </div>
    <p5:page5 ID="page5" runat="server" />
    <div class="row">
        <div class="col-md-3">
            <asp:LinkButton ID="back" runat="server" Text="Back" CssClass="linkbtn" PostBackUrl="/Broker/AddEmployerEmployees.aspx"></asp:LinkButton>
        </div>
        <div class="col-md-3">
            <asp:Button ID="cancel" runat="server" Text="Cancel" CssClass="btn-red" OnClick="cancel_Click" OnClientClick="confirm('Are you sure you want to cancel?');" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="save" runat="server" Text="Save For Later" CssClass="btn" OnClick="save_Click"  OnClientClick="confirm('Are you sure you want to save this application for later?');" />
        </div>
        <div class="col-md-3">
            <asp:Button ID="next" runat="server" Text="Next" CssClass="btn-green" OnClick="next_Click" />
        </div>
    </div>
</asp:Content>