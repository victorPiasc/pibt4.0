<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineQuoteRates.aspx.cs" Inherits="Pibt.OnlineQuoteRates" MasterPageFile="~/Website.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">
                <asp:Literal ID="lblCreationMessage" runat="server" EnableViewState="False"></asp:Literal>
                <fieldset>
                    <legend><b>Online Quote </b></legend>
                    <hr />                   
                    <span style="font-size:14px; font-weight:bold">To generate rates complete the Employer details below and then click on Get Rates </span>                                                        
                    <div class="customer-info-box">
                         <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server"></telerik:RadAjaxLoadingPanel>
                        
                        <telerik:RadFormDecorator ID="RadFormDecorator2" DecoratedControls="All" ControlsToSkip="Fieldset,CheckBoxes"
                            DecorationZoneID="mainzone" runat="server" />

                        <telerik:RadAjaxPanel ID="RadAjaxPanel1" EnableAJAX="true" ClientEvents-OnRequestStart="onRequestStart" ClientEvents-OnResponseEnd="OnResponseEnd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                            <!-- content start -->
                        <asp:PlaceHolder runat="server" ID="EmployerDetails">
                            <div class="section-title">
                                Employer Details:
                            </div>
                            <div class="section-body">
                                <table class="table-container">
                                    <tbody>
                                        <tr class="row">
                                            <td class="item-name">Employer Zip Code:
                                            </td>
                                            <td class="item-value">
                                                <telerik:RadTextBox ID="empZip" runat="server" CssClass="form-control" MaxLength="9" Height="34px" Width="160"  AutoPostBack="true" ReadOnly="true"></telerik:RadTextBox>
                                            </td>
                                            <%--<td>
                                                <asp:RequiredFieldValidator ID="empZipValidator" runat="server" CssClass="required-info" SetFocusOnError="true" ErrorMessage="*Employer zip code required" ControlToValidate="empZip" ValidationGroup="empInputGroup"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="regularExpression1" ControlToValidate="empZip" runat="server" ErrorMessage="*Only Numbers allowed" CssClass="required-info" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                                            </td>--%>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">Effective Date:
                                            </td>
                                            <td class="item-value">
                                                <%--<telerik:RadComboBox ID="effectiveDate" runat="server" CssClass="form-control"></telerik:RadComboBox>--%>
                                                <asp:DropDownList ID="effectiveDate" runat="server" CssClass="form-control">
                                                     <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td colspan="3">
                                                <asp:RequiredFieldValidator ID="effectiveDateValidator" runat="server" CssClass="required-info" SetFocusOnError="true" ErrorMessage="*Effective date required" ControlToValidate="effectiveDate" ValidationGroup="empInputGroup" InitialValue="0"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name">Plan Type:
                                            </td>
                                            <td class="item-value">
                                                <asp:DropDownList ID="MedTYPE" runat="server" CssClass="form-control">
                                                    <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:RequiredFieldValidator ID="medTypeValidator" runat="server" ErrorMessage="*Please select a medical type" CssClass="required-info" ControlToValidate="MedTYPE" InitialValue="0" ValidationGroup="empInputGroup"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name" colspan="3">Employer Contribution:
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name" style="text-align: right;">For Employees:
                                            </td>
                                            <td class="item-value">
                                                <asp:DropDownList ID="contributionType" runat="server" CssClass="form-control" Height="34px" Width="100px" OnSelectedIndexChanged="contributionType_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Text="Percentage" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Amount" Value="1"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="item-value">
                                                <asp:Label ID="amt" runat="server" Text="$" Height="34px" Font-Bold="true" Visible="false"></asp:Label>
                                                &nbsp;
                                                    <telerik:RadTextBox ID="empContribution" runat="server" CssClass="form-control" Height="34px" Width="60" MaxLength="3" Text="50"></telerik:RadTextBox>
                                                &nbsp;
                                                    <asp:Label ID="pct" runat="server" Text="%" Height="34px" Font-Bold="true"></asp:Label>
                                                <asp:RangeValidator ID="empRange" runat="server" ControlToValidate="empContribution" CssClass="required-info" MinimumValue="50" MaximumValue="100" ValidationGroup="empInputGroup" Visible="true" ErrorMessage="*Value has to be a number between 50 and 100" Type="Integer"></asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr class="row">
                                            <td class="item-name" style="text-align: right;">For Dependents:
                                            </td>
                                            <td class="item-value">
                                                <asp:DropDownList ID="dependentDDL" runat="server" CssClass="form-control" Height="34px" Width="100px" OnSelectedIndexChanged="dependentDDL_SelectedIndexChanged" AutoPostBack="true">
                                                    <asp:ListItem Text="Percentage" Value="0"></asp:ListItem>
                                                    <asp:ListItem Text="Amount" Value="1"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td class="item-value">
                                                <asp:Label ID="amt2" runat="server" Text="$" Height="34px" Font-Bold="true" Visible="false"></asp:Label>
                                                &nbsp;
                                                    <telerik:RadTextBox ID="dependentInput" runat="server" CssClass="form-control" Height="34px" Width="60" MaxLength="3" Text="0"></telerik:RadTextBox>
                                                &nbsp;
                                                    <asp:Label ID="pct2" runat="server" Text="%" Height="34px" Font-Bold="true"></asp:Label>
                                                <asp:RangeValidator ID="dependentRange" runat="server" ControlToValidate="dependentInput" CssClass="required-info" MinimumValue="0" MaximumValue="100" ValidationGroup="empInputGroup" Visible="true" Type="Integer" ErrorMessage="*Value has to be a number between 0 and 100"></asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;                                                   
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </asp:PlaceHolder>

                       
                            <div style="text-align: center;">
                                <asp:Button ID="getRates" runat="server" CssClass="btn" Text="Get Rates" OnClick="getRates_Click" ValidationGroup="empInputGroup" />
                            </div>
                           
                            <div>
                                <asp:Literal ID="message" runat="server" Visible="false" />
                            </div>
                            <div style="font-size:14px; font-weight:bold; margin-bottom:10px;">
                                <asp:Literal ID="inst1" Text="1. Select plan(s) " runat="server" Visible="false"></asp:Literal>
                            </div>
                            <div style="font-size:14px; font-weight:bold; margin-bottom:10px;">
                                <asp:Literal ID="inst2" Text="2. Click on Show Details to view individual rates" runat="server" Visible="false"></asp:Literal>                                
                            </div>  
                            <div style="font-size:14px; font-weight:bold; margin-bottom:10px;">
                                <asp:Literal ID="inst3" Text="3. Click on export to download quote" runat="server" Visible="false"></asp:Literal>                                
                            </div>                          
                            <div style=" margin-bottom:10px;">
                                <asp:CheckBox ID="details" runat="server" Text="Show Details" Checked="false" Font-Size="14px" Font-Bold="true" ForeColor="Black" OnCheckedChanged="details_CheckedChanged" AutoPostBack="true" Visible="false"  />
                               
                            </div>
                           
                            <asp:PlaceHolder ID="ratesGrid" runat="server">
                                <telerik:RadGrid ID="QQRatesGrid" runat="server" AllowMultiRowSelection="true" Skin="MetroTouch" CssClass="ChoosePlanGird" GridLines="None" ShowStatusBar="true" AutoGenerateColumns="false" AllowSorting="true" AllowPaging="true" OnPageIndexChanged="QQRatesGrid_PageIndexChanged" OnPageSizeChanged="QQRatesGrid_PageSizeChanged" OnSortCommand="QQRatesGrid_SortCommand">
                                    <MasterTableView DataKeyNames="PLANID">
                                        <CommandItemSettings ShowAddNewRecordButton="false" />
                                        <Columns>
                                            <telerik:GridClientSelectColumn UniqueName="CompareCheckBox" HeaderText="Compare" >
                                            </telerik:GridClientSelectColumn>
                                            <telerik:GridBoundColumn DataField="PLANID" UniqueName="PLANID" Visible="true" Display="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="EMPLOYEENAME" HeaderText="Family Name" SortExpression="EMPLOYEENAME" UniqueName="EMPLOYEENAME" Visible="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="piaPlanTierDesc" HeaderText="Type" SortExpression="piaPlanTierDesc" UniqueName="piaPlanTierDesc" Visible="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="Plan Name" UniqueName="PLANNAME" SortExpression="PLANNAME" Visible="false"></telerik:GridBoundColumn>
                                            <telerik:GridNumericColumn DataField="RATES" HeaderText="Employer Premium" UniqueName="RATES" SortExpression="RATES" Visible="false" DataType="System.Decimal" NumericType="Currency"></telerik:GridNumericColumn>
                                            <telerik:GridNumericColumn DataField="employeeRates" HeaderText="Employee Contribution" SortExpression="employeeRates" UniqueName="EMPLOYEERATES" Visible="false" DataType="System.Decimal" NumericType="Currency"></telerik:GridNumericColumn>
                                            <telerik:GridBoundColumn DataField="NOTE" HeaderText="Notes" SortExpression="NOTE" UniqueName="NOTE" Visible="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="CARRIERID" HeaderText="Carrier" SortExpression="CARRIERID" UniqueName="CARRIERID" Visible="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn DataField="PLANNAME" HeaderText="Plan Name" UniqueName="PLANNAME2" SortExpression="PLANNAME" Visible="false"></telerik:GridBoundColumn>
                                            <telerik:GridBoundColumn UniqueName="BodyCount" DataField="BodyCount" HeaderText="Billing Count" SortExpression="BodyCount" Visible="false"></telerik:GridBoundColumn>
                                            <telerik:GridNumericColumn DataField="ratesTotal" HeaderText="Employer Monthly Premium " UniqueName="RATESTOTAL" SortExpression="RATESTOTAL" Visible="false" DataType="System.Decimal" NumericType="Currency"></telerik:GridNumericColumn>
                                            <telerik:GridNumericColumn DataField="employeeRatesTotal" HeaderText="Employee Monthly Contribution" UniqueName="EMPLOYEERATESTOTAL" SortExpression=" EMPLOYEERATESTOTAL" Visible="false" DataType="System.Decimal" NumericType="Currency"></telerik:GridNumericColumn>                                            
                                        </Columns>
                                    </MasterTableView>

                                    <ClientSettings>
                                        <Selecting AllowRowSelect="true" EnableDragToSelectRows="false" />
                                    </ClientSettings>

                                </telerik:RadGrid>                                
                            </asp:PlaceHolder>
                            <div>

                            </div>
                            <div style="text-align:left">
                                <asp:Button ID="Submit" runat="server" CssClass="btn" Text="Compare" OnClientClick="buttonPress()"  Visible="false"    />  
                                <asp:Button ID="Export" runat="server" CssClass="btn" Text="Export"
                                    Visible="false" OnClientClick="exportPress()" />
                                <asp:Button ID="Save" runat="server" CssClass="btn btn-danger" style="background-color:red;" Text="Save" Visible="false" OnClientClick="savePress()" />
                            </div>                                                                                 
                            <!-- content end -->
                        </telerik:RadAjaxPanel>
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
                                function buttonPress() {
                                    var clickButton = document.getElementById("<%= newPage.ClientID %>");
                                    clickButton.click();
                                }
                                function exportPress() {
                                    var clickButton = document.getElementById("<%= expNewPage.ClientID %>");
                                    clickButton.click();
                                }
                                function savePress() {
                                    var clickButton = document.getElementById("<%= SavePage.ClientID %>");
                                    clickButton.click();
                                }
                                
                            </script>
                        </telerik:RadCodeBlock> 
                        <asp:Button ID="newPage" style="display:none" runat="server" OnClick="Submit_Click" />
                        <asp:Button ID="expNewPage" style="display:none" runat="server" OnClick="Export_Click" />
                        <asp:Button ID="SavePage" style="display:none" runat="server" OnClick="SavePage_Click" />
                    </div>
                </fieldset>
            </div>
        </div>
    </div> 
</asp:Content>
