<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="DocumentLibrary.aspx.cs" Inherits="Pibt.Admin.DocumentLibrary" %>

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
    <a href="/">Home</a> > Document Management
                <h2>Document Library</h2>
        <asp:TreeView ID="TreeView1" runat="server">
            <NodeStyle  ForeColor="#000000" />
            <HoverNodeStyle  BackColor="#dddddd"/>
            <SelectedNodeStyle BackColor="#999999" Font-Bold="true"/>
        </asp:TreeView>
        <br /><br />
        <table>
            <tr>
                <td>
                    Type Category Name :
                </td>
                <td>
                    <asp:TextBox ID="NodeNameTextbBox" runat="server"></asp:TextBox>
                    <asp:Button ID="AddCategoryButton" runat="server" Text="Add a New Node" OnClick="AddCategoryButton_Click" />
                </td>
            </tr>
        </table>
        <br />
        <h2>File Upload</h2>
        <table>
            <tr>
                <td>
                    Document Title :
                </td>
                <td>
                    <asp:TextBox ID="DocumentNameTextBox" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    File Upload :
                </td>
                <td>
                    <asp:FileUpload ID="DocumentUpload" runat="server" />
                    <asp:Button ID="UploadButton" runat="server" Text="Upload" OnClick="UploadButton_Click" />
                   
                </td>
            </tr>
        </table>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
        <br />
        <h2>Document List</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="DocumentId" HeaderText="ID" InsertVisible="False" ReadOnly="True"
                    SortExpression="DocumentId" />
                <asp:BoundField DataField="DocumentName" HeaderText="Document Name" SortExpression="DocumentName" />
                <asp:BoundField DataField="DocumentTypeId" HeaderText="Document Type Id" SortExpression="DocumentTypeId" />
                <asp:BoundField DataField="Keywords" HeaderText="Keywords" SortExpression="Keywords" />
                <asp:BoundField DataField="DocumentURL" HeaderText="DocumentURL" SortExpression="DocumentPath" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MaximumASPSQLServer %>"
            SelectCommand="SELECT * FROM [Documents] WHERE ([DocumentTypeId] = @DocumentTypeId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TreeView1" DefaultValue="-1" Name="DocumentTypeId"
                    PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">

</asp:Content>

