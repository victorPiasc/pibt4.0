<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="Plans.aspx.cs" Inherits="Pibt.Employer.Plans" %>
<%@ Register Src="../UserControl/CtlCurrentPlans.ascx" TagName="CtlCurrentPlans"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc4" %>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">Plans</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <u><a href="/">Home</a></u>
    <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Administrator,Agent,RK,Broker">
                <ContentTemplate>
                    &nbsp;>&nbsp;<u><a href="BusinessList.aspx">Employer List</a></u>
                    &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx?erid=<%=EmployerId %>">Employer #<%=EmployerId %></a></u>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Employer">
                <ContentTemplate>
                    &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx">Employer</a></u>
                </ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
    &nbsp;>&nbsp;Plans
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="papersize">
        <uc1:CtlCurrentPlans ID="CtlCurrentPlans1" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc4:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
