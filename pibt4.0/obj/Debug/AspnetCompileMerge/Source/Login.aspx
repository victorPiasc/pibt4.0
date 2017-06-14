﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pibt.Login" %>

<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="contentWrapper">
      <div class="row">
         <div class="column-12">
            <h1>Welcome!</h1>
            <hr /> 
         </div>
      </div>
      <div class="row">
         <div class="column-4">
            <asp:Panel runat="server" DefaultButton="LoginButton">
               <table class="login-form" style="width: 240px;">
                  <tbody>
                     <tr class="row">
                        <td class="item-name">
                           <label>
                              Username&nbsp;&nbsp;&nbsp;</label>
                        </td>
                        <td class="item-value"></td>
                     </tr>
                     <tr>

                        <td>
                           <asp:TextBox ID="UserName" Width="100%" CssClass="form-control" autofocus="autofocus" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="UserNameOrEmailRequired" Display="Dynamic" runat="server"
                              ControlToValidate="UserName" Text="*Required" ErrorMessage="Username is required." CssClass="red"
                              ToolTip="Username is required." ValidationGroup="LoginForm"></asp:RequiredFieldValidator></td>
                        <td>&nbsp;</td>
                     </tr>
                     <tr>
                        <td>&nbsp;</td>
                     </tr>
                     <tr class="row">
                        <td class="item-name">
                           <label>
                              Password&nbsp;&nbsp;&nbsp;</label>
                        </td>
                        <td class="item-value"></td>
                     </tr>
                     <tr>

                        <td>
                           <asp:TextBox ID="Password" Width="100%" CssClass="form-control" TextMode="Password" runat="server"
                              MaxLength="50"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="PasswordRequired" Display="Dynamic" runat="server"
                              ControlToValidate="Password" Text="*Required" ErrorMessage="Password Required" CssClass="red"
                              ToolTip="Password Required" ValidationGroup="LoginForm"></asp:RequiredFieldValidator></td>
                        <td></td>
                     </tr>
                     <tr class="row">
                        <td class="item-value" colspan="2">
                           <asp:CheckBox ID="RememberMe" Text="Remember me next time" runat="server"></asp:CheckBox>
                        </td>
                     </tr>
                     <tr class="row">
                        <td colspan="2">
                           <p>
                           </p>
                           <div>
                              <asp:HyperLink ID="hlForgotPassword" CssClass="link" runat="server" NavigateUrl="~/passwordrecovery.aspx"
                                 Text="Forgot Password"></asp:HyperLink>
                           </div>
                           <br />
                           <div>
                              Not a <%=Pibt.Common.Utilities.Us()%> member? 
                              <br/>
                              <a class="link" href="Register.aspx">Click here</a>
                           </div>                           
                        </td>
                     </tr>
                     <tr>
                        <td></td>
                     </tr>
                     <tr class="row">
                        <td colspan="2" align="right">
                           <center>
                                    <asp:Button ID="LoginButton" class="btn" runat="server" Width="100%" CommandName="Login" Text="Sign in"
                                       ValidationGroup="LoginForm" OnClick="LoginButton_Click" />
                                 </center>
                        </td>
                     </tr>
                     <tr class="row">
                        <td class="message-error" colspan="2" style="font-size: large; font-family: Open sans;">
                           <asp:Literal ID="lbl_failureText" runat="server" EnableViewState="False"></asp:Literal>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </asp:Panel>
         </div>
         <div class="column-8">
            <table>
               <tbody>
                  <tr>
                     <td align="left" style="padding-right: 5px; padding-top: 10px;">
                        Did you know you can: <br/><br/>
                        <ul class="disc">
                           <li style="font-size: 16px; font-family: Open Sans; padding: 3px;">Check your billing status</li>
                           <li style="font-size: 16px; font-family: Open Sans; padding: 3px;">View your account activity</li>
                           <li style="font-size: 16px; font-family: Open Sans; padding: 3px;">View your detailed coverage information</li>
                           <li style="font-size: 16px; font-family: Open Sans; padding: 3px;">Email your questions to OnlineHelpDesk@piasc.org</li>              
                        </ul>
                              <br />
                              <p style="color: black; font-size: 12px; width :426px;">
                                 You are authorized to use this system for approved business purposes only.
                                 Use for any other purpose is prohibited.
                                 All transactional records, reports, email, software, and any other
                                 data generated by or residing upon this system are
                                 the property of the Company and may be used by
                                 the Company for any purpose. 
                                 Authorized and unauthorized activities may be monitored.
                                 </p>
                     </td>
                  </tr>
                  <tr>
                     <td align="right" style="padding-right: 20px; padding-top: 20px;"></td>
                  </tr>
               </tbody>
            </table>
         </div>

      </div>
   </div>
</asp:Content>