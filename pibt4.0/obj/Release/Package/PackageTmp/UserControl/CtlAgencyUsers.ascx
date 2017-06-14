<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAgencyUsers.ascx.cs" Inherits="Pibt.UserControl.CtlAgencyUsers" %>
<div class="customer-info-box">
    <div class="row">
        <fieldset>
            <legend>Current Users</legend>
            <div class="col-md-12">
                <telerik:RadGrid ID="users" runat="server" SkinID="MetroTouch" AutoGenerateColumns="false" EnableLinqExpressions="false" OnNeedDataSource="users_NeedDataSource" OnItemCommand="users_ItemCommand">
                    <ClientSettings>
                        <Selecting AllowRowSelect="true" />
                    </ClientSettings>
                    <MasterTableView DataKeyNames="pk">
                        <Columns>
                            <telerik:GridBoundColumn DataField="pk" Display="false" UniqueName="pk"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="email" Display="false" UniqueName="email"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="firstname" Display="false" UniqueName="firstname"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="lastname" Display="false" UniqueName="lastname"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="username" Display="false" UniqueName="username"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="licenseNo" Display="false" UniqueName="licenseNo"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="issueDate" Display="false" UniqueName="issueDate"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="privelege" Display="false" UniqueName="privelege"></telerik:GridBoundColumn>
                            <telerik:GridCalculatedColumn DataFields="firstname, lastname" HeaderText="Name" SortExpression="firstname, lastname" UniqueName="name" Expression='{0}+" "+{1}'></telerik:GridCalculatedColumn>
                            <telerik:GridBoundColumn DataField="name" HeaderText="Name" SortExpression="name" UniqueName="name"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="role" HeaderText="Role" SortExpression="role" UniqueName="role"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="office" HeaderText="Office" SortExpression="office" UniqueName="office"></telerik:GridBoundColumn>
                            <telerik:GridBoundColumn DataField="cell" HeaderText="cell" SortExpression="cell" UniqueName="cell"></telerik:GridBoundColumn>
                            <telerik:GridButtonColumn ButtonCssClass="btn" ButtonType="PushButton" CommandName="edit" Text="Edit" HeaderText="Edit"></telerik:GridButtonColumn>
                            <telerik:GridButtonColumn ButtonCssClass="btn-red" ButtonType="PushButton" CommandName="remove" Text="X" HeaderText="Delete" ConfirmDialogType="Classic" ConfirmText="Are you sure you want to delete this record?"></telerik:GridButtonColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>
            </div>
        </fieldset>
    </div>
    <div class="row">
        <div class="clear"></div>
        <fieldset>
            <asp:HiddenField ID="userId" runat="server" />
            <legend>Add/Edit</legend>
            <div class="row" style="padding-bottom:15px;">
                <div class="col-md-4">
                    <span class="simpleText bold" style="padding-right:17px">Last Name:</span>
                    <asp:TextBox ID="lName" runat="server" CssClass="form-control" style="display:inline;" MaxLength="30" Height="27"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="lNameReq" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="lName"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <span class="simpleText bold" style="padding-right:15px">First Name:</span>
                    <asp:TextBox ID="fName" runat="server" CssClass="form-control" style="display: inline" MaxLength="30" Height="27"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="fName"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <span class="simpleText bold" style="padding-right:19px">Username:</span>
                    <asp:TextBox ID="uName" runat="server" CssClass="form-control" style="display: inline" MaxLength="30" Height="27"></asp:TextBox>
                    <%--                 <div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="require-info" ErrorMessage="*Required" ControlToValidate="uName"></asp:RequiredFieldValidator>
                     </div>--%>
                </div>
            </div>
            <div class="row" style="padding-bottom:15px;">
                <div class="col-md-4">
                    <span class="simpleText bold" style="padding-right:64px;">Role:</span>
                    <asp:DropDownList ID="roles" runat="server" CssClass="form-control" style="display: inline" AppendDataBoundItems="true" Width="40%">
                        <asp:ListItem Selected="True" Text="--Select--" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="roles" InitialValue="0"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <span class="simpleText bold" style="padding-right:15px;">License No:</span>
                    <asp:TextBox ID="licenseNo" runat="server" CssClass="form-control" style="display: inline" MaxLength="30" Height="27"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="licenseNo"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <span class="simpleText bold" style="padding-right:18px;">Issue Date:</span>
                    <telerik:RadDatePicker ID="issue" runat="server" Height="27"></telerik:RadDatePicker>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="issue"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row" style="padding-bottom:15px;">
                <div class="col-md-4">
                    <span class="simpleText bold" style="padding-right:28px;">Privelege:</span>
                    <asp:RadioButtonList ID="priveleges" runat="server" RepeatDirection="Horizontal" style="display:inline;vertical-align: -webkit-baseline-middle;" >
                        <asp:ListItem Text="All" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Read" Value="2"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="priveleges"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-4">
                    <span class="simpleText bold" style="padding-right:52px;">Office:</span>
                    <asp:TextBox ID="officeNo" runat="server" CssClass="form-control" Style="display: inline" MaxLength="30" Height="27"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="officeNo" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="required-info" ErrorMessage="*Numbers Only" ControlToValidate="officeNo" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-4">
                    <span class="simpleText bold" style="padding-right:69px;">Cell:</span>
                    <asp:TextBox ID="cellNo" runat="server" CssClass="form-control" Style="display: inline" MaxLength="30" Height="27"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="cellNo" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="required-info" ErrorMessage="*Numbers Only" ControlToValidate="cellNo" ValidationExpression="\d+" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row" style="padding-bottom:15px;">
                <div class="col-md-12">
                    <span class="simpleText bold" style="padding-right:55px;">Email:</span>
                    <asp:TextBox ID="email" runat="server" CssClass="form-control" Style="display: inline" MaxLength="30" Height="27"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="required-info" ErrorMessage="*Required" ControlToValidate="email"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="required-info" ErrorMessage="*Incorrect Email"
                        ControlToValidate="email" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:Button ID="addUpdate" runat="server" Text="Add User" CssClass="btn" OnClick="addUpdate_Click" />
                </div>
                <div class="col-md-4">
                    <asp:Button ID="cancel" runat="server" Text="Cancel Add" CssClass="btn-red" OnClick="cancel_Click" />
                </div>
            </div>
        </fieldset>
    </div>
</div>
