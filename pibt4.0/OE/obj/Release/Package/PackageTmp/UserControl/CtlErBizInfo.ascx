<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlErBizInfo.ascx.cs"
   Inherits="Pibt.UserControl.CtlBizInfo" %>
<div class="customer-info-box">
   <div class="section-title">
      Company Details
   </div>
   <div class="section-body">
      <ul class="readonly-view">
         <li><span class="label">Company Name :</span>
            <asp:Label ID="tbCompanyName" CssClass="data" runat="server"></asp:Label>
         </li>
      </ul>
   </div>
   <div class="section-title">
      Physical Address
   </div>
   <div class="section-body">
      <ul class="readonly-view">
         <li><span class="label">Street Address :</span>
            <asp:Label ID="tbPhsicalStreetAddress1" CssClass="data" runat="server"></asp:Label>
         </li>
         <%--            <li><span class="label">Street Address Two :</span>
                <asp:Label ID="tbPhsicalStreetAddress2" CssClass="data" runat="server"></asp:Label>
            </li>--%>
         <li><span class="label">City :</span>
            <asp:Label ID="tbPhsicalCity" CssClass="data" runat="server"></asp:Label>
         </li>
         <li><span class="label">State :</span>
            <asp:Label ID="tbPhsicalState" CssClass="data" runat="server"></asp:Label>
         </li>
         <li><span class="label">Postal Code :</span>
            <asp:Label ID="tbPhsicalPostCode" CssClass="data" runat="server"></asp:Label>
         </li>
         <li><span class="label edit">Contact Person :</span>
            <div style="margin: 7px;"><asp:TextBox ID="tbPhsicalContact" runat="server" CssClass="form-control" Height="27px" MaxLength="60" Width="400"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhsicalContact" runat="server" ControlToValidate="tbPhsicalContact"
               ErrorMessage="It is required." CssClass="required-info" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator></div>
         </li>
         <li><span class="label">Contact Email :</span>
            <div style="margin: 7px;"><asp:TextBox ID="tbPhsicalEmail" runat="server" CssClass="form-control" Height="27px" MaxLength="100" Width="400"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhsicalEmail" Display="Dynamic" runat="server"
               ControlToValidate="tbPhsicalEmail" ErrorMessage="It is required." CssClass="required-info"
               ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="tbPhsicalEmail"
               ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
               ValidationGroup="CustomerInfo" CssClass="required-info" Display="Dynamic" runat="server"
               ErrorMessage="Email format is invalid!"></asp:RegularExpressionValidator></div>
         </li>
      </ul>
   </div>
   <div class="section-title">
      Mailing Address
   </div>
   <div class="section-body">
      <ul class="readonly-view">
         <li><span class="label">Street Address :</span>
            <asp:Label ID="tbMailingStreetAddress1" CssClass="data" runat="server"></asp:Label>
         </li>
         <%--            <li><span class="label">Street Address Two :</span>
                <asp:Label ID="tbMailingStreetAddress2" CssClass="data" runat="server"></asp:Label>
            </li>--%>
         <li><span class="label">City :</span>
            <asp:Label ID="tbMailingCity" CssClass="data" runat="server"></asp:Label>
         </li>
         <li><span class="label">State Province :</span>
            <asp:Label ID="tbMailingState" CssClass="data" runat="server"></asp:Label>
         </li>
         <li><span class="label">Postal Code :</span>
            <asp:Label ID="tbMailingPostCode" CssClass="data" runat="server"></asp:Label>
         </li>
         <li><span class="label edit">Contact Person :</span>
            <div style="margin: 7px;"><asp:TextBox ID="tbMailingContact" runat="server" CssClass="form-control" Height="27px" MaxLength="60" Width="400"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbMailingContact"
               ErrorMessage="It is required." Display="Dynamic" CssClass="required-info" ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
         </div>
         </li>
         <li><span class="label edit">Contact Email :</span>
            <div style="margin: 7px;"><asp:TextBox ID="tbMailingEmail" runat="server" CssClass="form-control" Height="27px" MaxLength="60" Width="400"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMailingEmail" Display="Dynamic" runat="server"
               ControlToValidate="tbMailingEmail" ErrorMessage="It is required." CssClass="required-info"
               ValidationGroup="CustomerInfo"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail1" ControlToValidate="tbMailingEmail"
               ValidationExpression="^[\w\.\-]+@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]{1,})*(\.[a-zA-Z]{2,3}){1,2}$"
               ValidationGroup="CustomerInfo" CssClass="required-info" Display="Dynamic" runat="server"
               ErrorMessage="Email format is invalid!"></asp:RegularExpressionValidator></div>
         </li>
      </ul>
   </div>
   <div class="section-title">
      Status
   </div>
   <div class="section-body">
      <ul class="readonly-view">
         <li><span class="label">Start Date :</span>
            <asp:Label ID="lbStartDate" CssClass="data" runat="server"></asp:Label>
         </li>
         <li><span class="label">End Date :</span>
            <asp:Label ID="lbEndDate" CssClass="data" runat="server"></asp:Label>
         </li>
       </ul>
   </div>
   <div class="bottom-center-buttons">
      <asp:Button ID="btSave" runat="server" ValidationGroup="CustomerInfo" Text="Update"
         CssClass="btn" Width="100" OnClick="btSave_Click" />
   </div>
   <div id="UpdateErInfo" class="message-error">
      <asp:Literal ID="lblMsg" runat="server" EnableViewState="false"></asp:Literal>
   </div>
</div>
<%--<telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
   <script type="text/javascript">

      function customResponseEnd(sernder, args) {
         if (args.EventTarget == "<%=btSave.UniqueID %>") {
            if ($("#UpdateErInfo .error-list").length > 0 || $("#UpdateErInfo .alert-list").length > 0) {
               PopupMsgDialog("UpdateErInfo");
            }
         }
      }
   </script>
</telerik:RadCodeBlock>--%>
