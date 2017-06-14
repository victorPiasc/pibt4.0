<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlQQ6.ascx.cs" Inherits="Pibt.UserControl.CtlQQ6" %>
<div class="row">
    <div class="column-3 col-md-3">
        <span class="simpleText bold">Effective Date:&nbsp;</span>
        <asp:Label ID="effectiveDate" runat="server" CssClass="simpleText"></asp:Label>
    </div>
    <div class="column-3 col-md-3">
        <span class="simpleText bold">Zip Code:&nbsp;</span>
        <asp:Label ID="zip" runat="server" CssClass="simpleText"></asp:Label>
    </div>
    <div class="column-4 col-md-4 simpleText">
        <span class="bold">Census:&nbsp;</span>
        Employee:&nbsp;<asp:Label ID="eeCount" runat="server" CssClass="simpleText"></asp:Label>
        <span style="padding: 5px;">&nbsp;</span>
        Dependent:&nbsp;<asp:Label ID="depCount" runat="server" CssClass="simpleText"></asp:Label>
    </div>
</div>
<div class="row">
    <asp:Panel ID="overallDollar" runat="server">
        <div class="column-3 col-md-3 simpleText">
            <span class=" bold">Employees: </span>
            $&nbsp;
                        <asp:Label ID="dollarCont" runat="server"></asp:Label>
        </div>
        <div class="column-3 col-md-3 simpleText">
            <span class=" bold">Dependents:</span>
            $&nbsp;
                        <asp:Label ID="dollarDepCont" runat="server"></asp:Label>
        </div>
    </asp:Panel>
    <asp:Panel ID="overallContribution" runat="server">
        <div class="column-3 col-md-3 simpleText ">
            <span class="bold">Employees: </span>
            <asp:Label ID="overAllContEE" runat="server"></asp:Label>&nbsp;
                        %
        </div>
        <div class="column-3 col-md-3 simpleText">
            <span class="bold">Dependents:</span>
            <asp:Label ID="overAllContDep" runat="server"></asp:Label>&nbsp;
                        %
        </div>
    </asp:Panel>
    <asp:Panel ID="perPlanType" runat="server">
        <div class="column-6 col-md-6">
            <table class="table-container simpleText " style="width: 100%">
                <tbody>
                    <tr class="row">
                        <td>&nbsp;</td>
                        <td class="item-name"><span class="simpleText bold und">Medical</span></td>
                        <td class="item-name"><span class="simpleText bold und">Dental</span></td>
                        <td class="item-name"><span class="simpleText bold und">Vision</span></td>
                        <td class="item-name"><span class="simpleText bold und">Chiropractic</span></td>
                        <td class="item-name"><span class="simpleText bold und">Mental Health</span></td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            <span class="bold">Employee:</span>
                        </td>
                        <td>
                            <asp:Label ID="top_1" runat="server"></asp:Label>%
                        </td>
                        <td>
                            <asp:Label ID="top_2" runat="server"></asp:Label>%
                        </td>
                        <td>
                            <asp:Label ID="top_3" runat="server"></asp:Label>%
                        </td>
                        <td>
                            <asp:Label ID="top_4" runat="server"></asp:Label>%
                        </td>
                        <td>
                            <asp:Label ID="top_5" runat="server"></asp:Label>%
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            <span class="bold">Dependent:</span>
                        </td>
                        <td>
                            <asp:Label ID="bot_1" runat="server"></asp:Label>%
                        </td>
                        <td>
                            <asp:Label ID="bot_2" runat="server"></asp:Label>%
                        </td>
                        <td>
                            <asp:Label ID="bot_3" runat="server"></asp:Label>%
                        </td>
                        <td>
                            <asp:Label ID="bot_4" runat="server"></asp:Label>%
                        </td>
                        <td>
                            <asp:Label ID="bot_5" runat="server"></asp:Label>%
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </asp:Panel>
    <div class="column-4 col-md-4">
        <span class="simpleText bold">Calculation Basis:&nbsp;</span>
        <asp:Label ID="basis" runat="server" CssClass="simpleText"></asp:Label>
    </div>
