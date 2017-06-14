<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAddEmployee.ascx.cs"
   Inherits="Pibt.UserControl.CtlAddEmployee" %>
<%--<%@ Register Src="CtlCreateWebUser.ascx" TagName="CtlCreateWebUser" TagPrefix="uc1" %>--%>

<fieldset>
         <div class="message-error" style="margin-top:10px;">    
         <asp:ValidationSummary ID="ValidaitonSummary2" runat="server" DisplayMode="BulletList" />     
         <asp:Literal ID="lblCreationMessage2" runat="server" EnableViewState="False"></asp:Literal>
</div>
</fieldset>

<fieldset>
   <legend><b>Add New Employee </b></legend>
   <div class="customer-info-box">
      <asp:PlaceHolder runat="server" ID="phEmployeeDetails">
         <div class="section-title">
            Employee Detail:
         </div>
         <div class="clear">
         </div>
         <div class="section-body">
            <table class="table-container">
               <tbody>
                  <tr class="row">
                     <td class="item-name">Last Name:<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <telerik:RadTextBox ID="tbLName" runat="server" CssClass="form-control" Placeholder="Enter Your Last Name" Width="260" MaxLength="20" Height="34px"></telerik:RadTextBox>
                     </td>
                     <td>
                        <asp:RequiredFieldValidator ID="LastNameValidator" runat="server" CssClass="required-info" SetFocusOnError="true"
                           ErrorMessage="*Last name is a required field" ControlToValidate="tbLName"></asp:RequiredFieldValidator>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">First Name:<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <telerik:RadTextBox ID="tbFName" runat="server" CssClass="form-control" Placeholder="Enter Your First Name" Width="260" MaxLength="20" Height="34px"></telerik:RadTextBox>
                     </td>
                     <td>
                        <asp:RequiredFieldValidator ID="FirstNameValidator" runat="server" CssClass="required-info" SetFocusOnError="true"
                           ErrorMessage="*First name is a required field" ControlToValidate="tbFName"></asp:RequiredFieldValidator>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">Middle Initial:
                     </td>
                     <td class="item-value">
                        <telerik:RadTextBox runat="server" ID="tbMName" CssClass="form-control" MaxLength="1" Width="35" Height="34px"></telerik:RadTextBox>
                     </td>
                  </tr>
                  <tr><td colspan="3">&nbsp;</td></tr>
                  <tr class="row">
                     <td class="item-name">Gender:
                     </td>
                     <td class="item-value">
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" Width="100">
                           <asp:ListItem Selected="True" Text="Male" Value="Y"></asp:ListItem>
                           <asp:ListItem Text="Female" Value="N"></asp:ListItem>
                        </asp:DropDownList>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">SSN:<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <telerik:RadMaskedTextBox ID="tbSSN" runat="server" Width="100px" Height="34px" MaxLength="9" Mask="###-##-####">
                        </telerik:RadMaskedTextBox>

                     </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="required-info" SetFocusOnError="true"
                           ErrorMessage="*SSN is a required field" ControlToValidate="tbSSN"></asp:RequiredFieldValidator></td>
                  </tr>
                  <tr><td colspan="3">&nbsp;</td></tr>
                  <tr class="row">
                     <td class="item-name">Birth Date:<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <telerik:RadDatePicker ID="dpBirthDate" CssClass="form-control" MinDate="1900/1/1" runat="server">
                        </telerik:RadDatePicker>
                        (MM/DD/YYYY)

                     </td>
                     <td>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="required-info" SetFocusOnError="true"
                            ErrorMessage="*Birth date is a required field" ControlToValidate="dpBirthDate"></asp:RequiredFieldValidator>
                     </td>
                  </tr>
                  <tr class="row" hidden="hidden">
                     <td class="item-name">Marriage Date:
                     </td>
                     <td class="item-value">
                        <telerik:RadDatePicker ID="dpMarriageDate" CssClass="form-control" MinDate="1900/1/1" runat="server" ControlToValidate="dpMarriageDate">
                        </telerik:RadDatePicker>
                        (MM/DD/YYYY)

                     </td>
                     <td>
                         <asp:CompareValidator ID="CompareValidator1" CssClass="required-info" runat="server" ErrorMessage="*Marriage date must be later than birth date." ControlToCompare="dpBirthDate" ControlToValidate="dpMarriageDate" Type="Date" Operator="GreaterThan" Text="*Marriage date must be later than birth date."></asp:CompareValidator>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">Hire Date:<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <telerik:RadDatePicker ID="dpHireDate" MinDate="1900/1/1" CssClass="form-control" DateInput-AutoPostBack="true" OnSelectedDateChanged="RadDatePicker1_SelectedDateChanged" DateInput-CausesValidation="false" runat="server">
                        </telerik:RadDatePicker>
                        (MM/DD/YYYY)
                     </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="required-info" SetFocusOnError="true"
                           runat="server" ErrorMessage="*Hire date is a required field" ControlToValidate="dpHireDate"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" CssClass="required-info" runat="server" ErrorMessage="*Hire date must be later than birth date." ControlToCompare="dpBirthDate" ControlToValidate="dpHireDate" Type="Date" Operator="GreaterThan" Text="*Hire date must be later than birth date."></asp:CompareValidator>
                     </td>
                  </tr>
                  <tr>
                     <td></td>
                     <td></td>
                     <td>
                        <asp:Label ID="HireDateLabel" runat="server" Font-Size="Larger" ForeColor="Red"></asp:Label></td>
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
                     <td class="item-name">Street Address:<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <telerik:RadTextBox ID="tbAddress1" CssClass="form-control" runat="server" Height="34px" MaxLength="80" Width="400"></telerik:RadTextBox>
                     </td>
                     <td>
                        <asp:RequiredFieldValidator ID="StreetAddressValidator" runat="server" CssClass="required-info" SetFocusOnError="true"
                           ErrorMessage="*Street address is a required field" ControlToValidate="tbAddress1"></asp:RequiredFieldValidator>
                     </td>
                  </tr>
                  <%--<tr class="row">
                            <td class="item-name">
                                Apt/Suite/Unite #:
                            </td>
                            <td class="item-value">
                                <asp:TextBox ID="tbAddress2" runat="server" MaxLength="30" Width="240"></asp:TextBox>
                            </td>
                        </tr>--%>
                  <tr class="row">
                     <td class="item-name">City:<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <telerik:RadTextBox ID="tbCity" runat="server" CssClass="form-control" MaxLength="30" Height="34px" Width="260"></telerik:RadTextBox>
                     </td>
                     <td>
                        <asp:RequiredFieldValidator ID="CityValidator" runat="server" CssClass="required-info" SetFocusOnError="true"
                           ErrorMessage="*City is a required field" ControlToValidate="tbCity"></asp:RequiredFieldValidator>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">State:<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" Width="260" AppendDataBoundItems="True" DataTextField="NAME"
                           DataValueField="STATEID" DataSourceID="odsState">
                           <asp:ListItem Selected="True" Text="California" Value="CA"></asp:ListItem>
                        </asp:DropDownList>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">Zip Code:<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <telerik:RadTextBox ID="tbPostCode" runat="server" CssClass="form-control" MaxLength="9" Height="34px" Width="160"></telerik:RadTextBox>
                     </td>
                     <td>
                        <asp:RequiredFieldValidator ID="ZipCodeValidator" runat="server" CssClass="required-info" SetFocusOnError="true"
                           ErrorMessage="*Zip code is a required field" ControlToValidate="tbPostCode"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="[0-9]{5,}" ControlToValidate="tbPostCode" 
                           runat="server" ErrorMessage="Please enter valid zip code" Font-Size="Larger"></asp:RegularExpressionValidator></td>
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
                     <td class="item-name">Cell:
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
                  <tr><td colspan="3">&nbsp;</td></tr>
                  <tr class="row">
                     <td class="item-name">Contact Email:<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <telerik:RadTextBox ID="tbEmail" runat="server" MaxLength="120" CssClass="form-control" Height="34px" Width="380"></telerik:RadTextBox>&nbsp;&nbsp;&nbsp;                               
                     </td>
                     <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="required-info" SetFocusOnError="true"
                           ErrorMessage="*Email is a required field" ControlToValidate="tbEmail"></asp:RequiredFieldValidator>
                     </td>          
                  </tr>
                  <tr class="row">
                     <td></td>
                     <td>
                        <asp:Label ID="Label1" runat="server" Text="Label">* If unknown, please enter employer's email address.</asp:Label>
                     </td>
                     <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" 
                           ControlToValidate="tbEmail" runat="server" ForeColor="Red" Font-Size="larger" ErrorMessage="Please enter valid email address."></asp:RegularExpressionValidator></td> 
                  </tr>
                  <tr class="row">
                     <td>&nbsp;</td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">Department Code:
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
         <asp:Label ID="Label2" runat="server" Text="Label2" Font-Size="14px"><span style="color:red; font-size:x-large;">*</span> Indicates required field.</asp:Label>
         <div class="clear">
         </div>
      </asp:PlaceHolder>
      <br />
      <br />
