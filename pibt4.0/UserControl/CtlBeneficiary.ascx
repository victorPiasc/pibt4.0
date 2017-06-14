<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlBeneficiary.ascx.cs"
    Inherits="Pibt.UserControl.CtlBeneficiary" %>
<telerik:RadGrid ID="RadGrid1" CssClass="AutoWidthGrid" runat="server" Skin="MetroTouch" AllowSorting="True" AutoGenerateColumns="False"
    AllowAutomaticDeletes="True" ShowStatusBar="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True" DataSourceID="odsBeneficiary"
    OnItemCommand="RadGrid1_ItemCommand" OnItemDeleted="RadGrid1_ItemDeleted" OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated"
    OnUpdateCommand="RadGrid1_UpdateCommand" OnInsertCommand="RadGrid1_InsertCommand">
    <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
    <MasterTableView DataSourceID="odsBeneficiary" CommandItemDisplay="Top" DataKeyNames="ID">
        <CommandItemSettings ShowRefreshButton="false" AddNewRecordText="Additional" />
        <Columns>
            <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn" HeaderText="Edit">
                <ItemStyle CssClass="MyImageButton" />
            </telerik:GridEditCommandColumn>
            <telerik:GridBoundColumn DataField="plantypeName" HeaderText="Benefit Type" SortExpression="plantypeName" UniqueName="plantypeName">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LASTNAME" HeaderText="Last Name" SortExpression="LASTNAME" UniqueName="LASTNAME">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="FIRSTNAME" HeaderText="First Name" SortExpression="FIRSTNAME" UniqueName="FIRSTNAME">
            </telerik:GridBoundColumn>
            <telerik:GridDropDownColumn ColumnEditorID="GridDropDownColumnEditor2" DataField="RELATIONSHIPID"
                DataSourceID="odsDsBeneficiaryTypes" HeaderText="Relationship" ListTextField="DESCRIPTION"
                ListValueField="RELATIONSHIPID" UniqueName="RELATIONSHIPID">
            </telerik:GridDropDownColumn>
            <telerik:GridBoundColumn DataField="PERCENTAGE" DataType="System.Decimal" HeaderText="Percentage"
                SortExpression="PERCENTAGE" UniqueName="PERCENTAGE">
            </telerik:GridBoundColumn>
            <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmDialogType="RadWindow" ConfirmText="Delete this beneficiary?"
                ConfirmTitle="Delete" Text="Delete" UniqueName="DeleteColumn" HeaderText="Remove">
                <ItemStyle CssClass="MyImageButton" HorizontalAlign="Center" />
            </telerik:GridButtonColumn>
        </Columns>
        <EditFormSettings EditFormType="Template">
            <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
            <FormTemplate>
                <table id="Table2" class="table-container" style="width: 100%" <%-- style="border-collapse: collapse; margin: 15px 15px 15px 15px;"--%>>
                    <tr class="row">
                        <td colspan="2" style="font-size: small">
                            <b>Beneficiary Details:</b>
                            <asp:TextBox ID="tbID" runat="server" Text='<%# Eval ("ID") %>' Visible="false">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td>
                            <b>Contact Information:</b>
                        </td>
                        <td>
                            <b>Coverage Information:</b>
                        </td>
                    </tr>
                    <tr class="row">
                        <td>
                            <table class="table-container" style="width: 100%">
                                <tbody>
                                    <tr class="row">
                                        <td class="item-name">Last&nbsp;Name:</td>
                                        <td class="item-value">
                                            <asp:TextBox ID="tbLastName" runat="server" MaxLength="20" TabIndex="1" Text='<%# Bind( "LASTNAME" ) %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbLastName" 
                                                CssClass="required-info" Display="Dynamic" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbLastName"
                                                CssClass="required-info" Display="Static" ErrorMessage="*Letters only" 
                                                ValidationExpression="^[a-zA-Z''-'\s]{2,20}$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">First&nbsp;Name:</td>
                                        <td class="item-value">
                                            <asp:TextBox ID="tbFirstName" runat="server" MaxLength="15" TabIndex="2" Text='<%# Bind( "FIRSTNAME") %>'>
                                            </asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbFirstName" 
                                                CssClass="required-info" Display="Dynamic" ErrorMessage="*Required"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbFirstName" 
                                                CssClass="required-info" ErrorMessage="*Letters only"
                                                ValidationExpression="^[a-zA-Z''-'\s]{1,20}$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">Middle&nbsp;Init:</td>
                                        <td class="item-value">
                                            <asp:TextBox ID="tbMiddle" runat="server" MaxLength="1" Width="25px" TabIndex="3" Text='<%# Bind( "MIDDLEINITIAL") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbMiddle" 
                                                CssClass="required-info" ErrorMessage="*Letters only" 
                                                ValidationExpression="^[a-zA-Z''-'\s]{1}$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">SSN:</td>
                                        <td class="item-value">
                                            <telerik:RadMaskedTextBox ID="tbSSN" runat="server" MaxLength="9" TabIndex="4" Mask="###-##-####" Text='<%# Bind( "SOCSECNBR") %>'></telerik:RadMaskedTextBox>
                                            <asp:HiddenField ID="hideSSN" runat="server" Value='<%# Bind( "SOCSECNBR") %>' />
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">Address:</td>
                                        <td class="item-value">
                                            <asp:TextBox ID="tbAddress" runat="server" MaxLength="80" TabIndex="5" Text='<%# Bind( "ADDRESS") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">City:</td>
                                        <td class="item-value">
                                            <asp:TextBox ID="tbCity" runat="server" MaxLength="20" TabIndex="6" Text='<%# Bind( "CITY") %>'>
                                            </asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">State:</td>
                                        <td class="item-value" colspan="2">
                                            <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" DataSourceID="odsState" 
                                                DataTextField="NAME" DataValueField="STATEID" SelectedValue='<%# Bind("STATE") %>' TabIndex="7">
                                                <asp:ListItem Selected="True" Text="-- Select --" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">Zip:</td>
                                        <td class="item-value">
                                            <asp:TextBox ID="tbZip" runat="server" MaxLength="5" TabIndex="8" Text='<%# Bind( "ZIP") %>'></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RegularExpressionValidator ID="RangeExpress2" runat="server" ControlToValidate="tbZip" CssClass="required-info" 
                                                ErrorMessage="*Number only" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        <td>
                            <table class="table-container" style="width: 100%; margin-top:-140px">
                                <tbody>
                                    <tr class="row">
                                        <td class="item-name">Benefit&nbsp;Type:</td>
                                        <td class="item-value">
                                            <asp:HiddenField ID="hidePlanTypeId" runat="server" Value='<%# Bind( "PLANTYPEID") %>' />
                                            <asp:DropDownList ID="ddlPlanType" runat="server" DataSourceID="OdsLifeCoverage" DataTextField="DESCRIPTION"
                                                DataValueField="PLANTYPEID" TabIndex="9" OnDataBound="ddlPlanType_OnDataBound" AppendDataBoundItems="true">
                                                <asp:ListItem Selected="True" Text="-- Select --" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlRelationship" 
                                                CssClass="required-info" ErrorMessage="*Required" InitialValue="0" Display="Static"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">Relationship:</td>
                                        <td class="item-value">
                                            <asp:HiddenField ID="HiddenRelationship" runat="server" Value='<%# Bind( "RELATIONSHIPID") %>' />
                                            <asp:DropDownList ID="ddlRelationship" runat="server" DataSourceID="odsDsBeneficiaryTypes" DataTextField="DESCRIPTION"
                                                DataValueField="RELATIONSHIPID" TabIndex="10" OnDataBound="ddlRelationship_OnDataBound" AppendDataBoundItems="true">
                                                <asp:ListItem Selected="True" Text="-- Select --" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlRelationship" 
                                                CssClass="required-info" Display="Static" ErrorMessage="*Required" InitialValue="0"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="item-name">Percentage:</td>
                                        <td class="item-value">
                                            <asp:TextBox ID="tbPercentage" runat="server" MaxLength="3" TabIndex="11" Text='<%# Bind( "PERCENTAGE") %>'>%
                                            </asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbPercentage"
                                                CssClass="required-info" Display="Dynamic" ErrorMessage="*Required">
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="tbPercentage"
                                                CssClass="required-info" Display="Dynamic" ErrorMessage="*Number only" ValidationExpression="^\d+$">
                                            </asp:RegularExpressionValidator>
                                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbPercentage" CssClass="required-info" 
                                                Display="Dynamic" ErrorMessage="*1-100" MaximumValue="100" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                                        </td>
                                    </tr>
                                    <tr class="row">
                                        <td class="red" >
                                            Percentage amount must be 1-100
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr class="row">
                        <td style="text-align: center" colspan="2">
                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn"
                                CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                Text='<%# (Container is GridEditFormInsertItem) ? "Save" : "Update" %>' />
                            &nbsp;
                            <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </tr>
                </table>
            </FormTemplate>
        </EditFormSettings>
        <PagerStyle PageSizeControlType="RadComboBox" />
    </MasterTableView>
    <FilterMenu EnableImageSprites="False">
    </FilterMenu>
