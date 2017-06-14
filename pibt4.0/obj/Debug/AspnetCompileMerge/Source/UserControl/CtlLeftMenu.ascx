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
   </AnonymousTemplate>
   <RoleGroups>
      <asp:RoleGroup Roles="Administrator">
         <ContentTemplate>
            <telerik:RadPanelBar ID="AdminMenuPanel" runat="server" Width="175">
               <Items>
                  <telerik:RadPanelItem Text="Administrator" CssClass="blue" NavigateUrl="/default.aspx" runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Management" Expanded="true" runat="server">
                     <Items>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/Maintenance.aspx" Text="Maintenance">
                        </telerik:RadPanelItem>                       
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/LegalDocs.aspx" Text="Legal Documents">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/OETypes.aspx" Text="OE Types">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/Administrators.aspx" Text="Administrators">
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
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/UsersLog.aspx" Text="Operation Log">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/ErrorLog.aspx" Text="Error Log">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/OnlineQuote.aspx" Text="Online Quote"></telerik:RadPanelItem>
                     </Items>
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Public Site Management" Expanded="true" runat="server">
                     <Items>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/NewsList.aspx" Text="News">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/Admin/EventList.aspx" Text="Events">
                        </telerik:RadPanelItem>
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
                  <telerik:RadPanelItem Text="Agent" CssClass="blue" NavigateUrl="/default.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Employer" CssClass="blue" Expanded="true" runat="server">
                     <Items>
                        <telerik:RadPanelItem runat="server" Text="Employer List" NavigateUrl="/employer/businesslist.aspx">
                        </telerik:RadPanelItem>
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
                  <telerik:RadPanelItem Text="RK" CssClass="blue" NavigateUrl="/default.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Employers" CssClass="blue" NavigateUrl="/employer/businesslist.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
               </Items>
            </telerik:RadPanelBar>
         </ContentTemplate>
      </asp:RoleGroup>
      <asp:RoleGroup Roles="Employer">
         <ContentTemplate>
            <telerik:RadPanelBar ID="ErMenuPanel" runat="server" Width="175" >
               <Items>
                  <telerik:RadPanelItem Text="Employer" CssClass="blue" NavigateUrl="/default.aspx" runat="server">
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Employee" CssClass="blue" Expanded="true" runat="server">
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
                  <telerik:RadPanelItem Text="Plans"  CssClass="blue" Expanded="true" runat="server">
                     <Items>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/employer/plans.aspx?tab=0" Text="Current Plans">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/employer/plans.aspx?tab=1" Text="Available Plans">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" NavigateUrl="/employer/PA.aspx" Text="Participation Agreement">
                        </telerik:RadPanelItem>
                     </Items>
                  </telerik:RadPanelItem>
                  <telerik:RadPanelItem Text="Invoice" CssClass="blue" Expanded="true" runat="server">
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
                        <telerik:RadPanelItem Text="Employee" CssClass="blue" NavigateUrl="/default.aspx"
                            runat="server">
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
                  <telerik:RadPanelItem Text="Dependent" CssClass="blue" NavigateUrl="/default.aspx"
                     runat="server">
                  </telerik:RadPanelItem>
                   <telerik:RadPanelItem Text="Plans" CssClass="blue" NavigateUrl="/employer/allplans.aspx" runat="server">
                  </telerik:RadPanelItem>
               </Items>
            </telerik:RadPanelBar>
         </ContentTemplate>
      </asp:RoleGroup>
   </RoleGroups>
</asp:LoginView>
