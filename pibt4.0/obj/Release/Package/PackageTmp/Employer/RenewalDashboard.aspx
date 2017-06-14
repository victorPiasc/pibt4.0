<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenewalDashboard.aspx.cs" Inherits="Pibt.Employer.RenewalDashboard" MasterPageFile="~/Content.master" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="cPlaceHolderPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">Dashboard</asp:Content>
<asp:Content ID="cFrameHeaderPlaceHolder" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <span style="color:#adf4ff;">Introduction > Comparative Costs > Contribution Section</span> > Dashboard
</asp:Content>
<asp:Content ID="cLeftMenu" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="leftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="cMainContentPlaceHolder" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <style>
        .simpleText {
            font-size: 14px;
        }
    </style>
    <div class="customer-info-box">
        <div class="section-body">
            <div class="row" style="padding-bottom: 10px;display:none;">
                <div class="col-lg-12">
                    <div style="border-bottom: 1px solid #CFCFCE;">
                        <table class="table-container" style="width:40%">
                            <tr class="row">
                                <td class="sectionHeader">Census Statistics</td>
                                <td class="item-name">Employees:&nbsp;<asp:Label ID="count" runat="server"></asp:Label></td>
                                <td class="item-name">Dependents: &nbsp;<asp:Label ID="depCount" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row ">
                <div class="col-lg-3">
                    <div style="height: 180px; border-right: 1px solid #CFCFCE;">
                        <div class="sectionHeader">A.&nbsp;Contribution Approach</div>
                        <asp:RadioButtonList ID="c_Approach" runat="server" OnSelectedIndexChanged="c_Approach_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="0"><span class="simpleText" >Percentage - Overall </span></asp:ListItem>
                            <asp:ListItem Value="1"><span class="simpleText" >Percentage - Per Benefit Type </span></asp:ListItem>
                            <asp:ListItem Value="2"><span class="simpleText" >Dollar Amount </span></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div style="height: 180px; border-right: 1px solid #CFCFCE;">
                        <div class="sectionHeader">B.&nbsp;Adjust Contribution</div>
                        <asp:Panel ID="overallContribution" runat="server" Visible="false" DefaultButton="update">
                            <table class="table-container" style="width: 75%; text-align: center;">
                                <thead>
                                    <tr class="row">
                                        <td>&nbsp;</td>
                                        <td class="item-name">Overall Contribution
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="row">
                                        <td class="item-name">Employee:</td>
                                        <td class="item-name">
                                            <asp:TextBox ID="overAllContEE" runat="server" CssClass="form-control" Style="display: inline" MaxLength="3" Width="100px"></asp:TextBox>&nbsp;
                                            <span class="simpleText">%</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">Dependent:</td>
                                        <td class="item-name">
                                            <asp:TextBox ID="overAllContDep" runat="server" CssClass="form-control" Style="display: inline" MaxLength="3" Width="100px"></asp:TextBox>&nbsp;
                                             <span class="simpleText">%</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="overallDollar" runat="server" Visible="false" DefaultButton="update">
                            <table class="table-container" style="width: 75%; text-align: center;">
                                <thead>
                                    <tr class="row">
                                        <td>&nbsp;</td>
                                        <td class="item-name">Amount Per Month
                                        </td>
                                        <td>&nbsp</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="row">
                                        <td class="item-name">Employee:</td>
                                        <td class="item-name">
                                            <span class="simpleText">$</span>
                                            <asp:TextBox ID="dollarCont" runat="server" CssClass="form-control" Style="display: inline" MaxLength="9" Width="100px">
                                            </asp:TextBox>
                                        </td>
                                        <td class="item-name">MIN. REQ. $<asp:Label ID="minRequired" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">Dependent:</td>
                                        <td class="item-name">
                                            <span class="simpleText">$</span>
                                            <asp:TextBox ID="dollarDepCont" runat="server" CssClass="form-control" Style="display: inline" MaxLength="9" Width="100px"></asp:TextBox>&nbsp;
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="perPlanType" runat="server" Visible="true" DefaultButton="update">
                            <table class="table-container" style="width: 100%">
                                <thead>
                                    <tr class="row">
                                        <td>&nbsp;</td>
                                        <td class="item-name">Medical</td>
                                        <td class="item-name">Dental</td>
                                        <td class="item-name">Vision</td>
                                        <td class="item-name">Chiro</td>
                                        <td class="item-name">Mental Health</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="row">
                                        <td class="item-name">Employee:</td>
                                        <td class="item-name">
                                            <asp:TextBox ID="top_1" runat="server" CssClass="form-control" MaxLength="3" Width="60px"></asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="top_2" runat="server" CssClass="form-control" MaxLength="3" Width="60px"></asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="top_3" runat="server" CssClass="form-control" MaxLength="3" Width="60px"></asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="top_4" runat="server" CssClass="form-control" MaxLength="3" Width="60px"></asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="top_5" runat="server" CssClass="form-control" MaxLength="3" Width="60px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">Dependent:</td>
                                        <td class="item-name">
                                            <asp:TextBox ID="bot_1" runat="server" CssClass="form-control" MaxLength="3" Width="60px"></asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="bot_2" runat="server" CssClass="form-control" MaxLength="3" Width="60px"></asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="bot_3" runat="server" CssClass="form-control" MaxLength="3" Width="60px"></asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="bot_4" runat="server" CssClass="form-control" MaxLength="3" Width="60px"></asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="bot_5" runat="server" CssClass="form-control" style="display:none;" MaxLength="3" Width="60px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </asp:Panel>
                        <div style="width: 100%; text-align: center;">
                                <asp:Button ID="update" runat="server" CssClass="btn" Text="Update" OnClick="update_Click" CausesValidation="true" ValidationGroup="update"/>
                        </div>
                        <div style="display: block; height: 20px;">
                            <asp:CustomValidator ID="customValidator" runat="server" CssClass="required-info" ErrorMessage="*Error: Employee contribution must be 50% or greater." ClientValidationFunction="validateInput" ValidationGroup="update" EnableClientScript="true"></asp:CustomValidator>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div style="height: 180px;">
                        <div class="sectionHeader">C.&nbsp;Change Sharing Basis</div>
                        <asp:RadioButtonList ID="cs_Basis" runat="server" OnSelectedIndexChanged="cs_Basis_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="2"><span class="simpleText" >Lowest Cost Plan</span></asp:ListItem>
                            <asp:ListItem Value="1"><span class="simpleText" >Base Plan</span></asp:ListItem>
                            <asp:ListItem Value="3"><span class="simpleText" >Any Plan</span></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12" style="padding-top: 10px;">
                    <div style="border-top: 1px solid #CFCFCE;">
                        <div style="width:75%; padding-left:30px">
                            <asp:Literal ID="message" runat="server"></asp:Literal><br />
                        </div>
                        <div class="sectionHeader" style="padding-bottom:10px;">
                            D.&nbsp;Select Benefit Type 
                            <asp:HyperLink id="paForm" runat="server" style="font-size:25px;padding-left:25px;" NavigateUrl="/Download/ExportGenericReport.aspx?num=3" >
                                <span aria-hidden="true" class="glyphicon glyphicon-print"></span>
                            </asp:HyperLink>
                        </div>
                        <nav>
                            <ul id="typeList" runat="server">
                                <li id="l1" runat="server" style="margin-bottom: 0px" class="tablinks selected">
                                    <asp:LinkButton ID="medical" CssClass="tab" runat="server" Text="Medical" CommandName="1" OnCommand="type_Command"></asp:LinkButton></li>
                                <li id="l2" runat="server" style="margin-bottom: 0px" class="tablinks">
                                    <asp:LinkButton ID="dental" CssClass="tab" runat="server" Text="Dental" CommandName="2" OnCommand="type_Command"></asp:LinkButton></li>
                                <li id="l3" runat="server" style="margin-bottom: 0px" class="tablinks">
                                    <asp:LinkButton ID="vision" CssClass="tab" runat="server" Text="Vision" CommandName="3" OnCommand="type_Command"></asp:LinkButton></li>
                                <li id="l4" runat="server" style="margin-bottom: 0px" class="tablinks">
                                    <asp:LinkButton ID="chiro" CssClass="tab" runat="server" Text="Chiropractic" CommandName="4" OnCommand="type_Command"></asp:LinkButton></li>
                                <li id="l6" runat="server" style="margin-bottom: 0px" class="tablinks">
                                    <asp:LinkButton ID="vtl" CssClass="tab" runat="server" Text="Voluntary Term Life" CommandName="6" OnCommand="type_Command" ></asp:LinkButton></li>
                                <li id="l7" runat="server" style="margin-bottom: 0px" class="tablinks">
                                    <asp:LinkButton ID="mtl" CssClass="tab" runat="server" Text="Medical Term Life" CommandName="7" OnCommand="type_Command"></asp:LinkButton></li>
                                <li id="l8" runat="server" style="margin-bottom: 0px" class="tablinks">
                                    <asp:LinkButton ID="mental_health" CssClass="tab" runat="server" Text="Mental Health" CommandName="8" OnCommand="type_Command"></asp:LinkButton></li>
                            </ul>
                        </nav>
                        <div class="content">
                            <telerik:RadGrid ID="selectPlans" runat="server" AllowMultiRowSelection="true" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" OnNeedDataSource="selectPlans_NeedDataSource" Width="100%" OnItemCommand="selectPlans_ItemCommand" OnItemDataBound="selectPlans_ItemDataBound">
                                <MasterTableView DataKeyNames="planId">
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                        <%--Not displayed but needed start--%>
                                        <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                        <%--end--%>
                                        <telerik:GridClientSelectColumn HeaderStyle-Width="25px"></telerik:GridClientSelectColumn>
                                        <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" SortExpression="planName"></telerik:GridBoundColumn>
                                        <telerik:GridTemplateColumn DataField="status"  UniqueName="stat" HeaderText="Status" SortExpression="status">
                                            <ItemTemplate>
                                                <%# Eval("status") %>&nbsp;
                                                <asp:LinkButton ID="ttip" runat="server" Enabled="false" ToolTip="Plan is either active or the insurance carrier has terminated the current plan and replaced it with the plan shown and has automatically transferred all participants to the replacement plan. It is recommended that you review the replacement plan's benefits which may be different from the current plan's benefits." Visible='<%# "Active/Transfer".Equals(Eval("status")) %>'>
                                                    <span aria-hidden="true" class="glyphicon glyphicon-info-sign"></span>
                                                </asp:LinkButton> 
                                            </ItemTemplate>
                                        </telerik:GridTemplateColumn>
                                        <telerik:GridCalculatedColumn HeaderText="Employer<br/>Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="erPays" SortExpression="subsidy"></telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn HeaderText="Employee<br/>Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="eePays" SortExpression="rates"></telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn HeaderText="Gross<br/>Premium" DataFields="rates, depRates" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="gross" SortExpression="rates"></telerik:GridCalculatedColumn>
                                        <telerik:GridButtonColumn ButtonCssClass="btn" ButtonType="PushButton" CommandName="base" Text="Set as base plan" UniqueName="btn" ItemStyle-ForeColor="White" HeaderText="Base&nbsp;Plan"></telerik:GridButtonColumn>
                                        <telerik:GridButtonColumn ButtonCssClass="btn" CommandName="delete" UniqueName="Delete" Text="Remove" HeaderStyle-Width="110px" ItemStyle-ForeColor="White" ConfirmDialogType="RadWindow" ConfirmText="Are you sure that you want to delete this plan? Any employees currently active on this plan will be required to enroll in a different plan that you offer."></telerik:GridButtonColumn>
                                        <telerik:GridBoundColumn DataField="subPlanTypeId" UniqueName="subPlanTypeId" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="carrierId" UniqueName="carrierId" Display="false"></telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings>
                                    <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                </ClientSettings>
                            </telerik:RadGrid>
                            <telerik:RadGrid ID="eePlans" runat="server" Skin="MetroTouch" ShowStatusBar="false"  AllowSorting="true" EnableLinqExpressions="false" Visible="false" OnNeedDataSource="eePlans_NeedDataSource" Width="1043px"  OnColumnCreated="eePlans_ColumnCreated" OnPreRender="eePlans_PreRender">
                                <MasterTableView DataKeyNames="Employee Name">
                                </MasterTableView>
                                <ClientSettings EnableAlternatingItems="false" >
                                    <Scrolling AllowScroll="true" UseStaticHeaders="true" SaveScrollPosition="true" FrozenColumnsCount="1" />
                                </ClientSettings>
                                <HeaderStyle Width="200px" Height="75px" BackColor="#F5F5F5" ForeColor="Black"/>
                            </telerik:RadGrid>
                            <asp:Label runat="server" ID="mtlMessage" style="padding-left:10px;" Font-Bold="true" Font-Size="14px" ForeColor="white" Text="(If greater coverage is preferred, please contact us.)"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div style="border-bottom: 1px solid #CFCFCE; padding-bottom:10px">
                        <asp:Button ID="erLevel" runat="server" CssClass="btn" Text="Return to Employer Level" OnClick="eeLevel_Click" CausesValidation="false" Visible="false" />
                        <asp:Button ID="addPlan" runat="server" CssClass="btn" Text="Add More Plans" OnClick="addPlan_Click" CausesValidation="false" />
                        <asp:Button ID="compare" runat="server" CssClass="btn" Text="Compare Selected Plans" OnClick="compare_Click" CausesValidation="false" />
                        <telerik:RadWindow ID="radWindow" runat="server" Width="1000px" Height="525px" Modal="true" OffsetElementID="main" Behaviors="Close" Top="255px" Title="Select Plan to Add" IconUrl="/" Skin="MetroTouch">
                            <ContentTemplate>
                                <asp:Literal ID="windowMessage" runat="server"></asp:Literal>
                                <telerik:RadGrid ID="planSelection" runat="server" AllowMultiRowSelection="true" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="false" EnableLinqExpressions="false" AllowPaging="false">
                                    <MasterTableView DataKeyNames="planId">
                                        <GroupByExpressions>
                                            <telerik:GridGroupByExpression>
                                                <SelectFields>
                                                    <telerik:GridGroupByField FieldName="status" HeaderText="Status" />
                                                </SelectFields>
                                                <GroupByFields>
                                                    <telerik:GridGroupByField FieldName="status"  />
                                                </GroupByFields>
                                            </telerik:GridGroupByExpression>
                                        </GroupByExpressions>
                                        <Columns>
                                            <%--Not displayed but needed  start--%>
                                            <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="planTypeId" Display="false" UniqueName="planTypeId"></telerik:GridBoundColumn>
                                            <%--end--%>
                                            <telerik:GridClientSelectColumn HeaderStyle-Width="25px"></telerik:GridClientSelectColumn>
                                            <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" SortExpression="planName" HeaderStyle-Width="250px"></telerik:GridBoundColumn>
                                            <telerik:GridCalculatedColumn DataFields="subsidy, subsidyDep" UniqueName="erPays" DataType="System.Decimal" Expression="{0}+{1}" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" HeaderText="Employer&nbsp;Monthly&nbsp;Cost" SortExpression="subsidy" HeaderStyle-Width="175px" >
                                            </telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn DataFields="rates,deprates,subsidy,subsidyDep" UniqueName="eePays" DataType="System.Decimal" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" HeaderText="Employee&nbsp;Monthly&nbsp;Cost" SortExpression="rates" HeaderStyle-Width="175px">
                                            </telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn HeaderText="Gross&nbsp;Premium" DataFields="rates, depRates" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="gross" SortExpression="rates" HeaderStyle-Width="100px" ></telerik:GridCalculatedColumn>
                                            <telerik:GridBoundColumn DataField="subPlanTypeId" UniqueName="subPlanTypeId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="carrierId" UniqueName="carrierId" Display="false"></telerik:GridBoundColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                        <Scrolling UseStaticHeaders="true" AllowScroll="true" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                                <asp:Label runat="server" ID="mtlMessage2" style="padding-left:10px;" Font-Bold="true" Font-Size="14px"  Text="(If greater coverage is preferred, please contact us.)"></asp:Label>
                                <br /><br />
                                <asp:Button ID="add" runat="server" CssClass="btn" Text="Add Plans" OnClick="add_Click" />
                            </ContentTemplate>
                        </telerik:RadWindow>
                    </div>
                </div>
            </div>
            <asp:Panel ID="buttons" runat="server" CssClass="dontprint">
                <div class="row">
                    <div class="col-md-2" style="text-align: center">
                        <asp:Button ID="Back" runat="server" CssClass="btn" Text="Back" OnClick="Back_Click" CausesValidation="false" />
                    </div>
                    <div class="col-md-8" style="text-align: center">
                        <asp:Button ID="startOver" runat="server" CssClass="btn" Text="Start Over" OnClick="startOver_Click" CausesValidation="false" />&nbsp;
                        <asp:Button ID="eeLevel" runat="server" CssClass="btn" Text="Show Employee Level Detail" OnClick="eeLevel_Click" CausesValidation="false" />&nbsp;
                        <asp:Button ID="Save" runat="server" CssClass="btn" Text="Save For Later" OnClick="Save_Click" CausesValidation="false" />
                    </div>
                    <div class="col-md-2" style="text-align: center">
                        <asp:Button ID="Continue" runat="server" CssClass="btn" Text="Continue" OnClick="Continue_Click" ValidationGroup="update" />
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <script type="text/javascript" src="../js/validation.js"></script>
    <script type="text/javascript">
        function validateInput(source, args) {
            var error = document.getElementById('<%= customValidator.ClientID%>');
            var radioButtons = document.getElementById('<%= c_Approach.ClientID%>');
            var inputs = radioButtons.getElementsByTagName("input");
            var a; 
            var top = ['<%= top_1.ClientID%>',
                '<%= top_2.ClientID%>',
                '<%= top_3.ClientID%>',
                '<%= top_4.ClientID%>',
                '<%= top_5.ClientID%>'];
            if (inputs[0].checked) {
                a = document.getElementById('<%= overAllContEE.ClientID%>');
                b = document.getElementById('<%= overAllContDep.ClientID%>');
                var aVal = validatePercentEE(a.value);
                var bVal = validatePercentDep(b.value);
                args.IsValid = aVal && bVal;
            }

            if (inputs[1].checked) {
                var panel = document.getElementById('<%= perPlanType.ClientID%>');
                for (var i = 0; i < 5; i++) {
                    a = document.getElementById(top[i]);
                    args.IsValid = validatePercentEE(a.value);
                    if (!args.IsValid)
                        break;
                }
            }

            if (inputs[2].checked) {
                a = document.getElementById('<%= dollarCont.ClientID%>');
                b = document.getElementById('<%= dollarDepCont.ClientID%>');
                c = document.getElementById('<%= minRequired.ClientID%>');
                var aValid = validateDollar(a.value) && a.value >= c.innerText;
                var bValid = b.value != "" ? validateDollarDep(b.value) : true;
                args.IsValid = aValid && bValid;
                if (!args.IsValid)
                    error.innerHTML = "*Error: Employee dollar contribution must be at least the minimum required.";
            }
        }
    </script>
</asp:Content>