<%--      <uc1:CtlCreateWebUser ID="CtlCreateWebUser1" Role="Employee" runat="server" HideCreateButton="true"
         AutoGeneratePWD="true" />--%>
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
         <p style="color: red; font-size: 14px; font-family: Open Sans;">Note: Please review all information entered above before clicking "Add Employee" button</p>
         <asp:Button ID="btPrevious" CssClass="btn" runat="server" Text="Cancel" Width="100" OnClick="btPrevious_Click" CausesValidation="false" />
         <asp:Button ID="btAdd" CssClass="btn" runat="server" Text="Add Employee" Width="120" OnClick="btAdd_Click" AutoPostBack="True" />
      </div>
      <div class="message-error" style="margin-top:10px;">    
         <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" />     
         <asp:Literal ID="lblCreationMessage" runat="server" EnableViewState="False"></asp:Literal>
      </div>
      <asp:HiddenField ID="hideNewMemberId" runat="server" />
   </div>
       <telerik:RadInputManager ID="RadInputManager1" runat="server">
<%--   <telerik:RegExpTextBoxSetting BehaviorID="RagExpBehavior1" ValidationExpression="[0-9]{5,}"
            ErrorMessage="Enter more than 5 figures" IsRequiredFields="True" Validation-IsRequired="true">
            <TargetControls>
                <telerik:TargetInput ControlID="tbPostCode" />
            </TargetControls>
        </telerik:RegExpTextBoxSetting>--%>
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
<%--        <telerik:RegExpTextBoxSetting BehaviorID="RagExpBehavior6" Validation-IsRequired="true"
            ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
            ErrorMessage="Enter valid Email address!">
            <TargetControls>
                <telerik:TargetInput ControlID="tbEmail" />
            </TargetControls>
        </telerik:RegExpTextBoxSetting>--%>
    </telerik:RadInputManager>
</fieldset>
<asp:ObjectDataSource ID="odsState" runat="server" SelectMethod="GetState" TypeName="Pibt.BLL.User"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="odsDepartments" runat="server" OnSelecting="odsDepartments_Selecting"
   SelectMethod="GetDepartments" TypeName="Pibt.BLL.Employer">
   <SelectParameters>
      <asp:Parameter Name="employerId" Type="String" />
   </SelectParameters>
</asp:ObjectDataSource>
<%-- <telerik:RadTextBox runat="server" ID="tbLName" MaxLength="20" CssClass="Textbox"></telerik:RadTextBox>--%>
