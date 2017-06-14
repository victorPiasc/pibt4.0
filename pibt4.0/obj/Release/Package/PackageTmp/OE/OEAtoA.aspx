<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OEAtoA.aspx.cs" Inherits="Pibt.OE.OEAtoA" MasterPageFile="~/Content.Master" %>

<%@ Register Src="../UserControl/CtlEnrollmentFormTitle.ascx" TagName="CtlEnrollmentFormTitle"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc3" %>
<asp:Content ID="Content4" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="ContentPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Current Plans
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <a href="/">Home</a> > My Family > CurrentPlans
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:CtlEnrollmentFormTitle ID="CtlEnrollmentFormTitle1" runat="server" />
    <fieldset>
        <legend>Open Enrollment - Current Plans' Details & Monthly Costs  
        </legend>
        <%--content start --%>
        <div class="customer-info-box">
            <div class="section-body">
                <asp:Panel ID="masterPanel" runat="server">
                    <asp:Panel ID="type_1" runat="server" Visible="false">
                        <div class="title">
                            <asp:LinkButton ID="open_1" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="1" Visible="false" ToolTip="Click to Open Medical Comparison" style="min-width:40px; margin-right:10px;">
                                <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="close_1" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="1" Visible="true" ToolTip="Click to Close Medical Comparison" style="min-width:40px; margin-right:10px;">
                                <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                            </asp:LinkButton>
                            Medical
                        </div>
                        <telerik:RadGrid ID="radgrid_1" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="radgrid_NeedDataSource" OnItemDataBound="radgrid_ItemDataBound" OnItemCreated="radgrid_ItemCreated" OnPreRender="radgrid_PreRender">
                            <MasterTableView DataKeyNames="planId">
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true">
                                        <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290" />
                                        <ItemStyle Font-Size="14px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataFields="oldRates, oldDepRates" UniqueName="oldEmployeeCost" HeaderText="Monthly&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double">
                                        <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                        <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridBoundColumn DataField="planName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name">
                                        <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290" />
                                        <ItemStyle Font-Size="14px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataFields="rates, depRates" UniqueName="EmployeeCost" HeaderText="Monthly&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal">
                                        <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                        <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                    </telerik:GridCalculatedColumn>
                                </Columns>
                                <NoRecordsTemplate>
                                    No coverage
                                </NoRecordsTemplate>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </asp:Panel>
                    <asp:Panel ID="type_2" runat="server" Visible="false">
                        <div class="title">
                            <asp:LinkButton ID="open_2" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="2" Visible="false" ToolTip="Click to Open Dental Comparison" style="min-width:40px; margin-right:10px;">
                                <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="close_2" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="2" Visible="true" ToolTip="Click to Close Dental Comparison" style="min-width:40px; margin-right:10px;">
                                <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                            </asp:LinkButton>
                            Dental
                        </div>
                        <telerik:RadGrid ID="radgrid_2" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="radgrid_NeedDataSource" OnItemDataBound="radgrid_ItemDataBound" OnItemCreated="radgrid_ItemCreated">
                            <MasterTableView DataKeyNames="planId">
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true">
                                        <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290" />
                                        <ItemStyle Font-Size="14px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataFields="oldRates, oldDepRates" UniqueName="oldEmployeeCost" HeaderText="Monthly&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double">
                                        <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                        <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridBoundColumn DataField="planName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name">
                                        <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290" />
                                        <ItemStyle Font-Size="14px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataFields="rates, depRates" UniqueName="EmployeeCost" HeaderText="Monthly&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal">
                                        <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                        <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                    </telerik:GridCalculatedColumn>
                                </Columns>
                                <NoRecordsTemplate>
                                    No coverage
                                </NoRecordsTemplate>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </asp:Panel>
                    <asp:Panel ID="type_3" runat="server" Visible="false">
                        <div class="title">
                            <asp:LinkButton ID="open_3" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="3" Visible="false" ToolTip="Click to Open Vision Comparison" style="min-width:40px; margin-right:10px;">
                                <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="close_3" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="3" Visible="true" ToolTip="Click to Close Vision Comparison" style="min-width:40px; margin-right:10px;">
                                <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                            </asp:LinkButton>
                            Vision
                        </div>
                        <telerik:RadGrid ID="radgrid_3" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="radgrid_NeedDataSource" OnItemDataBound="radgrid_ItemDataBound" OnItemCreated="radgrid_ItemCreated">
                            <MasterTableView DataKeyNames="planId">
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true">
                                        <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290" />
                                        <ItemStyle Font-Size="14px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataFields="oldRates, oldDepRates" UniqueName="oldEmployeeCost" HeaderText="Monthly&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double">
                                        <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                        <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridBoundColumn DataField="planName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name">
                                        <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290" />
                                        <ItemStyle Font-Size="14px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataFields="rates, depRates" UniqueName="EmployeeCost" HeaderText="Monthly&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal">
                                        <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                        <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                    </telerik:GridCalculatedColumn>
                                </Columns>
                                <NoRecordsTemplate>
                                    No coverage
                                </NoRecordsTemplate>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </asp:Panel>
                    <asp:Panel ID="type_4" runat="server" Visible="false">
                        <div class="title">
                            <asp:LinkButton ID="open_4" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="4" Visible="false" ToolTip="Click to Open Chiropractic Comparison" style="min-width:40px; margin-right:10px;">
                                <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="close_4" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="4" Visible="true" ToolTip="Click to Close Chiropractic Comparison" style="min-width:40px; margin-right:10px;">
                                <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                            </asp:LinkButton>
                            Chiropractic 
                        </div>
                        <telerik:RadGrid ID="radgrid_4" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="radgrid_NeedDataSource" OnItemDataBound="radgrid_ItemDataBound" OnItemCreated="radgrid_ItemCreated">
                            <MasterTableView DataKeyNames="planId">
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true">
                                        <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290" />
                                        <ItemStyle Font-Size="14px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataFields="oldRates, oldDepRates" UniqueName="oldEmployeeCost" HeaderText="Monthly&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double">
                                        <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                        <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridBoundColumn DataField="planName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name">
                                        <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290" />
                                        <ItemStyle Font-Size="14px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataFields="rates, depRates" UniqueName="EmployeeCost" HeaderText="Monthly&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal">
                                        <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                        <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                    </telerik:GridCalculatedColumn>
                                </Columns>
                                <NoRecordsTemplate>
                                    No coverage
                                </NoRecordsTemplate>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </asp:Panel>
                    <asp:Panel ID="type_6" runat="server" Visible="false">
                        <div class="title">
                            <asp:LinkButton ID="open_6" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="6" Visible="false" ToolTip="Click to Open Voluntary Term Life Comparison" style="min-width:40px; margin-right:10px;">
                                <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="close_6" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="6" Visible="true" ToolTip="Click to Close Voluntary Term Life Comparison" style="min-width:40px; margin-right:10px;">
                                <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                            </asp:LinkButton>
                            Voluntary Term Life
                        </div>
                        <telerik:RadGrid ID="radgrid_6" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="radgrid_NeedDataSource" OnItemDataBound="radgrid_ItemDataBound" OnItemCreated="radgrid_ItemCreated">
                            <MasterTableView DataKeyNames="planId">
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true">
                                        <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290" />
                                        <ItemStyle Font-Size="14px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataFields="oldRates, oldDepRates" UniqueName="oldEmployeeCost" HeaderText="Monthly&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double">
                                        <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                        <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridBoundColumn DataField="planName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name">
                                        <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290" />
                                        <ItemStyle Font-Size="14px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataFields="rates, depRates" UniqueName="EmployeeCost" HeaderText="Monthly&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal">
                                        <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                        <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                    </telerik:GridCalculatedColumn>
                                </Columns>
                                <NoRecordsTemplate>
                                    No coverage
                                </NoRecordsTemplate>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </asp:Panel>
                    <asp:Panel ID="type_8" runat="server" Visible="false">
                        <div class="title">
                            <asp:LinkButton ID="open_8" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="8" Visible="false" ToolTip="Click to Open Mental Health Comparison" style="min-width:40px; margin-right:10px;">
                                <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="close_8" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="8" Visible="true" ToolTip="Click to Close Mental Health Comparison" style="min-width:40px; margin-right:10px;">
                                <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                            </asp:LinkButton>
                            Mental Health
                        </div>
                        <telerik:RadGrid ID="radgrid_8" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="radgrid_NeedDataSource"  OnItemDataBound="radgrid_ItemDataBound" OnItemCreated="radgrid_ItemCreated">
                            <MasterTableView DataKeyNames="planId">
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true">
                                        <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290" />
                                        <ItemStyle Font-Size="14px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataFields="oldRates, oldDepRates" UniqueName="oldEmployeeCost" HeaderText="Monthly&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double">
                                        <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                        <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                    </telerik:GridCalculatedColumn>
                                    <telerik:GridBoundColumn DataField="planName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name">
                                        <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290" />
                                        <ItemStyle Font-Size="14px" />
                                    </telerik:GridBoundColumn>
                                    <telerik:GridCalculatedColumn DataFields="rates, depRates" UniqueName="EmployeeCost" HeaderText="Monthly&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal">
                                        <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                        <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                    </telerik:GridCalculatedColumn>
                                </Columns>
                                <NoRecordsTemplate>
                                    No coverage
                                </NoRecordsTemplate>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </asp:Panel>
                    <br />
                    <asp:Panel ID="totals" runat="server">
                        <table class="table-container" style="width: 100%; font-size: 14px; font-weight: bold;">
                            <tbody style="border: solid 1px #CDCDCD;">
                                <tr class="row">
                                    <td style="text-align: right; padding-right: 10px; border-right: solid 1px #CDCDCD;">Expiring Total Monthly Cost:
                                        <asp:Literal ID="expireTotal" runat="server"></asp:Literal>
                                    </td>
                                    <td style="text-align: right; padding-right: 10px">Renewal Total Monthly Cost:
                                        <asp:Literal ID="renewTotal" runat="server"></asp:Literal>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
                </asp:Panel>
            </div>
        </div>
        <%--content end --%>
    </fieldset>
    <div class="row">
        <div class="col-lg-12">
            <asp:Literal ID="rtnMessage" runat="server" ></asp:Literal>
        </div>
    </div>
    <div style="width: 100%">
        <div class="row">
            <div class="col-lg-10">
                &nbsp;
            </div>
            <div class="col-lg-2">
                <asp:Button runat="server" ID="btNoChange" CssClass="btn" Text="Enroll Without Change" OnClick="btNoChange_Click"  />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-2">
                <asp:Button runat="server" ID="BtCancel" CssClass="btn" BackColor="Red" Text="Cancel" OnClick="BtCancel_Click" Width="98px" />
            </div>
            <div class="col-lg-8">
                &nbsp;
            </div>
            <div class="col-lg-2">
                <asp:Button runat="server" ID="BtChanges" CssClass="btn" BackColor="Green" Text="Make Changes" OnClick="BtChanges_Click" Width="120px" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LeftMenuPlaceHolder">
    <uc3:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
