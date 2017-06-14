<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="OETypes.aspx.cs" Inherits="Pibt.Admin.OETypes" %>

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
    <a href="/">Home</a> > OE Types Management
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <telerik:RadGrid ID="RadGridOETypes" runat="server" AllowPaging="True" Height="100%"
        AutoGenerateColumns="False" GridLines="None" AllowSorting="True" CellSpacing="0"
        AllowAutomaticInserts="False" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True"
        OnItemCommand="RadGridOETypes_ItemCommand" DataSourceID="odsOETypes" OnItemUpdated="RadGridOETypes_ItemUpdated"
        OnUpdateCommand="RadGridOETypes_UpdateCommand">
        <PagerStyle Mode="NextPrevAndNumeric" />
        <GroupingSettings CaseSensitive="false" />
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="ID" AllowSorting="true"
            Height="100%" PageSize="16" CommandItemDisplay="Top" CommandItemSettings-ShowAddNewRecordButton="false" CommandItemSettings-ShowRefreshButton="false" DataSourceID="odsOETypes">
            <Columns>
                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                    <ItemStyle CssClass="MyImageButton"></ItemStyle>
                </telerik:GridEditCommandColumn>
                <telerik:GridBoundColumn DataField="ID" SortExpression="ID" UniqueName="ID" HeaderText="ID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Description" SortExpression="Description" UniqueName="Description"
                    HeaderText="Description">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Usage" SortExpression="Usage" UniqueName="Usage"
                    HeaderText="Usage">
                </telerik:GridBoundColumn>
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
                                    MaxLength="30" Width="260"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="tbDescription"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                Usage:
                            </td>
                            <td class="item-value">
                                <telerik:RadEditor ID="ContentEditor" Height="500" Skin="Telerik" Content='<%# Bind( "Usage" ) %>'
                                    RenderMode="Classic" MaxHtmlLength="4000" Width="800" EnableResize="false" runat="server">
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
    <asp:ObjectDataSource ID="odsOETypes" runat="server" SelectMethod="GetOETypes" TypeName="Pibt.BLL.EnrollmentForm"
        UpdateMethod="UpdateOETypes" >
        <UpdateParameters>
            <asp:Parameter Name="id" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="usage" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
