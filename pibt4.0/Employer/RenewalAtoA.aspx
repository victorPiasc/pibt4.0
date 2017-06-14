<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenewalAtoA.aspx.cs" Inherits="Pibt.Employer.RenewalAtoA" MasterPageFile="~/Content.master" %>

<%@ Register Src="../UserControl/CtlLeftMenuLevel2.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="cPlaceHolderPageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">Comparative Costs</asp:Content>
<asp:Content ID="cFrameHeaderPlaceHolder" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <span style="color:#adf4ff;">Introduction</span> > Comparative Costs
</asp:Content>
<asp:Content ID="cLeftMenu" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="leftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="cMainContentPlaceHolder" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <style>
        .title {
            font-weight: bold;
            font-size: 16px;
            font-family: Open Sans;
            color: #004b84;
            padding-bottom: 10px;
        }
    </style>
    <div class="customer-info-box">
        <div class="section-body">
            <div class="row">
                <div class="col-md-12">
                    <fieldset>
                        <legend>Summary of Employee Census</legend>
                        <telerik:RadGrid ID="censusSummary" runat="server" AutoGenerateColumns="false" Skin="MetroTouch" ShowStatusBar="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="censusSummary_NeedDataSource">
                            <MasterTableView DataKeyNames="enrolled">
                                <CommandItemSettings ShowAddNewRecordButton="false" />
                                <Columns>
                                    <telerik:GridBoundColumn DataField="enrolled" HeaderText="&nbsp;" UniqueName="enrolled" ></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="medCount" HeaderText="Medical" UniqueName="medCount" Display="false" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="denCount" HeaderText="Dental" UniqueName="denCount" Display="false" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="visCount" HeaderText="Vision" UniqueName="visCount" Display="false" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="chiroCount" HeaderText="Chiropractic" UniqueName="chiroCount" Display="false" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="mglCount" HeaderText="Managed Group Life" UniqueName="mglCount" Display="false" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="vtlCount" HeaderText="Voluntary Term Life" UniqueName="vtlCount" Display="false" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="mtlCount" HeaderText="Medical Term Life" UniqueName="mtlCount" Display="false" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="mhCount" HeaderText="Mental Health" UniqueName="mhCount" Display="false" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="eboCount" HeaderText="Executive Benefit Option" UniqueName="eboCount" Display="false" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="mtlGaCount" HeaderText="Medical Term Life" UniqueName="mtlGaCount" Display="false" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="mtmtlCount" HeaderText="Medical Term Life" UniqueName="mtmtlCount" Display="false" ItemStyle-HorizontalAlign="Center"></telerik:GridBoundColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>
                    </fieldset>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div>
                        <h3 style="color:#004B84; font-weight:bold;">
                            Current Plans&nbsp;-&nbsp;<asp:label ID="headerText" runat="server" Text="Employer Level Detail"></asp:label>
                            <asp:HyperLink id="paForm" runat="server" style="font-size:25px; padding-left:40px;" NavigateUrl="/Download/ExportGenericReport.aspx?num=4" >
                                <span aria-hidden="true" class="glyphicon glyphicon-print"></span>
                            </asp:HyperLink>
                        </h3> 
                    </div>
                    <div>
                        <span class="simpleText">Effective Date: <%# renew.effectiveDate %></span>
                    </div>
                    <hr />
                </div>
                <div class="col-md-12">
                    <asp:Panel ID="masterPanel" runat="server">
                        <asp:Panel ID="type_1" runat="server" Visible="false">
                            <div class="title">
                                <asp:LinkButton ID="openMed" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="1" Visible="false" ToolTip="Click to Open Medical Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="closeMed" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="1" Visible="true" ToolTip="Click to Close Medical Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                                </asp:LinkButton>
                                Medical
                            </div>
                            <telerik:RadGrid ID="grid_1" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="grid_NeedDataSource" ShowFooter="true">
                                <MasterTableView DataKeyNames="planId">
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                        <%--<telerik:GridBoundColumn DataField="employeeId"></telerik:GridBoundColumn>--%>
                                        <telerik:GridBoundColumn DataField="fullName" UniqueName="fullName" HeaderText="Covered&nbsp;Employee" AllowSorting="true" Display="false">
                                            <HeaderStyle Font-Size="14px" />
                                            <ItemStyle Font-Size="12px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290"/>
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldSubsidy, oldSubsidyDep" UniqueName="oldEmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right"/>
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldRates, oldDepRates, oldSubsidy, oldSubsidyDep" UniqueName="oldEmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridBoundColumn DataField="newPlanName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290"/>
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="subsidy, subsidyDep" UniqueName="EmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="rates, depRates, subsidy, subsidyDep" UniqueName="EmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Decimal" Aggregate="Sum" FooterAggregateFormatString="{0:C}" >
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </asp:Panel>
                        <asp:Panel ID="type_2" runat="server" Visible="false">
                            <div class="title">
                                <asp:LinkButton ID="openDen" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="2" Visible="true" ToolTip="Click to Open Dental Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="closeDen" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="2" Visible="false" ToolTip="Click to close Dental Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                                </asp:LinkButton>
                                Dental
                            </div>
                            <telerik:RadGrid ID="grid_2" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" Visible="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="grid_NeedDataSource" ShowFooter="true">
                                <MasterTableView DataKeyNames="planId">
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="fullName" UniqueName="fullName" HeaderText="Covered&nbsp;Employee" AllowSorting="true" Display="false">
                                            <HeaderStyle Font-Size="14px" />
                                            <ItemStyle Font-Size="12px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290" />
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldSubsidy, oldSubsidyDep" UniqueName="oldEmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red"  />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldRates, oldDepRates, oldSubsidy, oldSubsidyDep" UniqueName="oldEmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridBoundColumn DataField="newPlanName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290"/>
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="subsidy, subsidyDep" UniqueName="EmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="rates, depRates, subsidy, subsidyDep" UniqueName="EmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </asp:Panel>
                        <asp:Panel ID="type_3" runat="server" Visible="false">
                            <div class="title">
                                <asp:LinkButton ID="openVis" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="3" Visible="true" ToolTip="Click to Open Vision Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="closeVis" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="3" Visible="false" ToolTip="Click to close Vision Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                                </asp:LinkButton>
                                Vision
                            </div>
                            <telerik:RadGrid ID="grid_3" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" Visible="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="grid_NeedDataSource" ShowFooter="true">
                                <MasterTableView DataKeyNames="planId">
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="fullName" UniqueName="fullName" HeaderText="Covered&nbsp;Employee" AllowSorting="true" Display="false">
                                            <HeaderStyle Font-Size="14px" />
                                            <ItemStyle Font-Size="12px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290"/>
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldSubsidy, oldSubsidyDep" UniqueName="oldEmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldRates, oldDepRates, oldSubsidy, oldSubsidyDep" UniqueName="oldEmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridBoundColumn DataField="newPlanName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290"/>
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="subsidy, subsidyDep" UniqueName="EmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="rates, depRates, subsidy, subsidyDep" UniqueName="EmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </asp:Panel>
                        <asp:Panel ID="type_4" runat="server" Visible="false">
                            <div class="title">
                                <asp:LinkButton ID="openChiro" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="4" Visible="true" ToolTip="Click to Open Chiropractic Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="closeChiro" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="4" Visible="false" ToolTip="Click to close Chiropractic Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                                </asp:LinkButton>
                                Chiropractic
                            </div>
                            <telerik:RadGrid ID="grid_4" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="grid_NeedDataSource" Visible="false" ShowFooter="true">
                                <MasterTableView DataKeyNames="planId">
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="fullName" UniqueName="fullName" HeaderText="Covered&nbsp;Employee" AllowSorting="true" Display="false">
                                            <HeaderStyle Font-Size="14px" />
                                            <ItemStyle Font-Size="12px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290" />
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldSubsidy, oldSubsidyDep" UniqueName="oldEmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldRates, oldDepRates, oldSubsidy, oldSubsidyDep" UniqueName="oldEmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridBoundColumn DataField="newPlanName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290"/>
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="subsidy, subsidyDep" UniqueName="EmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="rates, depRates, subsidy, subsidyDep" UniqueName="EmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </asp:Panel>
                        <asp:Panel ID="type_6" runat="server" Visible="false">
                            <div class="title">
                                <asp:LinkButton ID="openVtl" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="6" Visible="true" ToolTip="Click to Open Voluntary Term Life Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="closeVtl" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="6" Visible="false" ToolTip="Click to close Voluntary Term Life Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                                </asp:LinkButton>
                                Voluntary Term Life
                            </div>
                            <telerik:RadGrid ID="grid_6" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="grid_NeedDataSource" Visible="false" ShowFooter="true">
                                <MasterTableView DataKeyNames="planId">
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="fullName" UniqueName="fullName" HeaderText="Covered&nbsp;Employee" AllowSorting="true" Display="false">
                                            <HeaderStyle Font-Size="14px" />
                                            <ItemStyle Font-Size="12px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290" />
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldRates" UniqueName="oldEmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}-{0}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldRates,oldDepRates" UniqueName="oldEmployeeCost" Expression="{0}+{1}" HeaderText="Employee&nbsp;Cost"  DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridBoundColumn DataField="newPlanName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290"/>
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="subsidy, subsidyDep" UniqueName="EmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="rates, depRates, subsidy, subsidyDep" UniqueName="EmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </asp:Panel>
                        <asp:Panel ID="type_7" runat="server" Visible="false">
                            <div class="title">
                                <asp:LinkButton ID="openMtl" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="7" Visible="true" ToolTip="Click to Open Medical Term Life Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="closeMtl" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="7" Visible="false" ToolTip="Click to close Medical Term Life Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                                </asp:LinkButton>
                                Medical Term Life
                            </div>
                            <telerik:RadGrid ID="grid_7" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="grid_NeedDataSource" Visible="false" ShowFooter="true">
                                <MasterTableView DataKeyNames="planId">
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="fullName" UniqueName="fullName" HeaderText="Covered&nbsp;Employee" AllowSorting="true" Display="false">
                                            <HeaderStyle Font-Size="14px" />
                                            <ItemStyle Font-Size="12px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290"/>
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="oldRates" UniqueName="oldEmployerCost" HeaderText="Employer&nbsp;Cost" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldRates" UniqueName="oldEmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}-{0}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridBoundColumn DataField="newPlanName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290" />
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="subsidy, subsidyDep" UniqueName="EmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="rates, depRates, subsidy, subsidyDep" UniqueName="EmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </asp:Panel>
                        <asp:Panel ID="type_8" runat="server" Visible="false">
                            <div class="title">
                                <asp:LinkButton ID="openMh" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="8" Visible="true" ToolTip="Click to Open Mental Health Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="closeMh" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="8" Visible="false" ToolTip="Click to close Mental Health Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                                </asp:LinkButton>
                                Mental Health
                            </div>
                            <telerik:RadGrid ID="grid_8" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="grid_NeedDataSource" Visible="false" ShowFooter="true">
                                <MasterTableView DataKeyNames="planId">
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="fullName" UniqueName="fullName" HeaderText="Covered&nbsp;Employee" AllowSorting="true" Display="false">
                                            <HeaderStyle Font-Size="14px" />
                                            <ItemStyle Font-Size="12px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290"/>
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldSubsidy, oldSubsidyDep" UniqueName="oldEmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldRates, oldDepRates, oldSubsidy, oldSubsidyDep" UniqueName="oldEmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridBoundColumn DataField="newPlanName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290" />
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="subsidy, subsidyDep" UniqueName="EmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="rates, depRates, subsidy, subsidyDep" UniqueName="EmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </asp:Panel>
                        <asp:Panel ID="type_10" runat="server" Visible="false">
                            <div class="title">
                                <asp:LinkButton ID="openMtlGa" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="10" Visible="true" ToolTip="Click to Open Medical Term Life Georgia Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-plus"></span>
                                </asp:LinkButton>
                                <asp:LinkButton ID="closeMtlGa" runat="server" CssClass="btn" OnCommand="open_Command" CommandName="10" Visible="false" ToolTip="Click to close Medical Term Life Georgia Comparison" style="min-width:40px; margin-right:10px;">
                                    <span aria-hidden="true" class="glyphicon glyphicon-minus"></span>
                                </asp:LinkButton>
                                Medical Term Life Georgia
                            </div>
                            <telerik:RadGrid ID="grid_10" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="grid_NeedDataSource" Visible="false" ShowFooter="true">
                                <MasterTableView DataKeyNames="planId">
                                    <CommandItemSettings ShowAddNewRecordButton="false" />
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="fullName" UniqueName="fullName" HeaderText="Covered&nbsp;Employee" AllowSorting="true" Display="false">
                                            <HeaderStyle Font-Size="14px" />
                                            <ItemStyle Font-Size="12px" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="oldPlanName" UniqueName="oldPlanName" HeaderText="EXPIRING&nbsp;Plan&nbsp;Name" AllowSorting="true" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" Width="290" />
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldSubsidy, oldSubsidyDep" UniqueName="oldEmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="oldRates, oldDepRates, oldSubsidy, oldSubsidyDep" UniqueName="oldEmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Red" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridBoundColumn DataField="newPlanName" UniqueName="PlanName" HeaderText="RENEWAL&nbsp;Plan&nbsp;Name" FooterText="Total Monthly Cost">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" Width="290" />
                                            <ItemStyle Font-Size="14px" />
                                            <FooterStyle HorizontalAlign="Right" Font-Bold="true" />
                                        </telerik:GridBoundColumn>
                                        <telerik:GridCalculatedColumn DataFields="subsidy, subsidyDep" UniqueName="EmployerCost" HeaderText="Employer&nbsp;Cost" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                        <telerik:GridCalculatedColumn DataFields="rates, depRates, subsidy, subsidyDep" UniqueName="EmployeeCost" HeaderText="Employee&nbsp;Cost" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" Aggregate="Sum" FooterAggregateFormatString="{0:C}">
                                            <HeaderStyle Font-Size="14px" ForeColor="Green" />
                                            <ItemStyle Font-Size="14px" HorizontalAlign="Right" />
                                            <FooterStyle HorizontalAlign="Right" />
                                        </telerik:GridCalculatedColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </asp:Panel>
                    </asp:Panel>
                    <div>
                        <asp:Button ID="eeDetails" runat="server" CssClass="btn" Text="View Employee Level Detail" OnClick="details_Click" />
                        <asp:Button ID="noDetails" runat="server" CssClass="btn" Text="View Employer Level Detail" OnClick="details_Click" Visible="false" />
                    </div>
                </div>
            </div>
            <asp:Panel ID="buttons" runat="server" CssClass="dontprint">
                <div class="row">
                    <div class="col-md-4" style="text-align: center">
                        <asp:Button ID="Back" runat="server" CssClass="btn" Text="Back" OnClick="Back_Click" />
                    </div>
                    <div class="col-md-4" style="text-align: center">
                        <asp:Button ID="Save" runat="server" CssClass="btn" Text="Renew As Is" OnClick="Save_Click" />
                    </div>
                    <div class="col-md-4" style="text-align: center">
                        <asp:Button ID="Continue" runat="server" CssClass="btn" Text="Make Changes" OnClick="Continue_Click" />
                    </div>
                </div>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
