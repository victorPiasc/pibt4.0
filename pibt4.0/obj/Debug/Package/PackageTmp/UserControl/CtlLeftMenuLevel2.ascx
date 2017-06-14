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
            <%--Login --%>
            <li>
                <li><a href="/login.aspx"><img src="/images/LoginIcon_large.jpg" alt=""/></a></li>
            </li>
        </ul>
    </AnonymousTemplate>
    <RoleGroups>
        <asp:RoleGroup Roles="Administrator,Agent,RK,Broker,Enroller">
            <ContentTemplate>
                <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175">
                </telerik:RadPanelBar>
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Employer">
            <ContentTemplate>
                <telerik:RadPanelBar ID="ErMenuPanel" runat="server" Width="175" >
                    <Items>
                        <telerik:RadPanelItem Text="Company&nbsp;Profile" CssClass="blue" runat="server" NavigateUrl="/default.aspx" Expanded="true">
                            <Items>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/DocumentsLibrary.aspx" Text="Company&nbsp;Documents"></telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/OnlineDocuments.aspx" Text="General&nbsp;Documents" Target="_blank"></telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Employee&nbsp;Management" Expanded="true" runat="server">
                            <Items>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/Employee.aspx" Text="View&nbsp;Employees">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/addEmployee.aspx" Text="Add&nbsp;New&nbsp;Employee">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/EnrollmentForms.aspx"
                                    Text="Forms&nbsp;History">
                                </telerik:RadPanelItem>
                                 <telerik:RadPanelItem runat="server" NavigateUrl="/employer/EmployeeCoveragePlans.aspx" Text="Coverage&nbsp;Search">
                                </telerik:RadPanelItem>
                                <%--<telerik:RadPanelItem runat="server" NavigateUrl="/" Text="Pending&nbsp;Activity"></telerik:RadPanelItem>--%>
                            </Items>
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Plan&nbsp;Management" Expanded="true" runat="server">
                            <Items>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/plans.aspx" Text="Current&nbsp;Plans">
                                </telerik:RadPanelItem>
                                <%--<telerik:RadPanelItem runat="server" NavigateUrl="/" Text="Contribution&nbsp;Center"></telerik:RadPanelItem>--%>
                            </Items>
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Invoice" Expanded="true" runat="server">
                            <Items>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/InvoiceHist.aspx" Text="Invoice&nbsp;History">
                                </telerik:RadPanelItem>
                                <telerik:RadPanelItem runat="server" NavigateUrl="/employer/InvoiceAR.aspx" Text="Payment&nbsp;History">
                                </telerik:RadPanelItem>
                            </Items>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
                <asp:Button ID="renew" style="white-space:normal; width:150px; height:95px;font-weight: bold;background: #24b755;" runat="server" CssClass="btn" OnClick="renew_Click" />
            </ContentTemplate>
        </asp:RoleGroup>
        <asp:RoleGroup Roles="Employee">
            <ContentTemplate>
                <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175" >
                    <Items>
                        <telerik:RadPanelItem Text="Personal Profile" CssClass="blue" NavigateUrl="/default.aspx" runat="server">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Plans Offered" CssClass="blue" NavigateUrl="/employer/allplans.aspx" runat="server">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem Text="Enrollment History" CssClass="blue" runat="server" NavigateUrl="/employer/EnrollmentHistory.aspx">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
                <asp:Button ID="oe" style="white-space:normal; width:150px; height:95px;font-weight: bold;background: #24b755;" runat="server" CssClass="btn" OnClick="oe_Click" />
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
