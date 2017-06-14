<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEmployer.aspx.cs" Inherits="Pibt.Broker.AddEmployer" MasterPageFile="~/Content.master" %>
<%@ Register Src="/UserControl/CtlQQ2.ascx" TagName="page2" TagPrefix="p2" %>
<%@ Register Src="/UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    Add&nbsp;Employer&nbsp;>&nbsp;Basic&nbsp;Company&nbsp;Information&nbsp;>
</asp:Content>
<asp:Content ID="content2" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="row">
        <div class="col-md-12">
            <asp:Literal ID="message" runat="server"></asp:Literal>
        </div>
    </div>
    <div class="customer-info-box">
        <div class="row">
            <div class="col-md-12">
                <p2:page2 ID="page2" runat="server" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <asp:Button ID="cancel" runat="server" Text="Cancel" CssClass="btn-red" CausesValidation="false" OnClick="cancel_Click" />
        </div>
        <div class="col-md-6">
            <asp:Button ID="next" runat="server" Text="Next" CssClass="btn" OnClick="next_Click" />
        </div>
    </div>
</asp:Content>
