<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeBehind="BizChangePwd.aspx.cs" Inherits="Pibt.Employer.BizChangePwd" %>
<%@ Register Src="~/UserControl/CtlChangePassword.ascx" TagName="CtlChangePassword"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlCreateWebUser.ascx" TagName="CtlCreateWebUser"
    TagPrefix="uc3" %>
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
                <telerik:RadTab ImageUrl="/img/dba.png" Text="DBA Information" NavigateUrl="BizDbaInfo.aspx">
                </telerik:RadTab>
                <telerik:RadTab ImageUrl="/img/department.png" Text="Departments"  NavigateUrl="BizDepartments.aspx">
                </telerik:RadTab>
                <telerik:RadTab ImageUrl="/img/password1.png" Text="Account Settings" NavigateUrl="BizChangePwd.aspx"  Selected="true">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
    </div>
    <telerik:RadMultiPage runat="server" ID="RadMultiPage1" CssClass="multiPage">
        <telerik:RadPageView runat="server" ID="RadPageView2" Selected="true">
           <uc3:CtlCreateWebUser ID="CtlCreateWebUser1" Role="Employer" runat="server" />
            <uc1:CtlChangePassword ID="CtlChangePassword1" Role="Employer" runat="server" />
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function customResponseEnd(sernder, args) {
                if (typeof (btnChangePassword_click) != 'undefined') {
                    btnChangePassword_click(sernder, args);
                }
                if (typeof (btnCreateUser_click) != 'undefined') {
                    btnCreateUser_click(sernder, args);
                }
            }
        </script>
    </telerik:RadCodeBlock>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
