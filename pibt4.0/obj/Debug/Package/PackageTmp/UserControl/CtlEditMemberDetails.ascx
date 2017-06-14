<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlEditMemberDetails.ascx.cs"
    Inherits="Pibt.UserControl.CtlEditMemberDetails" %>
<div class="customer-info-box">
    <asp:Panel runat="server" ID="phEmployeeDetails">
        <br />
        <asp:Label CssClass="info" ID="lblName" runat="server" Style="font-size: x-large;
            line-height: 1.5em;"></asp:Label><br />
        <hr />
        <asp:Label CssClass="info" ID="lblEmployeeType" runat="server" Style="font-size: x-large;
            line-height: 1.5em;" ></asp:Label>
        <br />
        <br />
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
                            <asp:TextBox runat="server" ID="tbLName" CssClass="form-control" MaxLength="20"   Height="26px" Enabled="false"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="required-info"
                                ControlToValidate="tbLName" ErrorMessage="Last Name can't include numeric or any special character."
                                Display="Dynamic" ValidationGroup="EditMember" ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            First&nbsp;Name:
                        </td>
                        <td class="item-value">
                            <asp:TextBox runat="server" ID="tbFName" CssClass="form-control" MaxLength="15"   Height="26px" Enabled="false"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="required-info"
                                ControlToValidate="tbFName" ErrorMessage="First name can't include numeric or any special character."
                                Display="Dynamic" ValidationGroup="EditMember" ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Middle&nbsp;Initial:
                        </td>
                        <td class="item-value">
                            <asp:TextBox runat="server" ID="tbMName" MaxLength="1" CssClass="form-control" Width="30"  Height="26px" Enabled="false"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="required-info"
                                ControlToValidate="tbMName" ErrorMessage="Middle Initial can't include numeric or any special character."
                                Display="Dynamic" ValidationGroup="EditMember" ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            Gender:
                        </td>
                        <td class="item-value">
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
                            Birthdate:
                        </td>
                        <td class="item-value">
                            <telerik:RadDatePicker ID="dpBirthDate" CssClass="form-control" MinDate="1900/1/1" runat="server" Enabled="false" >
                            </telerik:RadDatePicker>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required Field "
                                ControlToValidate="dpBirthDate"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="row" >
                        <td class="item-name">
                            Marriage Date:
                        </td>
                        <td class="item-value">
                            <telerik:RadDatePicker ID="dpMarriageDate" CssClass="form-control" MinDate="1900/1/1" runat="server" Enabled="false" >
                            </telerik:RadDatePicker>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            <asp:Label ID="lblHireDate" runat="server" Text="Hire Date:"></asp:Label>
                        </td>
                        <td class="item-value">
                            <telerik:RadDatePicker ID="dpHireDate" CssClass="form-control" MinDate="1900/1/1" runat="server" Enabled="false" >
                            </telerik:RadDatePicker>
                            <asp:RequiredFieldValidator ID="RfvDpHireDate" runat="server" ErrorMessage="*Required Field "
                                ControlToValidate="dpHireDate"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name">
                            <asp:Label ID="lbSmoker" runat="server" Text="Smoker:"></asp:Label>
                        </td>
                        <td class="item-value" >
                            <asp:DropDownList ID="ddlSmoker" runat="server" CssClass="form-control" Enabled="false" >
                                <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                <asp:ListItem Text="No" Value="N"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="row" id="trHours">
                        <td class="item-name" >
                            <asp:Label ID="lbHours" runat="server" Text="Hours worked per Week:"></asp:Label>
                        </td>
                        <td class="item-value">
                            <asp:TextBox ID="tbHours" runat="server" CssClass="form-control" Height="26px" Enabled="false" MaxLength="3" ></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="phPhsicalAddress">
        <div class="section-title">
            Physical Address:
        </div>
        <div class="clear">
        </div>
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            Street&nbsp;Address:
                        </td>
                        <td class="item-value tcell-padding">                            
                            <asp:TextBox ID="tbAdd1" runat="server" CssClass="form-control" Height="26px" MaxLength="80" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            Street&nbsp;Address 2:
                        </td>
                        <td class="item-value tcell-padding">
                            <asp:TextBox ID="tbAdd2" runat="server" CssClass="form-control" Height="26px" MaxLength="30" Width="400"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            City:
                        </td>
                        <td class="item-value tcell-padding">
                            <asp:TextBox ID="tCity" runat="server" CssClass="form-control" MaxLength="30" Height="26px" Width="255"></asp:TextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            State:
                        </td>
                        <td class="item-value tcell-padding">
                            <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" AppendDataBoundItems="True" DataTextField="NAME" Width="260"
                                DataValueField="STATEID" DataSourceID="odsState" style="line-height:24px;">
                                <asp:ListItem Selected="True" Text="California" Value="CA"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            Zip:
                        </td>
                        <td class="item-value tcell-padding">
                            <asp:TextBox ID="tbZip" runat="server" CssClass="form-control" Height="26px" MaxLength="5" Width="160"></asp:TextBox>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="clear">
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="phContactDetails">
        <div class="section-title">
            Contact Details:
        </div>
        <div class="clear">
        </div>
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            Mobile:
                        </td>
                        <td class="item-value tcell-padding">
                            <telerik:RadMaskedTextBox ID="tbCellNbr" runat="server" CssClass="form-control" Height="34px" Width="100px" Mask="(###) ###-####">
                            </telerik:RadMaskedTextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            Home:
                        </td>
                        <td class="item-value tcell-padding">
                            <telerik:RadMaskedTextBox ID="tbHomePhoneNbr" runat="server" CssClass="form-control" Height="34px" Width="100px" Mask="(###) ###-####">
                            </telerik:RadMaskedTextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            Work:
                        </td>
                        <td class="item-value tcell-padding">
                            <telerik:RadMaskedTextBox ID="tbWorkPhoneNbr" runat="server" CssClass="form-control" Height="34px" Width="100px" Mask="(###) ###-####">
                            </telerik:RadMaskedTextBox>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            EMail:
                        </td>
                        <td class="item-value tcell-padding">
                            <asp:TextBox ID="tEmail" runat="server" MaxLength="120" Height="26px" CssClass="form-control" Width="200"></asp:TextBox>
                            <asp:Label ID="lbl_emailMsg" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            <asp:Label ID="lblDepartment" runat="server" Text="Office Department:"></asp:Label>
                        </td>
                        <td class="item-value tcell-padding">
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
    </asp:Panel>
    <asp:Panel runat="server" ID="ContributionOptions">
        <div class="section-title">
            Employer Monthly Contribution for:
        </div>
        <div class="clear" ></div>
        <div class="section-body">
            <table class="table-container">
                <tbody>
                    <tr class="row">
                        <td class="item-name tcell-padding" colspan="6">
                            Contribution %
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            For Employee:
                        </td>
                        <td class="item-value tcell-padding">
                            <asp:TextBox ID="eeContribution" runat="server" CssClass="form-control" Height="26px" MaxLength="6" ></asp:TextBox>
                        </td>
                        <td>
                            <asp:RangeValidator ID="eeContRange" ControlToValidate="eeContribution" runat="server" CssClass="required-info"  ErrorMessage="*Must be between 0-100%" MinimumValue="0" MaximumValue="100" Type="Double" Display="Dynamic" ></asp:RangeValidator>
                            <asp:RegularExpressionValidator ID="eeContRegular" ControlToValidate="eeContribution" runat="server" CssClass="required-info" Text="*"
                                ErrorMessage="*Numbers (which may contain a decimal point) only" Display="Dynamic" ValidationExpression="^\d{0,3}(\.\d{0,2})?" >
                            </asp:RegularExpressionValidator>
                        </td>
                        <td class="item-name tcell-padding">
                            For Dependent:
                        </td>
                        <td class="item-value tcell-padding">
                            <asp:TextBox ID="depContribution" runat="server" CssClass="form-control" Height="26px" MaxLength="6"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RangeValidator ID="depContRange" ControlToValidate="depContribution" runat="server" CssClass="required-info"  ErrorMessage="*Must be between 0-100%" MinimumValue="0" MaximumValue="100" Type="Double" Display="Dynamic" ></asp:RangeValidator>
                            <asp:RegularExpressionValidator ID="depContRegular" ControlToValidate="depContribution" runat="server" CssClass="required-info" Text="*"
                                ErrorMessage="*Numbers (which may contain a decimal point) only" Display="Dynamic" ValidationExpression="^\d{0,3}(\.\d{0,2})?" >
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding" colspan="6">
                            $ Contribution
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            For Employee:
                        </td>
                        <td class="item-value tcell-padding">
                            <asp:TextBox ID="eeDollar" runat="server" CssClass="form-control" Height="26px" MaxLength="8" ></asp:TextBox>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="eeDollarRegular" ControlToValidate="eeDollar" runat="server" CssClass="required-info"
                                ErrorMessage="*Numbers (which may contain a decimal point) only" Display="Dynamic" ValidationExpression="^\d{0,5}(\.\d{0,2})?">
                            </asp:RegularExpressionValidator>
                        </td>
                        <td class="item-name tcell-padding">
                            For Dependent:
                        </td>
                        <td class="item-value tcell-padding">
                            <asp:TextBox ID="depDollar" runat="server" CssClass="form-control" Height="26px" MaxLength="8" ></asp:TextBox>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="depDollarRegular" ControlToValidate="depDollar" runat="server" CssClass="required-info"
                                ErrorMessage="*Numbers (which may contain a decimal point) only" Display="Dynamic" ValidationExpression="^\d{0,5}(\.\d{0,2})?">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding" colspan="6">
                            Wages:
                        </td>
                    </tr>
                    <tr class="row">
                        <td class="item-name tcell-padding">
                            Periods per year:
                        </td>
                        <td class="item-value tcell-padding">                            
                            <asp:DropDownList ID="ddlPeriod" runat="server" CssClass="form-control" >
                                <asp:ListItem Text="-- Select --" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Annual" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Semi-annual" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Quarterly" Value="4"></asp:ListItem>
                                <asp:ListItem Text="Monthly" Value="12"></asp:ListItem>
                                <asp:ListItem Text="Semi-monthly" Value="24"></asp:ListItem>
                                <asp:ListItem Text="Bi-weekly" Value="26"></asp:ListItem>
                                <asp:ListItem Text="Weekly" Value="52"></asp:ListItem>
                                <asp:ListItem Text="Daily" Value="260"></asp:ListItem>
                                <asp:ListItem Text="Hourly" Value="2080"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td class="item-name tcell-padding">
                            Pay per period:
                        </td>
                        <td class="item-value tcell-padding">
                            <asp:TextBox ID="salary" runat="server" CssClass="form-control" Height="26px" MaxLength="8" ></asp:TextBox>
                        </td>
                        <td>
                            <asp:RegularExpressionValidator ID="salaryRegular" ControlToValidate="salary" runat="server" CssClass="required-info"
                                ErrorMessage="*Numbers (which may contain a decimal point) only" Display="Dynamic" ValidationExpression="^\d{0,5}(\.\d{0,2})?">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="phOptions">
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
                            <asp:Label ID="lblAdoptionDate" runat="server" Text="Adoption Date:"></asp:Label>
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
    </asp:Panel>
    <center>
        <asp:Button ID="btPrevious" runat="server" Text="Cancel" Width="100" CausesValidation="false" OnClick="btPrevious_Click"
            CssClass="btn" />&nbsp;
        <asp:Button ID="btUpdate" runat="server" Text="Update" Width="100" OnClick="btUpdate_Click"
            CssClass="btn" />
    </center>
    <div id="UpdateErInfo" class="message-error">
        <asp:Literal ID="lblError" runat="server" EnableViewState="false"></asp:Literal>
    </div>
