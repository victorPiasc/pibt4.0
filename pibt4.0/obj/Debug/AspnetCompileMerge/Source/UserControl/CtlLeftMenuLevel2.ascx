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
        <asp:RoleGroup Roles="Administrator,Agent,RK,Broker">
            <ContentTemplate>
                <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175">
                </telerik:RadPanelBar>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Employer">
            <ContentTemplate>
                <telerik:RadPanelBar ID="ErMenuPanel" runat="server" Width="175" >
                    <Items>
                        <telerik:RadPanelItem Text=" Employer" CssClass="blue" runat="server" NavigateUrl="/default.aspx" >
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
                        <telerik:RadPanelItem Text="Plans" Expanded="true" runat="server">
                            <Items>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/plans.aspx?tab=0" Text="Current Plans">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/plans.aspx?tab=1" Text="Available Plans">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/PA.aspx" Text="Participation Agreement">
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Invoice" Expanded="true" runat="server">
                            <Items>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/Invoice.aspx" Text="Current Invoice">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/InvoiceHist.aspx" Text="Invoice History">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/InvoiceAR.aspx" Text="Payment History">
                                </telerik:RadPanelItem>

                            </Items>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Employee">
            <ContentTemplate>
                <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175" >
                    <Items>
                        <telerik:RadPanelItem Text="Employee" CssClass="blue" NavigateUrl="/default.aspx" runat="server">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Plans" CssClass="blue" NavigateUrl="/employer/allplans.aspx" runat="server">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Enrollment" runat="server" Expanded="true">
                            <Items>
                                <telerik:RadPanelItem Text="Enrollment Form" runat="server" NavigateUrl="/OE/Type.aspx">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem Text="Enrollment History" runat="server" NavigateUrl="/employer/EnrollmentHistory.aspx">
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Dependent">
            <ContentTemplate>
                <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175">
                    <Items>
                         <telerik:RadPanelItem Text="Dependent" CssClass="blue" NavigateUrl="/default.aspx" runat="server">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Plans" CssClass="blue" NavigateUrl="/employer/allplans.aspx" runat="server">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
            </ContentTemplate>
        </asp:RoleGroup>
    </RoleGroups>
</asp:LoginView>
