<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlChangePassword.ascx.cs"
   Inherits="Pibt.UserControl.CtlChangePassword" %>
<style type="text/css">
   .auto-style1 {
      height: 26px;
   }
</style>
<div class="customer-info-box">
   <div class="section-body">
      <table class="table-container">
         <tbody>
            <tr class="message-error">
               <td colspan="3">
                  <asp:Literal ID="lblChangeLoginErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
               </td>
            </tr>
            <tr class="row">
               <td class="item-name">User Name:
               </td>
               <td class="item-value">
                  <asp:Label ID="lblLoginName" CssClass="form-control" runat="server"></asp:Label>
               </td>
               <td></td>
            </tr>
            <tr>
               <td colspan="3"></td>
            </tr>
            <tr>
               <td colspan="3"></td>
            </tr>
            <tr>
               <td colspan="3"></td>
            </tr>
            <tr class="row">
               <td class="item-name">New User Name:
               </td>
               <td class="item-value">
                  <asp:TextBox ID="tb_newLoginName" runat="server" CssClass="form-control" Height="26px" MaxLength="10"></asp:TextBox>
               </td>
               <td>&nbsp;(optional)
               </td>
            </tr>
            <tr>
               <td colspan="3"></td>
            </tr>
            <tr>
               <td colspan="3"></td>
            </tr>
            <tr class="row">
               <td></td>
               <td class="item-value">
                  <asp:Button ID="bt_changeLoginName" CssClass="btn" runat="server"
                     Text="Change Username" ValidationGroup="ChangePassword" OnClick="bt_changeLoginName_Click" CausesValidation="False" />
               </td>
            </tr>
            
            <tr>
               <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
               <td colspan="3">&nbsp;</td>
            </tr>

            <tr class="row">
               <td class="item-name">Old Password:
               </td>
               <td class="item-value">
                  <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-control" Height="28px" MaxLength="50" TextMode="Password"></asp:TextBox>
               </td>
               <td>
                  <asp:RequiredFieldValidator ID="rfvOldPassword" runat="server" ControlToValidate="txtOldPassword"
                     CssClass="required-info" ErrorMessage="* Required" ToolTip=".Old Password Is Required"
                     ValidationGroup="ChangePassword" />
               </td>
            </tr>
            <%--Extra Space--%>
            <tr>
               <td colspan="3"></td>
            </tr>
            <tr>
               <td colspan="3"></td>
            </tr>
            <tr>
               <td colspan="3"></td>
            </tr>
            <tr class="row">
               <td class="item-name">New Password:
               </td>
               <td class="item-value">
                  <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" Height="28px" MaxLength="50" TextMode="Password"></asp:TextBox>
               </td>
               <td>
                  <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNewPassword"
                     CssClass="required-info" ErrorMessage="* Required" ToolTip="New Password Is Required"
                     ValidationGroup="ChangePassword" />
               </td>
            </tr>
            <tr class="row">
               <td class="item-value"></td>
               <td class="item-value">
                  <div>
                     <span id="tdPwdStrength">Password Strength</span>
                     <table width="100px">
                        <tr style="height: 25px">
                           <td id="tdBad"></td>
                           <td id="tdWeak"></td>
                           <td id="tdStrong"></td>
                           <td id="tdBest"></td>
                        </tr>
                     </table>
                  </div>
               </td>
            </tr>
            <tr class="row">
               <td class="item-name">Confirm Password:
               </td>
               <td class="item-value">
                  <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" Height="28px" TextMode="Password"></asp:TextBox>
               </td>
               <td>
                  <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword"
                     CssClass="required-info" ErrorMessage="* Required" ToolTip="Confirm Password Is Required"
                     ValidationGroup="ChangePassword" />
               </td>
            </tr>
            <tr class="row">
               <td colspan="2">
                  <asp:CompareValidator ID="cvPasswordCompare" runat="server" ControlToCompare="txtNewPassword"
                     CssClass="required-info" ControlToValidate="txtConfirmPassword" Display="Dynamic"
                     ErrorMessage="Entered Passwords Do Not Match" ToolTip="Entered Passwords Do Not Match"
                     ValidationGroup="ChangePassword" />
               </td>
            </tr>
            <asp:LoginView ID="LoginViewLockWebUser" runat="server">
               <RoleGroups>
                  <asp:RoleGroup Roles="Administrator">
                     <ContentTemplate>
                        <tr class="row">
                           <td class="item-name">Lock Web Account:
                           </td>
                           <td>
                              <asp:CheckBox ID="chkLockUser" AutoPostBack="false" OnCheckedChanged="chkLockUser_CheckedChanged"
                                 runat="server" />
                           </td>
                        </tr>
                     </ContentTemplate>
                  </asp:RoleGroup>
               </RoleGroups>
            </asp:LoginView>
            <tr class="row">
               <td></td>
               <td class="item-value">
                  <asp:Button ID="btnChangePassword" CssClass="btn" runat="server" OnClick="BtnChangePassword_Click"
                     Text="Change Password" ValidationGroup="ChangePassword" />
               </td>
            </tr>
             <tr>
               <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
               <td colspan="3">&nbsp;</td>
            </tr>
            <tr class="row">
               <td class="item-name">
                  Web Contact Email:
               </td>
               <td class="item-value">
                  <asp:TextBox ID="oldEmail" runat="server" CssClass="form-control" Height="28px" ReadOnly="true"></asp:TextBox>
               </td>
            </tr>
            <tr class="row">
               <td class="item-name">
                  New Web Contact Email:
               </td>
               <td class="item-value">
                  <asp:TextBox ID="tb_newEmail" runat="server" CssClass="form-control" Height="28px"></asp:TextBox>
               </td>              
               <td>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ControlToValidate="tb_newEmail" runat="server" SetFocusOnError="true" CssClass="required-info"  ErrorMessage="*Please enter valid email address."></asp:RegularExpressionValidator>
               </td>
            </tr>           
             <tr class="row">
               <td></td>
               <td class="item-value">
                  <asp:Button ID="updateEmail" CssClass="btn" runat="server" OnClick="bt_changeEmail_Click"
                     Text="Change Email" CausesValidation="false" ValidationGroup="ChangePassword" />
               </td>
            </tr>
         </tbody>
      </table>
   </div>
   <div id="ChangePasswordDialog" class="message-error">
      <asp:Literal ID="lblChangePasswordErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
   </div>
   <div class="note-list">
      <ul class="items">
         <li>Password Rules: </li>
         <ul>
            <li>- Between 6-10 characters</li>
            <li>- Include letters (a-z) and numbers (0-9)</li>
            <li>- Include one special character</li>
         </ul>
         <li>A notification will be sent to Web Contact E-mail after the password is changed successfully.</li>
         <li>You may change username, but it is not required.</li>
      </ul>
   </div>
</div>
<br />
<br />
<%--<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">
       function btnChangePassword_click(sernder, args) {
          if (args.EventTarget == "<%=btnChangePassword.UniqueID %>") {
              if ($("#ChangePasswordDialog .error-list").length > 0 || $("#ChangePasswordDialog .alert-list").length > 0) {
                 PopupMsgDialog("ChangePasswordDialog");
              }
           }
        }
    </script>
</telerik:RadCodeBlock> --%>

