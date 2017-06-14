<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="LegalDocs.aspx.cs" Inherits="Pibt.Admin.LegalDocs" %>

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
    <a href="/">Home</a> > Legal Doc Management
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <telerik:RadGrid ID="RadGridLegalDocs" runat="server" AllowPaging="True" Height="100%"
        AutoGenerateColumns="False" GridLines="None" AllowSorting="True" CellSpacing="0"
        AllowAutomaticInserts="True" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True"
        OnItemCommand="RadGridLegalDocs_ItemCommand" DataSourceID="odsLegalDocs" OnInsertCommand="RadGridLegalDocs_InsertCommand"
        OnItemInserted="RadGridLegalDocs_ItemInserted" OnItemUpdated="RadGridLegalDocs_ItemUpdated"
        OnUpdateCommand="RadGridLegalDocs_UpdateCommand">
        <PagerStyle Mode="NextPrevAndNumeric" />
        <GroupingSettings CaseSensitive="false" />
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" AllowSorting="true"
            Height="100%" PageSize="16" CommandItemDisplay="Top" CommandItemSettings-ShowRefreshButton="true"
            CommandItemSettings-ShowAddNewRecordButton="true" DataSourceID="odsLegalDocs">
            <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
            <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
            </RowIndicatorColumn>
            <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
            </ExpandCollapseColumn>
            <Columns>
                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                    <ItemStyle CssClass="MyImageButton"></ItemStyle>
                </telerik:GridEditCommandColumn>
                <telerik:GridBoundColumn DataField="ID" SortExpression="ID" UniqueName="ID" HeaderText="ID#">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CarrierId" SortExpression="CarrierId" UniqueName="CarrierId"
                    HeaderText="Carrier Id">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Description" SortExpression="Description" UniqueName="Description"
                    HeaderText="Description">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MODIFIED" HeaderText="MODIFIED DATE" SortExpression="MODIFIED"
                    UniqueName="MODIFIED">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MODIFIEDBY" HeaderText="MODIFIED BY" SortExpression="MODIFIEDBY"
                    UniqueName="MODIFIEDBY">
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn ConfirmText="Are you sure to delete this record?" ConfirmDialogType="Classic"
                    ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                    UniqueName="DeleteColumn">
                </telerik:GridButtonColumn>
            </Columns>
            <EditFormSettings EditFormType="Template" InsertCaption="Inser">
                <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                </EditColumn>
                <FormTemplate>
                    <asp:TextBox ID="tbID" runat="server" Text='<%# Eval( "ID" ) %>' Visible="False">
                    </asp:TextBox>
                    <table class="table-container">
                        <tr class="row">
                            <td class="item-name">
                                Description:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbDescription" Text='<%# Bind( "Description" ) %>' runat="server"
                                    MaxLength="200" Width="200"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="tbDescription"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                Carrier Id:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbCarrierId" Text='<%# Bind( "CarrierId" ) %>' runat="server" MaxLength="3"
                                    Width="150"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCarrierId" runat="server" ControlToValidate="tbCarrierId"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rfCarrierId" runat="server" ControlToValidate="tbCarrierId" MinimumValue="0" MaximumValue="999"
                                    CssClass="required-info" ErrorMessage="It must be 0-999" ValidationGroup="CustomerInfo"></asp:RangeValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                Legal Content:
                            </td>
                            <td class="item-value">
                                <telerik:RadEditor ID="ContentEditor" Height="500" Skin="Telerik" Content='<%# Bind( "LEGALCONTENTHTML" ) %>'
                                    RenderMode="Classic" Width="800" EnableResize="false" runat="server">
                                    <FlashManager AllowFileExtensionRename="false" MaxUploadFileSize="1024000" ViewPaths="~/UploadFiles"
                                        UploadPaths="~/UploadFiles" DeletePaths="~/UploadFiles" />
                                    <ImageManager EnableImageEditor="false" AllowFileExtensionRename="false" MaxUploadFileSize="1024000"
                                        ViewPaths="~/UploadFiles" UploadPaths="~/UploadFiles" DeletePaths="~/UploadFiles" />
                                    <DocumentManager AllowFileExtensionRename="false" MaxUploadFileSize="1024000" ViewPaths="~/UploadFiles"
                                        UploadPaths="~/UploadFiles" DeletePaths="~/Documents" />
                                </telerik:RadEditor>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ContentEditor"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <asp:Label ID="lblErrorMsg" runat="server" CssClass="red"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
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
    <div class="note-list">
    Note: You can't delete the special ID=0 record. 
    </div>
    <asp:ObjectDataSource ID="odsLegalDocs" runat="server" DeleteMethod="Delete" SelectMethod="GetList"
        TypeName="Pibt.BLL.LegalDoc" UpdateMethod="Update" InsertMethod="Insert" OnInserting="odsLegalDocs_Inserting"
        OnUpdating="odsLegalDocs_Updating">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="legalContentHtml" Type="String" />
            <asp:Parameter Name="legalContent" Type="String" />
            <asp:Parameter Name="carrierId" Type="Int32" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="legalContentHtml" Type="String" />
            <asp:Parameter Name="legalContent" Type="String" />
            <asp:Parameter Name="carrierId" Type="Int32" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
