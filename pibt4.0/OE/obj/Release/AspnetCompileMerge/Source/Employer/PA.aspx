<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="PA.aspx.cs" Inherits="Pibt.Employee.PA" %>

<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content3" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a>
    <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Administrator,Agent,RK">
                <ContentTemplate>
                    &nbsp;>&nbsp;<a href="BusinessList.aspx">Employer List</a>&nbsp;>&nbsp;<a href="BusinessInfo.aspx?erid=<%=EmployerId %>">Employer#<%=EmployerId %></a>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Employer">
                <ContentTemplate>
                    &nbsp;>&nbsp;<a href="BusinessInfo.aspx">Employer</a></ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
    &nbsp;>&nbsp;Participation Agreement
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
   <fieldset>
         <fieldset>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel">
        <h1>
            <asp:Label ID="LabelValid" runat="server" Text="" Visible="False"></asp:Label>
            <asp:Label ID="LabelInvalid" runat="server" Text="" Visible="False"></asp:Label>
           <asp:Label ID="lblRKName" runat="server"></asp:Label> 
                      (323)728-9500 Ext. 
           <asp:Label ID="lblRKext" runat="server" />, or 
           <asp:Literal ID="literalRKEmail" runat="server"></asp:Literal>.
        <br />
    </telerik:RadAjaxPanel>
      </fieldset>
     </fieldset>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
