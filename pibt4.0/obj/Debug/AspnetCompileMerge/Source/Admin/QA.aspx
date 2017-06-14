<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true"
    CodeBehind="QA.aspx.cs" Inherits="Pibt.Admin.QA" %>

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
    <a href="/">Home</a> > Q&A Management
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSearch">
        <fieldset>
            <legend>Quick Search</legend>
            <table class="table-container">
                <tr class="row">
                    <td class="item-name">
                    Key Words
                    </td>
                    <td class="item-value">
                    <asp:TextBox ID="txtKeyWord" runat="server"></asp:TextBox>
                    </td>
                    <td class="item-name">
                    </td>
                    <td class="item-value">
                    </td>
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
    <telerik:RadGrid ID="RadGridQA" runat="server" AllowPaging="True" Height="100%" AutoGenerateColumns="False"
        GridLines="None" AllowSorting="True" CellSpacing="0" AllowAutomaticInserts="True" CssClass=""
        AllowAutomaticDeletes="True" AllowAutomaticUpdates="True" OnItemCommand="RadGridQA_ItemCommand"
        DataSourceID="odsQA" OnItemDeleted="RadGridQA_ItemDeleted" OnItemInserted="RadGridQA_ItemInserted"
        OnItemUpdated="RadGridQA_ItemUpdated" 
        oninsertcommand="RadGridQA_InsertCommand" 
        onupdatecommand="RadGridQA_UpdateCommand">
        <PagerStyle Mode="NextPrevAndNumeric" />
        <GroupingSettings CaseSensitive="false" />
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="QAID" AllowSorting="true"
            Height="100%" PageSize="16" CommandItemDisplay="TopAndBottom" CommandItemSettings-ShowAddNewRecordButton="true"
            DataSourceID="odsQA">
            <CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>
            <RowIndicatorColumn Visible="True" FilterControlAltText="Filter RowIndicator column">
            </RowIndicatorColumn>
            <ExpandCollapseColumn Visible="True" FilterControlAltText="Filter ExpandColumn column">
            </ExpandCollapseColumn>
            <Columns>
                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                    <ItemStyle CssClass="MyImageButton"></ItemStyle>
                </telerik:GridEditCommandColumn>
                <telerik:GridBoundColumn DataField="QAID" SortExpression="QAID" UniqueName="QAID" HeaderText="ID" Visible="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="QUESTION" SortExpression="QUESTION" UniqueName="QUESTION" HeaderText="Question">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="KEYWORDS" SortExpression="KEYWORDS" UniqueName="KEYWORDS" HeaderText="Keywords">
                </telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn DataField="ISTOP" SortExpression="ISTOP" UniqueName="ISTOP" HeaderText="Show In Top">
                    <ItemStyle />
                </telerik:GridCheckBoxColumn>
                <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="CREATEDDATE" HeaderText="Create Date" SortExpression="CREATEDDATE"
                    UniqueName="CREATEDDATE">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CREATEDBY" HeaderText="Created By" SortExpression="CREATEDBY" UniqueName="CREATEDBY">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataFormatString="{0:MM/dd/yyyy}" DataField="MODIFIEDDATE" HeaderText="Modified Date" SortExpression="MODIFIEDDATE"
                    UniqueName="MODIFIEDDATE">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MODIFIEDBY" HeaderText="Modified By" SortExpression="MODIFIEDBY"
                    UniqueName="MODIFIEDBY">
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
                    <asp:TextBox ID="tbID" runat="server" Text='<%# Eval( "QAID" ) %>' Visible="False">
                    </asp:TextBox>
                    <table class="table-container">
                        <tr class="row">
                            <td class="item-name">
                                Question:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbQuestion" Text='<%# Bind( "QUESTION" ) %>' runat="server" MaxLength="1000"
                                    Width="800"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvQuestion" runat="server" ControlToValidate="tbQuestion"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                Show in top:
                            </td>
                            <td class="item-value">
                              <asp:HiddenField ID="hideTop" OnDataBinding="hideTop_DataBinding" Value='<%# Eval( "ISTOP" ) %>'
                                    runat="server" />  <asp:CheckBox ID="chkTop" runat="server"/>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                Key Words:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbKeyWords" Text='<%# Bind( "KEYWORDS" ) %>' runat="server" MaxLength="256"
                                    Width="300"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbKeyWords"
                                    CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">
                                Answer:
                            </td>
                            <td class="item-value">
                            <telerik:RadEditor ID="ContentEditor" Height="500" Skin="Telerik" Content='<%# Bind( "ANSWER" ) %>'
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
    <asp:ObjectDataSource ID="odsQA" runat="server" SelectMethod="GetList" TypeName="Pibt.BLL.QA"
        UpdateMethod="Update" InsertMethod="Insert" OnInserting="odsQA_Inserting" OnUpdating="odsQA_Updating"
        DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="qaId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="answer" Type="String" />
            <asp:Parameter Name="isTop" Type="Boolean" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="qaId" Type="String" />
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="answer" Type="String" />
            <asp:Parameter Name="isTop" Type="Boolean" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsQASearching" runat="server" 
        SelectMethod="Searching" TypeName="Pibt.BLL.QA"
        UpdateMethod="Update" InsertMethod="Insert" OnInserting="odsQA_Inserting" OnUpdating="odsQA_Updating"
        DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="qaId" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="answer" Type="String" />
            <asp:Parameter Name="isTop" Type="Boolean" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txtKeyWord" Name="keyWord" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="qaId" Type="String" />
            <asp:Parameter Name="question" Type="String" />
            <asp:Parameter Name="answer" Type="String" />
            <asp:Parameter Name="isTop" Type="Boolean" />
            <asp:Parameter Name="keyWords" Type="String" />
            <asp:Parameter Name="updatedBy" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>
</asp:Content>
