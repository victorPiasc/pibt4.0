<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenewalPlanSelection.aspx.cs" Inherits="Pibt.Employer.RenewalPlanSelection" MasterPageFile="~/Content.master" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="cPlaceHolderPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">Contribution Section</asp:Content>
<asp:Content ID="cFrameHeaderPlaceHolder" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    Select Plans
</asp:Content>
<asp:Content ID="cLeftMenu" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="leftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="cMainContentPlaceHolder" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="customer-info-box">
        <div class="section-body">
            <fieldset>
                <legend>Adjust Contribution</legend>
                <div class="row">
                    <div class="col-md-12" style="text-align:right">
                        <span class="simpleText bold">Employee Count: <asp:Literal ID="count" runat="server"></asp:Literal></span><br />
                        <span class="simpleText bold">Dependent Count: <asp:Literal ID="depCount" runat="server"></asp:Literal> </span>
                    </div>
                </div>
                <asp:Panel ID="overallContribution" runat="server">
                    <div class="row">
                        <div class="col-md-4" style="text-align: center;">
                            <span class="simpleText">Employees: </span>
                            <asp:TextBox ID="overAllContEE" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px"></asp:TextBox>&nbsp;
                            <span class="simpleText">%</span>
                        </div>
                        <div class="col-md-4" style="text-align: left;">
                            <span class="simpleText">Dependents:</span>
                            <asp:TextBox ID="overAllContDep" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px"></asp:TextBox>&nbsp;
                            <span class="simpleText">%</span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <asp:CustomValidator ID="csOverAllPercent" runat="server" CssClass="required-info" ErrorMessage="*50-100%" ControlToValidate="overAllContEE" ClientValidationFunction="validatEE" ></asp:CustomValidator>
                        </div>
                        <div class="col-md-4">
                            <asp:CustomValidator ID="CustomValidator12" runat="server" CssClass="required-info" ErrorMessage="*0-100%" ControlToValidate="overAllContDep" ClientValidationFunction="validateDep" ></asp:CustomValidator>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="overallDollar" runat="server">
                    <div class="row">
                        <div class="col-md-4" style="text-align: center;">
                            <span class="simpleText">Employees: </span>
                            <span class="simpleText">$</span>
                            &nbsp;
                            <asp:TextBox ID="dollarCont" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px"></asp:TextBox>
                        </div>
                        <div class="col-md-4" style="text-align: left;">
                            <span class="simpleText">Dependents:</span>
                            <span class="simpleText">$</span>
                            &nbsp;
                            <asp:TextBox ID="dollarDepCont" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <asp:CustomValidator ID="CustomValidator10" runat="server" CssClass="required-info" ErrorMessage="*number value greater than 0" ControlToValidate="dollarCont" ClientValidationFunction="valDollar" ></asp:CustomValidator>
                        </div>
                        <div class="col-md-4">
                            <asp:CustomValidator ID="CustomValidator11" runat="server" CssClass="required-info" ErrorMessage="*number value greater than 0" ControlToValidate="dollarDepCont" ClientValidationFunction="valDollar" ></asp:CustomValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <span class="simpleText" style="font-size:12px">On the next page we will look at your plan selection and choose the least expensive plan to base your premium.</span>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="perPlanType" runat="server">
                    <div class="row">
                        <div class="col-md-10">
                            <table class="table-container" style="width: 100%">
                                <tbody>
                                    <tr class="row">
                                        <td>&nbsp;</td>
                                        <td class="item-name"><span class="simpleText bold">Medical</span></td>
                                        <td class="item-name"><span class="simpleText bold und">Dental</span></td>
                                        <td class="item-name"><span class="simpleText bold und">Vision</span></td>
                                        <td class="item-name"><span class="simpleText bold und">Chiro</span></td>
                                        <td class="item-name"><span class="simpleText bold und">Mental Health</span></td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name"><span class="simpleText bold">Employee:</span></td>
                                        <td class="item-name">
                                            <asp:TextBox ID="top_1" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px">
                                            </asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="top_2" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px">
                                            </asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="top_3" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px">
                                            </asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="top_4" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px">
                                            </asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="top_5" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px">
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator1" runat="server" CssClass="required-info" ErrorMessage="* Employee Medical:50-100%" ControlToValidate="top_1" ClientValidationFunction="validateEE" Display="Dynamic" ></asp:CustomValidator>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator2" runat="server" CssClass="required-info" ErrorMessage="*Employee Dental :50-100%" ControlToValidate="top_2" ClientValidationFunction="validateEE" Display="Dynamic" ></asp:CustomValidator>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator3" runat="server" CssClass="required-info" ErrorMessage="*Employee Vison: 50-100%" ControlToValidate="top_3" ClientValidationFunction="validateEE" Display="Dynamic" ></asp:CustomValidator>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator4" runat="server" CssClass="required-info" ErrorMessage="*Employee Chiropractic: 50-100%" ControlToValidate="top_4" ClientValidationFunction="validateEE" Display="Dynamic" ></asp:CustomValidator>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator5" runat="server" CssClass="required-info" ErrorMessage="*Employee Mental Health: 50-100%" ControlToValidate="top_5" ClientValidationFunction="validateEE" ></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name"><span class="simpleText bold">Dependent:</span></td>
                                        <td class="item-name">
                                            <asp:TextBox ID="bot_1" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px">
                                            </asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="bot_2" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px">
                                            </asp:TextBox>
 
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="bot_3" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px">
                                            </asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="bot_4" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px">
                                            </asp:TextBox>
                                        </td>
                                        <td class="item-name">
                                            <asp:TextBox ID="bot_5" runat="server" CssClass="form-control" Style="display:none" Font-Size="16px" Height="20px" Width="60px">
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td>&nbsp;</td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator6" runat="server" CssClass="required-info" ErrorMessage="*Dep Medical: 0-100%" ControlToValidate="bot_1" ClientValidationFunction="validateDep" Display="Dynamic" ></asp:CustomValidator>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator7" runat="server" CssClass="required-info" ErrorMessage="* Dep Dental: 0-100%" ControlToValidate="bot_2" ClientValidationFunction="validateDep" Display="Dynamic" ></asp:CustomValidator>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator8" runat="server" CssClass="required-info" ErrorMessage="*Dep Vision: 0-100%" ControlToValidate="bot_3" ClientValidationFunction="validateDep" Display="Dynamic" ></asp:CustomValidator>
                                        </td>
                                        <td>
                                            <asp:CustomValidator ID="CustomValidator9" runat="server" CssClass="required-info" ErrorMessage="*Dep Chiropractic: 0-100%" ControlToValidate="bot_4" ClientValidationFunction="validateDep" Display="Dynamic" ></asp:CustomValidator>
                                        </td>
                                        <td>&nbsp</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </asp:Panel>
                <br />
                <asp:Panel ID="controls" runat="server">
                    <div class="row">
                        <div class="col-md-2" style="width:12%">
                            <asp:Button ID="update" runat="server" CssClass="btn" Text="Update" OnClick="update_Click" />
                        </div>
                        <div class="col-md-3">
                            <asp:Button ID="changeHowShared" runat="server" CssClass="btn" Text="Change Your Sharing Basis" OnClientClick="togglePopUpModal(1); return false;" />
                            <telerik:RadWindow ID="rwchangeHowShared" runat="server" Width="700px" Height="365px" Modal="true" OffsetElementID="main" Behaviors="Close" KeepInScreenBounds="true" Title="Change Your Sharing Basis" IconUrl="/" Skin="MetroTouch" MinWidth="630px">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <span class="simpleText" style="font-weight: bold">Do you want to share cost on an overall (e.g., all benefit types) OR on a benefit-type basis?</span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-10" style="padding-left: 30px">
                                            <asp:RadioButtonList ID="rdlPerType" runat="server" OnSelectedIndexChanged="rdlPerType_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="1"><span class="simpleText" >Apply to total cost of all benefit types</span></asp:ListItem>
                                                <asp:ListItem Value="2"><span class="simpleText" >Apply to each benefit type and indicate percent/amount of cost shared</span></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </telerik:RadWindow>
                        </div>
                        <div class="col-md-3">
                            <asp:Button ID="changeContType" runat="server" CssClass="btn" Text="Change Amount Shared" OnClientClick="togglePopUpModal(2);return false;" />
                            <telerik:RadWindow ID="RadWindow2" runat="server" Width="800px" Height="365px" Modal="true" OffsetElementID="main" Behaviors="Close, Resize, Move" KeepInScreenBounds="true" Title="Change Amount Shared" IconUrl="/" Skin="MetroTouch">
                                <ContentTemplate>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <span class="simpleText" style="font-weight: bold">How are you going to share cost with your employees and dependents?</span>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-10" style="padding-left: 30px">
                                            <asp:RadioButtonList ID="RadioButtonList2" runat="server" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="1"><span class="simpleText" >Percentage (e.g., company pays 50% of premium)</span></asp:ListItem>
                                                <asp:ListItem Value="2"><span class="simpleText" >Dollar Amount (e.g., company pays $300 per month and employee pays the rest)</span></asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </telerik:RadWindow>
                        </div>
                    </div>
                </asp:Panel>
            </fieldset>
            <fieldset>
                <legend>Select Benefit Type:</legend>
                <div class="row">
                    <div class="col-md-8">
                        <asp:Literal id="message" runat="server"></asp:Literal>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-12">
                        <nav>
                            <ul id="typeList" runat="server">
                                <li id="l1" runat="server" style="margin-bottom:0px" class="tablinks selected"><asp:LinkButton ID="medical" CssClass="tab" runat="server" Text="Medical" CommandName="1" OnCommand="type_Command"></asp:LinkButton></li>
                                <li id="l2" runat="server" style="margin-bottom:0px" class="tablinks" ><asp:LinkButton ID="dental" CssClass="tab" runat="server" Text="Dental" CommandName="2" OnCommand="type_Command"></asp:LinkButton></li>
                                <li id="l3" runat="server" style="margin-bottom:0px" class="tablinks"><asp:LinkButton ID="vision" CssClass="tab" runat="server" Text="Vision" CommandName="3" OnCommand="type_Command"></asp:LinkButton></li>
                                <li id="l4" runat="server" style="margin-bottom:0px" class="tablinks"><asp:LinkButton ID="chiro" CssClass="tab" runat="server" Text="Chiropractic" CommandName="4" OnCommand="type_Command"></asp:LinkButton></li>
                                <li id="l6" runat="server" style="margin-bottom:0px"  class="tablinks"><asp:LinkButton ID="vtl" CssClass="tab" runat="server" Text="Voluntary Term Life" CommandName="6" OnCommand="type_Command"></asp:LinkButton></li>
                                <li id="l7" runat="server" style="margin-bottom:0px"  class="tablinks"><asp:LinkButton ID="mtl" CssClass="tab" runat="server" Text="Medical Term Life" CommandName="7" OnCommand="type_Command"></asp:LinkButton></li>
                                <li id="l8" runat="server" style="margin-bottom:0px" class="tablinks"><asp:LinkButton ID="mental_health" CssClass="tab" runat="server" Text="Mental Health" CommandName="8" OnCommand="type_Command"></asp:LinkButton></li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="content">
                            <telerik:RadGrid ID="selectPlans" runat="server" AllowMultiRowSelection="true" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" OnNeedDataSource="selectPlans_NeedDataSource" Width="100%" OnItemCommand="selectPlans_ItemCommand">
                                <MasterTableView DataKeyNames="planId">
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                        <telerik:GridClientSelectColumn HeaderStyle-Width="25px"></telerik:GridClientSelectColumn>
                                        <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" SortExpression="planName"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn HeaderText="Gross&nbsp;Premium" DataFields="rates, depRates" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="gross" SortExpression="rates"></telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn HeaderText="Employer&nbsp;Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="erPays" SortExpression="subsidy"></telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn HeaderText="Employee&nbsp;Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="eePays" SortExpression="rates"></telerik:GridCalculatedColumn>
                                        <telerik:GridButtonColumn ButtonCssClass="btn" CommandName="Delete" UniqueName="Delete" Text="Delete" ItemStyle-ForeColor="White" ConfirmDialogType="RadWindow" ConfirmText="Are you sure you want to delete this plan? Any employees active on this plan will be terminated." ></telerik:GridButtonColumn>
                                    </Columns>
                                </MasterTableView>
                                <ClientSettings>
                                            <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                </ClientSettings>
                            </telerik:RadGrid>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <asp:Button ID="addPlan" runat="server" CssClass="btn" Text="Add More Plans" OnClick="addPlan_Click" />
                        <asp:Button ID="compare" runat="server" CssClass="btn" Text="Compare Selected Plans" OnClick="compare_Click" />
                        <telerik:RadWindow ID="RadWindow3" runat="server" Width="1000px" Height="500px" Modal="true" OffsetElementID="main" Behaviors="Close" Top="255px" Title="Select Plan to Add" IconUrl="/" Skin="MetroTouch" >
                            <ContentTemplate>
                                <asp:Literal ID="windowmessage" runat="server"></asp:Literal>
                                <telerik:RadGrid ID="planSelection" runat="server" AllowMultiRowSelection="true" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="false" EnableLinqExpressions="false" AllowPaging="false" >
                                    <MasterTableView DataKeyNames="planId">
                                        <Columns>
                                            <telerik:GridClientSelectColumn HeaderStyle-Width="25px"></telerik:GridClientSelectColumn>
                                            <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" SortExpression="planName" HeaderStyle-Width="250px"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridCalculatedColumn HeaderText="Gross&nbsp;Premium" DataFields="rates, depRates" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="gross" SortExpression="rates" HeaderStyle-Width="100px" ></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn DataFields="subsidy, subsidyDep" UniqueName="erPays" DataType="System.Decimal" Expression="{0}+{1}" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" HeaderText="Employer&nbsp;Monthly&nbsp;Cost" SortExpression="subsidy" HeaderStyle-Width="175px" ></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn DataFields="rates,deprates,subsidy,subsidyDep" UniqueName="eePays" DataType="System.Decimal" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" ItemStyle-HorizontalAlign="Right" HeaderText="Employee&nbsp;Monthly&nbsp;Cost" SortExpression="rates" HeaderStyle-Width="175px"></telerik:GridCalculatedColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                        <Scrolling UseStaticHeaders="true" AllowScroll="true"/>
                                    </ClientSettings>
                                </telerik:RadGrid>
                                <br />
                                <asp:Button ID="add" runat="server" CssClass="btn" Text="Add Plans" OnClick="add_Click" />
                            </ContentTemplate>
                        </telerik:RadWindow>
                    </div>
                </div>
            </fieldset>
            <br />
            <asp:Panel ID="buttons" runat="server">
                <div class="row">
                    <div class="col-md-3" style="text-align: center">
                        <asp:Button ID="Back" runat="server" CssClass="btn" Text="Back" OnClick="Back_Click" />
                    </div>
                    <div class="col-md-6" style="text-align: center">
                        <asp:Button ID="startOver" runat="server" CssClass="btn" Text="Start Over" OnClick="startOver_Click" />&nbsp;
                        <asp:Button ID="Save" runat="server" CssClass="btn" Text="Save For Later" OnClick="Save_Click" />
                    </div>
                    <div class="col-md-3" style="text-align: center">
                        <asp:Button ID="Continue" runat="server" CssClass="btn" Text="Continue" OnClick="Continue_Click" />
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
    <script type="text/javascript" src="../js/validation.js"></script>
    <script type="text/javascript">
        function togglePopUpModal(modalId) {
            var modal;
            switch (modalId) {
                case 1:
                    modal = $find('<%= rwchangeHowShared.ClientID%>');
                    break;
                case 2:
                    modal = $find('<%= RadWindow2.ClientID%>');
                    break;
                case 3:
                    modal = $find('<%= RadWindow3.ClientID%>');
                    break;
            }
            modal.show();
        }

        function validateEE(source, args) {
            args.IsValid = validatePercentEE(args.value);
        }

        function validateDep(source, args) {
            args.IsValid = validatePercentDep(args.value);
        }

        function valDollar(source, args) {
            args.IsValid = validateDollar(args.value);
        }
    </script>
</asp:Content>
