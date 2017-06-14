<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlAddDependents.ascx.cs"
   Inherits="Pibt.UserControl.CtlAddDependents" %>
<%--<%@ Register Src="CtlCreateWebUser.ascx" TagName="CtlCreateWebUser" TagPrefix="uc1" %>--%>
<fieldset>
   <div id="AddDependentDialog2" class="message-error" style="margin-top:10px;">             
         <asp:Literal ID="lblCompletionMessage" runat="server"></asp:Literal>
      </div>
</fieldset>
<fieldset>
   <legend><b>Add New Dependent for Employee #<asp:Label ID="lbleeId" runat="server" Text=""></asp:Label>
      <asp:Label ID="lblEeName" runat="server" Text=""></asp:Label></b></legend>

   <div class="customer-info-box">
      <asp:PlaceHolder runat="server" ID="phEmployeeDetails">
         <div class="section-title">
            Member Details :
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
                        <telerik:RadTextBox ID="tbLName" runat="server" CssClass="form-control" Placeholder="Enter Your Last Name" Width="260" MaxLength="50" Height="34px"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorlastname" CssClass="required-info" SetFocusOnError="true"
                           runat="server" ErrorMessage="*Last name is a required field" ControlToValidate="tbLName">
                        </asp:RequiredFieldValidator>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">First Name:<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <telerik:RadTextBox ID="tbFName" runat="server" CssClass="form-control" Placeholder="Enter Your First Name" Width="260" MaxLength="50" Height="34px"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorfirstname" CssClass="required-info" SetFocusOnError="true"
                           runat="server" ErrorMessage="*First name is a required field" ControlToValidate="tbFName">
                        </asp:RequiredFieldValidator>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">Middle Initial:
                     </td>
                     <td class="item-value">
                        <asp:TextBox runat="server" ID="tbMName" CssClass="form-control" Height="26px" MaxLength="1" Width="30"></asp:TextBox>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3">&nbsp;</td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">Gender:
                     </td>
                     <td class="item-value">
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" Width="160px">
                           <asp:ListItem Selected="true" Text="Male" Value="Y"></asp:ListItem>
                           <asp:ListItem Text="Female" Value="N"></asp:ListItem>
                        </asp:DropDownList>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">SSN:<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <telerik:RadMaskedTextBox ID="tbSSN" runat="server" Width="160px" Height="34px" CssClass="form-control" MaxLength="9" Mask="###-##-####">
                        </telerik:RadMaskedTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="required-info" SetFocusOnError="true"
                           ErrorMessage="*SSN is a required field" ControlToValidate="tbSSN"></asp:RequiredFieldValidator>
<%--                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="required-info" SetFocusOnError="true"
                           runat="server" ErrorMessage="*SSN is a required field" ControlToValidate="tbSSN"
                           EnableClientScript="false" Display="Dynamic">
                        </asp:RequiredFieldValidator>--%>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="3">&nbsp;</td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">Relationship:
                     </td>
                     <td class="item-value">
                        <asp:DropDownList ID="ddlEeType" runat="server" CssClass="form-control" AutoPostBack="true" Width="260px"
                           OnSelectedIndexChanged="ddlEeType_SelectedIndexChanged" CausesValidation="False">
                           <asp:ListItem Selected="true" Text="Spouse" Value="1"></asp:ListItem>
                           <asp:ListItem Text="Child" Value="2"></asp:ListItem>
                           <asp:ListItem Text="Domestic Partner" Value="3"></asp:ListItem>
                        </asp:DropDownList>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">Birth Date :<span style="color:red "> *</span>
                     </td>
                     <td class="item-value">
                        <telerik:RadDatePicker ID="dpBirthDate" CssClass="form-control" MinDate="1900/1/1" runat="server">
                        </telerik:RadDatePicker>
                        (MM/DD/YYYY)
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="required-info" SetFocusOnError="true"
                            ErrorMessage="*Birth date is a required field" ControlToValidate="dpBirthDate"></asp:RequiredFieldValidator>
<%--                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="required-info" SetFocusOnError="true"
                           runat="server" ErrorMessage="*Birth date is a required field" ControlToValidate="dpBirthDate" EnableClientScript="false"
                           Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        <asp:CompareValidator ID="CompareValidator1" CssClass="required-info" runat="server" ErrorMessage="*Marriage date must be later than birth date."
                           ControlToCompare="dpBirthDate" ControlToValidate="dpMarriageDate" Type="Date" Operator="GreaterThan" Text="*Marriage date must be later than birth date."></asp:CompareValidator>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">
                        <asp:Label ID="lb_MarriageDate" runat="server" Text="Marriage Date:"></asp:Label>
                     </td>
                     <td class="item-value">
                        <telerik:RadDatePicker ID="dpMarriageDate" CssClass="form-control" MinDate="1900/1/1" runat="server">
                        </telerik:RadDatePicker>
                        <asp:Label ID="lb_MarriageDate2" runat="server">(MM/DD/YYYY)</asp:Label>
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
                        <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" Width="260px" AppendDataBoundItems="True" DataTextField="NAME"
                           DataValueField="STATEID" DataSourceID="odsState">
                           <asp:ListItem Selected="false" Text="Select State" Value=""></asp:ListItem>
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
                        <telerik:RadMaskedTextBox ID="tbCellNbr" CssClass="form-control" Height="34px" runat="server" Width="100px" Mask="(###) ###-####">
                        </telerik:RadMaskedTextBox>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">Home:
                     </td>
                     <td class="item-value">
                        <telerik:RadMaskedTextBox ID="tbHomePhoneNbr" CssClass="form-control" Height="34px" runat="server" Width="100px" Mask="(###) ###-####">
                        </telerik:RadMaskedTextBox>
                     </td>
                  </tr>
                  <tr class="row">
                     <td class="item-name">Work:
                     </td>
                     <td class="item-value">
                        <telerik:RadMaskedTextBox ID="tbWorkPhoneNbr" CssClass="form-control" Height="34px" runat="server" Width="100px" Mask="(###) ###-####">
                        </telerik:RadMaskedTextBox>
                     </td>
                  </tr>
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
                        <asp:Label ID="Label1" runat="server" Text="Label">* If unknown, please enter employer's email address.</asp:Label></td>
                     <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
                           ControlToValidate="tbEmail" runat="server" ForeColor="Red" Font-Size="larger" ErrorMessage="Please enter valid email address."></asp:RegularExpressionValidator>
                     </td>
                  </tr>
               </tbody>
            </table>
         </div>
         <asp:Label ID="Label2" runat="server" Text="Label2" Font-Size="14px" Font-Bold="true"><span style="color:red; font-size:x-large;">*</span> Indicates required field.</asp:Label>
         <div class="clear">
         </div>
      </asp:PlaceHolder>
