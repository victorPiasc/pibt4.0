<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEditMemberDetails.ascx.cs"
    Inherits="Pibt.UserControl.CtlEditMemberDetails" %>
<div class="customer-info-box">
    <asp:PlaceHolder runat="server" ID="phEmployeeDetails">
        <br />
        <asp:Label CssClass="info" ID="lblName" runat="server" Style="font-size: x-large;
            line-height: 1.5em;"></asp:Label><br />
        <hr />
        <asp:Label CssClass="info" ID="lblEmployeeType" runat="server"></asp:Label>
        <br />
        <br />
        <asp:LoginView ID="LoginViewWebAccountCreate" runat="server">
            <RoleGroups>
                <asp:RoleGroup Roles="Administrator,Agent,RK">
                    <ContentTemplate>
                        <fieldset>
                            <legend>Lockout Web Account</legend>
                            <asp:CheckBox ID="chkLockUser" Text="Lockout" AutoPostBack="true" runat="server"
                                OnCheckedChanged="chkLockUser_CheckedChanged" />
                        </fieldset>
                        <br />
                    </ContentTemplate>
                </asp:RoleGroup>
            </RoleGroups>
        </asp:LoginView>
        <div class="section-title">
            Member Details :
        </div>
        <div class="clear">
        </div>
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <tr class="row">
                        <td class="item-name">
                            Last Name:
                        </td>
                        <td class="item-value">
                            <asp:Label runat="server" ID="lblLastName" CssClass="form-control" style="line-height:24px;"></asp:Label>
                            <asp:TextBox runat="server" ID="tbLName" CssClass="form-control" MaxLength="20" Visible="false"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="required-info"
                                ControlToValidate="tbLName" ErrorMessage="It can't include numeric or any special character."
                                Display="Dynamic" ValidationGroup="EditMember" ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            First Name:
                        </td>
                        <td class="item-value">
                            <asp:Label runat="server" ID="lblFirstName" CssClass="form-control" style="line-height:24px;"></asp:Label>
                            <asp:TextBox runat="server" ID="tbFName" CssClass="form-control" MaxLength="15" Visible="false"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="required-info"
                                ControlToValidate="tbFName" ErrorMessage="It can't include numeric or any special character."
                                Display="Dynamic" ValidationGroup="EditMember" ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Middle Name:
                        </td>
                        <td class="item-value">
                            <asp:Label runat="server" ID="lblMiddleName" CssClass="form-control" style="line-height:24px;"></asp:Label>
                            <asp:TextBox runat="server" ID="tbMName" MaxLength="1" CssClass="form-control" Width="10" Visible="false"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="required-info"
                                ControlToValidate="tbMName" ErrorMessage="It can't include numeric or any special character."
                                Display="Dynamic" ValidationGroup="EditMember" ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Gender:
                        </td>
                        <td class="item-value">
                            <%--<asp:TextBox runat="server" ID="tbGender" Enabled="false" Value="<%# Eval("Male") %>"></asp:TextBox>--%>
                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlGender" Enabled="false" >
                                <asp:ListItem Text="Male" Value="Y"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="N"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            SSN:
                        </td>
                        <td class="item-value">
                                <asp:Label runat="server" ID="Label1" CssClass="form-control" style="line-height:24px;" Text="xxx-xx-xxxx"></asp:Label>
<%--                            <div class="readonly">
                                ***-**-****</div>--%>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Relationship:
                        </td>
                        <td class="item-value">
                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlEeType" Enabled="False">
                                <asp:ListItem Text="Employee" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Spouse" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Child" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Domestic Partner" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Birth Date:
                        </td>
                        <td class="item-value">
                            <telerik:RadDatePicker ID="dpBirthDate" CssClass="form-control" MinDate="1900/1/1" runat="server">
                            </telerik:RadDatePicker>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required Field "
                                ControlToValidate="dpBirthDate"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="row" id="trMarriageDate">
                        <td class="item-name">
                            Marriage Date:
                        </td>
                        <td class="item-value">
                            <telerik:RadDatePicker ID="dpMarriageDate" CssClass="form-control" MinDate="1900/1/1" runat="server">
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                    <tr class="row" id="trHireDateDate">
                        <td class="item-name">
                            <asp:Label ID="lblHireDate" runat="server" Text="Hire Date:"></asp:Label>
                        </td>
                        <td class="item-value">
                            <telerik:RadDatePicker ID="dpHireDate" CssClass="form-control" MinDate="1900/1/1" runat="server">
                            </telerik:RadDatePicker>
                            <asp:RequiredFieldValidator ID="RfvDpHireDate" runat="server" ErrorMessage="*Required Field "
                                ControlToValidate="dpHireDate"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="phPhsicalAddress">
        <div class="section-title">
            Physical Address :
        </div>
        <div class="clear">
        </div>
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <tr class="row">
                        <td class="item-name">
                            Street Address:
                        </td>
                        <td class="item-value">
                            
                            <asp:TextBox ID="tbAddress1" runat="server" CssClass="form-control" Height="26px" MaxLength="80" Width="400"></asp:TextBox>
                        </td>
                    </tr>