<%--    <fieldset>
        <legend>Quick Search</legend>
        <table class="table-container">
            <tr class="row">
                <td class="item-name">
                    Key Words
                </td>
                <td class="item-value">
                    <asp:TextBox ID="tbKeyWords" runat="server" MaxLength="256" Width="300"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbKeyWords"
                        CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="vgSearch"></asp:RequiredFieldValidator>
                </td>
                <td class="item-name">
                </td>
                <td class="item-value">
                </td>
                <td>
                    <asp:Button ID="btnSearch" Text="Search" ValidationGroup="vgSearch" runat="server"
                        CssClass="btn" OnClick="btnSearch_Click" />
                    <asp:Button ID="btnClear" Text="Clear" CssClass="btn" runat="server" CausesValidation="false"
                        OnClick="btnClear_Click" />
                </td>
            </tr>
        </table>
    </fieldset>
    <br />
    <asp:Label ID="lblGridHeader" runat="server"></asp:Label>
    <telerik:RadGrid ID="RadGridDoc" runat="server" AllowPaging="True" Height="100%"
        AutoGenerateColumns="False" GridLines="None" AllowSorting="True" CellSpacing="0"
        AllowAutomaticInserts="True" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True"
        OnItemCommand="RadGridDoc_ItemCommand" DataSourceID="odsRadGridDoc" OnInsertCommand="RadGridDoc_InsertCommand"
        OnItemDeleted="RadGridDoc_ItemDeleted" OnItemInserted="RadGridDoc_ItemInserted"
        OnItemUpdated="RadGridDoc_ItemUpdated" OnUpdateCommand="RadGridDoc_UpdateCommand">
        <PagerStyle Mode="NextPrevAndNumeric" />
        <GroupingSettings CaseSensitive="false" />
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="DocumentId" AllowSorting="true"
            Height="100%" PageSize="16" CommandItemDisplay="TopAndBottom" CommandItemSettings-ShowAddNewRecordButton="true"
            DataSourceID="odsRadGridDoc">
            <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
            <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
            </RowIndicatorColumn>
            <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
            </ExpandCollapseColumn>
            <GroupByExpressions>
                <telerik:GridGroupByExpression>
                    <SelectFields>
                        <telerik:GridGroupByField FieldAlias="DocumentTypeName" FieldName="DocumentTypeName">
                        </telerik:GridGroupByField>
                    </SelectFields>
                    <GroupByFields>
                        <telerik:GridGroupByField FieldName="DocumentTypeName"></telerik:GridGroupByField>
                    </GroupByFields>
                </telerik:GridGroupByExpression>
            </GroupByExpressions>
            <Columns>
                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                    <ItemStyle CssClass="MyImageButton"></ItemStyle>
                </telerik:GridEditCommandColumn>
                <telerik:GridBoundColumn DataField="DocumentId" SortExpression="DocumentId" UniqueName="DocumentId"
                    HeaderText="ID#">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DocumentName" SortExpression="DocumentName" UniqueName="DocumentName"
                    HeaderText="TITLE">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DocumentTypeName" Visible="false" SortExpression="DocumentTypeName"
                    UniqueName="DocumentTypeName" HeaderText="Group Name">
                </telerik:GridBoundColumn>
                <telerik:GridHyperLinkColumn DataTextField="DocumentURL" DataNavigateUrlFields="DocumentURL"
                    DataNavigateUrlFormatString="/documents/{0}" SortExpression="DocumentURL" UniqueName="DocumentURL"
                    HeaderText="URL" Target="_blank">
                </telerik:GridHyperLinkColumn>
                <telerik:GridBoundColumn DataField="Sort" SortExpression="Sort" UniqueName="Sort"
                    HeaderText="Order">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="KeyWords" SortExpression="KeyWords" UniqueName="KeyWords"
                    HeaderText="Key Words">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CREATEDDATE" HeaderText="CREATED DATE" SortExpression="CREATEDDATE"
                    UniqueName="CREATEDDATE">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MODIFIEDDATE" HeaderText="MODIFIED DATE" SortExpression="MODIFIEDDATE"
                    UniqueName="MODIFIEDDATE">
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
                    <asp:TextBox ID="tbID" runat="server" Text='<%# Eval( "DocumentId" ) %>' Visible="False">
                    </asp:TextBox>
                    <table class="table-container">
                        <tr class="row">
                            <td class="item-name">
                                Title:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbTitle" Text='<%# Bind( "DocumentName" ) %>' runat="server" MaxLength="50"
                                    Width="300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ControlToValidate="tbTitle"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                Document Type:
                            </td>
                            <td class="item-value">
                                <asp:HiddenField ID="hideDocTypeId" runat="server" Value='<%# Bind( "DocumentTypeId") %>' />
                                <asp:DropDownList ID="ddlDocTypes" runat="server" DataSourceID="odsRegions" DataTextField="DocumentTypeName"
                                    DataValueField="DocumentTypeId">
                                </asp:DropDownList>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsGetDocType"
                                    DataTextField="DocumentTypeName" DataValueField="DocumentTypeId">
                                </asp:DropDownList>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="odsGetDocYear"
                                    DataTextField="DocumentTypeName" DataValueField="DocumentTypeId">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                Key Words:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbKeyWords" Text='<%# Bind( "KeyWords" ) %>' runat="server" MaxLength="256"
                                    Width="300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbKeyWords"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                Order:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbOrder" Text='<%# Bind( "Sort" ) %>' runat="server" MaxLength="8"
                                    Width="30"></asp:TextBox>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbOrder"
                                    MinimumValue="1" MaximumValue="99999" CssClass="required-info" ErrorMessage="It must be 1~99999"
                                    Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbOrder"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name" valign="top">
                                Document Upload:
                            </td>
                            <td class="item-value">
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <div>
                                    <asp:CheckBox ID="chkOverwrite" Text="Overwrite exist" runat="server" /></div>
                                <div>
                                    <asp:HyperLink ID="hyDocumentURL" runat="server" Text='<%# Eval( "DocumentURL")%>'
                                        NavigateUrl='<%# Eval( "DocumentURL","/documents/{0}" ) %>'></asp:HyperLink></div>
                                <div>
                                    <asp:Label ID="lblUploadMsg" runat="server" CssClass="red"></asp:Label></div>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="btnUpdate" OnClientClick="disableAjax()" ValidationGroup="CustomerInfo"
                                    runat="server" CssClass="btn" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                    Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>' />
                                &nbsp;
                                <asp:Button ID="btnCancel" OnClientClick="enableAjax()" runat="server" CausesValidation="False"
                                    CssClass="btn" CommandName="Cancel" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </FormTemplate>
            </EditFormSettings>
            <PagerStyle PageSizeControlType="RadComboBox"></PagerStyle>
        </MasterTableView>
        <GroupingSettings ShowUnGroupButton="true"></GroupingSettings>
        <FilterMenu EnableImageSprites="False">
        </FilterMenu>
    </telerik:RadGrid>

    <br />
    <asp:ObjectDataSource ID="odsGetDocYear" runat="server" SelectMethod="GetDocYear"
        TypeName="Pibt.BLL.Documents"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsGetDocType" runat="server" SelectMethod="GetDocType"
        TypeName="Pibt.BLL.Documents"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsRegions" runat="server" SelectMethod="GetByRegion" TypeName="Pibt.BLL.Documents">
                <SelectParameters>
            <asp:Parameter Name="parentId" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsDocTypes" runat="server" SelectMethod="GetTypeList"
        TypeName="Pibt.BLL.Documents"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsRadGridDoc" runat="server" DeleteMethod="Delete" SelectMethod="GetList"
        TypeName="Pibt.BLL.Documents" UpdateMethod="Update" InsertMethod="Insert" OnInserting="odsRadGridDoc_Inserting"
        OnUpdating="odsRadGridDoc_Updating">
        <DeleteParameters>
            <asp:Parameter Name="documentId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="documentName" Type="String" />
            <asp:Parameter Name="documentTypeId" Type="Int32" />
            <asp:Parameter Name="documentURL" Type="String" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="sort" Type="Int32" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="documentId" Type="String" />
            <asp:Parameter Name="documentName" Type="String" />
            <asp:Parameter Name="documentTypeId" Type="Int32" />
            <asp:Parameter Name="documentURL" Type="String" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="sort" Type="Int32" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsSearching" runat="server" SelectMethod="Searching" TypeName="Pibt.BLL.Documents"
        DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update" OnInserting="odsRadGridDoc_Inserting"
        OnUpdating="odsRadGridDoc_Updating">
        <DeleteParameters>
            <asp:Parameter Name="documentId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="documentName" Type="String" />
            <asp:Parameter Name="documentTypeId" Type="Int32" />
            <asp:Parameter Name="documentURL" Type="String" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="sort" Type="Int32" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="tbKeyWords" Name="keyWord" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="documentId" Type="String" />
            <asp:Parameter Name="documentName" Type="String" />
            <asp:Parameter Name="documentTypeId" Type="Int32" />
            <asp:Parameter Name="documentURL" Type="String" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="sort" Type="Int32" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>--%>