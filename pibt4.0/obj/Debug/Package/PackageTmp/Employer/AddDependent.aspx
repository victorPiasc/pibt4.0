<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"
    CodeBehind="AddDependent.aspx.cs" Inherits="Pibt.Employer.AddDependent" %>

<%@ Register Src="../UserControl/CtlAddDependents.ascx" TagName="CtlAddDependent"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlCreateWebUser.ascx" TagName="CtlCreateWebUser"
    TagPrefix="uc2" %>
<%@ Register Src="../UserControl/CtlChangePassword.ascx" TagName="CtlChangePassword"
    TagPrefix="uc3" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc5" %>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Add Dependent
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <h1>
        <input type="button" class="ImgHome" value=" " />
        <a href="/">Home</a>
        <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
            <RoleGroups>
                <asp:RoleGroup Roles="Administrator,Agent,RK,Broker">
                    <ContentTemplate>
                        &nbsp;>&nbsp;<u><a href="BusinessList.aspx">Employer List</a></u> 
                        &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx?erId=<%=Request["erid"] %>">Employer #<%=EmployerId %></a></u>
                        &nbsp;>&nbsp;<u><a href="Employee.aspx?erId=<%=Request["erid"] %>">Employee List</a></u>
                        &nbsp;>&nbsp;<u><a href="EmployeeDetails.aspx?eeId=<%=Request["eeid"] %>&erId=<%=Request["erid"] %>">Employee #<%=EmployeeId %></a></u>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
            <RoleGroups>
                <asp:RoleGroup Roles="Employer">
                    <ContentTemplate>
                       &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx">Employer</a></u>
                       &nbsp;>&nbsp;<u><a href="Employee.aspx">Employee List</a></u>
                       &nbsp;>&nbsp;<u><a href="/employer/EmployeeDetails.aspx?eeId=<%=EmployeeId %>">Employee #<%=EmployeeId %></a></u>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
        &nbsp;>&nbsp;Add Dependent
    </h1>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlAddDependent ID="CtlAddDependent1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc5:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel1" runat="server" />
</asp:Content>