<%--                    <tr class="row">
                        <td class="item-name">
                            Apt/Suite/Unit #:
                        </td>
                        <td class="item-value">
                            <asp:TextBox ID="tbAddress2" runat="server" MaxLength="30" Width="240"></asp:TextBox>
                        </td>
                    </tr>--%>

                    <tr class="row">
                        <td class="item-name">
                            City:
                        </td>
                        <td class="item-value">
                            <asp:TextBox ID="tbCity" runat="server" CssClass="form-control" MaxLength="30" Height="26px" Width="255"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            State:
                        </td>
                        <td class="item-value">
                            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataTextField="NAME" Width="260"
                                DataValueField="STATEID" DataSourceID="odsState" style="line-height:24px;">
                                <asp:ListItem Selected="True" Text="California" Value="CA"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Postal Code:
                        </td>
                        <td class="item-value">
                            <asp:TextBox ID="tbPostCode" runat="server" CssClass="form-control" Height="26px" MaxLength="5" Width="160"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="clear">
        </div>
    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="phContactDetails">
        <div class="section-title">
            Contact Details:
        </div>
        <div class="clear">
        </div>
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <tr class="row">
                        <td class="item-name">
                            Cell:
                        </td>
                        <td class="item-value">
                            <telerik:RadMaskedTextBox ID="tbCellNbr" runat="server" CssClass="form-control" Height="34px" Width="100px" Mask="(###) ###-####">
                            </telerik:RadMaskedTextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Home:
                        </td>
                        <td class="item-value">
                            <telerik:RadMaskedTextBox ID="tbHomePhoneNbr" runat="server" CssClass="form-control" Height="34px" Width="100px" Mask="(###) ###-####">
                            </telerik:RadMaskedTextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Work:
                        </td>
                        <td class="item-value">
                            <telerik:RadMaskedTextBox ID="tbWorkPhoneNbr" runat="server" CssClass="form-control" Height="34px" Width="100px" Mask="(###) ###-####">
                            </telerik:RadMaskedTextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Contact Email:
                        </td>
                        <td class="item-value">
                            <asp:TextBox ID="tbEmail" runat="server" MaxLength="120" Height="26px" CssClass="form-control" Width="200"></asp:TextBox>
                           <asp:Label ID="lbl_emailMsg" runat="server" Text="Label"></asp:Label>
                          <%-- * If unknown, please enter 
                           <% if( Role.ToString() == "Employee")
                              {
                                 Response.Write("Employer");
                              }
                              else{
                                 Response.Write("Employee");
                              }
                              %> email address.--%>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            <asp:Label ID="lblDepartment" runat="server" Text="Office Department:"></asp:Label>
                        </td>
                        <td class="item-value">
                            <asp:DropDownList ID="ddlDept" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataTextField="description"
                                DataValueField="DEPTID" DataSourceID="odsDepartments">
                            </asp:DropDownList>
                            <asp:Label runat="server" Text="" ID="lblDeptId" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="clear">
        </div>
    </asp:PlaceHolder>
    <asp:PlaceHolder runat="server" ID="phOptions">
        <div class="section-title">
            Other Options:
        </div>
        <div class="clear">
        </div>
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <tr class="row">
                        <td class="item-name" colspan="2">
                            <asp:CheckBox ID="ckHandicapped" runat="server" Text="Disabled" />
                        </td>
                    </tr>
                    <tr class="row" id="trAdoptionDate">
                        <td class="item-name">
                            <asp:Label ID="lblAdoptionDate" runat="server" Text="Adoption Date :"></asp:Label>
                        </td>
                        <td class="item-name">
                            <telerik:RadDatePicker ID="dpAdoptionDate" CssClass="form-control" MinDate="1900/1/1" runat="server">
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="clear">
        </div>
    </asp:PlaceHolder>
    <center>
        <asp:Button ID="btPrevious" runat="server" Text="Previous" Width="100" CausesValidation="false" OnClick="btPrevious_Click"
            CssClass="btn" />&nbsp;
        <asp:Button ID="btUpdate" runat="server" Text="Update" Width="100" OnClick="btUpdate_Click"
            CssClass="btn" />
    </center>
    <div id="UpdateErInfo" class="message-error">
        <asp:Literal ID="lblError" runat="server" EnableViewState="false"></asp:Literal>
    </div>
