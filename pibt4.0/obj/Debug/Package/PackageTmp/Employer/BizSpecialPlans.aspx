﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeBehind="BizSpecialPlans.aspx.cs" Inherits="Pibt.Employer.BizSpecialPlans" %>
<%@ Register Src="~/UserControl/CtlSpecialPlans.ascx" TagName="CtlSpecialPlans" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <h1>
        <input type="button" class="ImgHome" value=" " />
        <a href="/">Home</a>
        <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
            <RoleGroups>
                <asp:RoleGroup Roles="Administrator,Agent,RK,Broker">
                    <ContentTemplate>
                        &nbsp;>&nbsp;<a href="BusinessList.aspx">Employers List</a></ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
         &gt; Employer #<%= EmployerId.Contains("-")? "Pending" : EmployerId %>
    </h1>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div class="dontprint">
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="MetroTouch" MultiPageID="RadMultiPage1" Align="Justify" ReorderTabsOnSelect="false" >
            <Tabs>
                <telerik:RadTab Text="General Information">
                </telerik:RadTab>
                <telerik:RadTab Text="Additional Information" NavigateUrl="BizAdditional.aspx">
                </telerik:RadTab>
                <telerik:RadTab Text="Contacts" NavigateUrl="BizContacts.aspx">
                </telerik:RadTab>
                <telerik:RadTab Text="DBA Information" IsBreak="true" NavigateUrl="BizDbaInfo.aspx">
                </telerik:RadTab>
                <telerik:RadTab Text="Plans Selection" NavigateUrl="BizSpecialPlans.aspx"  Selected="true">
                </telerik:RadTab>
                <telerik:RadTab Text="Departments"  NavigateUrl="BizDepartments.aspx">
                </telerik:RadTab>
                <telerik:RadTab Text="Change Password" NavigateUrl="BizChangePwd.aspx">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
    </div>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" CssClass="multiPage">
        <telerik:RadPageView runat="server" ID="RadPageView2" Selected="true">
            <uc1:CtlSpecialPlans ID="CtlSpecialPlans1" runat="server" />
        </telerik:RadPageView>
    </telerik:RadMultiPage>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
