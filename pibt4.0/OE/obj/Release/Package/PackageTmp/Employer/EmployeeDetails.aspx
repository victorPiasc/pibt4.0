<%@ Page Title="" Language="C#" MasterPageFile="~/Content.Master" AutoEventWireup="true"
    CodeBehind="EmployeeDetails.aspx.cs" Inherits="Pibt.Employer.EmployeeDetails" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenuLevel2"
    TagPrefix="uc2" %>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <u><a href="/">Home</a></u>
    <asp:LoginView ID="LoginViewBreadcrumbs" runat="server">
        <RoleGroups>
            <asp:RoleGroup Roles="Administrator,Agent,RK">
                <ContentTemplate>
                    &nbsp;>&nbsp;<u><a href="BusinessList.aspx">Employer List</a></u>
                    &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx?erId=<%=EmployerId %>">Employer#<%=EmployerId %></a></u>&nbsp;>&nbsp;<u><a href="Employee.aspx?erid=<%=EmployerId %>">Employee List</a></u>
                    &nbsp;>&nbsp;Employee#<%=EmployeeId %>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Employer">
                <ContentTemplate>
                    &nbsp;>&nbsp;<u><a href="BusinessInfo.aspx">Employer</a></u>
                    &nbsp;>&nbsp;<u><a href="Employee.aspx?erid=<%=EmployerId %>">Employee List</a></u>
                    &nbsp;>&nbsp;Employee#<%=EmployeeId %>
                </ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Employee">
                <ContentTemplate>
                    &nbsp;>&nbsp;My Family</ContentTemplate>
            </asp:RoleGroup>
            <asp:RoleGroup Roles="Dependent">
                <ContentTemplate>
                    &nbsp;>&nbsp;My Profile</ContentTemplate>
            </asp:RoleGroup>
        </RoleGroups>
    </asp:LoginView>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function OnClientNodeClicked(sender, args) {
                var node = args.get_node();
                var panel;
                var panel2;
                if (node.get_level() == 1) {
                    panel = $find("<%=RadXmlHttpPanel1.ClientID%>");
                    panel2 = $find("<%=RadXmlHttpPanel2.ClientID%>");
                    panel.set_value(node.get_value());
                    panel2.set_value(node.get_value());
                }
                else {
                    panel = $find("<%=RadXmlHttpPanel1.ClientID%>");
                    panel2 = $find("<%=RadXmlHttpPanel2.ClientID%>");
                    panel.set_value(node.get_value());
                    panel2.set_value(node.get_value());
                    //Expand the node
                    node.expand();
                }
            }

            function OnClientLoad(sender, eventArgs) {
                var treeView1 = $find("<%=RadTreeView1.ClientID%>");
                if (!treeView1.get_selectedNode()) {
                    var node = treeView1.get_nodes().getNode(0);
                    //Expand node
                    if (node != null) {
                        node.toggle();
                    }
                }
            }
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="MetroTouch" MultiPageID="RadMultiPage1"
        ReorderTabsOnSelect="true" Orientation="HorizontalTop" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab ImageUrl="/img/customerInfo.png" Text="Employee">
            </telerik:RadTab>
        </Tabs>
    </telerik:RadTabStrip>
    <telerik:RadMultiPage runat="server" SelectedIndex="0" ID="RadMultiPage1" CssClass="multiPage">
        <telerik:RadPageView runat="server" ID="RadPageView1">
            <div class="customer-info-box">
                <table class="table-container">
                    <tr>
                        <td class="cell-top">
                            <fieldset style="width: 200px; min-height: 300px;">
                                <legend><b>
                                    <asp:Literal ID="Literal1" runat="server"> Employee : </asp:Literal></b></legend>
                                <telerik:RadTreeView ID="RadTreeView1" Skin="Vista" runat="server" Width="200px"
                                    OnClientNodeClicked="OnClientNodeClicked" OnClientLoad="OnClientLoad" OnNodeExpand="RadTreeView1_NodeExpand"
                                    Height="100%">
                                </telerik:RadTreeView>
                            </fieldset>
                        </td>
                        <td class="cell-top">
                            <fieldset>
                                <legend><b>Details : </b></legend>
                                <telerik:RadXmlHttpPanel ID="RadXmlHttpPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1"
                                    Value="0" OnServiceRequest="XmlHttpPanel_ServiceRequest" Height="100%" RenderMode="Block">
                                    <asp:FormView ID="FormView_MemberDetials" Width="735" runat="server" EmptyDataText="No record found."
                                        OnDataBound="FormView_MemberDetials_DataBound">
                                        <ItemTemplate>
                                            <div class="bottom-left-buttons" style="margin-bottom: -15px;">
                                                <asp:HyperLink CssClass="btn" ID="lnkEditMember" NavigateUrl='<%# "../Employer/EditMemberDetails.aspx?eeId="+Eval("employeeId")+"&erId="+Eval("employerId")+"&mId="+ Eval("memberId")+"&typeId="+ Eval("employeeTypeId")%>'
                                                    Font-Size="Medium" runat="server">Edit Member Info</asp:HyperLink>
                                                <asp:HyperLink CssClass="btn" ID="lnkAddDependent" NavigateUrl='<%# "../Employer/AddDependent.aspx?eeId="+Eval("employeeId")+"&erId="+Eval("employerId") %>'
                                                    Font-Size="Medium" runat="server">Add Dependent</asp:HyperLink>
                                                <asp:HyperLink CssClass="btn" ID="lnkOE" NavigateUrl='<%# "../OE/Type.aspx?eeId="+Eval("employeeId")+"&erId="+Eval("employerId") %>'
                                                    Font-Size="Medium" runat="server">Plan Enrollment</asp:HyperLink>
                                                <asp:HyperLink CssClass="btn" ID="lnk_Term" NavigateUrl='<%# "../OE/Type.aspx?eeId="+Eval("employeeId")+"&erId="+Eval("employerId")+"&OeTypeId=6" %>'
                                                    Font-Size="Medium" runat="server">Employee Termination</asp:HyperLink>
                                            </div>
                                            <asp:Label CssClass="info" ID="Name" runat="server" Style="font-size: x-large; line-height: 1.5em;"><%# Eval("name")%></asp:Label><br />
                                            <hr />
                                            <asp:Label CssClass="info" ID="Label1" runat="server"><%# Eval("employeeType")%>  #<%# Eval("memberId")%></asp:Label>
                                            <asp:Label CssClass="info" ID="lblEmployeeTypeId" runat="server" Text='<%# Eval("employeeTypeId")%>'
                                                Visible="False"></asp:Label>
                                            <div class="customer-info-box">
                                                <asp:PlaceHolder runat="server" ID="phEmployeeDetails">
                                                    <div class="section-title">
                                                        Memeber Details :
                                                    </div>
                                                    <div class="clear">
                                                    </div>
                                                    <div class="section-body">
                                                        <table class="table-container">
                                                            <tbody>
                                                                <asp:PlaceHolder runat="server" ID="phGender">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            Gender:
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("Gender")%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                                <asp:PlaceHolder runat="server" ID="phBirthDate">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            Birth Date :
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("birthDate","{0:DD-MMM-yyyy}")%>
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                                <asp:PlaceHolder runat="server" ID="phMarriageDate">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            Marriage Date:
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("marriageDate", "{0:DD-MMM-yyyy}")%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                                <asp:PlaceHolder runat="server" ID="phHireDateDate">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            Hire Date:
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("hireDate", "{0:DD-MMM-yyyy}")%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </asp:PlaceHolder>
                                                <asp:PlaceHolder runat="server" ID="phPhsicalAddress">
                                                    <div class="section-title">
                                                        Physical Address :
                                                    </div>
                                                    <div class="clear">
                                                    </div>
                                                    <div class="section-body">
                                                        <table class="table-container">
                                                            <tbody>
                                                                <asp:PlaceHolder runat="server" ID="phPhsicalStreetAddress1">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            Street Address:
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("address")%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                                <asp:PlaceHolder runat="server" ID="phPhsicalCity">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            City:
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("city")%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                                <asp:PlaceHolder runat="server" ID="phPhsicalState">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            State:
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("state")%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                                <asp:PlaceHolder runat="server" ID="phPhsicalPostCode">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            Postal Code:
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("zip")%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="clear">
                                                    </div>
                                                </asp:PlaceHolder>
                                                <asp:PlaceHolder runat="server" ID="phContactDetails">
                                                    <div class="section-title">
                                                        Contact Details:
                                                    </div>
                                                    <div class="clear">
                                                    </div>
                                                    <div class="section-body">
                                                        <table class="table-container">
                                                            <tbody>
                                                                <asp:PlaceHolder runat="server" ID="phCellPhone">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            Cell:
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("mobilePhoneNbr") == DBNull.Value ? "&nbsp;" : (String.Format("{0:(###) ###-####}", Convert.ToInt64(Eval("mobilePhoneNbr").ToString())))%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                                <asp:PlaceHolder runat="server" ID="phHomePhone">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            Home:
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("homePhoneNbr") == DBNull.Value ? "&nbsp;" : (String.Format("{0:(###) ###-####}", Convert.ToInt64(Eval("homePhoneNbr").ToString())))%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                                <asp:PlaceHolder runat="server" ID="phWorkPhone">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            Work:
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("workPhoneNbr") == DBNull.Value ? "&nbsp;" : (String.Format("{0:(###) ###-####}", Convert.ToInt64(Eval("workPhoneNbr").ToString())))%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                                <asp:PlaceHolder runat="server" ID="phPhsicalEmail">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            Contact Email:
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("emailAddress")%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                                <asp:PlaceHolder runat="server" ID="phDepartment">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            Office Department:
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("deptname")%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div class="clear">
                                                    </div>
                                                </asp:PlaceHolder>
                                                <asp:PlaceHolder runat="server" ID="phOptions">
                                                    <div class="section-title">
                                                        Other Options:
                                                    </div>
                                                    <div class="clear">
                                                    </div>
                                                    <div class="section-body">
                                                        <table class="table-container">
                                                            <tbody>
                                                                <tr class="row">
                                                                    <td class="item-name" colspan="2">
                                                                        <asp:CheckBox ID="ckHandicapped" Checked='<%#Eval("Handicapped").ToString()=="Y"?true:false %>'
                                                                            Enabled="false" runat="server" Text="Disabled" />
                                                                    </td>
                                                                </tr>
                                                                <asp:PlaceHolder ID="trAdoptionDate" runat="server">
                                                                    <tr class="row">
                                                                        <td class="item-name">
                                                                            Adoption Date :
                                                                        </td>
                                                                        <td class="item-value">
                                                                            <%# Eval("adoptionDate", "{0:DD-MMM-yyyy}")%>&nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </asp:PlaceHolder>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </asp:PlaceHolder>
                                            </div>
                                        </ItemTemplate>
                                    </asp:FormView>
                                </telerik:RadXmlHttpPanel>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </div>
            <telerik:RadXmlHttpPanel ID="RadXmlHttpPanel2" runat="server" LoadingPanelID="RadAjaxLoadingPanel1"
                Value="0" OnServiceRequest="XmlHttpPanel_ServiceRequest2" RenderMode="Block">
                <fieldset>
                    <legend><b>Coverage Details </b>:</legend>
                    <br />
                    <telerik:RadListView ID="RadListViewPlanDetails" runat="server" ItemPlaceholderID="ListViewContainer">
                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="ListViewContainer" />
                        </LayoutTemplate>
                        <ItemTemplate>
                            <fieldset>
                                <legend><b>
                                    <%#Eval("description")%></b>:</legend>
                                <div class="details">
                                    <div class="photo-container">
                                        <asp:Image runat="server" ID="Image1" ImageUrl='<%# "~/Img/" + Eval("plantypeid") + ".jpg" %>'
                                            AutoAdjustImageControlSize="false" Width="90px" Height="110px" ToolTip='<%#Eval("description", "Photo of {0}") %>'
                                            AlternateText='<%#Eval("description", "Photo of {0}") %>' />
                                    </div>
                                    <div class="data-container">
                                        <table class="table-container">
                                            <tr class="row">
                                                <td class="item-name">
                                                    Carrier Name :
                                                </td>
                                                <td class="item-value">
                                                    <%#Eval("name")%>&nbsp;
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">
                                                    Plan Type :
                                                </td>
                                                <td class="item-value">
                                                    <%#Eval("description")%>&nbsp;
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">
                                                    Plan Name :
                                                </td>
                                                <td class="item-value">
                                                    <%#Eval("planname")%>&nbsp;
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">
                                                    Last Changed :
                                                </td>
                                                <td class="item-value">
                                                    <%#Eval("lastchanged")%>&nbsp;
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">
                                                    Effective Date :
                                                </td>
                                                <td class="item-value">
                                                    <%#Eval("effectivedate")%>&nbsp;
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">
                                                    Temination Date :
                                                </td>
                                                <td class="item-value red">
                                                    <%#Eval("expirydate")%>&nbsp;
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">
                                                    Temination Reason :
                                                </td>
                                                <td class="item-value red">
                                                    <%#Eval("reason")%>&nbsp;
                                                </td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">
                                                    Plan Description :
                                                </td>
                                                <td class="item-value">
                                                   N/A
                                                </td>
                                            </tr>
                                           <tr class="row">
                                                <td class="item-name">
                                                   
                                                </td>
                                                <td class="item-value">
                                                      <asp:HyperLink ID="hl_Term" runat="server" CssClass="btn"
                                                         NavigateUrl='<%# "~/OE/Type.aspx?eeId="+Request.QueryString["eeId"]+"&erId="+Request.QueryString["erId"]+"&planId=" + Eval("planID") + "&OeTypeId=3"%>' 
                                                         Visible='<%# (Eval("expirydate").ToString()=="") %>' ForeColor="white" Font-Underline="false">Plan Termination</asp:HyperLink>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </fieldset>
                            <br />
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <asp:Label ID="lbNoCoverage" runat="server" Text='No coverages to show' CssClass="red" />
                        </EmptyDataTemplate>
                    </telerik:RadListView>
                </fieldset>
            </telerik:RadXmlHttpPanel>
        </telerik:RadPageView>
    </telerik:RadMultiPage>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc2:CtlLeftMenuLevel2 ID="CtlLeftMenuLevel21" runat="server" />
</asp:Content>
