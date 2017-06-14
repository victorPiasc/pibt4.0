<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeBehind="BrokerDetails.aspx.cs" Inherits="Pibt.Broker.BrokerDetails" %>

<%@ Register Src="/UserControl/CtlCreateWebUser.ascx" TagName="CtlCreateWebUser" TagPrefix="uc3" %>
<%@ Register Src="/UserControl/CtlChangePassword.ascx" TagName="CtlChangePassword" TagPrefix="uc4" %>
<%@ Register Src="/UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<%@ Register Src="/UserControl/CtlEditBrokerDetails.ascx" TagName="CtlEditBrokerDetails" TagPrefix="uc2" %>
<%@ Register Src="/UserControl/CtlAgencyUsers.ascx" TagName="CtlAgencyUsers" TagPrefix="uc5" %>
<%@ Register Src="/UserControl/CtlBrokerContacts.ascx" TagName="CtlBrokerContacts" TagPrefix="uc6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
        <a href="/">Home</a>
        <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
            <RoleGroups>
                <asp:RoleGroup Roles="Administrator">
                    <ContentTemplate>
                        &nbsp;>&nbsp;<a href="/Broker/Brokers.aspx">RKs</a>&nbsp;>&nbsp;Broker #<%=CurrentUserInfo.UserId%>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
            <RoleGroups>
                <asp:RoleGroup Roles="Broker">
                    <ContentTemplate>
                        &nbsp;>&nbsp;Broker #<%=CurrentUserInfo.UserId %></ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="dontprint">
        <nav>
            <ul id="typeList" runat="server">
                <li id="l1" runat="server" style="margin-bottom: 0px;" class="tablinks selected"><asp:LinkButton ID="general" CssClass="tab" runat="server" Text="General&nbsp;Info" OnCommand="type_Command" CommandName="1" CausesValidation="false"></asp:LinkButton></li>
                <li id="l2" runat="server" style="margin-bottom: 0px;" class="tablinks"><asp:LinkButton ID="agencyUsers" CssClass="tab" runat="server" Text="Agency&nbsp;Users" OnCommand="type_Command" CommandName="2" CausesValidation="false"></asp:LinkButton></li>
                <li id="l3" runat="server" style="margin-bottom: 0px;" class="tablinks"><asp:LinkButton ID="contacts" CssClass="tab" runat="server" Text="Private&nbsp;Choice&nbsp;Contacts" OnCommand="type_Command" CommandName="3" style="width:175px;" CausesValidation="false"></asp:LinkButton></li>
                <li id="l4" runat="server" style="margin-bottom: 0px;" class="tablinks"><asp:LinkButton ID="settings" CssClass="tab" runat="server" Text="Settings" OnCommand="type_Command" CommandName="4" CausesValidation="false"></asp:LinkButton></li>
            </ul>
        </nav>
    </div>
    <div class="content" >
         <style>
                .customer-info-box {
                background: white;
            }
        </style>
        <div id="pages" runat="server">
            <uc2:CtlEditBrokerDetails ID="page_1" runat="server"/>
            <uc5:CtlAgencyUsers ID="page_2" runat="server" Visible="false" />
            <uc6:CtlBrokerContacts ID="page_3" runat="server" Visible="false" />
            <uc4:CtlChangePassword ID="page_4" Role="Broker" runat="server" Visible="false" />
            <uc3:CtlCreateWebUser ID="page_4B" Role="Broker" runat="server" Visible="false" />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
