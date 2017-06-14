<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="BusinessInfo.aspx.cs" Inherits="Pibt.Employer.BusinessInfo" %>

<%@ Register Src="~/UserControl/CtlErBizInfo.ascx" TagName="CtlErBizInfo" TagPrefix="uc3" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc10" %>
<%@ Register Src="../UserControl/CtlEmployerGeneralInfoView.ascx" TagName="CtlEmployerGeneralInfoView"
    TagPrefix="uc1" %>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Business Information
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <script type="text/javascript">
        window.onload = testForPopUp();
        function testForPopUp() {
            var test = window.open("about:blank", "", "directories=no,height=10,width=10,menubar=no,resizable=no,scrollbars=no,status=no,titlebar=no,top=0,location=no");
            if (!test) {
                alert("Popup blocker is turned on. Please turn it off as it may affect pages to open. ")
            }
            test.close();
        }
    </script>
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
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <style>
        .customer-info-box {
            background: white;
        }
    </style>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div class="dontprint">
        <nav>
            <ul id="typeList" runat="server">
                <li id="l1" runat="server" style="margin-bottom: 0px" class="tablinks selected">
                    <asp:LinkButton ID="general" CssClass="tab" runat="server" Text="General&nbsp;Info" PostBackUrl="/Employer/BusinessInfo.aspx"></asp:LinkButton></li>
                <li id="l2" runat="server" style="margin-bottom: 0px;" class="tablinks">
                    <asp:LinkButton ID="additional" CssClass="tab" runat="server" Text="Additional&nbsp;Info" PostBackUrl="/Employer/BizAdditional.aspx"></asp:LinkButton></li>
                <li id="l3" runat="server" style="margin-bottom: 0px" class="tablinks">
                    <asp:LinkButton ID="contacts" CssClass="tab" runat="server" Text="Contacts" PostBackUrl="/Employer/BizContacts.aspx"></asp:LinkButton></li>
                <li id="l4" runat="server" style="margin-bottom: 0px" class="tablinks">
                    <asp:LinkButton ID="dba" CssClass="tab" runat="server" Text="DBA Info" PostBackUrl="/Employer/BizDbaInfo.aspx"></asp:LinkButton></li>
                <li id="l6" runat="server" style="margin-bottom: 0px" class="tablinks">
                    <asp:LinkButton ID="departments" CssClass="tab" runat="server" Text="Departments" PostBackUrl="/Employer/BizDepartments.aspx"></asp:LinkButton></li>
                <li id="l7" runat="server" style="margin-bottom: 0px" class="tablinks">
                    <asp:LinkButton ID="settings" CssClass="tab" runat="server" Text="Account Settings" PostBackUrl="/Employer/BizChangePwd.aspx"></asp:LinkButton></li>
            </ul>
        </nav>
    </div>
    <div class="content">
        <uc3:CtlErBizInfo ID="CtlEmployerInfo1" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc10:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