</telerik:RadGrid>
<div id="OEAlertDialog" class="message-error">
    <asp:Literal ID="lblMsg" ViewStateMode="Disabled" runat="server"></asp:Literal>
</div>
<asp:ObjectDataSource ID="odsBeneficiary" runat="server" DeleteMethod="DeleteBeneficiary" SelectMethod="GetOEBeneficiary" TypeName="Pibt.BLL.EnrollmentForm"
    InsertMethod="InsertOEBeneficiary" UpdateMethod="UpdateOEBeneficiary" OnUpdating="odsBeneficiary_Updating" OnInserting="odsBeneficiary_Inserting"
    OnInserted="odsBeneficiary_Inserted" OnUpdated="odsBeneficiary_Updated">
    <DeleteParameters>
        <asp:ControlParameter ControlID="RadGrid1" Name="id" PropertyName="SelectedValue" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:SessionParameter Name="oeId" SessionField="OEId" Type="String" />
        <asp:Parameter Name="memberId" Type="String" />
        <asp:Parameter Name="lastName" Type="String" />
        <asp:Parameter Name="firstName" Type="String" />
        <asp:Parameter Name="Middleinitial" Type="String" />
        <asp:Parameter Name="Socsecnbr" Type="String" />
        <asp:Parameter Name="address" Type="String" />
        <asp:Parameter Name="city" Type="String" />
        <asp:Parameter Name="state" Type="String" />
        <asp:Parameter Name="zip" Type="String" />
        <asp:Parameter Name="planTypeId" Type="String" />
        <asp:Parameter Name="relationshipId" Type="String" />
        <asp:Parameter Name="percentage" Type="String" />
        <asp:Parameter Name="updatedBy" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="oeId" SessionField="OEId" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Id" Type="String" />
        <asp:Parameter Name="lastName" Type="String" />
        <asp:Parameter Name="firstName" Type="String" />
        <asp:Parameter Name="Middleinitial" Type="String" />
        <asp:Parameter Name="Socsecnbr" Type="String" />
        <asp:Parameter Name="address" Type="String" />
        <asp:Parameter Name="city" Type="String" />
        <asp:Parameter Name="state" Type="String" />
        <asp:Parameter Name="zip" Type="String" />
        <asp:Parameter Name="planTypeId" Type="String" />
        <asp:Parameter Name="relationshipId" Type="String" />
        <asp:Parameter Name="percentage" Type="String" />
        <asp:Parameter Name="updatedBy" Type="String" />
    </UpdateParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsDsBeneficiaryTypes" runat="server" SelectMethod="GetBeneficiaryrelationship" TypeName="Pibt.BLL.EnrollmentForm"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsState" runat="server" SelectMethod="GetState" TypeName="Pibt.BLL.User"></asp:ObjectDataSource>
