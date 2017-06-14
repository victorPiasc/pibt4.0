<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlLeftMenuLevel2.ascx.cs"
    Inherits="Pibt.UserControl.CtlLeftMenuLevel2" %>
<%@ Register Src="CtlLogin.ascx" TagName="CtlLogin" TagPrefix="uc2" %>
<asp:LoginView ID="LoginViewLoggedUserInfo" runat="server">
    <LoggedInTemplate>
        <uc2:CtlLogin ID="CtlLogin1" runat="server" />
    </LoggedInTemplate>
</asp:LoginView>
<asp:LoginView ID="LoginViewLeftMenuPanel" runat="server" EnableTheming="true">
    <AnonymousTemplate>
        <ul id="categoryList" style="display: block">
            <!--Login -->
            <li>
                <li><a href="/login.aspx"><img src="/images/LoginIcon_large.jpg" alt=""/></a></li>
            </li>
        </ul>
    </AnonymousTemplate>
    <RoleGroups>
        <asp:RoleGroup Roles="Administrator,Agent,RK">
            <ContentTemplate>
                <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175">
                </telerik:RadPanelBar>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Employer">
            <ContentTemplate>
                <telerik:RadPanelBar ID="ErMenuPanel" runat="server" Width="175" Skin="MetroTouch">
                    <Items>
                        <telerik:RadPanelItem Text="Home" CssClass="blue" runat="server" NavigateUrl="/default.aspx">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Employee" Expanded="true" runat="server">
                            <Items>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/Employee.aspx" Text="Employee Search">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/addEmployee.aspx" Text="Add Employee">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/EnrollmentForms.aspx"
                                    Text="Forms History">
                                </telerik:RadPanelItem>
                                 <telerik:RadPanelItem runat="server" NavigateUrl="/employer/EmployeeCoveragePlans.aspx"
                                    Text="Coverage Search">
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Employer" Expanded="true" runat="server">
                            <Items>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/businessInfo.aspx"
                                    Text="General Info">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/BizAdditional.aspx"
                                    Text="Additional Info">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/BizDbaInfo.aspx"
                                    Text="DBA Info">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/BizContacts.aspx"
                                    Text="Contacts">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/BizDepartments.aspx"
                                    Text="Departments">
                                </telerik:RadPanelItem>
                              <%--  <telerik:RadPanelItem runat="server" NavigateUrl="/employer/BizSpecialPlans.aspx"
                                    Text="Special Plans">
                                </telerik:RadPanelItem>--%>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/BizChangePwd.aspx"
                                    Text="Account Settings">
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Plans" Expanded="false" runat="server">
                            <Items>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/plans.aspx?tab=0" Text="Current Plans">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/plans.aspx?tab=1" Text="Available Plans">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/PA.aspx" Text="Participation Agreement">
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Invoice" Expanded="false" runat="server">
                            <Items>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/Invoice.aspx" Text="Current Invoice">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/InvoiceHist.aspx" Text="Invoice History">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/InvoiceAR.aspx" Text="Account Receivable">
                                </telerik:RadPanelItem>
                                <%-- <telerik:RadPanelItem runat="server" NavigateUrl="/employer/InvoiceReportChart.aspx" Text="Invoice Report Chart">
                                </telerik:RadPanelItem>--%>
                            </Items>
                        </telerik:RadPanelItem>
                        <%--<telerik:RadPanelItem Text="PA" Expanded="true" runat="server">
                            <Items>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/PA.aspx" Text="Participation Agreement">
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>--%>
                    </Items>
                </telerik:RadPanelBar>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Employee">
            <ContentTemplate>
                <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175" Skin="MetroTouch">
                    <Items>
                        <telerik:RadPanelItem Text="Home" CssClass="blue" NavigateUrl="/" runat="server">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Profile" CssClass="blue" NavigateUrl="/employer/EditMemberDetails.aspx" runat="server">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="My Family" CssClass="blue" NavigateUrl="/employer/EmployeeDetails.aspx"
                            runat="server">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Plans" CssClass="blue" NavigateUrl="/employer/allplans.aspx" runat="server">
                        </telerik:RadPanelItem>
<%--                        <telerik:RadPanelItem Text="Invoice" runat="server" Expanded="true">
                            <Items>
                                <telerik:RadPanelItem Text="Current Invoice" runat="server" NavigateUrl="/employer/Invoice.aspx">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem Text="Invoice History" runat="server" NavigateUrl="/employer/InvoiceHist.aspx">
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>--%>
                        <telerik:RadPanelItem Text="Enrollment" runat="server" Expanded="true">
                            <Items>
                                <telerik:RadPanelItem Text="Enrollment Form" runat="server" NavigateUrl="/OE/Type.aspx">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem Text="Enrollment History" runat="server" NavigateUrl="/employer/EnrollmentHistory.aspx">
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Contact Us" CssClass="blue" NavigateUrl="/contactUs.aspx" runat="server">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Dependent">
            <ContentTemplate>
                <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175" Skin="MetroTouch">
                    <Items>
                        <telerik:RadPanelItem Text="Home" CssClass="blue" NavigateUrl="/" runat="server">
                        </telerik:RadPanelItem>
                         <telerik:RadPanelItem Text="Profile" CssClass="blue" NavigateUrl="/employer/EditMemberDetails.aspx" runat="server">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Contact Us" CssClass="blue" NavigateUrl="/contactUs.aspx" runat="server">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
            </ContentTemplate>
        </asp:RoleGroup>
    </RoleGroups>
</asp:LoginView>
