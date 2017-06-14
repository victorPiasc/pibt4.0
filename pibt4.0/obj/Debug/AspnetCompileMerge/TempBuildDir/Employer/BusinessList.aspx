<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="BusinessList.aspx.cs" Inherits="Pibt.Employer.BusinessList" %>

<%@ Register Src="../UserControl/CtlEmployerGrid.ascx" TagName="CtlEmployerGrid"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="FrameHeaderPlaceHolder">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a>&nbsp; > Employer List
    <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Administrator,Agent,RK,Broker">
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
   <uc1:CtlEmployerGrid ID="CtlEmployerGrid1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" runat="server" 
    contentplaceholderid="PlaceHolderBreadcrumbs">
    &nbsp;&nbsp;&gt;<span>Employer</span>
</asp:Content>

