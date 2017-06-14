<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OnlineQuoteEmployee.aspx.cs" Inherits="Pibt.OnlineQuote" MasterPageFile="~/Website.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">                
                <fieldset>
                    <legend style="font-size:x-large"><b>Online Quote </b></legend>
                    <hr />
                    <div style="font-size:14px; font-weight:bold; margin-bottom:10px;">To add employee details, simply enter the required information below
                        (Employee’s name, Type, Gender and Birthdate) and then click on the “Add to Quote” box.  Once you have completed entering the employee
                        information and clicking the “Add to Quote” box, you can now enter any additional family members by opening the “Type” box and selecting 
                        either “spouse” or “child”.  Finish by clicking on the “Add to Quote” box before entering any additional family members.</div>
                    <div style="font-size:14px; font-weight:bold; margin-bottom:10px;">To enter the next employee, click on the “Add Another Employee” box.</div>
                    <div style="font-size:14px; font-weight:bold;">When you have finished adding employees, click on the “Next” box appearing at the bottom of the screen.</div>                    
                    <div class="customer-info-box">                        
                        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">                           
                        </telerik:RadAjaxLoadingPanel>
                        <telerik:RadFormDecorator ID="RadFormDecorator2" DecoratedControls="All" ControlsToSkip="Fieldset,CheckBoxes"
                            DecorationZoneID="mainzone" runat="server" />
                        <telerik:RadAjaxPanel ID="RadAjaxPanel1" EnableAJAX="true" ClientEvents-OnRequestStart="onRequestStart" ClientEvents-OnResponseEnd="OnResponseEnd" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">                            
                            <%-- content start --%>
                            <asp:Literal ID="lblCreationMessage" runat="server" EnableViewState="False"></asp:Literal>
                            <asp:PlaceHolder ID="CountOver" runat="server" Visible="false"></asp:PlaceHolder>
                            <asp:Literal ID="countError" runat="server" Visible="false"></asp:Literal>
                            <asp:PlaceHolder runat="server" ID="phEmployeeDetails">
                                <div class="section-title">
                                    Employee Detail:
                                </div>
                                <div class="clear">
                                </div>
                                <div class="section-body">
                                    <table class="table-container">
                                        <tbody>
                                            <tr class="row">
                                                <td class="item-name">
                                                    Employee Count:
                                                </td>
                                                <td class="item-value">
                                                    <asp:Label ID="eeCount" runat="server" CssClass="label" Font-Bold="true" ForeColor="Red" ></asp:Label>
                                                     
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                             <tr class="row">                                                
                                                <td class="item-value" colspan="3">
                                                    (Employee count will update as you enter employees)       
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">Employee name:
                                                </td>
                                                <td class="item-value">
                                                    <telerik:RadTextBox ID="tbName" runat="server" CssClass="form-control" Width="260" MaxLength="60" Height="34px"></telerik:RadTextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="NameValidator" runat="server" CssClass="required-info" SetFocusOnError="true"
                                                        ErrorMessage="*Family name is a required field" ControlToValidate="tbName" ValidationGroup="inputGroup"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">Type:
                                                </td>
                                                <td class="item-value">
                                                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control" Width="160">
                                                        <asp:ListItem Value="4" Text="Select"></asp:ListItem>
                                                        <asp:ListItem Value="0" Text="Employee"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="Spouse/Domestic Partner"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Child"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="ddlTypeValidator" runat="server" ErrorMessage="*Please select type" CssClass="required-info" ControlToValidate="ddlType" ValidationGroup="inputGroup" InitialValue="4"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">Gender:
                                                </td>
                                                <td class="item-value">
                                                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" Width="100">
                                                        <asp:ListItem Text="Select" Value="4"></asp:ListItem>
                                                        <asp:ListItem Text="Male" Value="Y"></asp:ListItem>
                                                        <asp:ListItem Text="Female" Value="N"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="ddlGenderValidator" runat="server" ErrorMessage="*Please select gender" CssClass="required-info" ControlToValidate="ddlGender" ValidationGroup="inputGroup" InitialValue="4"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3">&nbsp;</td>
                                            </tr>
                                            <tr class="row">
                                                <td class="item-name">Birthdate:
                                                </td>
                                                <td class="item-value">
                                                    <telerik:RadDatePicker ID="dpBirthDate"  MinDate="1900/1/1" runat="server" Height="34" >
                                                    </telerik:RadDatePicker>
                                                    (MM/DD/YYYY)

                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="required-info" SetFocusOnError="true"
                                                        ErrorMessage="*Birthdate is a required field" ControlToValidate="dpBirthDate" ValidationGroup="inputGroup">
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div style="text-align: center">
                                        <asp:Button ID="add" runat="server" Text="Add to Quote" CssClass="btn" ValidationGroup="inputGroup" OnClick="add_Click" />
                                        &nbsp;
                                    <asp:Button ID="familyAdd" runat="server" Text="Add Another Employee" CssClass="btn" OnClick="familyAdd_Click" />
                                        &nbsp;
                                        <asp:Button ID="deleteAll" runat="server" Text="Delete All Below" style="background-color:red;" CssClass="btn btn-danger" OnClick="deleteAll_Click" />
                                    </div>
                                </div>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="employeeGrid" runat="server">
                                <div class="section-title">
                                    Employee Grid
                                </div>
                                <div class="clear">
                                </div>
                                <div class="section-body">
                                    <telerik:RadGrid ID="employeeRadGrid" DataKeyNames="ROWID" AllowMultiRowSelection="false" runat="server" AutoGenerateColumns="false" AllowSorting="true" AllowPaging="false" Skin="MetroTouch"  CssClass="ChoosePlanGird" GridLines="None" ShowStatusBar="true" OnNeedDataSource="employeeGrid_NeedDataSource" OnDeleteCommand="employeeRadGrid_DeleteCommand"
                                        OnUpdateCommand="employeeRadGrid_UpdateCommand">
                                        <MasterTableView CommandItemSettings-ShowAddNewRecordButton="false" DataKeyNames="ROWID">
                                            <SortExpressions>
                                                <telerik:GridSortExpression FieldName="EMPLOYEENAME" SortOrder="Descending" />
                                            </SortExpressions>
                                            <Columns>
                                                <telerik:GridBoundColumn SortExpression="ROWID" UniqueName="ROWID" HeaderText="ROWID" DataField="ROWID" Display="false"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn SortExpression="FAMILYID" UniqueName="FAMILYID" HeaderText="FAMILYID" DataField="FAMILYID" Display="false"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn SortExpression="CARTID" UniqueName="CARTID" HeaderText="CARTID" DataField="CARTID" Visible="false"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn SortExpression="EMPLOYEETYPEID" UniqueName="EMPLOYEETYPEID" HeaderText="EMPLOYEETYPEID" DataField="EMPLOYEETYPEID" Visible="false"></telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn SortExpression="EMPLOYEENAME" UniqueName="EMPLOYEENAME" HeaderText="Employee Name"
                                                    DataField="EMPLOYEENAME">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn SortExpression="EMPLOYEETYPE" UniqueName="EMPLOYEETYPE" HeaderText="Employee Type"
                                                    DataField="EMPLOYEETYPE">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridBoundColumn SortExpression="BIRTHDATE" UniqueName="Birthdate" HeaderText="BIRTHDATE"
                                                    DataField="BIRTHDATE" DataFormatString="{0:MM/dd/yyyy}">
                                                </telerik:GridBoundColumn>
                                                <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                                                </telerik:GridEditCommandColumn>                                                
                                                <telerik:GridButtonColumn UniqueName="DELETECOLUMN" Text="Delete" CommandName="DELETE"></telerik:GridButtonColumn>
                                            </Columns>
                                            <EditFormSettings UserControlName="~/UserControl/CtlOnlineQuote.ascx" EditFormType="WebUserControl">
                                                <EditColumn UniqueName="EditCommandColumn1"></EditColumn>
                                            </EditFormSettings>
                                        </MasterTableView>
                                    </telerik:RadGrid>
                                </div>
                            </asp:PlaceHolder>
                            <%-- content end --%>
                        </telerik:RadAjaxPanel>
                        <telerik:RadCodeBlock runat="server">
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
                        <div style="text-align: center;">
                            <asp:Button ID="submit" CssClass="btn" runat="server" ValidationGroup="empInputGroup" Text="Next" OnClick="submit_Click"  />
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</asp:Content>