</div>
<telerik:RadInputManager ID="RadInputManager1" runat="server">
    <telerik:TextBoxSetting BehaviorID="TextBoxBehavior1" EmptyMessage="Type Last Name Here"
        Validation-IsRequired="true">
        <TargetControls>
            <telerik:TargetInput ControlID="tbLName" />
        </TargetControls>
    </telerik:TextBoxSetting>
    <telerik:TextBoxSetting BehaviorID="TextBoxBehavior2" EmptyMessage="Type First Name Here"
        Validation-IsRequired="true">
        <TargetControls>
            <telerik:TargetInput ControlID="tbFName" />
        </TargetControls>
    </telerik:TextBoxSetting>
    <telerik:TextBoxSetting BehaviorID="TextBoxBehavior3" EmptyMessage="Type Address Here"
        Validation-IsRequired="true">
        <TargetControls>
            <telerik:TargetInput ControlID="tbAddress1" />
        </TargetControls>
    </telerik:TextBoxSetting>
    <telerik:TextBoxSetting BehaviorID="TextBoxBehavior4" EmptyMessage="Type Apt/Suite/Unit # Here"
        Validation-IsRequired="false">
        <TargetControls>
            <telerik:TargetInput ControlID="tbAddress2" />
        </TargetControls>
    </telerik:TextBoxSetting>
    <telerik:TextBoxSetting BehaviorID="TextBoxBehavior5" EmptyMessage="Type City Here"
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
    <telerik:RegExpTextBoxSetting BehaviorID="RagExpBehavior5" ValidationExpression="[0-9]{5,}"
        ErrorMessage="Enter no more than 5 figures">
        <TargetControls>
            <telerik:TargetInput ControlID="tbPostCode" />
        </TargetControls>
    </telerik:RegExpTextBoxSetting>
    <telerik:RegExpTextBoxSetting BehaviorID="RagExpBehavior6"
        ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ErrorMessage="Enter valid eMail address.">
        <Validation IsRequired="false" />
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
