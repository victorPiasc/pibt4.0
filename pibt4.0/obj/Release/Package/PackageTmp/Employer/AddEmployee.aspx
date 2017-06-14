<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"
    CodeBehind="AddEmployee.aspx.cs" Inherits="Pibt.Employer.AddEmployee" %>

<%@ Register Src="../UserControl/CtlAddEmployee.ascx" TagName="CtlAddEmployee" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc2" %>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PlaceHolderHead">
<script type="text/javascript">
    function responseEnd(sender, eventArgs) {
        alert('Response end initiated by: ' + eventArgs.get_eventTarget());
    }
</script>
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Add Employee</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <h1>
        <input type="button" class="ImgHome" value=" " />
        <a href="/">Home</a>
        <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
            <RoleGroups>
                <asp:RoleGroup Roles="Administrator,Agent,RK,Broker">
                    <ContentTemplate>
                        &nbsp;>&nbsp;<a href="BusinessList.aspx">Employer List</a> &nbsp;>&nbsp;<a href="BusinessInfo.aspx?erId=<%=Request["erid"] %>">Employer #<%=EmployerId %></a>
                        &nbsp;>&nbsp;<a href="Employee.aspx?erId=<%=Request["erid"] %>">Employee List</a>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
            <RoleGroups>
                <asp:RoleGroup Roles="Employer">
                    <ContentTemplate>
                        &nbsp;>&nbsp;<a href="BusinessInfo.aspx">Employer</a>&nbsp;>&nbsp;<a href="Employee.aspx">Employee
                        List</a>
                        </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
        &nbsp;>&nbsp;Add Employee
    </h1>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlAddEmployee ID="CtlAddEmployee1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
