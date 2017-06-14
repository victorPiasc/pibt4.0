<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlDbaInfo.ascx.cs"
    Inherits="Pibt.UserControl.CtlDbaInfo" %>
<div class="customer-info-box">
    <div class="section-title">
        Business DBA Information:
    </div>
    <div class="section-body">
        <telerik:RadGrid ID="RadGridDBA" runat="server" AllowPaging="True" AutoGenerateColumns="False"
            GridLines="None" AllowSorting="True" CellSpacing="0" AllowAutomaticInserts="True" Skin="MetroTouch"
            AllowAutomaticUpdates="True" OnItemCommand="RadGridDBA_ItemCommand" DataSourceID="odsDBA"
             OnItemInserted="RadGridDBA_ItemInserted" OnItemUpdated="RadGridDBA_ItemUpdated" >
            <PagerStyle Mode="NextPrevAndNumeric" />
            <GroupingSettings CaseSensitive="false" />
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="rowId" AllowSorting="true"
                PageSize="16" CommandItemDisplay="Top" CommandItemSettings-ShowRefreshButton="false"
                CommandItemSettings-ShowAddNewRecordButton="true" DataSourceID="odsDBA">
                <Columns>
                    <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                        <ItemStyle CssClass="MyImageButton" Width="30"></ItemStyle>
                    </telerik:GridEditCommandColumn>
                    <telerik:GridBoundColumn DataField="Dbaname" SortExpression="Dbaname" UniqueName="Dbaname" HeaderText="DBA Name">
                    </telerik:GridBoundColumn>
                </Columns>
                <EditFormSettings EditFormType="Template" InsertCaption="Inser">
                    <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                    </EditColumn>
                    <FormTemplate>
                        <asp:TextBox ID="tbID" runat="server" Text='<%# Eval( "rowId" ) %>' Visible="False">
                        </asp:TextBox>
                        <table class="table-container">
                            <tr class="row">
                                <td class="item-name">
                                    DBA NAME:
                                </td>
                                <td class="item-value">
                                    <asp:TextBox ID="tbDBANAME" Text='<%# Bind( "DBANAME" ) %>' runat="server" MaxLength="30"
                                        Width="250"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCarrierId" runat="server" ControlToValidate="tbDBANAME"
                                        CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <asp:Button ID="btnUpdate" ValidationGroup="CustomerInfo" runat="server" CssClass="btn"
                                        CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                        Text='<%# (Container is GridEditFormInsertItem) ? "Save" : "Update" %>' />
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
        <asp:ObjectDataSource ID="odsDBA" runat="server" OnSelecting="odsDBA_Selecting" SelectMethod="GetEmployerDBAs"
            TypeName="Pibt.BLL.Employer" InsertMethod="InsertEmployerDBA" OnInserting="odsDBA_Inserting"
            OnUpdating="odsDBA_Updating" UpdateMethod="UpdateEmployerDBA">
            <InsertParameters>
                <asp:Parameter Name="employerId" Type="String" />
                <asp:Parameter Name="dbaName" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="employerId" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="rowId" Type="String" />
                <asp:Parameter Name="employerId" Type="String" />
                <asp:Parameter Name="dbaName" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
</div>
