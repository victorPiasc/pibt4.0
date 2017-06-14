<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeBehind="RatesHopper.aspx.cs" Inherits="Pibt.Employer.RatesHopper" %>

<%@ Register Src="../UserControl/CtlCurrentPlans.ascx" TagName="CtlCurrentPlans"
   TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlRatesHopper.ascx" TagName="CtlRatesHopper" 
   TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlAvailablePlans.ascx" TagName="CtlAvailablePlans"
   TagPrefix="uc2" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
   TagPrefix="uc4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
   Rates Hopper
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
   <uc4:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
   <input type="button" class="ImgHome" value=" " />
   <u><a href="/">Home</a></u>
   <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
      <RoleGroups>
         <asp:RoleGroup Roles="Administrator,Agent,RK,Broker">   
            <ContentTemplate>
               &nbsp;>&nbsp;<u><a href="BusinessList.aspx">Employer List</a></u>
               &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx?erid=<%=EmployerId %>">Employer #<%=EmployerId %></a></u>
            </ContentTemplate>
         </asp:RoleGroup>
         <asp:RoleGroup Roles="Employer">
            <ContentTemplate>
               &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx">Employer</a></u>
            </ContentTemplate>
         </asp:RoleGroup>
      </RoleGroups>
   </asp:LoginView>
   &nbsp;>&nbsp;Rates Hopper
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="dontprint">
        <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="MetroTouch" MultiPageID="RadMultipage1" Orientation="HorizontalTop">
            <Tabs>
                <telerik:RadTab ImageUrl="/img/plans.png" Text="Rates Hopper">
                </telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
    </div>
   <telerik:RadMultiPage runat="server" ID="RadMultiPage1" CssClass="multiPage">
      <telerik:RadPageView runat="server" ID="RadPageView1">
         <uc1:CtlRatesHopper ID="CtlRatesHopper1" runat="server" />
      </telerik:RadPageView>
   </telerik:RadMultiPage>
</asp:Content>
