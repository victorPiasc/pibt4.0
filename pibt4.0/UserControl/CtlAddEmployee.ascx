<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAddEmployee.ascx.cs"
    Inherits="Pibt.UserControl.CtlAddEmployee" %>

<div class="message-error" style="margin-top: 10px;">
    <asp:ValidationSummary ID="ValidaitonSummary2" runat="server" DisplayMode="BulletList" />
    <asp:Literal ID="lblCreationMessage2" runat="server" EnableViewState="False"></asp:Literal>
</div>
<fieldset>
    <legend><b>Add Employee </b></legend>
    <asp:Label ID="Label2" runat="server" Text="Label2" Font-Size="14px">
        <span style="color:red; font-size:x-large;">*</span> Indicates required field.
    </asp:Label>
    <div class="customer-info-box">
        <asp:PlaceHolder runat="server" ID="phEmployeeDetails">
            <div class="section-title">
                Employee Details:
            </div>
            <div class="clear">
            </div>
            <div class="section-body">
                <table class="table-container">
                    <tbody>
                        <tr class="row">
                            <td class="item-name">Last&nbsp;Name:<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="item-value">
                                <telerik:RadTextBox ID="tbLName" runat="server" CssClass="form-control" Placeholder="Enter Last Name" Width="260" MaxLength="20"
                                    Height="34px">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="LastNameValidator" runat="server" CssClass="required-info" SetFocusOnError="true" ErrorMessage="*Last name is a required field" Text="*" ControlToValidate="tbLName" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="required-info"  SetFocusOnError="true" ErrorMessage="*No special characters" Text="*" ControlToValidate="tbLName" Display="Dynamic"  ValidationExpression="[a-z A-Z]+" ></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">First&nbsp;Name:<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="item-value">
                                <telerik:RadTextBox ID="tbFName" runat="server" CssClass="form-control" Placeholder="Enter First Name" Width="260" MaxLength="20"
                                    Height="34px">
                                </telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="FirstNameValidator" runat="server" CssClass="required-info" SetFocusOnError="true" ErrorMessage="*First name is a required field" Text="*" ControlToValidate="tbFName" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" CssClass="required-info"  SetFocusOnError="true" ErrorMessage="*No special characters" Text="*" ControlToValidate="tbFName" Display="Dynamic"  ValidationExpression="[a-z A-Z]+" ></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Middle&nbsp;Initial:
                            </td>
                            <td class="item-value">
                                <telerik:RadTextBox runat="server" ID="tbMName" CssClass="form-control" MaxLength="1" Width="35" Height="34px"></telerik:RadTextBox>
                            </td>
                             <td>
                                <asp:RegularExpressionValidator ID="middleInitialReg" runat="server" CssClass="required-info"  SetFocusOnError="true" ErrorMessage="*No special characters" Text="*" ControlToValidate="tbMName" Display="Dynamic"  ValidationExpression="[a-z A-Z]+" ></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Gender:<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="item-value">
                                <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                                    <asp:ListItem Selected="True" Text="-- Select --" Value="X"></asp:ListItem>
                                    <asp:ListItem Text="Male" Value="Y"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="N"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">SSN:<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="item-value">
                                <telerik:RadMaskedTextBox ID="tbSSN" runat="server" Width="100px" Height="34px" MaxLength="9" Mask="###-##-####">
                                </telerik:RadMaskedTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="required-info" SetFocusOnError="true" ErrorMessage="*SSN is a required field" Text="*" ControlToValidate="tbSSN" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regularExpressionValidator" runat="server" CssClass="required-info" SetFocusOnError="true" ErrorMessage="*SSN minimum lenght is 9 characters long" Text="*" ControlToValidate="tbSSN" Display="Dynamic" ValidationExpression = "[\s\S]{11,11}$"></asp:RegularExpressionValidator>
                            </td>
                                
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Birthdate:<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="item-value">
                                <telerik:RadDatePicker ID="dpBirthDate" CssClass="form-control" MinDate="1900/1/1" runat="server">
                                </telerik:RadDatePicker>
                                (MM/DD/YYYY)
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="required-info" SetFocusOnError="true" ErrorMessage="*Birthdate is a required field" Text="*" ControlToValidate="dpBirthDate" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row" hidden="hidden">
                            <td class="item-name">Marriage&nbsp;Date:
                            </td>
                            <td class="item-value">
                                <telerik:RadDatePicker ID="dpMarriageDate" CssClass="form-control" MinDate="1900/1/1" runat="server" ControlToValidate="dpMarriageDate">
                                </telerik:RadDatePicker>
                                (MM/DD/YYYY)
                            </td>
                            <td>
                                <asp:CompareValidator ID="CompareValidator1" CssClass="required-info" runat="server"
                                    ErrorMessage="*Marriage date must be after birthdate." ControlToCompare="dpBirthDate" ControlToValidate="dpMarriageDate" Type="Date" Operator="GreaterThan" Text="*" Display="Dynamic">
                                </asp:CompareValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Hire&nbsp;Date:<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="item-value">
                                <telerik:RadDatePicker ID="dpHireDate" MinDate="1900/1/1" CssClass="form-control" DateInput-AutoPostBack="true" OnSelectedDateChanged="RadDatePicker1_SelectedDateChanged" DateInput-CausesValidation="false" runat="server">
                                </telerik:RadDatePicker>
                                (MM/DD/YYYY)
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="required-info" SetFocusOnError="true" runat="server" ErrorMessage="*Hire date is a required field" Text="*" ControlToValidate="dpHireDate" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator2" CssClass="required-info" runat="server" ErrorMessage="*Hire date must be after birthdate." ControlToCompare="dpBirthDate" Text="*" ControlToValidate="dpHireDate" Type="Date" Operator="GreaterThan" Display="Dynamic">
                                </asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Pay&nbsp;Period:</td>
                            <td class="item-value" colspan="2">
                                <asp:DropDownList ID="ddlPeriod" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="-- Select --" Value="0" Selected="True"></asp:ListItem>
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
                        </tr>
                        <tr class="row">
                            <td class="item-name">Pay&nbsp;per&nbsp;Period:&nbsp;$</td>
                            <td class="item-value">
                                <telerik:RadTextBox ID="tbSalary" runat="server" CssClass="form-control" Width="260" MaxLength="10" Height="34px"></telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:RegularExpressionValidator ID="salaryRegExp" runat="server" CssClass="required-info" ErrorMessage="*Numbers only"
                                    ControlToValidate="tbSalary" ValidationExpression="^\d{0,7}(\.\d{0,2})?" Display="Dynamic"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Hours&nbsp;Worked&nbsp;Per&nbsp;Week:<span style="color: red">&nbsp;*</span></td>
                            <td class="item-value">
                                <telerik:RadTextBox ID="tbHours" runat="server" CssClass="form-control" Width="260" MaxLength="3" Height="34px" ></telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="requiredHours" runat="server" CssClass="required-info" ErrorMessage="*Hours worked is required" ControlToValidate="tbHours" Display="Dynamic" Text="*"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regularExpHours" runat="server" CssClass="required-info" ErrorMessage="*Numbers only"
                                    ControlToValidate="tbHours" ValidationExpression="^\d+$" Display="Dynamic">
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Smoker:<span style="color: red">&nbsp;*</span></td>
                            <td class="item-value">
                                 <asp:DropDownList ID="ddlSmoker" runat="server" CssClass="form-control" >
                                    <asp:ListItem Text="--Select--" Value="X"></asp:ListItem>
                                    <asp:ListItem Text="Yes" Value="Y"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="N"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                 <asp:RequiredFieldValidator ID="requiredSmoker" runat="server" CssClass="required-info" ErrorMessage="*Smoker is a required field" Text="*" ControlToValidate="ddlSmoker" InitialValue="X" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="HireDateLabel" runat="server" Font-Size="Larger" ForeColor="Red"></asp:Label>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" ID="phPhsicalAddress">
            <div class="section-title">
                Physical Address:
            </div>
            <div class="clear">
            </div>
            <div class="section-body red">
                <table class="table-container">
                    <tbody>
                        <tr class="row">
                            <td class="item-name">Street&nbsp;Address:<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="item-value">
                                <telerik:RadTextBox ID="tbAddress1" CssClass="form-control" runat="server" Height="34px" MaxLength="80" Width="400"></telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="StreetAddressValidator" runat="server" CssClass="required-info" SetFocusOnError="true" ErrorMessage="*Street address is a required field" Text="*" ControlToValidate="tbAddress1" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">City:<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="item-value">
                                <telerik:RadTextBox ID="tbCity" runat="server" CssClass="form-control" MaxLength="30" Height="34px" Width="260"></telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="CityValidator" runat="server" CssClass="required-info" SetFocusOnError="true" ErrorMessage="*City is a required field" ControlToValidate="tbCity" Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">State:<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="item-value">
                                <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" Width="260" AppendDataBoundItems="True" DataTextField="NAME"
                                    DataValueField="STATEID" DataSourceID="odsState">
                                    <asp:ListItem Selected="True" Text="California" Value="CA"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Zip&nbsp;Code:<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="item-value">
                                <telerik:RadTextBox ID="tbPostCode" runat="server" CssClass="form-control" MaxLength="9" Height="34px" Width="160"></telerik:RadTextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="ZipCodeValidator" runat="server" CssClass="required-info" SetFocusOnError="true" ErrorMessage="*Zip code is a required field" Text="*" ControlToValidate="tbPostCode" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="[0-9]{5,}" ControlToValidate="tbPostCode" runat="server" ErrorMessage="*Please enter valid zip code" Text="*" Font-Size="Larger" Display="Dynamic">
                                </asp:RegularExpressionValidator></td>
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
                            <td class="item-name">Mobile:
                            </td>
                            <td class="item-value">
                                <telerik:RadMaskedTextBox ID="tbCellNbr" runat="server" Height="34px" CssClass="form-control" Width="115px" Mask="(###) ###-####">
                                </telerik:RadMaskedTextBox>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Home:
                            </td>
                            <td class="item-value">
                                <telerik:RadMaskedTextBox ID="tbHomePhoneNbr" runat="server" Height="34px" CssClass="form-control" Width="115px" Mask="(###) ###-####">
                                </telerik:RadMaskedTextBox>
                            </td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Work:
                            </td>
                            <td class="item-value">
                                <telerik:RadMaskedTextBox ID="tbWorkPhoneNbr" runat="server" Height="34px" CssClass="form-control" Width="115px" Mask="(###) ###-####">
                                </telerik:RadMaskedTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">EMail:<span style="color: red">&nbsp;*</span>
                            </td>
                            <td class="item-value">
                                <telerik:RadTextBox ID="tbEmail" runat="server" MaxLength="120" CssClass="form-control" Height="34px" Width="380"></telerik:RadTextBox>&nbsp;&nbsp;&nbsp;
                            </td>
                            <td>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="required-info" SetFocusOnError="true" ErrorMessage="*EMail is a required field" Text="*" ControlToValidate="tbEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="row">
                            <td></td>
                            <td></td>
                            <td>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ControlToValidate="tbEmail" runat="server" ForeColor="Red" Font-Size="larger" ErrorMessage="*Please enter valid email address." Display="Dynamic" Text="*"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr class="row">
                            <td>&nbsp;</td>
                        </tr>
                        <tr class="row">
                            <td class="item-name">Department&nbsp;Code:
                            </td>
                            <td class="item-value">
                                <asp:DropDownList ID="ddlDept" runat="server" AppendDataBoundItems="True" CssClass="form-control" DataTextField="description"
                                    DataValueField="DEPTID" DataSourceID="odsDepartments">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="clear">
            </div>
        </asp:PlaceHolder>
        <br />
        <br />
        <asp:PlaceHolder runat="server" ID="phOptions">
            <div class="section-title">
                Other Options:
            </div>
            <div class="section-body">
                For disability enrollment, please contact your Relationship Keeper.
            </div>
            <div class="clear">
            </div>
        </asp:PlaceHolder>
        <div id="AddEmployeeDialog">
            <asp:Literal ID="lblError" runat="server"></asp:Literal>
        </div>
        <div class="bottom-center-buttons">
            <p style="color: red; font-size: 14px; font-family: Open Sans;">Note: Please review all information entered above before clicking "Next" button</p>
            <asp:Button ID="btPrevious" CssClass="btn" runat="server" Text="Cancel" Width="100" OnClick="btPrevious_Click" CausesValidation="false" />
            <asp:Button ID="btAdd" CssClass="btn" runat="server" Text="Next" Width="120" OnClick="btAdd_Click" CausesValidation="true" AutoPostBack="True" />
        </div>
        <asp:HiddenField ID="hideNewMemberId" runat="server" />
    </div>
</fieldset>
<asp:ObjectDataSource ID="odsState" runat="server" SelectMethod="GetState" TypeName="Pibt.BLL.User"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsDepartments" runat="server" OnSelecting="odsDepartments_Selecting"
    SelectMethod="GetDepartments" TypeName="Pibt.BLL.Employer">
    <SelectParameters>
        <asp:Parameter Name="employerId" Type="String" />
    </SelectParameters>
</asp:ObjectDataSource>
