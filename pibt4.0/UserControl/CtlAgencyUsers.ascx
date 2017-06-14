<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAgencyUsers.ascx.cs" Inherits="Pibt.UserControl.CtlAgencyUsers" %>
<div class="customer-info-box">
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <legend>Current Users</legend>
                <telerik:RadGrid ID="users" runat="server" Skin="MetroTouch" AutoGenerateColumns="false" EnableLinqExpressions="false" OnNeedDataSource="users_NeedDataSource" OnItemCommand="users_ItemCommand" AllowPaging="true" >
                    <PagerStyle Position="Bottom" ShowPagerText="true" Mode="NumericPages" />
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <MasterTableView DataKeyNames="pk" PageSize="5">
                        <Columns>
                            <telerik:GridBoundColumn DataField="pk" Display="false" UniqueName="pk"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="manager" Display="false" UniqueName="manager"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="license" Display="false" UniqueName="license"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="licenseIssued" Display="false" UniqueName="licenseIssued"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="notes" Display="false" UniqueName="notes"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="firstname" HeaderText="First Name" UniqueName="firstname" SortExpression="firstname"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lastname" HeaderText="Last Name" UniqueName="lastname" SortExpression="lastname"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="status" HeaderText="Role" UniqueName="status" SortExpression="status"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="officePhone" HeaderText="Office No." SortExpression="officePhone" UniqueName="officePhone"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="cell" HeaderText="Cell No." SortExpression="cell" UniqueName="cell"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="email" UniqueName="Email" HeaderText="email"></telerik:GridBoundColumn>
                            <telerik:GridButtonColumn ButtonCssClass="btn" ButtonType="PushButton" CommandName="editA" Text="Edit" HeaderText="Edit"></telerik:GridButtonColumn>
                            <telerik:GridButtonColumn ButtonCssClass="btn-red" ButtonType="PushButton" CommandName="delete" Text="Delete" HeaderText="Delete" ConfirmDialogType="Classic" ConfirmText="Are you sure you want to delete this record?"></telerik:GridButtonColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <fieldset>
                <asp:HiddenField ID="pk" runat="server" />
                <legend>Add/Edit</legend>
                <div class="row" style="padding-bottom: 15px;">
                    <div class="col-md-4">
                        <span class="simpleText bold" >Last Name:</span>
                        <asp:TextBox ID="lName" runat="server" CssClass="form-control" MaxLength="30" Height="27"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="lNameReq" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="lName"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="lNameReg" runat="server" CssClass="required-info" ErrorMessage="*Letters only" ControlToValidate="lName" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-4">
                        <span class="simpleText bold">Middle Initial:</span>
                        <asp:TextBox ID="mName" runat="server" CssClass="form-control" MaxLength="1" Height="27" Width="100px"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="mNameReg" runat="server" CssClass="required-info" ErrorMessage="*Letters only" ControlToValidate="mName" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-4">
                        <span class="simpleText bold" >First Name:</span>
                        <asp:TextBox ID="fName" runat="server" CssClass="form-control"  MaxLength="22" Height="27" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="fName"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="fNameReg" runat="server" CssClass="required-info" ErrorMessage="*Letters only" ControlToValidate="fName" ValidationExpression="[a-zA-Z]+"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row" >
                    <div class="col-md-6">
                        <span class="simpleText bold">License No:</span>
                        <asp:TextBox ID="licenseNo" runat="server" CssClass="form-control" MaxLength="24" Height="27"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <span class="simpleText bold" style="padding-right: 18px; display:block;">Issue Date:</span>
                        <telerik:RadDatePicker ID="issue" runat="server" Height="27" ></telerik:RadDatePicker><br />
                        <asp:CustomValidator ID="issueDate" runat="server" CssClass="required-info" ErrorMessage="*Both license no and issue date are required" ClientValidationFunction="require" EnableClientScript="true"></asp:CustomValidator>
                    </div>
                </div>
                <div class="row" >
                    <div class="col-md-4">
                        <span class="simpleText bold" >Office:</span>
                        <asp:TextBox ID="officeNo" runat="server" CssClass="form-control"  MaxLength="10" Height="27"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="officeNo" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="required-info" ErrorMessage="*10 Numbers only" ControlToValidate="officeNo" ValidationExpression="^[0-9]{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-4">
                        <span class="simpleText bold" >Cell:</span>
                        <asp:TextBox ID="cellNo" runat="server" CssClass="form-control" MaxLength="10" Height="27"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="cellNo" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="required-info" ErrorMessage="*10 Numbers only" ControlToValidate="cellNo" ValidationExpression="^[0-9]{10}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-4">
                        <span class="simpleText bold" >Email:</span>
                        <asp:TextBox ID="email" runat="server" CssClass="form-control" MaxLength="64" Height="27"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="email"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="required-info" ErrorMessage="*Incorrect Email"
                            ControlToValidate="email" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="row" style="padding-bottom: 15px;">
                    <div class="col-md-6">
                        <span class="simpleText bold" >Role:</span>
                        <asp:DropDownList ID="roles" runat="server" CssClass="form-control" Width="40%" onchange="showManagerList(this)" >
                            <asp:ListItem Selected="True" Text="--Select--" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Manager" Value="1"></asp:ListItem>
                            <asp:ListItem Text="Agent" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="roles" InitialValue="0"></asp:RequiredFieldValidator>
                    </div>
                    <div class="col-md-6" id="managerListdiv" style="display:none;">
                        <div>
                            <span class="simpleText bold" >Manager:</span>
                            <asp:DropDownList ID="managersList" runat="server" CssClass="form-control" Width="40%" AppendDataBoundItems="true">
                                <asp:ListItem Selected="True" Text="--Select--" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <asp:Button ID="addUpdate" runat="server" Text="Add User" CssClass="btn" OnClick="addUpdate_Click" />
                    </div>
                    <div class="col-md-4">
                        <asp:Button ID="cancel" runat="server" Text="Cancel Add" CausesValidation="false" CssClass="btn-red" OnClick="cancel_Click" />
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</div>
