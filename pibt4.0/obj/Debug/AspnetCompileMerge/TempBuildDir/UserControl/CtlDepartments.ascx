<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlDepartments.ascx.cs"
    Inherits="Pibt.UserControl.CtlDepartments" %>
<div class="customer-info-box">
    <div class="section-title">
        Business Department Information:
    </div>
    <div class="section-body">
        <asp:Literal ID="errormessage" runat="server" Visible="false"></asp:Literal>
        <telerik:RadGrid ID="RadGridDeparts" runat="server" AllowPaging="True" Skin="MetroTouch"
            AutoGenerateColumns="False" GridLines="None" AllowSorting="True" CellSpacing="0"
            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" OnItemCommand="RadGridDeparts_ItemCommand"
            DataSourceID="odsDepartments" OnItemInserted="RadGridDeparts_ItemInserted" OnItemUpdated="RadGridDeparts_ItemUpdated" >
            <PagerStyle Mode="NextPrevAndNumeric" />
            <GroupingSettings CaseSensitive="false" />
            <MasterTableView AutoGenerateColumns="False" DataKeyNames="Deptid" AllowSorting="true"
                PageSize="17" CommandItemDisplay="Top" CommandItemSettings-ShowRefreshButton="false"
                CommandItemSettings-ShowAddNewRecordButton="true" DataSourceID="odsDepartments">
                <Columns>
                    <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                        <ItemStyle CssClass="MyImageButton" Width="30"></ItemStyle>
                    </telerik:GridEditCommandColumn>
                    <telerik:GridBoundColumn DataField="Description" SortExpression="Description" UniqueName="Description" HeaderText="Description">
                    </telerik:GridBoundColumn>
                </Columns>
                <EditFormSettings EditFormType="Template" InsertCaption="Inser">
                    <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column">
                    </EditColumn>
                    <FormTemplate>
                        <asp:TextBox ID="tbID" runat="server" Text='<%# Eval( "Deptid" ) %>' Visible="False">
                        </asp:TextBox>
                        <table class="table-container">
                            <tr class="row">
                                <td class="item-name">
                                    Dept Code:
                                </td>
                                <td class="item-value">
                                    <asp:TextBox ID="tbDeptCode" Text='<%# Bind( "deptcode" ) %>' runat="server" MaxLength="4"
                                        Width="150"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvCarrierId" runat="server" ControlToValidate="tbDeptCode"
                                        CssClass="required-info" ErrorMessage="It is required" Display="Dynamic" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="rfCarrierId" runat="server" ControlToValidate="tbDeptCode"
                                        MinimumValue="0" MaximumValue="9999" CssClass="required-info" ErrorMessage="It must be 1-9999"
                                        ValidationGroup="CustomerInfo"></asp:RangeValidator>
                                </td>
                            </tr>
                            <tr class="row">
                                <td class="item-name">
                                    Description:
                                </td>
                                <td class="item-value">
                                    <asp:TextBox ID="tbDescription" Text='<%# Bind( "Name" ) %>' runat="server" MaxLength="30"
                                        Width="260"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="tbDescription"
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
    </div>
</div>
<asp:ObjectDataSource ID="odsDepartments" runat="server" OnSelecting="odsDepartments_Selecting"
    SelectMethod="GetDepartments" TypeName="Pibt.BLL.Employer" InsertMethod="InsertDepartments"
    OnInserting="odsDepartments_Inserting" OnUpdating="odsDepartments_Updating" UpdateMethod="UpdateDepartments">
    <InsertParameters>
        <asp:Parameter Name="employerId" Type="String" />
        <asp:Parameter Name="deptCode" Type="String" />
        <asp:Parameter Name="name" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:Parameter Name="employerId" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="deptId" Type="String" />
        <asp:Parameter Name="employerId" Type="String" />
        <asp:Parameter Name="deptCode" Type="String" />
        <asp:Parameter Name="name" Type="String" />
    </UpdateParameters>
</asp:ObjectDataSource>
