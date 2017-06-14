<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeBehind="BizDbaInfo.aspx.cs" Inherits="Pibt.Employer.BizDbaInfo" %>
<%@ Register Src="~/UserControl/CtlDbaInfo.ascx" TagName="CtlDbaInfo" TagPrefix="uc1" %>
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
         &gt; Employer #<%=EmployerId %>
    </h1>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div class="dontprint">
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="MetroTouch" MultiPageID="RadMultiPage1" Align="Justify" ReorderTabsOnSelect="false" >
            <Tabs>
                <telerik:RadTab ImageUrl="/img/businessInfo1.png" Text="General Information" NavigateUrl="businessInfo.aspx">
                </telerik:RadTab>
                <telerik:RadTab ImageUrl="/img/additionalInfo.png" Text="Additional Information" NavigateUrl="BizAdditional.aspx">
                </telerik:RadTab>
                <telerik:RadTab ImageUrl="/img/contacts.png" Text="Contacts" IsBreak="true" NavigateUrl="BizContacts.aspx">
                </telerik:RadTab>
                <telerik:RadTab ImageUrl="/img/dba.png" Text="DBA Information" NavigateUrl="BizDbaInfo.aspx" Selected="true">
                </telerik:RadTab>
                <telerik:RadTab ImageUrl="/img/department.png" Text="Departments"  NavigateUrl="BizDepartments.aspx">
                </telerik:RadTab>
                <telerik:RadTab ImageUrl="/img/password1.png" Text="Account Settings" NavigateUrl="BizChangePwd.aspx">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
    </div>

   <uc1:CtlDbaInfo ID="CtlDbaInfo1" runat="server" />
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
