<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineQuotesExport.aspx.cs" Inherits="Pibt.OnlineQuotesExport" MasterPageFile="~/Website.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">
                <fieldset>
                    <legend>
                        <b>Online Quote Export</b>
                    </legend>
                    <hr />
                    <div class="customer-info-box">
                        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"></telerik:RadAjaxLoadingPanel>
                        <telerik:RadFormDecorator ID="RadFormDecorator2" DecoratedControls="All" ControlsToSkip="Fieldset,CheckBoxes"
                            DecorationZoneID="mainzone" runat="server" />

                        <telerik:RadAjaxPanel ID="RadAjaxPanel1" EnableAJAX="true" ClientEvents-OnRequestStart="onRequestStart" ClientEvents-OnResponseEnd="OnResponseEnd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                            <!-- content start -->
                            <asp:Literal ID="message" runat="server" Visible="false"></asp:Literal>
                            <telerik:RadGrid ID="EmployeeList" runat="server" AllowMultiRowSelection="false" Skin="MetroTouch" CssClass="ChoosePlanGrid"  GridLines="Horizontal" AutoGenerateColumns ="false" AllowSorting="true" AllowPaging="true" PageSize="10" OnNeedDataSource="EmployeeList_NeedDataSource" OnItemCreated="EmployeeList_ItemCreated" OnItemDataBound="EmployeeList_ItemDataBound" Width="200px">
                                <MasterTableView>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="ROWID" UniqueName="ROWID" Display="false"></telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn Datafield="EMPLOYEENAME" UniqueName="EMPLOYEENAME" HeaderText="Employee Name" > 
                                            <HeaderStyle HorizontalAlign ="Center" />
                                            <ItemStyle ForeColor="#0066ff" Font-Underline="true" HorizontalAlign="Center"  />     
                                        </telerik:GridBoundColumn> 
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <asp:HyperLink ID="eAll" runat="server" Text="Export All" CssClass="btn"></asp:HyperLink>
                        </telerik:RadAjaxPanel>
                            <!-- content end -->
                        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server" >                            
                            <script type="text/javascript" language="javascript">
                                var ajaxObjectId = "<%= RadAjaxPanel1.ClientID%>";
                                var ajaxObject = null;
                                function disableAjax() {
                                    ajaxObject = $find(ajaxObjectId);
                                    if (ajaxObject != null && ajaxObject.get_enableAJAX()) {
                                        ajaxObject.set_enableAJAX(false);
                                    }
                                }
                                function enableAjax() {
                                    ajaxObject = $find(ajaxObjectId);
                                    if (ajaxObject != null && !ajaxObject.get_enableAJAX()) {
                                        ajaxObject.set_enableAJAX(true);
                                    }
                                }
                                function onRequestStart(sender, args) {
                                    ajaxObject = sender;
                                    try {
                                        if (typeof (customRequestStart) != 'undefined') {
                                            customRequestStart(sender, args);
                                        }
                                    } catch (ex) {
                                    }
                                    if (args.get_eventTarget().indexOf("ExportToExcelButton") >= 0 ||
                                        args.get_eventTarget().indexOf("ExportToWordButton") >= 0 ||
                                        args.get_eventTarget().indexOf("ExportToPdfButton") >= 0) {
                                        args.set_enableAjax(false);
                                    }
                                }
                                function OnResponseEnd(sender, args) {
                                    try {
                                        if (typeof (customResponseEnd) != 'undefined') {
                                            customResponseEnd(sender, args);
                                        }
                                    } catch (ex) {
                                    }
                                }
                            </script>
                        </telerik:RadCodeBlock>                      
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>