</div>
<telerik:RadInputManager ID="RadInputManager1" runat="server">
    <telerik:TextBoxSetting BehaviorID="TextBoxBehavior1" EmptyMessage="Type Last Name Here..."
        Validation-IsRequired="true">
        <TargetControls>
            <telerik:TargetInput ControlID="tbLName" />
        </TargetControls>
    </telerik:TextBoxSetting>
    <telerik:TextBoxSetting BehaviorID="TextBoxBehavior2" EmptyMessage="Type First Name Here..."
        Validation-IsRequired="true">
        <TargetControls>
            <telerik:TargetInput ControlID="tbFName" />
        </TargetControls>
    </telerik:TextBoxSetting>
    <telerik:TextBoxSetting BehaviorID="TextBoxBehavior3" EmptyMessage="Type Address Here..."
        Validation-IsRequired="true">
        <TargetControls>
            <telerik:TargetInput ControlID="tbAddress1" />
        </TargetControls>
    </telerik:TextBoxSetting>
    <telerik:TextBoxSetting BehaviorID="TextBoxBehavior4" EmptyMessage="Type apt/suite/unit# Here..."
        Validation-IsRequired="false">
        <TargetControls>
            <telerik:TargetInput ControlID="tbAddress2" />
        </TargetControls>
    </telerik:TextBoxSetting>
    <telerik:TextBoxSetting BehaviorID="TextBoxBehavior5" EmptyMessage="Type City Here..."
        Validation-IsRequired="true">
        <TargetControls>
            <telerik:TargetInput ControlID="tbCity" />
        </TargetControls>
    </telerik:TextBoxSetting>
    <telerik:RegExpTextBoxSetting BehaviorID="RagExpBehavior1" ValidationExpression="[0-9]{5,}"
        ErrorMessage="Enter more than 5 figures" IsRequiredFields="True" Validation-IsRequired="true">
        <TargetControls>
            <telerik:TargetInput ControlID="tbPostCode" />
        </TargetControls>
    </telerik:RegExpTextBoxSetting>
    <telerik:RegExpTextBoxSetting BehaviorID="RagExpBehavior2" ValidationExpression="[0-9]{10,}"
        ErrorMessage="Enter more than 10 figures">
        <TargetControls>
            <telerik:TargetInput ControlID="tbCellNbr" />
        </TargetControls>
    </telerik:RegExpTextBoxSetting>
    <telerik:RegExpTextBoxSetting BehaviorID="RagExpBehavior3" ValidationExpression="[0-9]{10,}"
        ErrorMessage="Enter more than 10 figures">
        <TargetControls>
            <telerik:TargetInput ControlID="tbHomePhoneNbr" />
        </TargetControls>
    </telerik:RegExpTextBoxSetting>
    <telerik:RegExpTextBoxSetting BehaviorID="RagExpBehavior4" ValidationExpression="[0-9]{10,}"
        ErrorMessage="Enter no more than 10 Numbers">
        <TargetControls>
            <telerik:TargetInput ControlID="tbWorkPhoneNbr" />
        </TargetControls>
    </telerik:RegExpTextBoxSetting>
    <telerik:RegExpTextBoxSetting BehaviorID="RagExpBehavior5" ValidationExpression="[0-9]{5,}"
        ErrorMessage="Enter no more than 5 figures">
        <TargetControls>
            <telerik:TargetInput ControlID="tbPostCode" />
        </TargetControls>
    </telerik:RegExpTextBoxSetting>
    <telerik:RegExpTextBoxSetting BehaviorID="RagExpBehavior6" EmptyMessage="Enter a Email address"
        ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
        ErrorMessage="Enter valid Email address!">
        <Validation IsRequired="true" />
        <TargetControls>
            <telerik:TargetInput ControlID="tbEmail" />
        </TargetControls>
    </telerik:RegExpTextBoxSetting>
</telerik:RadInputManager>
<asp:ObjectDataSource ID="odsDepartments" runat="server" OnSelecting="odsDepartments_Selecting"
    SelectMethod="GetDepartments" TypeName="Pibt.BLL.Employer">
    <SelectParameters>
        <asp:Parameter Name="employerId" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsState" runat="server" SelectMethod="GetState" 
    TypeName="Pibt.BLL.User"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsGender" runat="server" SelectMethod="GetGender" TypeName="Pibt.BLL.User">
    <SelectParameters>
        <asp:Parameter  Name="memberId" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>

<%--<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">

        function btnUpdateMember_click(sernder, args) {
            if (args.EventTarget == "<%=btUpdate.UniqueID %>") {
                if ($("#UpdateErInfo .error-list").length > 0 || $("#UpdateErInfo .alert-list").length > 0) {
                    PopupMsgDialog("UpdateErInfo");
                }
            }
        }
    </script>
</telerik:RadCodeBlock>--%>