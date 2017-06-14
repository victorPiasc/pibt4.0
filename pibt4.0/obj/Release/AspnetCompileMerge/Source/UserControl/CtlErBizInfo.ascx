<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlErBizInfo.ascx.cs"
   Inherits="Pibt.UserControl.CtlBizInfo" %>
<div class="customer-info-box">
   <div class="section-title">
      Company Details
   </div>
   <div class="section-body">
      <ul class="readonly-view">
         <li><span class="label">Company Name:</span>
            <asp:Label ID="tbCompanyName" CssClass="data" runat="server"></asp:Label>
         </li>
      </ul>
   </div>
   <div class="section-title">
      Physical Address
   </div>
   <div class="section-body">
      <table class="table-container">
         <tr class="row">
            <td class="item-name">
               Street Address:
            </td>
            <td class="readonly-view item-Value tcell-padding">
               <asp:Label ID="tbPhsicalStreetAddress1" CssClass="data" runat="server"></asp:Label>
            </td>
         </tr>
         <tr class="row">
            <td class="item-name">
               City:
            </td>
            <td class="readonly-view item-Value tcell-padding">
               <asp:Label ID="tbPhsicalCity" CssClass="data" runat="server"></asp:Label>
            </td>
         </tr>
         <tr class="row">
            <td class="item-name">
               State:
            </td>
            <td class="readonly-view item-Value tcell-padding">
               <asp:Label ID="tbPhsicalState" CssClass="data" runat="server"></asp:Label>
            </td>
         </tr>
         <tr class="row">
            <td class="item-name">
               Zip:
            </td>
            <td class="readonly-view item-Value tcell-padding">
               <asp:Label ID="tbPhsicalPostCode" CssClass="data" runat="server"></asp:Label>
            </td>
         </tr>
         <tr class="row">
             <td class="item-name">
                Phone Number:
             </td>
             <td class="readonly-view item-value tcell-padding">
                 <asp:Label ID="tbPhoneNumber" CssClass="data" runat="server"></asp:Label>
             </td>
         </tr>
         <tr class="row">
            <td class="item-name" colspan="2">
               Contact Person:
            </td>
         </tr>
         <tr class="row">
            <td class="readonly-view item-Value" colspan="2">
               <div>
                  <asp:TextBox ID="tbPhsicalContact" runat="server" CssClass="form-control" Height="27px" MaxLength="60" Width="400"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvPhsicalContact" runat="server" ControlToValidate="tbPhsicalContact" ErrorMessage="Required field"
                     CssClass="required-info" ValidationGroup="CustomerInfo">
                  </asp:RequiredFieldValidator>
               </div>
            </td>
         </tr>
         <tr class="row">
            <td class="item-name" colspan="2">
               EMail:
            </td>
         </tr>
         <tr class="row">
            <td class="readonly-view item-Value" colspan="2">
               <div>
                  <asp:TextBox ID="tbPhsicalEmail" runat="server" CssClass="form-control" Height="27px" MaxLength="100" Width="400"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvPhsicalEmail" Display="Dynamic" runat="server" ControlToValidate="tbPhsicalEmail"
                     ErrorMessage="Required field" CssClass="required-info" ValidationGroup="CustomerInfo">
                  </asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="tbPhsicalEmail"
                     ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ValidationGroup="CustomerInfo"
                     CssClass="required-info" Display="Dynamic" runat="server" ErrorMessage="Invalid eMail format">
                  </asp:RegularExpressionValidator>
               </div>
            </td>
         </tr>
      </table>
   </div>
   <div class="section-title">
      Mailing Address
   </div>
   <div class="section-body">
      <table class="table-container">
         <tr class="row">
            <td class="item-name">
               Street Address:
            </td>
            <td class="readonly-view item-Value tcell-padding">
               <asp:Label ID="tbMailingStreetAddress1" CssClass="data" runat="server"></asp:Label>
            </td>
         </tr>
         <tr class="row">
            <td class="item-name">
               City:
            </td>
            <td class="readonly-view item-Value tcell-padding">
               <asp:Label ID="tbMailingCity" CssClass="data" runat="server"></asp:Label>
            </td>
         </tr>
         <tr class="row">
            <td class="item-name">
               State:
            </td>
            <td class="readonly-view item-Value tcell-padding">
               <asp:Label ID="tbMailingState" CssClass="data" runat="server"></asp:Label>
            </td>
         </tr>
         <tr class="row">
            <td class="item-name">
               Zip:
            </td>
            <td class="readonly-view item-Value tcell-padding">
               <asp:Label ID="tbMailingPostCode" CssClass="data" runat="server"></asp:Label>
            </td>
         </tr>
         <tr class="row">
            <td class="item-name" colspan="2">
               Contact Person:
            </td>
         </tr>
         <tr class="row">
            <td class="readonly-view item-Value" colspan="2">
               <div>
                  <asp:TextBox ID="tbMailingContact" runat="server" CssClass="form-control" Height="27px" MaxLength="60" Width="400"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbMailingContact" ErrorMessage="Required field"
                     CssClass="required-info" ValidationGroup="CustomerInfo">
                  </asp:RequiredFieldValidator>
               </div>
            </td>
         </tr>
         <tr class="row">
            <td class="item-name" colspan="2">
               EMail:
            </td>
         </tr>
         <tr class="row">
            <td class="readonly-view item-Value" colspan="2">
               <div>
                  <asp:TextBox ID="tbMailingEmail" runat="server" CssClass="form-control" Height="27px" MaxLength="100" Width="400"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvMailingEmail" Display="Dynamic" runat="server" ControlToValidate="tbPhsicalEmail"
                     ErrorMessage="Required field" CssClass="required-info" ValidationGroup="CustomerInfo">
                  </asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="revEmail1" ControlToValidate="tbMailingEmail"
                     ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$" ValidationGroup="CustomerInfo"
                     CssClass="required-info" Display="Dynamic" runat="server" ErrorMessage="Invalid eMail format">
                  </asp:RegularExpressionValidator>
               </div>
            </td>
         </tr>
      </table>
   </div>
   <asp:PlaceHolder ID="pStatus" runat="server" Visible="false">
      <div class="section-title">
         Status
      </div>
      <table class="table-container">
         <tr class="row">
            <td class="item-name">
               Start Date:
            </td>
            <td class="readonly-view item-Value tcell-padding">
               <asp:Label ID="lbStartDate" CssClass="data" runat="server"></asp:Label>
            </td>
         </tr>
         <tr class="row">
            <td class="item-name">
               End Date:
            </td>
            <td class="readonly-view item-Value tcell-padding">
               <asp:Label ID="lbEndDate" CssClass="data" runat="server"></asp:Label>
            </td>
         </tr>
      </table>
   </asp:PlaceHolder>
   <div class="bottom-center-buttons">
      <asp:Button ID="btSave" runat="server" ValidationGroup="CustomerInfo" Text="Update" CssClass="btn" Width="100" OnClick="btSave_Click" />
   </div>
   <div id="UpdateErInfo" class="message-error">
      <asp:Literal ID="lblMsg" runat="server" EnableViewState="false"></asp:Literal>
   </div>
</div>
