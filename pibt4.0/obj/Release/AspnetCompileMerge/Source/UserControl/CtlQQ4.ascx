<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlQQ4.ascx.cs" Inherits="Pibt.UserControl.CtlQQ4" %>
<style>
    .simpleText {
        font-size: 14px;
    }
</style>
<div class="row">
    <div class="column-12 col-md-12">
        <span style="font-size: large; font-weight: bold; color: #085394;">Employee Census Information</span>
    </div>
</div>
<div id="popup1" class="popup2" style="width: 65%; padding: 20px; left: 15%;" runat="server">
    <div style="background: #FFFFFF; padding: 10px;">
        <div class="sectionHeader">
            <asp:Label ID="newHeader" runat="server"></asp:Label>
            <asp:HiddenField ID="hfEmployeeId" runat="server" />
        </div>
        <fieldset>
            <legend>Personal Information</legend>
            <div class="row">
                <div class="column-3 col-md-3">
                    First Name:
                                        <asp:TextBox ID="fName" runat="server" Style="display: inline; width: 92%;" CssClass="form-control" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="fNameValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="fName" Display="Static" ValidationGroup="Update"></asp:RequiredFieldValidator>
                </div>
                <div class="column-3 col-md-3">
                    Last Name:
                                        <asp:TextBox ID="lName" runat="server" Style="display: inline; width: 92%;" CssClass="form-control" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="lNameValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="lName" Display="Static" ValidationGroup="Update"></asp:RequiredFieldValidator>
                </div>
                <div class="column-3 col-md-3">
                    Gender:
                                        <asp:DropDownList ID="gender" runat="server" CssClass="form-control" Style="display: inline; width: 92%;">
                                            <asp:ListItem Value="0" Text="--Select--" Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="Y" Text="Male"></asp:ListItem>
                                            <asp:ListItem Value="N" Text="Female"></asp:ListItem>
                                        </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="genderValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="gender" InitialValue="0" ValidationGroup="Update" Display="Static"></asp:RequiredFieldValidator>
                </div>
                <div class="column-3 col-md-3">
                    Birthdate:
                                        <telerik:RadDatePicker ID="bday" runat="server" Height="34px" Style="border-radius: 6px;"></telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="bDayValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="bDay" Display="Static" ValidationGroup="Update"></asp:RequiredFieldValidator>
                </div>
                <div class="column-3 col-md-3">
                    SSN:
                                        <asp:TextBox ID="ssn" runat="server" Style="display: inline; width: 92%;" CssClass="form-control" MaxLength="9"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="ssnValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ssn" Display="Dynamic" ValidationGroup="Update"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="ssnReg" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ssn" ValidationExpression="\d+" Display="Dynamic" ValidationGroup="Update"></asp:RegularExpressionValidator>
                </div>
                <div class="column-3 col-md-3">
                    <div>Smoker:</div>
                    <asp:RadioButtonList ID="smokerChoice" runat="server" RepeatDirection="Horizontal" Style="float: left;">
                        <asp:ListItem Value="Y" Text="Yes"></asp:ListItem>
                        <asp:ListItem Value="N" Text="No"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="smokerValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="smokerChoice" Display="Static" ValidationGroup="Update"></asp:RequiredFieldValidator>
                </div>
                <asp:Panel ID="noDep" runat="server">
                    <div class="column-3 col-md-3">
                        Email
                                            <asp:TextBox ID="email" runat="server" CssClass="form-control" Style="display: inline; width: 92%;" MaxLength="120"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="emailValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="email" Display="Dynamic" ValidationGroup="Update"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="cEmailReg" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ControlToValidate="email" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="Update"></asp:RegularExpressionValidator>
                    </div>
                    <div class="column-3 col-md-3">
                        Hours Worked Per Week:
                                            <asp:TextBox ID="hours" type="number" min="0" runat="server" Style="display: inline; width: 92%;" CssClass="form-control" MaxLength="2"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="hoursValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="hours" Display="Dynamic" ValidationGroup="Update"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="hoursReg" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="hours" ValidationExpression="\d+" Display="Dynamic" ValidationGroup="Update"></asp:RegularExpressionValidator>
                    </div>
                    <div class="column-3 col-md-3">
                        Department:
                                            <asp:DropDownList ID="dept" runat="server" CssClass="form-control" Style="display: inline; width: 92%;" AppendDataBoundItems="true">
                                                <asp:ListItem Value="0" Text="--Select--" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                    </div>
                </asp:Panel>
                <div class="column-3 col-md-3">
                    Type:
                                        <asp:DropDownList ID="type" runat="server" CssClass="form-control" Style="display: inline; width: 92%;">
                                            <asp:ListItem Value="9" Text="--Select--"></asp:ListItem>
                                        </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="type" Display="Dynamic" ValidationGroup="Update" InitialValue="9"></asp:RequiredFieldValidator>
                </div>
            </div>
        </fieldset>
        <div class="row">
            <div class="column-4 col-md-4">
                <asp:Button ID="addDep" runat="server" Text="Add Dependent" CssClass="btn" OnClick="dep_Click" CommandName="add" ValidationGroup="update" />
            </div>
            <div class="column-4 col-md-4">
                <asp:Button ID="cancelBtn" runat="server" Text="Cancel" CssClass="btn-red" OnClick="dep_Click" CommandName="cancel" />
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="column-12 col-md-12">
        <asp:Literal ID="lblCreationMessage" runat="server"></asp:Literal>
    </div>
    <div class="column-12 col-md-12">
        <fieldset style="padding: 0px 10px 10px 10px !important; border: 1px solid #CFCFCE;">
            <legend class="section-title">Requirements:</legend>
            Entering insured data:
            <ol style="padding-left: 10px;">
                <li>Upload a file with the required data in one of these formats: .csv, .tsv, .txt </li>
                <li>Input individual insureds</li>
            </ol>
            <asp:Button ID="btnUpload" runat="server" CssClass="btn" Text="Replace Census Using File" OnClientClick=" genPopUp('popup4', true);return false;" />
            <a href="\Documents\AccountSetUpCensus.xlsx" target="_blank" style="margin-left: 50px">Download Template</a>
        </fieldset>
    </div>
    <div class="column-12 col-md-12">
        <fieldset style="padding: 0px 10px 10px 10px !important; border: 1px solid #CFCFCE;">
            <legend class="section-title">Employee Information:</legend>
            <div class="simpleText">
                Employee Count:&nbsp;<asp:Label ID="eeCount" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
            </div>
            <div>
                <div class="row">
                    <div class="column-8 col-md-8">
                        <asp:Literal ID="message" runat="server"></asp:Literal>
                    </div>
                </div>
                <asp:CustomValidator ID="batchValid" runat="server" CssClass="required-info" ErrorMessage="*The grid has been modifed, please save changed before continuing." Display="Static" ClientValidationFunction="hasChanges" ValidationGroup="empInputGroup"></asp:CustomValidator>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="column-3 col-md-3">
                        <asp:Button ID="add" runat="server" Text="Add Employee" CssClass="btn" OnClick="add_Click" />
                    </div>
                </div>
                <telerik:RadGrid ID="eeGrid" runat="server" AutoGenerateColumns="false" AllowSorting="true" AllowPaging="false" Skin="MetroTouch" OnItemCommand="eeGrid_ItemCommand" AllowAutomaticUpdates="false" OnNeedDataSource="employeeRadGrid_NeedDataSource" OnItemDataBound="eeGrid_ItemDataBound">
                    <MasterTableView DataKeyNames="memberId" EditMode="EditForms">
                        <CommandItemSettings />
                        <Columns>
                            <telerik:GridBoundColumn UniqueName="memberId" DataField="memberId" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="employeeId" DataField="employeeId" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="EMPLOYEETYPE" DataField="EMPLOYEETYPE" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="male" DataField="male" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="smoker" DataField="smoker" Display="false"></telerik:GridBoundColumn>
                            <telerik:GridEditCommandColumn UniqueName="EditCommandColumn" ButtonType="ImageButton" HeaderText="Edit">
                                <ItemStyle CssClass="MyImageButton" Width="30"></ItemStyle>
                            </telerik:GridEditCommandColumn>
                            <telerik:GridBoundColumn UniqueName="firstName" DataField="firstName" HeaderText="First Name"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="lastName" DataField="lastName" HeaderText="Last Name"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="Birthdate" DataField="Birthdate" HeaderText="Birthdate" DataFormatString="{0: MM/dd/yyyy}"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn UniqueName="description" DataField="description" HeaderText="Type"></telerik:GridBoundColumn>
                            <telerik:GridButtonColumn UniqueName="action" ButtonType="PushButton" ButtonCssClass="btn" Text="Add Dependent" CommandName="action"></telerik:GridButtonColumn>
                            <telerik:GridButtonColumn UniqueName="remove" ButtonType="PushButton" ButtonCssClass="btn" Text="Remove" CommandName="delete"></telerik:GridButtonColumn>
                        </Columns>
                        <EditFormSettings EditFormType="Template" InsertCaption="Insert">
                            <EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
                            <FormTemplate>
                                <div style="padding: 15px;">
                                    <div class="row">
                                        <div class="column-3 col-md-3">
                                            First Name:
                                            <asp:TextBox ID="fName" runat="server" Style="display: inline; width: 92%;" CssClass="form-control" Text='<%# Bind("firstName") %>' MaxLength="20"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="fNameValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="fName" Display="Static" ValidationGroup="updateMember"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="column-3 col-md-3">
                                            Last Name:
                                            <asp:TextBox ID="lName" runat="server" Style="display: inline; width: 92%;" CssClass="form-control" Text='<%# Bind("lastName") %>' MaxLength="20"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="lNameValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="lName" Display="Static" ValidationGroup="updateMember"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="column-3 col-md-3">
                                            Gender:
                                                    <asp:DropDownList ID="gender" runat="server" CssClass="form-control" Style="display: inline; width: 92%;" OnPreRender="gender_PreRender">
                                                        <asp:ListItem Value="0" Text="--Select--"></asp:ListItem>
                                                        <asp:ListItem Value="Y" Text="Male"></asp:ListItem>
                                                        <asp:ListItem Value="N" Text="Female"></asp:ListItem>
                                                    </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="genderValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="gender" InitialValue="0" Display="Static" ValidationGroup="updateMember"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="column-3 col-md-3">
                                            Birthdate:
                                            <telerik:RadDatePicker ID="bday" runat="server" Height="34px" DbSelectedDate='<%# Bind("birthdate") %>' Style="border-radius: 6px;"></telerik:RadDatePicker>
                                            <asp:RequiredFieldValidator ID="bDayValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="bDay" Display="Static" ValidationGroup="updateMember"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="column-3 col-md-3">
                                            SSN:
                                            <asp:TextBox ID="ssn" runat="server" Style="display: inline; width: 92%;" CssClass="form-control" Text='<%# Bind("socSecNbr") %>' MaxLength="9"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="ssnValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ssn" Display="Dynamic" ValidationGroup="updateMember"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="ssnReg" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ssn" ValidationExpression="\d+" Display="Dynamic" ValidationGroup="updateMember"></asp:RegularExpressionValidator>
                                        </div>
                                        <asp:Panel ID="noChild" runat="server" Visible='<%# Eval("employeeType").ToString() != "2" ? true : false %>'>
                                            <div class="column-3 col-md-3">
                                                <div>Smoker:</div>
                                                <asp:RadioButtonList ID="smokerChoice" runat="server" RepeatDirection="Horizontal" Style="float: left;">
                                                    <asp:ListItem Value="Y" Text="Yes"></asp:ListItem>
                                                    <asp:ListItem Value="N" Text="No"></asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="smokerValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="smokerChoice" Display="Static" ValidationGroup="updateMember"></asp:RequiredFieldValidator>
                                            </div>
                                        </asp:Panel>
                                        <div class="column-3 col-md-3">
                                            Email
                                            <asp:TextBox ID="email" runat="server" CssClass="form-control" Style="display: inline; width: 92%;" Text='<%# Bind("emailAddress") %>' MaxLength="120"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="emailValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="email" Display="Dynamic" ValidationGroup="updateMember" Visible='<%# Eval("employeeType").ToString()=="0" %>'></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="cEmailReg" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ControlToValidate="email" runat="server" ErrorMessage="*" ForeColor="Red" ValidationGroup="updateMember"></asp:RegularExpressionValidator>
                                        </div>
                                        <asp:Panel ID="noDep" runat="server" Visible='<%# Eval("employeeType").ToString()=="0" %>'>
                                            <div class="column-3 col-md-3">
                                                Hours Worked Per Week:
                                                <asp:TextBox ID="hours" type="number" min="0" MaxLength="2" runat="server" Style="display: inline; width: 92%;" CssClass="form-control" Text='<%# Bind  ("hoursWorked") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="hoursValid" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="hours" Display="Dynamic" ValidationGroup="updateMember"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="hoursReg" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="hours" ValidationExpression="\d+" Display="Dynamic" ValidationGroup="updateMember"></asp:RegularExpressionValidator>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                    <div class="row">
                                        <div class="column-6 col-md-6">
                                            <asp:Button ID="update" runat="server" CssClass="btn" Text="Update" CommandName="update" ValidationGroup="updateMember" />
                                        </div>
                                        <div class="column-6 col-md-6">
                                            <asp:Button ID="cancel" runat="server" CssClass="btn-red" Text="cancel" CommandName="cancel" CausesValidation="false" />
                                        </div>
                                    </div>
                                </div>
                            </FormTemplate>
                        </EditFormSettings>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </fieldset>
    </div>
</div>
