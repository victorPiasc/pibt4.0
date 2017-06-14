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
                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlOptions" Width="320px">
                            <asp:ListItem Text="All" Value="0" />
                            <asp:ListItem Text="Active" Selected="True" Value="1" />
                            <asp:ListItem Text="New Hire" Value="2" />
                        </asp:DropDownList>
                    </td>
                    <td class="item-name">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=Pibt.Common.Utilities.Us()%> Employee ID
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtEmployeeID" runat="server" Placeholder="" CssClass="form-control" autofocus="autofocus" Height="26px" MaxLength="8"
                            Width="320px" ValidationGroup="vgId">
                        </asp:TextBox>
                        <asp:RangeValidator ID="rvId" runat="server" ControlToValidate="txtEmployeeID" Display="Dynamic"
                            ValidationGroup="vgId" CssClass="red" ErrorMessage="It must be 1-99999999" MinimumValue="1"
                            MaximumValue="99999999"></asp:RangeValidator>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr class="row">
                    <td class="item-name">
                        Web&nbsp;Username
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtLoginName" CssClass="form-control" Placeholder="" Height="26px" Width="315px" runat="server"></asp:TextBox>
                    </td>
                    <td class="item-name">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Last Name &nbsp;&nbsp;&nbsp;
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtUserName" CssClass="form-control" Placeholder="" Height="26px" Width="320px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
                <tr>
                    <td colspan="4">
                        <asp:Button ID="btnSearch" CssClass="btn" Text="Search" runat="server" ValidationGroup="vgId"
                            OnClick="btnSearch_Click" />
                        <asp:Button ID="btnClear" CssClass="btn" Text="Clear" runat="server" CausesValidation="false"
                            OnClick="btnClear_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </asp:Panel>
    <br />
   <br />
    <asp:Label ID="lblGridHeader" runat="server"></asp:Label>
    <telerik:RadGrid ID="RadGridEmployees" runat="server" AllowPaging="True" AllowSorting="true" Skin="MetroTouch"
        AutoGenerateColumns="False" GridLines="None" CellSpacing="0" OnItemCommand="RadGridEmployees_ItemCommand"
        OnNeedDataSource="RadGridEmployees_NeedDataSource" >
        <PagerStyle Mode="NextPrevNumericAndAdvanced"/>
        <GroupingSettings CaseSensitive="false" />       
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="EmployeeId,Id,Loginname,EmployerId"
            HierarchyLoadMode="ServerOnDemand" GroupLoadMode="Server"
            AllowSorting="true" PageSize="16"  >             
            <Columns>
                <telerik:GridButtonColumn 
                     CommandName="View" Text="View" UniqueName="ViewColumn" ItemStyle-HorizontalAlign="Center" HeaderText="View" ItemStyle-ForeColor="White" ButtonCssClass="btn" >
                </telerik:GridButtonColumn>
                <telerik:GridBoundColumn DataField="EMPLOYEEID" SortExpression="EMPLOYEEID" UniqueName="EMPLOYEEID" DataType="System.Decimal" HeaderText="Employee ID" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                </telerik:GridBoundColumn>
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
            <NestedViewTemplate >                
                <fieldset>
                    <legend>Employee Details:</legend>
                    <asp:DetailsView ID="DetailsView1" Width="100%" DataKeyNames="EmployeeId" runat="server"
                        AutoGenerateRows="False" DataSourceID="ObjectDataSource1" CellPadding="0" CellSpacing="2"
                        GridLines="None" EmptyDataText="You haven't selected an item">
                        <Fields>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <div class="customer-info-box">
                                        <asp:Label CssClass="info" ID="Name" runat="server" Style="font-size: large; line-height: 1.5em;"><%# Eval("UserName")%></asp:Label><br />
                                        <asp:Label CssClass="info" ID="Label1" runat="server">  #<%# Eval("EmployeeId")%></asp:Label>
                                        <hr/>
                                        <div class="section-body">
                                            <table class="table-container">
                                                <asp:PlaceHolder runat="server" ID="phGender">
                                                    <tr class="row">
                                                        <td class="item-name">
                                                            Gender:
                                                        </td>
                                                        <td class="item-value readonly">
                                                            <%# Eval("Gender")%>&nbsp;
                                                        </td>
                                                    </tr>
                                                </asp:PlaceHolder>
                                                <asp:PlaceHolder runat="server" ID="phBirthDate">
                                                    <tr class="row">
                                                        <td class="item-name">
                                                            Birthdate:
                                                        </td>
                                                        <td class="item-value readonly">
                                                            <%# Eval("BirthDate")%>&nbsp;
                                                        </td>
                                                    </tr>
                                                </asp:PlaceHolder>
                                                <asp:PlaceHolder runat="server" ID="phMarriageDate">
                                                    <tr class="row">
                                                        <td class="item-name">
                                                            Marriage Date:
                                                        </td>
                                                        <td class="item-value readonly">
                                                            <%# Eval("MarriageDate")%>&nbsp;
                                                        </td>
                                                    </tr>
                                                </asp:PlaceHolder>
                                                <asp:PlaceHolder runat="server" ID="phHireDateDate">
                                                    <tr class="row">
                                                        <td class="item-name">
                                                            Hire Date:
                                                        </td>
                                                        <td class="item-value readonly">
                                                            <%# Eval("HireDate")%>&nbsp;
                                                        </td>
                                                    </tr>
                                                </asp:PlaceHolder>
                                            </table>
                                        </div>
                                        <div class="section-title">
                                            Physical Address:
                                        </div>
                                        <div class="section-body">
                                            <table class="table-container">
                                                <tbody>
                                                    <asp:PlaceHolder runat="server" ID="phPhsicalStreetAddress1">
                                                        <tr class="row">
                                                            <td class="item-name">
                                                                Street&nbsp;Address:
                                                            </td>
                                                            <td class="item-value readonly">
                                                                <%# Eval("Address")%>&nbsp;
                                                            </td>
                                                        </tr>
                                                    </asp:PlaceHolder>
                                                    <asp:PlaceHolder runat="server" ID="phPhsicalCity">
                                                        <tr class="row">
                                                            <td class="item-name">
                                                                City:
                                                            </td>
                                                            <td class="item-value readonly">
                                                                <%# Eval("City")%>&nbsp;
                                                            </td>
                                                        </tr>
                                                    </asp:PlaceHolder>
                                                    <asp:PlaceHolder runat="server" ID="phPhsicalState">
                                                        <tr class="row">
                                                            <td class="item-name">
                                                                State:
                                                            </td>
                                                            <td class="item-value readonly">
                                                                <%# Eval("State")%>&nbsp;
                                                            </td>
                                                        </tr>
                                                    </asp:PlaceHolder>
                                                    <asp:PlaceHolder runat="server" ID="phPhsicalPostCode">
                                                        <tr class="row">
                                                            <td class="item-name">
                                                                Zip:
                                                            </td>
                                                            <td class="item-value readonly">
                                                                <%# Eval("Zip")%>'&nbsp;
                                                            </td>
                                                        </tr>
                                                    </asp:PlaceHolder>
                                                </tbody>
                                            </table>
                                        </div>
                                        <br />
                                        <a class="linkbtn" href="../Employer/EmployeeDetails.aspx?eeId=<%# Eval("EmployeeId")%>&erId=<%# Eval("EmployerId")%>">
                                            View Details</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="linkbtn" href="../Employer/AddDependent.aspx?eeId=<%# Eval("EmployeeId")%>&erId=<%# Eval("EmployerId")%>">
                                                Add Dependent</a>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </fieldset>
            </NestedViewTemplate>
            <NestedViewSettings DataSourceID="ObjectDataSource1">
                <ParentTableRelation>
                    <telerik:GridRelationFields DetailKeyField="memberId" MasterKeyField="EmployeeId" />
                </ParentTableRelation>
            </NestedViewSettings>
            <PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
        </MasterTableView>
    </telerik:RadGrid>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetMemberDetails"
        TypeName="Pibt.BLL.Employee">
        <SelectParameters>
            <asp:Parameter Name="memberId" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc3:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel1" runat="server" />
</asp:Content>
<asp:Content ID="Content4" runat="server" contentplaceholderid="PlaceHolderHead">
</asp:Content>
