<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="AgentFavorites.aspx.cs" Inherits="Pibt.Employer.AgentFavorites" %>

<%@ Register Src="../UserControl/CtlAgentFavorites.ascx" TagName="CtlAgentFavorites" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="FrameHeaderPlaceHolder">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> > Favorites List
    <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Administrator,Agent,RK">
<%--                <ContentTemplate>
                    &nbsp;>&nbsp;<a href="BusinessList.aspx">Employer List</a></ContentTemplate>--%>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
   <uc1:CtlAgentFavorites ID="CtlAgentFavorites1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="PlaceHolderBreadcrumbs">
    &gt;<span>Employer</span>
</asp:Content>




<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeBehind="AgentFavorites.aspx.cs" Inherits="Pibt.Employer.AgentFavorites" %>
<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
   <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> > Employer List
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

   <telerik:RadGrid ID="AgentFavoriteList" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" 
       ShowGroupPanel="True" DataSourceID="odsAgentFavorite">
   </telerik:RadGrid>
    <asp:ObjectDataSource ID="odsAgentFavorite" runat="server" SelectMethod="GetAgentFavorites" TypeName="Pibt.BLL.Agent">
    </asp:ObjectDataSource>
</asp:Content>--%>
