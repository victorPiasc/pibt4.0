<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="NewsList.aspx.cs" Inherits="Pibt.Admin.NewsList" %>

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
    <a href="/">Home</a> > News Management
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
                        <asp:Button ID="btnClear" CssClass="btn" Text="Clear" runat="server" CausesValidation="false"
                            OnClick="btnClear_Click" />
                    </td>
                </tr>
            </table>
        </fieldset>
    </asp:Panel>
    <br />
    <asp:Label ID="lblGridHeader" runat="server"></asp:Label>
    <telerik:RadGrid ID="RadGridNews" runat="server" AllowPaging="True" Height="100%" OnItemDataBound="binder" AutoGenerateColumns="False" AllowSorting="True"
        AllowAutomaticInserts="True" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True" OnItemCommand="RadGridNews_ItemCommand" DataSourceID="odsNews"
        OnInsertCommand="RadGridNews_InsertCommand" OnItemInserted="RadGridNews_ItemInserted" OnItemUpdated="RadGridNews_ItemUpdated" Skin="MetroTouch"
        OnUpdateCommand="RadGridNews_UpdateCommand">
        <PagerStyle Mode="NextPrevAndNumeric" />
        <GroupingSettings CaseSensitive="false" />
        <ClientSettings>
            <KeyboardNavigationSettings AllowSubmitOnEnter="false" />
        </ClientSettings>
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="NEWSID" AllowSorting="true"
            Height="100%" PageSize="16" CommandItemDisplay="TopAndBottom" CommandItemSettings-ShowAddNewRecordButton="true"
            DataSourceID="odsNews">
            <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
            <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
            </RowIndicatorColumn>
            <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
            </ExpandCollapseColumn>
            <Columns>
                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                    <ItemStyle CssClass="MyImageButton"></ItemStyle>
                </telerik:GridEditCommandColumn>
                <telerik:GridHyperLinkColumn SortExpression="NEWSID" UniqueName="NEWSID" HeaderText="View ID" DataNavigateUrlFields="NewsId"
                    DataNavigateUrlFormatString="/NewsDetails.aspx?id={0}" DataTextField="NEWSID" DataTextFormatString="{0}">
                    <HeaderStyle Wrap="False" Font-Bold="False"></HeaderStyle>
                    <ItemStyle Wrap="True" Font-Underline="true" HorizontalAlign="Left" />
                </telerik:GridHyperLinkColumn>
                <telerik:GridBoundColumn DataField="NEWSTITLE" SortExpression="NEWSTITLE" UniqueName="NEWSTITLE" HeaderText="Title">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="NEWSDATE" SortExpression="NEWSDATE"
                    UniqueName="NEWSDATE" HeaderText="News Date">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="KeyWords" SortExpression="KeyWords" UniqueName="KeyWords"
                    HeaderText="Key Words">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="CREATEDDATE" HeaderText="Create Date" SortExpression="CREATEDDATE"
                    UniqueName="CREATEDDATE">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="MODIFIEDDATE" HeaderText="Modified Date" SortExpression="MODIFIEDDATE"
                    UniqueName="MODIFIEDDATE">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MODIFIEDBY" HeaderText="Modified By" SortExpression="MODIFIEDBY" UniqueName="MODIFIEDBY">
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn ConfirmText="Are you sure to delete this record?" ConfirmDialogType="Classic"
                    ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                    UniqueName="DeleteColumn">
                </telerik:GridButtonColumn>
            </Columns>
            <EditFormSettings EditFormType="Template" InsertCaption="Insert">
                <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                </EditColumn>
                <FormTemplate>
                    <asp:TextBox ID="tbID" runat="server" Text='<%# Eval( "NEWSID" ) %>' Visible="False">
                    </asp:TextBox>
                    <table class="table-container">
                        <tr class="row">
                            <td class="item-name">Title:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbTitle" Text='<%# Bind( "NEWSTITLE" ) %>' runat="server" MaxLength="50"
                                    Width="300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="tbTitle" CssClass="required-info"
                                    ErrorMessage="Title is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Date:
                            </td>
                            <td class="item-value">
                                <asp:HiddenField ID="hideNewsDate" OnDataBinding="hideNewsDate_DataBinding" Value='<%# Eval( "NEWSDATE" ) %>'
                                    runat="server" />
                                <telerik:RadDatePicker ID="dtPicker" runat="server">
                                </telerik:RadDatePicker>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dtPicker" CssClass="required-info"
                                    ErrorMessage="Date is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Key Words:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbKeyWords" Text='<%# Bind( "KEYWORDS" ) %>' runat="server" MaxLength="256"
                                    Width="300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbKeyWords" CssClass="required-info"
                                    ErrorMessage="An entry for the keywords field is required" Display="Dynamic" ValidationGroup="CustomerInfo">
                                </asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Priority:</td>
                            <td class="item-value">

                                <asp:DropDownList ID="tbPriority" runat="server">
                                    <asp:ListItem Value="0" Text="High"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="Medium"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Low"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Content:
                            </td>
                            <td class="item-value">
                                <telerik:RadEditor ID="ContentEditor" Height="500" Skin="Telerik" Content='<%# Bind( "NEWSCONTENT" ) %>'
                                    RenderMode="Classic" Width="800" EnableResize="false" runat="server">
                                    <FlashManager AllowFileExtensionRename="false" MaxUploadFileSize="1024000" ViewPaths="~/UploadFiles"
                                        UploadPaths="~/UploadFiles" DeletePaths="~/UploadFiles" />
                                    <ImageManager EnableImageEditor="false" AllowFileExtensionRename="false" MaxUploadFileSize="1024000"
                                        ViewPaths="~/UploadFiles" UploadPaths="~/UploadFiles" DeletePaths="~/UploadFiles" />
                                    <DocumentManager AllowFileExtensionRename="false" MaxUploadFileSize="1024000" ViewPaths="~/UploadFiles"
                                        UploadPaths="~/UploadFiles" DeletePaths="~/Documents" />
                                </telerik:RadEditor>
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
    <asp:ObjectDataSource ID="odsNews" runat="server" DeleteMethod="Delete" SelectMethod="GetList"
        TypeName="Pibt.BLL.News" UpdateMethod="Update" InsertMethod="Insert" OnInserting="odsNews_Inserting"
        OnUpdating="odsNews_Updating">
        <DeleteParameters>
            <asp:Parameter Name="newsId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="newsTitle" Type="String" />
            <asp:Parameter Name="newsDate" Type="DateTime" />
            <asp:Parameter Name="startDate" Type="DateTime" />
            <asp:Parameter Name="endDate" Type="DateTime" />
            <asp:Parameter Name="newsContent" Type="String" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="updatedBy" Type="String" />
            <asp:Parameter Name="priorityLevel" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="newsId" Type="String" />
            <asp:Parameter Name="newsTitle" Type="String" />
            <asp:Parameter Name="newsDate" Type="DateTime" />
            <asp:Parameter Name="startDate" Type="DateTime" />
            <asp:Parameter Name="endDate" Type="DateTime" />
            <asp:Parameter Name="newsContent" Type="String" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="updatedBy" Type="String" />
            <asp:Parameter Name="priorityLevel" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsNewsSearching" runat="server"
        DeleteMethod="Delete" SelectMethod="Searching"
        TypeName="Pibt.BLL.News" UpdateMethod="Update" InsertMethod="Insert" OnInserting="odsNews_Inserting"
        OnUpdating="odsNews_Updating">
        <DeleteParameters>
            <asp:Parameter Name="newsId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="newsTitle" Type="String" />
            <asp:Parameter Name="newsDate" Type="DateTime" />
            <asp:Parameter Name="newsContent" Type="String" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtKeyWord" Name="keyWord" PropertyName="Text"
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="newsId" Type="String" />
            <asp:Parameter Name="newsTitle" Type="String" />
            <asp:Parameter Name="newsDate" Type="DateTime" />
            <asp:Parameter Name="newsContent" Type="String" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
