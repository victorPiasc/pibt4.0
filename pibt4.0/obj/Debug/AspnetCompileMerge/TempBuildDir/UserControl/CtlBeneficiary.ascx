<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlBeneficiary.ascx.cs"
    Inherits="Pibt.UserControl.CtlBeneficiary" %>
<telerik:RadAjaxManagerProxy ID="AjaxManagerProxy1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="SameCheckBox">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="tbAddress" />
                <telerik:AjaxUpdatedControl ControlID="tbCity"/>
                <telerik:AjaxUpdatedControl ControlID="ddlState" />
                <telerik:AjaxUpdatedControl ControlID="tbZip" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManagerProxy>
<p>
    You must add a Beneficiary for your Life Coverage(s).
</p>
<fieldset>
    <legend>Beneficiaries:</legend>
    <telerik:RadGrid ID="RadGrid1" CssClass="AutoWidthGrid" runat="server" Skin="MetroTouch"
        AllowSorting="True" AutoGenerateColumns="False" AllowAutomaticDeletes="True"
        ShowStatusBar="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True"
        DataSourceID="odsBeneficiary" OnItemCommand="RadGrid1_ItemCommand"
        OnItemDeleted="RadGrid1_ItemDeleted" OnItemInserted="RadGrid1_ItemInserted" OnItemUpdated="RadGrid1_ItemUpdated"
        OnUpdateCommand="RadGrid1_UpdateCommand" OnInsertCommand="RadGrid1_InsertCommand">
        <PagerStyle Mode="NextPrevAndNumeric"></PagerStyle>
        <MasterTableView DataSourceID="odsBeneficiary" CommandItemDisplay="Top" DataKeyNames="ID">
            <Columns>
                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn" HeaderText="Edit" HeaderStyle-ForeColor="white">
                    <ItemStyle CssClass="MyImageButton" />
                </telerik:GridEditCommandColumn>
                <telerik:GridBoundColumn DataField="plantypeName" HeaderText="Coverage Type" SortExpression="plantypeName" UniqueName="plantypeName">
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
                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" ConfirmDialogType="RadWindow"
                    ConfirmText="Delete this beneficiary?" ConfirmTitle="Delete" Text="Delete" UniqueName="DeleteColumn" HeaderText="REMOVE" HeaderStyle-ForeColor="white">
                    <ItemStyle CssClass="MyImageButton" HorizontalAlign="Center" />
                </telerik:GridButtonColumn>
            </Columns>
            <EditFormSettings EditFormType="Template">
                <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                <FormTemplate>
                    <table id="Table2" border="0" cellpadding="1" cellspacing="2" rules="none" style="border-collapse:collapse; margin:15px 15px 15px 15px;" background="white" width="100%">
                       <tr class="EditFormHeader">
                          <td colspan="2" style="font-size:small">
                             <b>Beneficiary Details:</b>
                             <asp:TextBox ID="tbID" runat="server" Text='<%# Eval ("ID") %>' Visible="false">
                             </asp:TextBox>
                          </td>
                       </tr>
                       <tr>
                          <td>
                             <b>Contact Information:</b>
                          </td>
                          <td>
                             <b>Coverage Information:</b>
                          </td>
                       </tr>
                       <tr>
                          <td>
                              Last Name:                             
                             <asp:TextBox ID="tbLastName" runat="server" MaxLength="20" TabIndex="1" Text='<%# Bind( "LASTNAME" ) %>'></asp:TextBox> 
                             <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="tbLastName" CssClass="required-info" Display="Dynamic" ErrorMessage="*Last name required" Text="*"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbLastName"
                              CssClass="required-info" Display="Dynamic" ErrorMessage="*Last name allows letters only" Text ="*" ValidationExpression="^[a-zA-Z''-'\s]{2,20}$">
                             </asp:RegularExpressionValidator>
                               
                          </td>
                        
                          <td>
                             Coverage Type:
                          
                              <asp:HiddenField ID="hidePlanTypeId" runat="server" Value='<%# Bind( "PLANTYPEID") %>' />
                                            <asp:DropDownList ID="ddlPlanType" runat="server" DataSourceID="OdsLifeCoverage"
                                                DataTextField="DESCRIPTION" DataValueField="PLANTYPEID" TabIndex="9" OnDataBound="ddlPlanType_OnDataBound">
                                            </asp:DropDownList>
                          </td>
                         
                       </tr>
                       <tr>
                          <td>
                             First Name:
                         
                              <asp:TextBox ID="tbFirstName" runat="server" MaxLength="15" TabIndex="2" Text='<%# Bind( "FIRSTNAME") %>'>
                                            </asp:TextBox>
                             <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="tbFirstName" CssClass="required-info" Display="Dynamic" ErrorMessage="*First name required" Text="*"></asp:RequiredFieldValidator>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbFirstName"
                              CssClass="required-info" Display="Dynamic" ErrorMessage="*First name allows letters only" Text ="*" ValidationExpression="^[a-zA-Z''-'\s]{1,20}$">
                             </asp:RegularExpressionValidator>
                          </td>
                        
                          <td>
                             Relationship:
                         
                             <asp:HiddenField ID="HiddenRelationship" runat="server" Value='<%# Bind( "RELATIONSHIPID") %>' />
                                            <asp:DropDownList ID="ddlRelationship" runat="server" DataSourceID="odsDsBeneficiaryTypes"
                                                DataTextField="DESCRIPTION" DataValueField="RELATIONSHIPID" TabIndex="10" OnDataBound="ddlRelationship_OnDataBound">
                                            </asp:DropDownList>
                          
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="ddlRelationship"
                                                CssClass="required-info" Display="Dynamic" ErrorMessage="* Required Field" Text ="*"></asp:RequiredFieldValidator>
                          </td>
                       </tr>
                       <tr>
                          <td>
                             Middle Init:
                         
                              <asp:TextBox ID="tbMiddle" runat="server" MaxLength="1" Width="8" TabIndex="3" Text='<%# Bind( "MIDDLEINITIAL") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbMiddle"
                              CssClass="required-info" Display="Dynamic" ErrorMessage="*Middle initial allows letters only" Text ="*" ValidationExpression="^[a-zA-Z''-'\s]{1}$">
                             </asp:RegularExpressionValidator>
                          </td>
                        
                          <td>
                             Percentage:
                         
                             <asp:TextBox ID="tbPercentage" runat="server" MaxLength="3" TabIndex="11" Text='<%# Bind( "PERCENTAGE") %>'>%
                                            </asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tbPercentage"
                                                CssClass="required-info" Display="Dynamic" ErrorMessage="*Precentage required " Text ="*"></asp:RequiredFieldValidator>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="tbPercentage"
                              CssClass="required-info" Display="Dynamic" ErrorMessage="*Percentage allows number only" Text ="*" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                             <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbPercentage"
                                                CssClass="required-info" Display="Dynamic" ErrorMessage="*Max percentage is 100%"
                                                MaximumValue="100" MinimumValue="1" Type="Integer" Text ="*"></asp:RangeValidator>
                          </td>
                         
                       </tr>
                       <tr>
                          <td>
                             SSN:
                       
                             <asp:TextBox ID="tbSSN" runat="server" MaxLength="9" TabIndex="4" Text='<%# Bind( "SOCSECNBR") %>'
                                                TextMode="Password">
                                            </asp:TextBox>
                                            <asp:HiddenField ID="hideSSN" runat="server" Value='<%# Bind( "SOCSECNBR") %>' />
                         
                             <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="tbSSN"
                                                CssClass="required-info" Display="Dynamic" ErrorMessage="Range 1 ~ 999999999 only."
                                                MaximumValue="999999999" MinimumValue="1" Type="Integer" Text ="*"></asp:RangeValidator>
                          </td>
                          <td>
                              <asp:Label ID="lblPercentageMsg" runat="server" CssClass="red" Text="Percentage amount must be 1 ~ 100"></asp:Label>
                          
                            
                          </td>
                       
                       </tr>
                       <tr>
                          <td>
                              Address:
                         
                             <asp:TextBox ID="tbAddress" runat="server" MaxLength="80" TabIndex="5" Text='<%# Bind( "ADDRESS") %>'>
                                            </asp:TextBox>
                          </td> 
                          <td colspan="1" rowspan="4">
                             
                          </td>                        
                       </tr>
                       <tr>
                          <td>
                             City:
                          
                             <asp:TextBox ID="tbCity" runat="server" MaxLength="20" TabIndex="6" Text='<%# Bind( "CITY") %>'>
                                            </asp:TextBox>
                          </td>
                       </tr>
                       <tr>
                          <td>
                             State:
                         
                             <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" DataSourceID="odsState"
                                                DataTextField="NAME" DataValueField="STATEID" SelectedValue='<%# Bind("STATE") %>'
                                                TabIndex="7">
                                                <asp:ListItem Selected="True" Text="Select" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                          </td>
                       </tr>
                       <tr>
                          <td>
                             Zip:
                        
                             <asp:TextBox ID="tbZip" runat="server" MaxLength="5" TabIndex="8" Text='<%# Bind( "ZIP") %>'>
                                            </asp:TextBox>
                         <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="tbZip"
                                                CssClass="required-info" Display="Dynamic" ErrorMessage="*Range 1 ~ 99999 only."
                                                MaximumValue="100000" MinimumValue="1" Type="Integer" Text ="*"></asp:RangeValidator>
                          </td>                          
                       </tr>
                       <tr>
                           <td style="text-align:right">
                             <asp:Button ID="btnUpdate" runat="server" CssClass="btn" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'
                                    Text='<%# (Container is GridEditFormInsertItem) ? "Save" : "Update" %>' />
                           </td>
                           <td>
                               &nbsp;                               
                             <asp:Button ID="btnCancel" runat="server" CausesValidation="False" CssClass="btn"
                                    CommandName="Cancel" Text="Cancel" />
                          </td>
                       </tr>
                    </table>
                    <div>
                         <asp:ValidationSummary ID="validate" runat="server" CssClass="required-info" HeaderText="ErrorMessages" 
                                  DisplayMode="BulletList" EnableClientScript="true"/>
                    </div>
                    


                </FormTemplate>
            </EditFormSettings>
            <PagerStyle PageSizeControlType="RadComboBox" />
         <CommandItemSettings AddNewRecordText="Add New"></CommandItemSettings>
        </MasterTableView>
        <FilterMenu EnableImageSprites="False">
        </FilterMenu>
    </telerik:RadGrid>
</fieldset>
<div id="OEAlertDialog" class="message-error">
    <asp:Literal ID="lblMsg" ViewStateMode="Disabled" runat="server"></asp:Literal>
</div>
<asp:ObjectDataSource ID="odsBeneficiary" runat="server" DeleteMethod="DeleteBeneficiary"
    SelectMethod="GetOEBeneficiary" TypeName="Pibt.BLL.EnrollmentForm" InsertMethod="InsertOEBeneficiary"
    UpdateMethod="UpdateOEBeneficiary" OnUpdating="odsBeneficiary_Updating" OnInserting="odsBeneficiary_Inserting"
    OnInserted="odsBeneficiary_Inserted" OnUpdated="odsBeneficiary_Updated">
    <DeleteParameters>
        <asp:ControlParameter ControlID="RadGrid1" Name="id" PropertyName="SelectedValue"
            Type="String" />
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
<asp:ObjectDataSource ID="odsDsBeneficiaryTypes" runat="server" SelectMethod="GetBeneficiaryrelationship"
    TypeName="Pibt.BLL.EnrollmentForm"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsState" runat="server" SelectMethod="GetState" TypeName="Pibt.BLL.User">
</asp:ObjectDataSource>
