<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlLeftMenu.ascx.cs"
   Inherits="Pibt.UserControl.LeftMenu" %>
<%@ Register Src="CtlLogin.ascx" TagName="CtlLogin" TagPrefix="uc2" %>
<asp:LoginView ID="LoginViewLoggedUserInfo" runat="server">
   <LoggedInTemplate>
      <uc2:CtlLogin ID="CtlLogin1" runat="server" />
   </LoggedInTemplate>
</asp:LoginView>
<asp:LoginView ID="LoginViewLeftMenuPanel" runat="server" EnableTheming="true">
   <AnonymousTemplate>
      <asp:ImageButton ID="LogInImageButton" runat="server" class="btn btn-primary btn-lg" OnClick="LogInImageButton_Click"
         data-toggle="modal" CausesValidation="false"
         data-target="#loginDialog" ImageUrl="/images/LogInBox.PNG" Height="168" />
      <%--               <a href="/login.aspx">
            <img src="/images/LogInBox.PNG" alt="login" width="175px" /></a>--%>
   </AnonymousTemplate>
   <RoleGroups>
      <asp:RoleGroup Roles="Administrator">
         <ContentTemplate>
            <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175">
               <Items>
                  <telerik:RadPanelItem Text="Home" CssClass="blue" NavigateUrl="/" runat="server">
                  </telerik:RadPanelItem>
              <%--<telerik:RadPanelItem Text="Profile" CssClass="blue" NavigateUrl="/Admin/AdminEdit.aspx"
                     runat="server">
                  </telerik:RadPanelItem>--%>
                  <telerik:RadPanelItem Text="Management" Expanded="true" runat="server">
                     <Items>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/Maintenance.aspx" Text="Maintenance">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/AccountManagement.aspx" Text="Account Management">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/LegalDocs.aspx" Text="Legal Document">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/OETypes.aspx" Text="OE Types">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/Administrators.aspx" Text="Administrator">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/Agents.aspx" Text="Agents">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/AgentLookup.aspx" Text="Agent Reports">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/RKs.aspx" Text="RKs">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/employer/BusinessList.aspx" Text="Employers">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/OEWindowManagement.aspx"
                           Text="OE Window Management">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/employer/EnrollmentForms.aspx"
                           Text="Enrollment Forms History">
                        </telerik:RadPanelItem>
                       <%-- <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/InvoiceReportChart.aspx"
                           Text="Invoice Report Chart">
                        </telerik:RadPanelItem>--%>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/UsersLog.aspx" Text="Operation Log">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/ErrorLog.aspx" Text="Error Log">
                        </telerik:RadPanelItem>
                     </Items>
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Public Site Management" Expanded="true" runat="server">
                     <Items>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/NewsList.aspx" Text="News">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/EventList.aspx" Text="Events">
                        </telerik:RadPanelItem>
                        <%--<telerik:RadPanelItem runat="server" NavigateUrl="/Admin/DocumentLibrary.aspx" Text="Documents">
                                </telerik:RadPanelItem>--%>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/QA.aspx" Text="Q & A">
                        </telerik:RadPanelItem>
                     </Items>
                  </telerik:RadPanelItem>
               </Items>
            </telerik:RadPanelBar>
         </ContentTemplate>
      </asp:RoleGroup>
      <asp:RoleGroup Roles="Agent">
         <ContentTemplate>
            <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175">
               <Items>
                  <telerik:RadPanelItem Text="Home" CssClass="blue" NavigateUrl="/" runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Profile" CssClass="blue" NavigateUrl="/Admin/AgentDetails.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Employer" CssClass="blue" Expanded="true" runat="server">
                     <Items>
                        <telerik:RadPanelItem runat="server" Text="Employer List" NavigateUrl="/employer/businesslist.aspx">
                        </telerik:RadPanelItem>
<%--                        <telerik:RadPanelItem runat="server" Text="Agent's Favorites" NavigateUrl="/employer/AgentFavorites.aspx">
                        </telerik:RadPanelItem>--%>
                     </Items>
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Reports" CssClass="blue" NavigateUrl="/Admin/AgentLookup.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
               </Items>
            </telerik:RadPanelBar>
         </ContentTemplate>
      </asp:RoleGroup>
      <asp:RoleGroup Roles="RK">
         <ContentTemplate>
            <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175">
               <Items>
                  <telerik:RadPanelItem Text="Home" CssClass="blue" NavigateUrl="/" runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Profile" CssClass="blue" NavigateUrl="/Admin/RKDetails.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Employers" CssClass="blue" NavigateUrl="/employer/businesslist.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Contact Us" CssClass="blue" NavigateUrl="/contactUs.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
               </Items>
            </telerik:RadPanelBar>
         </ContentTemplate>
      </asp:RoleGroup>
      <asp:RoleGroup Roles="Employer">
         <ContentTemplate>
            <telerik:RadPanelBar ID="ErMenuPanel" runat="server" Width="175" Skin="MetroTouch">
               <Items>
                  <telerik:RadPanelItem Text="Home" CssClass="blue" NavigateUrl="/" runat="server">
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
                        <telerik:RadPanelItem runat="server" NavigateUrl="/employer/businessInfo.aspx" Text="General Info">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/employer/BizAdditional.aspx" Text="Additional Info">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/employer/BizDbaInfo.aspx" Text="DBA Info">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/employer/BizContacts.aspx" Text="Contacts">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/employer/BizDepartments.aspx"
                           Text="Departments">
                        </telerik:RadPanelItem>
                        <%--<telerik:RadPanelItem runat="server" NavigateUrl="/employer/BizSpecialPlans.aspx"
                                    Text="Special Plans">
                                </telerik:RadPanelItem>--%>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/employer/BizChangePwd.aspx" Text="Account Settings">
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
                    <%--<telerik:RadPanelItem runat="server" NavigateUrl="/employer/InvoiceReportChart.aspx"
                           Text="Invoice Report Chart">
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
            <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175">
               <Items>
                  <telerik:RadPanelItem Text="Home" CssClass="blue" NavigateUrl="/" runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Profile" CssClass="blue" NavigateUrl="/employer/EditMemberDetails.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="My Family" CssClass="blue" NavigateUrl="/employer/EmployeeDetails.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
                  <%--<telerik:RadPanelItem Text="Plans" CssClass="blue" NavigateUrl="/employer/allplans.aspx"
                            runat="server">
                        </telerik:RadPanelItem>--%>
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
                  <telerik:RadPanelItem Text="Contact Us" CssClass="blue" NavigateUrl="/contactUs.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
               </Items>
            </telerik:RadPanelBar>
         </ContentTemplate>
      </asp:RoleGroup>
      <asp:RoleGroup Roles="Dependent">
         <ContentTemplate>
            <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175">
               <Items>
                  <telerik:RadPanelItem Text="Home" CssClass="blue" NavigateUrl="/" runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Profile" CssClass="blue" NavigateUrl="/employer/EmployeeDetails.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Contact Us" CssClass="blue" NavigateUrl="/contactUs.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
               </Items>
            </telerik:RadPanelBar>
         </ContentTemplate>
      </asp:RoleGroup>
   </RoleGroups>
</asp:LoginView>
