<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accounting.aspx.cs" Inherits="Pibt.Broker.Accounting" MasterPageFile="~/Content.master" %>

<%@ Register Src="/UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<%@ Register Src="/UserControl/CtlSnapShot.ascx" TagName="CtlSnapShot" TagPrefix="uc2" %>
<%@ Register Src="/UserControl/CtlBrokerInvoiceHistory.ascx" TagName="CtlInvoice" TagPrefix="uc3" %>
<%@ Register Src="/UserControl/CtlBrokerCommission.ascx" TagName="CtlCommission" TagPrefix="uc4" %>

<asp:Content ID="frame" runat="server" ContentPlaceHolderID="FrameHeaderPlaceHolder"></asp:Content>
<asp:Content ID="leftMenu" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="main" runat="server" ContentPlaceHolderID="MainContentPlaceHolder">
    <div id="contentWrapper">
        <div class="customer-info-box">
            <div class="dontprint">
                <nav>
                    <ul id="typeList" runat="server">
                        <li id="l1" runat="server" style="margin-bottom: 0px" class="tablinks selected">
                            <asp:LinkButton ID="snapshot" CssClass="tab" runat="server" Text="Snapshot" OnCommand="type_Command" CommandName="1"></asp:LinkButton></li>
                        <li id="l2" runat="server" style="margin-bottom: 0px;" class="tablinks">
                            <asp:LinkButton ID="invoiceHist" CssClass="tab" runat="server" Text="Invoice&nbsp;History" OnCommand="type_Command" CommandName="2" ></asp:LinkButton></li>
                        <li id="l3" runat="server" style="margin-bottom: 0px" class="tablinks">
                            <asp:LinkButton ID="commision" CssClass="tab" runat="server" Text="Commission&nbsp;History" OnCommand="type_Command" CommandName="3" ></asp:LinkButton></li>
                    </ul>
                </nav>
            </div>
            <div class="content">
                <div id="pages" runat="server" style="background-color:#FFFFFF;">
                    <uc2:CtlSnapShot ID="page_1" runat="server" Visible="false" />
                    <uc3:CtlInvoice ID="page_2" runat="server" Visible="false" />
                    <uc4:CtlCommission ID="page_3" runat="server" Visible="false" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
