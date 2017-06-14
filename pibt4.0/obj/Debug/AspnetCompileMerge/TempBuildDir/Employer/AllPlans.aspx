<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="AllPlans.aspx.cs" Inherits="Pibt.Employer.AllPlans" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a>
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
    &nbsp;>&nbsp;Plans
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">    
    <div class="customer-info-box">
        <div class="section-body">
            <div class="section-title">
                Coverage Type:
            </div>
            <div>
                <telerik:RadGrid ID="PlanTypeGrid" DataKeyNames="planId" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                        PageSize="10" GridLines="None" ShowStatusBar="True" CssClass="papersize" OnNeedDataSource="PlanTypeGrid_NeedDataSource"
                        OnDataBound="PlanTypeGrid_DataBound" OnSelectedIndexChanged="PlanTypeGrid_SelectedIndexChanged">
                    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                    <MasterTableView AllowMultiColumnSorting="True" DataKeyNames="PLANTYPEID">
                        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
                        <Columns>
                            <telerik:GridBoundColumn SortExpression="DESCRIPTION" HeaderText="Plan Type" DataField="DESCRIPTION" UniqueName="DESCRIPTION">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                    <ClientSettings EnablePostBackOnRowClick="true">
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                </telerik:RadGrid>
            </div>
            <div class="section-title">
                Current Plans:
            </div>
            <div>
                <telerik:RadGrid ID="CurrentPlanGrid" DataKeyNames="planId" runat="server" AutoGenerateColumns="False" AllowSorting="True" AllowPaging="True"
                        GridLines="None" ShowStatusBar="True" CssClass="papersize" CellSpacing="0" OnNeedDataSource="CurrentPlanGrid_NeedDataSource">
                    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
                    <MasterTableView AllowMultiColumnSorting="True">
                        <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
                        <Columns>
                            <telerik:GridBoundColumn DataFormatString="{0:MM/yyyy}" SortExpression="MONTHIN"
                                HeaderText="Covered Month" DataField="MONTHIN" UniqueName="MONTHIN" DataType="System.DateTime">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="CARRIERNAME" HeaderText="Carrier Name" DataField="CARRIERNAME" UniqueName="CARRIERNAME">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="PLANID" DataType="System.Decimal" HeaderText="Plan ID"
                                SortExpression="PLANID" UniqueName="PLANID">
                            </telerik:GridBoundColumn>
                            <telerik:GridBoundColumn SortExpression="PLANNAME" HeaderText="Plan Name" DataField="PLANNAME" UniqueName="PLANNAME">
                            </telerik:GridBoundColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </div>
    </div>
</asp:Content>
