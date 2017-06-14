<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="EventList.aspx.cs" Inherits="Pibt.Admin.EventList" %>

<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
    <input type="button" class="ImgHome" value=" " />
    <a href="/">Home</a> > Event Management
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
        <fieldset>
            <legend>Quick Search</legend>
            <table class="table-container">
                <tr class="row">
                    <td class="item-name">Key Words
                    </td>
                    <td class="item-value">
                        <asp:TextBox ID="txtKeyWord" runat="server"></asp:TextBox>
                    </td>
                    <td class="item-name"></td>
                    <td class="item-value"></td>
                    <td>
                        <asp:Button ID="btnSearch" CssClass="btn" Text="Search" runat="server" OnClick="btnSearch_Click" />
                        <asp:Button ID="btnClear" CssClass="btn" Text="Clear" runat="server" CausesValidation="false" OnClick="btnClear_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </asp:Panel>
    <br />
    <asp:Label ID="lblGridHeader" runat="server"></asp:Label>
    <telerik:RadGrid ID="RadGridEvents" runat="server" AllowPaging="True" Height="100%"
        AutoGenerateColumns="False" GridLines="None" AllowSorting="True" CellSpacing="0"
        AllowAutomaticInserts="True" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True"
        OnItemCommand="RadGridEvents_ItemCommand" DataSourceID="odsEvents" OnInsertCommand="RadGridEvents_InsertCommand"
        OnItemDeleted="RadGridEvents_ItemDeleted" OnItemInserted="RadGridEvents_ItemInserted"
        OnItemUpdated="RadGridEvents_ItemUpdated" OnUpdateCommand="RadGridEvents_UpdateCommand">
        <PagerStyle Mode="NextPrevAndNumeric" />
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings>
            <KeyboardNavigationSettings AllowSubmitOnEnter="false" />
        </ClientSettings>
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="EVENTID" AllowSorting="true"
            Height="100%" PageSize="16" CommandItemDisplay="TopAndBottom" CommandItemSettings-ShowAddNewRecordButton="true"
            DataSourceID="odsEvents">
            <CommandItemSettings ExportToPdfText="Export to PDF" ShowRefreshButton="false"></CommandItemSettings>
            <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
            </RowIndicatorColumn>
            <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
            </ExpandCollapseColumn>
            <Columns>
                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                    <ItemStyle CssClass="MyImageButton"></ItemStyle>
                </telerik:GridEditCommandColumn>
                <telerik:GridBoundColumn DataField="EVENTID" SortExpression="EVENTID" UniqueName="EVENTID" HeaderText="ID" Visible="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="EVENTNAME" SortExpression="EVENTNAME" UniqueName="EVENTNAME" HeaderText="Name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy HH:mm}" DataField="EVENTDATE"
                    SortExpression="EVENTDATE" UniqueName="EVENTDATE" HeaderText="Event Date &amp; Time">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataFormatString="{0:c2}" DataField="COST" SortExpression="COST" UniqueName="COST" HeaderText="Cost">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LOCATION" SortExpression="LOCATION" UniqueName="LOCATION" HeaderText="Location">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="KeyWords" SortExpression="KeyWords" UniqueName="KeyWords" HeaderText="Key Words">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="CREATEDDATE" HeaderText="Create Date" SortExpression="CREATEDDATE"
                    UniqueName="CREATEDDATE">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CreatedBy" HeaderText="Created By" SortExpression="CreatedBy" UniqueName="CreatedBy">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="MODIFIEDDATE" HeaderText="Modified Date" SortExpression="MODIFIEDDATE"
                    UniqueName="MODIFIEDDATE">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MODIFIEDBY" HeaderText="Modified By" SortExpression="MODIFIEDBY" UniqueName="MODIFIEDBY">
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn ConfirmText="Are you sure to delete this record?" ConfirmDialogType="Classic" ConfirmTitle="Delete"
                    ButtonType="ImageButton" CommandName="Delete" Text="Delete" UniqueName="DeleteColumn">
                </telerik:GridButtonColumn>
            </Columns>
            <EditFormSettings EditFormType="Template" InsertCaption="Insert">
                <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                </EditColumn>
                <FormTemplate>
                    <asp:TextBox ID="tbID" runat="server" Text='<%# Eval( "EVENTID" ) %>' Visible="False">
                    </asp:TextBox>
                    <table class="table-container">
                        <tr class="row">
                            <td class="item-name">Name:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbTitle" Text='<%# Bind( "EVENTNAME" ) %>' runat="server" MaxLength="50"
                                    Width="300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="tbTitle"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Cost:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbCost" Text='<%# Bind( "COST","{0:f2}" ) %>' runat="server" MaxLength="20"
                                    Width="100"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator" runat="server" ControlToValidate="tbCost"
                                    CssClass="red" ErrorMessage="It must be in 0~99999999." Display="Dynamic" MaximumValue="99999999.00"
                                    ValidationGroup="CustomerInfo" MinimumValue="0.00"></asp:RangeValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbCost"
                                    CssClass="red" ErrorMessage="Input value was not in a correct format." ValidationGroup="CustomerInfo"
                                    ValidationExpression="^\d+(.\d+)?$"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbCost"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Location:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbLocation" Text='<%# Bind( "LOCATION" ) %>' runat="server" MaxLength="200"
                                    Width="300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbLocation"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Date &amp; Time:
                            </td>
                            <td class="item-value">
                                <asp:HiddenField ID="hideNewsDate" OnDataBinding="hideNewsDate_DataBinding" Value='<%# Eval( "EVENTDATE" ) %>'
                                    runat="server" />
                                <telerik:RadDateTimePicker ID="dtPicker" runat="server" DateInput-DateFormat="MM/dd/yyyy HH:mm">
                                </telerik:RadDateTimePicker>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dtPicker"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Key Words:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbKeyWords" Text='<%# Bind( "KEYWORDS" ) %>' runat="server" MaxLength="256"
                                    Width="300"></asp:TextBox>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Content:
                            </td>
                            <td class="item-value">
                                <telerik:RadEditor ID="ContentEditor" Height="500" Skin="Telerik" Content='<%# Bind( "EVENTCONTENT" ) %>'
                                    RenderMode="Classic" Width="800" EnableResize="false" runat="server">
                                    <FlashManager AllowFileExtensionRename="false" MaxUploadFileSize="1024000" ViewPaths="~/UploadFiles"
                                        UploadPaths="~/UploadFiles" DeletePaths="~/UploadFiles" />
                                    <ImageManager EnableImageEditor="false" AllowFileExtensionRename="false" MaxUploadFileSize="1024000" ViewPaths="~/UploadFiles"
                                        UploadPaths="~/UploadFiles" DeletePaths="~/UploadFiles" />
                                    <DocumentManager AllowFileExtensionRename="false" MaxUploadFileSize="1024000" ViewPaths="~/UploadFiles"
                                        UploadPaths="~/UploadFiles" DeletePaths="~/Documents" />
                                </telerik:RadEditor>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ContentEditor"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="btnUpdate" ValidationGroup="CustomerInfo" runat="server" CssClass="btn"
                                    CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                    Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' />
                                &nbsp;
                                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn"
                                    CommandName="Cancel" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </FormTemplate>
            </EditFormSettings>
            <PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
        </MasterTableView>
        <FilterMenu EnableImageSprites="False">
        </FilterMenu>
    </telerik:RadGrid>
    <asp:ObjectDataSource ID="odsEvents" runat="server" SelectMethod="GetList" TypeName="Pibt.BLL.Events"
        UpdateMethod="Update" InsertMethod="Insert" OnInserting="odsEvents_Inserting"
        OnUpdating="odsEvents_Updating" DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="eventId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="eventName" Type="String" />
            <asp:Parameter Name="cost" Type="Decimal" />
            <asp:Parameter Name="eventDate" Type="DateTime" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="eventContent" Type="String" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="eventId" Type="String" />
            <asp:Parameter Name="eventName" Type="String" />
            <asp:Parameter Name="cost" Type="Decimal" />
            <asp:Parameter Name="eventDate" Type="DateTime" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="eventContent" Type="String" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsEventsSearching" runat="server"
        SelectMethod="Searching" TypeName="Pibt.BLL.Events"
        UpdateMethod="Update" InsertMethod="Insert" OnInserting="odsEvents_Inserting"
        OnUpdating="odsEvents_Updating" DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="eventId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="eventName" Type="String" />
            <asp:Parameter Name="cost" Type="Decimal" />
            <asp:Parameter Name="eventDate" Type="DateTime" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="eventContent" Type="String" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtKeyWord" Name="keyWord" PropertyName="Text"
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="eventId" Type="String" />
            <asp:Parameter Name="eventName" Type="String" />
            <asp:Parameter Name="cost" Type="Decimal" />
            <asp:Parameter Name="eventDate" Type="DateTime" />
            <asp:Parameter Name="location" Type="String" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="eventContent" Type="String" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