</div>
<asp:Panel ID="masterPanel" runat="server">
    <asp:Panel ID="type_1" runat="server" Visible="false">
        <div class="row">
            <div class="column-12 col-md-12">
                <fieldset>
                    <legend>Medical</legend>
                    <telerik:RadGrid ID="radgrid_1" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnItemDataBound="radgrid_ItemDataBound" OnNeedDataSource="radgrid_NeedDataSource" OnPdfExporting="radgrid_1_PdfExporting">
                        <ExportSettings FileName="Medical" OpenInNewWindow="true" ExportOnlyData="true" UseItemStyles="true">
                            <Pdf AllowAdd="false" AllowCopy="false" AllowModify="false" AllowPrinting="true"  PageWidth="297mm" PageHeight="210mm" ForceTextWrap="true" >
                                <PageHeader>
                                    <LeftCell TextAlign="Center" />
                                    <MiddleCell TextAlign="Center" />
                                    <RightCell TextAlign="Center" />
                                </PageHeader>
                            </Pdf>
                        </ExportSettings>
                        <MasterTableView DataKeyNames="planId" CommandItemDisplay="Top">
                            <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton ="false"  ShowExportToPdfButton="true"/>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName" HeaderStyle-HorizontalAlign="Left"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridCalculatedColumn UniqueName="erPays" HeaderText="Employer<br />Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="subsidy" HeaderStyle-HorizontalAlign="Left" ></telerik:GridCalculatedColumn>
                                <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee<br />Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="rates" HeaderStyle-HorizontalAlign="Left" ></telerik:GridCalculatedColumn>
                                <telerik:GridCalculatedColumn HeaderText="Gross&nbsp;Premium" DataFields="rates, depRates" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" UniqueName="gross" SortExpression="rates" HeaderStyle-HorizontalAlign="Left"></telerik:GridCalculatedColumn>
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
    <asp:Panel ID="type_2" runat="server" Visible="false">
        <div class="row">
            <div class="column-12 col-md-12">
                <fieldset>
                    <legend>Dental</legend>
                    <telerik:RadGrid ID="radgrid_2" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnItemDataBound="radgrid_ItemDataBound" OnNeedDataSource="radgrid_NeedDataSource" OnPdfExporting="radgrid_1_PdfExporting">
                        <ExportSettings FileName="Dental" OpenInNewWindow="true" ExportOnlyData="true" UseItemStyles="true">
                            <Pdf AllowAdd="false" AllowCopy="false" AllowModify="false" AllowPrinting="true"  PageWidth="297mm" PageHeight="210mm" ForceTextWrap="true" >
                                <PageHeader>
                                    <LeftCell TextAlign="Center" />
                                    <MiddleCell TextAlign="Center" />
                                    <RightCell TextAlign="Center" />
                                </PageHeader>
                            </Pdf>
                        </ExportSettings>
                        <MasterTableView DataKeyNames="planId" CommandItemDisplay="Top">
                            <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton ="false"  ShowExportToPdfButton="true"/>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridCalculatedColumn UniqueName="erPays"  HeaderText="Employer<br />Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="subsidy"></telerik:GridCalculatedColumn>
                                <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee<br />Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="rates"></telerik:GridCalculatedColumn>
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
            <div class="column-12 col-md-12">
                <fieldset>
                    <legend>Vision</legend>
                    <telerik:RadGrid ID="radgrid_3" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnItemDataBound="radgrid_ItemDataBound" OnNeedDataSource="radgrid_NeedDataSource" OnPdfExporting="radgrid_1_PdfExporting">
                        <ExportSettings FileName="Vision" OpenInNewWindow="true" ExportOnlyData="true" UseItemStyles="true">
                            <Pdf AllowAdd="false" AllowCopy="false" AllowModify="false" AllowPrinting="true"  PageWidth="297mm" PageHeight="210mm" ForceTextWrap="true" >
                                <PageHeader>
                                    <LeftCell TextAlign="Center" />
                                    <MiddleCell TextAlign="Center" />
                                    <RightCell TextAlign="Center" />
                                </PageHeader>
                            </Pdf>
                        </ExportSettings>
                        <MasterTableView DataKeyNames="planId" CommandItemDisplay="Top">
                            <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton ="false"  ShowExportToPdfButton="true" />
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridCalculatedColumn UniqueName="erPays"  HeaderText="Employer<br />Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="erPays"></telerik:GridCalculatedColumn>
                                <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee<br />Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="eePays"></telerik:GridCalculatedColumn>
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
            <div class="column-12 col-md-12">
                <fieldset>
                    <legend>Chiropractic</legend>
                    <telerik:RadGrid ID="radgrid_4" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnItemDataBound="radgrid_ItemDataBound" OnNeedDataSource="radgrid_NeedDataSource" OnPdfExporting="radgrid_1_PdfExporting">
                        <ExportSettings FileName="Dental" OpenInNewWindow="true" ExportOnlyData="true" UseItemStyles="true">
                            <Pdf AllowAdd="false" AllowCopy="false" AllowModify="false" AllowPrinting="true"  PageWidth="297mm" PageHeight="210mm" ForceTextWrap="true" >
                                <PageHeader>
                                    <LeftCell TextAlign="Center" />
                                    <MiddleCell TextAlign="Center" />
                                    <RightCell TextAlign="Center" />
                                </PageHeader>
                            </Pdf>
                        </ExportSettings>
                        <MasterTableView DataKeyNames="planId" CommandItemDisplay="Top">
                            <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton ="false"  ShowExportToPdfButton="true"/>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridCalculatedColumn UniqueName="erPays"  HeaderText="Employer<br />Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="erPays"></telerik:GridCalculatedColumn>
                                <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee<br />Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" SortExpression="eePays"></telerik:GridCalculatedColumn>
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
    <asp:Panel ID="type_8" runat="server" Visible="false">
        <div class="row">
            <div class="column-12 col-md-12">
                <fieldset>
                    <legend>Mental Health</legend>
                    <telerik:RadGrid ID="radgrid_8" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnItemDataBound="radgrid_ItemDataBound" OnNeedDataSource="radgrid_NeedDataSource" OnPdfExporting="radgrid_1_PdfExporting">
                        <ExportSettings FileName="Mental Health" OpenInNewWindow="true" ExportOnlyData="true" UseItemStyles="true">
                            <Pdf AllowAdd="false" AllowCopy="false" AllowModify="false" AllowPrinting="true"  PageWidth="297mm" PageHeight="210mm" ForceTextWrap="true" >
                                <PageHeader>
                                    <LeftCell TextAlign="Center" />
                                    <MiddleCell TextAlign="Center" />
                                    <RightCell TextAlign="Center" />
                                </PageHeader>
                            </Pdf>
                        </ExportSettings>
                        <MasterTableView DataKeyNames="planId" CommandItemDisplay="Top">
                            <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton ="false"  ShowExportToPdfButton="true"/>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridCalculatedColumn UniqueName="erPays"  HeaderText="Employer<br />Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" SortExpression="erPays"></telerik:GridCalculatedColumn>
                                <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee<br />Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" SortExpression="eePays"></telerik:GridCalculatedColumn>
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
    <asp:Panel ID="type_6" runat="server" Visible="false">
        <div class="row">
            <div class="column-12 col-md-12">
                <fieldset>
                    <legend>Voluntary Term Life</legend>
                    <telerik:RadGrid ID="radgrid_6" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="radgrid_NeedDataSource" OnPdfExporting="radgrid_1_PdfExporting">
                        <ExportSettings FileName="Voluntary Temr Life" OpenInNewWindow="true" ExportOnlyData="true" UseItemStyles="true">
                            <Pdf AllowAdd="false" AllowCopy="false" AllowModify="false" AllowPrinting="true"  PageWidth="297mm" PageHeight="210mm" ForceTextWrap="true" >
                                <PageHeader>
                                    <LeftCell TextAlign="Center" />
                                    <MiddleCell TextAlign="Center" />
                                    <RightCell TextAlign="Center" />
                                </PageHeader>
                            </Pdf>
                        </ExportSettings>
                        <MasterTableView DataKeyNames="planId" CommandItemDisplay="Top">
                            <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton ="false"  ShowExportToPdfButton="true"/>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridCalculatedColumn UniqueName="erPays"  HeaderText="Employer<br />Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="erPays"></telerik:GridCalculatedColumn>
                                <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee<br />Monthly&nbsp;Cost" DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" SortExpression="eePays"></telerik:GridCalculatedColumn>
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
            <div class="column-12 col-md-12">
                <fieldset>
                    <legend>Medical Term Life</legend>
                    <telerik:RadGrid ID="radgrid_7" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" ShowStatusBar="false" AutoGenerateColumns="false" AllowSorting="true" EnableLinqExpressions="false" Width="100%" OnNeedDataSource="radgrid_NeedDataSource" OnPdfExporting="radgrid_1_PdfExporting">
                        <ExportSettings FileName="Medical Term Life" OpenInNewWindow="true" ExportOnlyData="true" UseItemStyles="true">
                            <Pdf AllowAdd="false" AllowCopy="false" AllowModify="false" AllowPrinting="true"  PageWidth="297mm" PageHeight="210mm" ForceTextWrap="true" >
                                <PageHeader>
                                    <LeftCell TextAlign="Center" />
                                    <MiddleCell TextAlign="Center" />
                                    <RightCell TextAlign="Center" />
                                </PageHeader>
                            </Pdf>
                        </ExportSettings>
                        <MasterTableView DataKeyNames="planId" CommandItemDisplay="Top">
                            <CommandItemSettings ShowAddNewRecordButton="false" ShowRefreshButton ="false"  ShowExportToPdfButton="true"/>
                            <Columns>
                                <telerik:GridBoundColumn DataField="planName" UniqueName="planName" HeaderText="Plan&nbsp;Name" HeaderStyle-Width="400px" SortExpression="planName"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="planId" UniqueName="planId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="basePlanId" UniqueName="basePlanId" Display="false"></telerik:GridBoundColumn>
                                <telerik:GridCalculatedColumn UniqueName="erPays"  HeaderText="Employer<br />Monthly&nbsp;Cost" DataFields="subsidy, subsidyDep" Expression="{0}+{1}" DataFormatString="{0:C}" DataType="System.Double" ItemStyle-HorizontalAlign="Right" SortExpression="erPays"></telerik:GridCalculatedColumn>
                                <telerik:GridCalculatedColumn UniqueName="eePays" HeaderText="Employee<br />Monthly&nbsp;Cost"  DataFields="rates,depRates,subsidy,subsidyDep" Expression="{0}+{1}-{2}-{3}" DataFormatString="{0:C}" DataType="System.Decimal" ItemStyle-HorizontalAlign="Right" SortExpression="eePays"></telerik:GridCalculatedColumn>
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
</asp:Panel>