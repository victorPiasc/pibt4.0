<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeBehind="BizDepartments.aspx.cs" Inherits="Pibt.Employer.BizDepartments" %>

<%@ Register Src="~/UserControl/CtlDepartments.ascx" TagName="CtlDepartments" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <h1>
        <a href="/">Home</a>
        <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
            <RoleGroups>
                <asp:RoleGroup Roles="Administrator,Agent,RK,Broker">
                    <ContentTemplate>
                        &nbsp;>&nbsp;<a href="BusinessList.aspx">Employers List</a>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
        &gt; Employer #<%= EmployerId.Contains("-")? "Pending" : EmployerId %>
    </h1>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <style>
        .customer-info-box {
            background: white;
        }
    </style>
    <div class="dontprint">
        <nav>
            <ul id="typeList" runat="server">
                <li id="l1" runat="server" style="margin-bottom: 0px" class="tablinks">
                    <asp:LinkButton ID="general" CssClass="tab" runat="server" Text="General&nbsp;Info" PostBackUrl="/Employer/BusinessInfo.aspx"></asp:LinkButton></li>
                <li id="l2" runat="server" style="margin-bottom: 0px;" class="tablinks">
                    <asp:LinkButton ID="additional" CssClass="tab" runat="server" Text="Additional&nbsp;Info" PostBackUrl="/Employer/BizAdditional.aspx"></asp:LinkButton></li>
                <li id="l3" runat="server" style="margin-bottom: 0px" class="tablinks ">
                    <asp:LinkButton ID="contacts" CssClass="tab" runat="server" Text="Contacts" PostBackUrl="/Employer/BizContacts.aspx"></asp:LinkButton></li>
                <li id="l4" runat="server" style="margin-bottom: 0px" class="tablinks ">
                    <asp:LinkButton ID="dba" CssClass="tab" runat="server" Text="DBA Info" PostBackUrl="/Employer/BizDbaInfo.aspx"></asp:LinkButton></li>
                <li id="l6" runat="server" style="margin-bottom: 0px" class="tablinks selected">
                    <asp:LinkButton ID="departments" CssClass="tab" runat="server" Text="Departments" PostBackUrl="/Employer/BizDepartments.aspx"></asp:LinkButton></li>
                <li id="l7" runat="server" style="margin-bottom: 0px" class="tablinks">
                    <asp:LinkButton ID="settings" CssClass="tab" runat="server" Text="Account Settings" PostBackUrl="/Employer/BizChangePwd.aspx"></asp:LinkButton></li>
            </ul>
        </nav>
    </div>
    <div class="content">
        <uc1:CtlDepartments ID="CtlDepartments1" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
