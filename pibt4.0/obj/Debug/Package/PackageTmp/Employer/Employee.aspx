<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="Employee.aspx.cs" Inherits="Pibt.Employer.Employee" %>

<%@ Register Src="../UserControl/CtlAddEmployee.ascx" TagName="CtlAddEmployee" TagPrefix="uc2" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc3" %>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Employees</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">   
    <h1>
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
        &nbsp;>&nbsp;Employees
    </h1>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
        <fieldset>
            <legend>Employee Search</legend>
            <table class="table-container">
                <tr class="row">
                    <td class="item-name" >
                        Status
                    </td>
                    <td class="item-value">
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlOptions" Width="320px" AutoPostBack="true" OnSelectedIndexChanged="btnSearch_Click">
                            <asp:ListItem Text="All" Value="0" />
                            <asp:ListItem Text="Active" Value="1" />
                            <asp:ListItem Text="New Hire" Value="2" />
                        </asp:DropDownList>
                    </td>
                    <td class="item-name">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Search For
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtClue" runat="server" CssClass="form-control" autofocus="autofocus" Height="26px" Width="320px">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="btnSearch" CssClass="btn" Text="Search" runat="server" OnClick="btnSearch_Click" />
                        <asp:Button ID="btnClear" CssClass="btn" Text="Clear" runat="server" CausesValidation="false" OnClick="btnClear_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </asp:Panel>
    <asp:Button ID="btnRegister" CssClass="btn" Text="Send Registration EMail to Selected Employees" runat="server" OnClick="btnRegister_Click" style="margin-bottom:15px; margin-top:15px;"/>
    <asp:Literal ID="message1" runat="server"></asp:Literal>
    <telerik:RadGrid ID="RadGridEmployees" runat="server" AllowPaging="True" AllowSorting="true" AutoGenerateColumns="False" GridLines="None" OnNeedDataSource="RadGridEmployees_NeedDataSource" EnableLinqExpressions="false" OnItemDataBound="binder" Skin="MetroTouch" AllowMultiRowSelection="true" OnDataBound="RadGridEmployees_DataBound">
        <PagerStyle Mode="NextPrev"/>
        <MasterTableView DataKeyNames="EmployeeId,Id,Loginname,EmployerId"
            AllowSorting="true" PageSize="16">
            <Columns>
                <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn"></telerik:GridClientSelectColumn>
                <telerik:GridBoundColumn DataField="emailAddress" UniqueName="emailAddress" Display="false"></telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="employeeId" UniqueName="eeId" Display="false"></telerik:GridBoundColumn>
                <telerik:GridHyperLinkColumn DataNavigateUrlFields="EMPLOYERID,EMPLOYEEID"
                    DataNavigateUrlFormatString="/Employer/EmployeeDetails.aspx?erId={0}&eeId={1}" SortExpression="EMPLOYEEID" UniqueName="EMPLOYEEID"
                    DataType="System.Decimal" HeaderText="View Employee Details" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center"
                    DataTextField="EMPLOYEEID" DataTextFormatString="{0}" ItemStyle-Font-Underline="true">
                </telerik:GridHyperLinkColumn>
                <telerik:GridBoundColumn DataField="LoginName" SortExpression="LoginName" UniqueName="LoginName" HeaderText="Web Username" DataType="System.String"
                    ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="NAME" HeaderText="Name" SortExpression="NAME" UniqueName="NAME">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="GENDER" HeaderText="Gender" SortExpression="GENDER"
                    UniqueName="GENDER" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="BIRTHDATE" HeaderText="Birthdate" SortExpression="BIRTHDATE" ItemStyle-HorizontalAlign="Center"
                    UniqueName="BIRTHDATE" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="HIREDATE" HeaderText="Hire Date" SortExpression="HIREDATE" ItemStyle-HorizontalAlign="Center"
                    UniqueName="HIREDATE" DataFormatString="{0:MM/dd/yyyy}" DataType="System.DateTime" HeaderStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
            </Columns>
            <PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
        </MasterTableView>
        <ClientSettings>
            <Selecting AllowRowSelect="true" UseClientSelectColumnOnly ="true" EnableDragToSelectRows="false" />
        </ClientSettings>
    </telerik:RadGrid>
    <br />
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc3:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="PlaceHolderHead">
</asp:Content>