<%--      <uc1:CtlCreateWebUser ID="CtlCreateWebUser1" Role="Dependent" runat="server" HideCreateButton="true"
         AutoGeneratePWD="true" />--%>
      <asp:PlaceHolder runat="server" ID="phOptions">
         <div class="section-title">
            Other Options:
         </div>
         <div class="clear">
         </div>
         <div class="section-body red">
            For disability enrollment, please contact your PIBT Relationship Keeper.
         </div>
         <div class="clear">
         </div>
      </asp:PlaceHolder>
      <div id="AddDependentDialog" class="message-error" style="margin-top:10px;">    
         <asp:ValidationSummary ID="ValidationSummary2" runat="server" DisplayMode="BulletList" />  
         <asp:Literal ID="lblError" runat="server"></asp:Literal>
      </div>
      <div class="bottom-center-buttons">
         <asp:Button ID="btAdd" runat="server" CssClass="btn" Text="Add Dependent" Width="120" OnClick="btAdd_Click"
            CausesValidation="true" />
      </div>
      <asp:HiddenField ID="hideNewMemberId" runat="server" />
   </div>


   <telerik:RadInputManager ID="RadInputManager1" runat="server">
<%--      <telerik:RegExpTextBoxSetting BehaviorID="RagExpBehavior1" ValidationExpression="[0-9]{5,}"
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
<%--      <telerik:RegExpTextBoxSetting BehaviorID="RagExpBehavior6" Validation-IsRequired="true"
         ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
         ErrorMessage="Enter valid Email address!">
         <TargetControls>
            <telerik:TargetInput ControlID="tbEmail" />
         </TargetControls>
      </telerik:RegExpTextBoxSetting>--%>
   </telerik:RadInputManager>
   <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="SubmitInfo" EnableClientScript="False" CssClass="ValidationSummary" BorderStyle="Solid" EnableTheming="False" Font-Size="Medium" ShowMessageBox="True" BorderColor="#999999" DisplayMode="List"></asp:ValidationSummary>--%>
</fieldset>
<asp:ObjectDataSource ID="odsState" runat="server" SelectMethod="GetState" TypeName="Pibt.BLL.User"></asp:ObjectDataSource>
<telerik:RadCodeBlock ID="RadCodeBlock" runat="server">
   <style type="text/css">
      #ValidationSummary1 {
         font-size: 15px;
      }
   </style>
</telerik:RadCodeBlock>
<%--<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
   
    <script type="text/javascript">
       function ShowDialog(){
                var msg = AlertMsgHTML("If you have a dependent, please Click [Add Dependent]. If not, click [Continue] to proceed enrollment.");
           $('#AddDependentDialog').html(msg);
                $('#AddDependentDialog').dialog({
                    title: "Create new Dependent successful !",
                    autoOpen: false,
                    modal: true,
                    draggable: false,
                    width: 600,
                    buttons: {
                        "Add Dependent": function () { 
                                $('#AddDependentDialog').dialog('close');
                                $('#AddDependentDialog').dialog('destroy');
                                $('#AddDependentDialog').hide();
                                window.location.href = "/employer/AddDependent.aspx?eeId=" + <%=EmployeeId %> + "&erId=" + <%=EmployerId %>;
                            },
                        "Continue": function () { 
                                window.location.href = "/OE/Type.aspx?eeId=" + <%=EmployeeId %>;
                        }
                    },
                    resizable:false
                });
                $('#AddDependentDialog').dialog('open');
           radalert(msg, 600, 280, 'Client RadAlert', null, "/images/ok.png");
           return false;
        }

    function customRequestStart(sernder, args) {
            $("#<%=hideNewMemberId.ClientID %>").val("");
    }

    function customResponseEnd(sernder, args) {
        if (args.EventTarget == "<%=btAdd.UniqueID %>") {
            var msg = $('#AddDependentDialog').html();
            var newMemberId = $("#<%=hideNewMemberId.ClientID %>").val();
                if (newMemberId != "") {
                    //ShowDialog();
                   radalert(msg, 600, 280, 'Completed!', null, "/images/ok.png");
                }else{
                    //PopupMsgDialog("AddDependentDialog");
                   radalert(msg, 600, 280, 'Confirmation!', null, "/images/error.png");
                }
        }
    }
    </script>
</telerik:RadCodeBlock>--%>
