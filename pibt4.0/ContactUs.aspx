<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true"
    CodeBehind="ContactUs.aspx.cs" Inherits="Pibt.ContactUs" %>

<%@ Register Src="UserControl/ctlContactUs.ascx" TagName="ctlContactUs" TagPrefix="uc2" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">
                <h1>Contact Us</h1>
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="column-6">
                <h2>How can we help you?</h2>
                <ul class="disc">
                    <li>Address: 5800 S. Eastern Ave Suite 400 Los Angeles, CA 90040</li>
                    <li>Phone: (800) 449-4898 / (323) 728-9500</li>
                    <li>Fax: (323) 271-0138</li>
                    <li>E-mail: OnlineHelpDesk@piasc.org</li>
                    <li>Hours of Operation:
                    <ul>
                        <li>Monday-Thursday 8:30 am to 5:00 pm</li>
                        <li>Friday   8:30 am to 4:00 pm</li>
                        <li>Saturday-Sunday Closed</li>
                    </ul>

                    </li>
                </ul>
            </div>
            <div class="column-6">
                <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
                </telerik:RadAjaxLoadingPanel>
                <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                    <uc2:ctlContactUs ID="ctlContactUs1" runat="server" />
                </telerik:RadAjaxPanel>
            </div>
        </div>
        <asp:Literal ID="mapLit" runat="server"></asp:Literal>
    </div>
</asp:Content>
