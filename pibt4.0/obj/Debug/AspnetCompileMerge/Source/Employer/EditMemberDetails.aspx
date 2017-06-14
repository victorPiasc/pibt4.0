<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="EditMemberDetails.aspx.cs" Inherits="Pibt.Employer.EditMemberDetails" %>

<%@ Register Src="../UserControl/CtlEditMemberDetails.ascx" TagName="CtlEditMemberDetails"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlCreateWebUser.ascx" TagName="CtlCreateWebUser"
    TagPrefix="uc2" %>
<%@ Register Src="../UserControl/CtlChangePassword.ascx" TagName="CtlChangePassword"
    TagPrefix="uc3" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc5" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
 Edit Member Details
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
        <input type="button" class="ImgHome" value=" " />
        <a href="/">Home</a>
        <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
            <RoleGroups>
                <asp:RoleGroup Roles="Administrator,Agent,RK,Broker">
                    <ContentTemplate>
                        &nbsp;>&nbsp;<u><a href="BusinessList.aspx">Business List</a></u> 
                        &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx?erId=<%=Request["erid"] %>">Employer #<%=EmployerId %></a></u>
                        &nbsp;>&nbsp;<u><a href="Employee.aspx?erId=<%=Request["erid"] %>">Employee List</a></u>
                        &nbsp;>&nbsp;<u><a href="EmployeeDetails.aspx?eeId=<%=Request["eeid"] %>&erId=<%=Request["erid"] %>">Employee #<%=EmployeeId %></a></u>
                        &nbsp;>&nbsp;Edit  Member #<%=Request["mid"] %>
                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="Employer">
                    <ContentTemplate>
                       &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx">Employer</a></u>
                       &nbsp;>&nbsp;<u><a href="Employee.aspx">Employee List</a></u>
                       &nbsp;>&nbsp;<u><a href="/employer/EmployeeDetails.aspx?eeId=<%=EmployeeId %>">Employee #<%=EmployeeId %></a></u>
                       &nbsp;>&nbsp;Edit Member #<%=Request["mid"] %>
                    </ContentTemplate>
                </asp:RoleGroup>
                <asp:RoleGroup Roles="Employee,Dependent">
                    <ContentTemplate>
                        &nbsp;>&nbsp;Profile #<%=Request["mid"] %>
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="dontprint">
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="MetroTouch" MultiPageID="RadMultiPage1"
            ReorderTabsOnSelect="true" Orientation="HorizontalTop" SelectedIndex="0">
            <Tabs>
                <telerik:RadTab ImageUrl="/img/customerInfo.png" Text="General Information">
                </telerik:RadTab>
                <telerik:RadTab ImageUrl="/img/password1.png" Text="Username & Password" Visible="False">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
    </div>
    <telerik:RadMultiPage runat="server" SelectedIndex="0" ID="RadMultiPage1" CssClass="multiPage">
        <telerik:RadPageView runat="server" ID="RadPageView1" CssClass="productsPageView">
            <uc1:CtlEditMemberDetails ID="CtlEditMemberDetails1" runat="server" />
            <uc2:CtlCreateWebUser ID="CtlCreateWebUser1" runat="server" />
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="RadPageView2" Visible="False">
            <uc3:CtlChangePassword ID="CtlChangePassword1" runat="server" />
            
        </telerik:RadPageView>
    </telerik:RadMultiPage>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function customResponseEnd(sernder, args) {
                if (typeof (btnChangePassword_click) != 'undefined') {
                    btnChangePassword_click(sernder, args);
                }
                if (typeof (btnUpdateMember_click) != 'undefined') {
                    btnUpdateMember_click(sernder, args);
                }
            }
        </script>
    </telerik:RadCodeBlock>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc5:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
