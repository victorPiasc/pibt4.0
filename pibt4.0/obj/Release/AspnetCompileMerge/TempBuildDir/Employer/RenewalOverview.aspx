<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenewalOverview.aspx.cs" Inherits="Pibt.Employer.RenewalOverview" MasterPageFile="~/Content.master" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="cPlaceHolderPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">Review Plans Selected</asp:Content>
<asp:Content ID="cFrameHeaderPlaceHolder" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <span style="color:#adf4ff;">Introduction > Comparative Costs > Contribution Section > Dashboard</span> > Review Plans Selected
</asp:Content>
<asp:Content ID="cLeftMenu" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="leftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="cMainContentPlaceHolder" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="customer-info-box">
        <div class="section-body">
            <div class="row">
                <div class="col-md-10">
                    <span class="simpleText bold">Effective Date:&nbsp;</span>
                    <asp:Label ID="effectiveDate" runat="server" CssClass="simpleText"></asp:Label>
                </div>
                <div class="col-md-2">
                    <asp:HyperLink id="paForm" runat="server" style="font-size:25px;" NavigateUrl="/Download/ExportGenericReport.aspx?num=3" >
                        <span aria-hidden="true" class="glyphicon glyphicon-print"></span>
                    </asp:HyperLink>
                </div>
            </div>
            <div class="row" >
                <asp:Panel ID="overallDollar" runat="server">
                    <div class="col-md-4" style="padding-top:20px" >
                        <span class="simpleText">Employees: </span>
                        <span class="simpleText">$</span>&nbsp;
                        <asp:TextBox ID="dollarCont" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Enabled="false" Width="60px" ></asp:TextBox>
                    </div>
                    <div class="col-md-4" style="padding-top:20px">
                        <span class="simpleText">Dependents:</span>
                        <span class="simpleText">$</span>&nbsp;
                        <asp:TextBox ID="dollarDepCont" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Enabled="false" Width="60px"></asp:TextBox>
                    </div>
                </asp:Panel>
                <asp:Panel ID="overallContribution" runat="server">
                    <div class="col-md-4" style="padding-top:20px">
                        <span class="simpleText">Employees: </span>
                        <asp:TextBox ID="overAllContEE" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Enabled="false" Width="60px" ></asp:TextBox>&nbsp;
                        <span class="simpleText">%</span>
                    </div>
                    <div class="col-md-4" style="padding-top:20px">
                        <span class="simpleText">Dependents:</span>
                        <asp:TextBox ID="overAllContDep" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Enabled="false"  Width="60px"></asp:TextBox>&nbsp;
                        <span class="simpleText">%</span>
                    </div>
                </asp:Panel>
                <asp:Panel ID="perPlanType" runat="server">
                    <div class="col-md-8">
                        <table class="table-container" style="width: 100%">
                            <tbody>
                                <tr class="row">
                                    <td>&nbsp;</td>
                                    <td class="item-name" ><span class="simpleText bold und">Medical</span></td>
                                    <td class="item-name" ><span class="simpleText bold und">Dental</span></td>
                                    <td class="item-name" ><span class="simpleText bold und">Vision</span></td>
                                    <td class="item-name" ><span class="simpleText bold und">Chiropractic</span></td>
                                    <td class="item-name" ><span class="simpleText bold und">Mental Health</span></td>
                                </tr>
                                <tr class="row">
                                    <td class="item-name">
                                        <span class="simpleText bold">Employee:</span>
                                    </td>
                                    <td >
                                        <asp:TextBox ID="top_1" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false" ></asp:TextBox>
                                    </td>
                                    <td >
                                        <asp:TextBox ID="top_2" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px"   Width="60px" Enabled="false" ></asp:TextBox>
                                    </td>
                                    <td >
                                        <asp:TextBox ID="top_3" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false" ></asp:TextBox>
                                    </td>
                                    <td >
                                        <asp:TextBox ID="top_4" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px"   Width="60px" Enabled="false" ></asp:TextBox>
                                    </td>
                                    <td >
                                        <asp:TextBox ID="top_5" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px"   Width="60px" Enabled="false" ></asp:TextBox>
                                    </td>
                                </tr>
                                <tr><td>&nbsp;</td></tr>
                                <tr class="row">
                                    <td class="item-name">
                                        <span class="simpleText bold">Dependent:</span>
                                    </td>
                                    <td >
                                        <asp:TextBox ID="bot_1" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px"   Width="60px" Enabled="false" ></asp:TextBox>
                                    </td>
                                    <td >
                                        <asp:TextBox ID="bot_2" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false" ></asp:TextBox>
                                    </td>
                                    <td >
                                        <asp:TextBox ID="bot_3" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false" ></asp:TextBox>
                                    </td>
                                    <td >
                                        <asp:TextBox ID="bot_4" runat="server" CssClass="form-control" Style="display: inline" Font-Size="16px" Height="20px" Width="60px" Enabled="false" ></asp:TextBox>
                                    </td>
                                    <td >
                                        <asp:TextBox ID="bot_5" runat="server" CssClass="form-control" Style="display: none" Font-Size="16px" Height="20px" Width="60px" Enabled="false" ></asp:TextBox>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </asp:Panel>
                <div class="col-md-4">
                    <fieldset>
                        <legend>Calculation Basis</legend>
                        <span class="simpleText"><asp:Literal ID="contributionName" runat="server"></asp:Literal></span>
                    </fieldset>
                </div>
            </div>
            <asp:Panel ID="masterPanel" runat="server">
                <asp:Panel ID="type_1" runat="server" Visible="false">
                    <div class="row">
                        <div class="col-md-12">
                            <fieldset>
                                <legend>Medical</legend>
                                <telerik:RadGrid ID="radgrid_1" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnItemDataBound="radgrid_ItemDataBound" OnNeedDataSource="radgrid_1_NeedDataSource">
                                    <MasterTableView DataKeyNames="planId">
                                        <CommandItemSettings ShowAddNewRecordButton="false" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridCalculatedColumn UniqueName="erPays" HeaderText="Employer&nbsp;Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="subsidy"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee&nbsp;Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="rates"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn HeaderText="Gross&nbsp;Premium" DataFields="rates, depRates" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="gross" SortExpression="rates"></telerik:GridCalculatedColumn>
                                            <telerik:GridButtonColumn ButtonCssClass="btn" ButtonType="PushButton" CommandName="base" Text="Set as base plan" UniqueName="btn" ItemStyle-ForeColor="White" HeaderText="Base&nbsp;Plan" HeaderStyle-Width="105px" ></telerik:GridButtonColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="false" EnableDragToSelectRows="false" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </fieldset>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="type_2" runat="server" Visible="false">
                    <div class="row">
                        <div class="col-md-12">
                            <fieldset>
                                <legend>Dental</legend>
                                <telerik:RadGrid ID="radgrid_2" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnItemDataBound="radgrid_ItemDataBound" OnNeedDataSource="radgrid_2_NeedDataSource">
                                    <MasterTableView DataKeyNames="planId">
                                        <CommandItemSettings ShowAddNewRecordButton="false" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridCalculatedColumn UniqueName="erPays" HeaderText="Employer&nbsp;Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="subsidy"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee&nbsp;Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="rates"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn HeaderText="Gross&nbsp;Premium" DataFields="rates, depRates" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="gross" SortExpression="rates"></telerik:GridCalculatedColumn>
                                            <telerik:GridButtonColumn ButtonCssClass="btn" ButtonType="PushButton" CommandName="base" Text="Set as base plan" UniqueName="btn" ItemStyle-ForeColor="White" HeaderText="Base&nbsp;Plan" HeaderStyle-Width="105px"></telerik:GridButtonColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="false" EnableDragToSelectRows="false" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </fieldset>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="type_3" runat="server" Visible="false">
                    <div class="row">
                        <div class="col-md-12">
                            <fieldset>
                                <legend>Vision</legend>
                                <telerik:RadGrid ID="radgrid_3" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnItemDataBound="radgrid_ItemDataBound" OnNeedDataSource="radgrid_3_NeedDataSource">
                                    <MasterTableView DataKeyNames="planId">
                                        <CommandItemSettings ShowAddNewRecordButton="false" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridCalculatedColumn UniqueName="erPays" HeaderText="Employer&nbsp;Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="erPays"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee&nbsp;Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="eePays"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn HeaderText="Gross&nbsp;Premium" DataFields="rates, depRates" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="gross" SortExpression="gross"></telerik:GridCalculatedColumn>
                                            <telerik:GridButtonColumn ButtonCssClass="btn" ButtonType="PushButton" CommandName="base" Text="Set as base plan" UniqueName="btn" ItemStyle-ForeColor="White" HeaderText="Base&nbsp;Plan" HeaderStyle-Width="105px"></telerik:GridButtonColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="false" EnableDragToSelectRows="false" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </fieldset>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="type_4" runat="server" Visible="false">
                    <div class="row">
                        <div class="col-md-12">
                            <fieldset>
                                <legend>Chiropractic</legend>
                                <telerik:RadGrid ID="radgrid_4" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%"  OnItemDataBound="radgrid_ItemDataBound" OnNeedDataSource="radgrid_4_NeedDataSource">
                                    <MasterTableView DataKeyNames="planId">
                                        <CommandItemSettings ShowAddNewRecordButton="false" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridCalculatedColumn UniqueName="erPays" HeaderText="Employer&nbsp;Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="erPays"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee&nbsp;Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" SortExpression="eePays"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn HeaderText="Gross&nbsp;Premium" DataFields="rates, depRates" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" UniqueName="gross" SortExpression="gross"></telerik:GridCalculatedColumn>
                                            <telerik:GridButtonColumn ButtonCssClass="btn" ButtonType="PushButton" CommandName="base" Text="Set as base plan" UniqueName="btn" ItemStyle-ForeColor="White" HeaderText="Base&nbsp;Plan" HeaderStyle-Width="105px"></telerik:GridButtonColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="false" EnableDragToSelectRows="false" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </fieldset>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="type_6" runat="server" Visible="false">
                    <div class="row">
                        <div class="col-md-12">
                            <fieldset>
                                <legend>Voluntary Term Life</legend>
                                <telerik:RadGrid ID="radgrid_6" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="radgrid_6_NeedDataSource" >
                                    <MasterTableView DataKeyNames="planId">
                                        <CommandItemSettings ShowAddNewRecordButton="false" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridCalculatedColumn UniqueName="erPays" HeaderText="Employer&nbsp;Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="erPays"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee&nbsp;Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" SortExpression="eePays"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn HeaderText="Gross&nbsp;Premium" DataFields="rates, depRates" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" UniqueName="gross" SortExpression="gross"></telerik:GridCalculatedColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="false" EnableDragToSelectRows="false" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </fieldset>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="type_7" runat="server" Visible="false">
                    <div class="row">
                        <div class="col-md-12">
                            <fieldset>
                                <legend>Medical Term Life</legend>
                                <telerik:RadGrid ID="radgrid_7" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="radgrid_7_NeedDataSource" >
                                    <MasterTableView DataKeyNames="planId">
                                        <CommandItemSettings ShowAddNewRecordButton="false" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridCalculatedColumn UniqueName="erPays" HeaderText="Employer&nbsp;Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="erPays"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee&nbsp;Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" SortExpression="eePays"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn HeaderText="Gross&nbsp;Premium" DataFields="rates, depRates" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" UniqueName="gross" SortExpression="gross"></telerik:GridCalculatedColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="false" EnableDragToSelectRows="false" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </fieldset>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="type_8" runat="server" Visible="false">
                    <div class="row">
                        <div class="col-md-12">
                            <fieldset>
                                <legend>Mental Health</legend>
                                <telerik:RadGrid ID="radgrid_8" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnItemDataBound="radgrid_ItemDataBound" OnNeedDataSource="radgrid_8_NeedDataSource">
                                    <MasterTableView DataKeyNames="planId">
                                        <CommandItemSettings ShowAddNewRecordButton="false" />
                                        <Columns>
                                            <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridCalculatedColumn UniqueName="erPays" HeaderText="Employer&nbsp;Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" SortExpression="erPays"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee&nbsp;Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" SortExpression="eePays"></telerik:GridCalculatedColumn>
                                            <telerik:GridCalculatedColumn HeaderText="Gross&nbsp;Premium" DataFields="rates, depRates" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="gross" SortExpression="gross"></telerik:GridCalculatedColumn>
                                            <telerik:GridButtonColumn ButtonCssClass="btn" ButtonType="PushButton" CommandName="base" Text="Set as base plan" UniqueName="btn" ItemStyle-ForeColor="White" HeaderText="Base&nbsp;Plan" ItemStyle-HorizontalAlign="Right" HeaderStyle-Width="105px"></telerik:GridButtonColumn>
                                        </Columns>
                                    </MasterTableView>
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="false" EnableDragToSelectRows="false" />
                                    </ClientSettings>
                                </telerik:RadGrid>
                            </fieldset>
                        </div>
                    </div>
                </asp:Panel>
            </asp:Panel>
            <div class="row"><%--TODO Terminated plans rid goes here--%></div>
            <asp:Panel ID="buttons" runat="server" CssClass="dontprint">
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
</asp:Content>
