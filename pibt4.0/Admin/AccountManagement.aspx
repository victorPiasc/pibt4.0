<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeBehind="AccountManagement.aspx.cs" Inherits="Pibt.Admin.AccountManagement" %>

<%@ Register Src="../UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
   &gt;<span>Account Management</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
   <uc2:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
   <div class="customer-info-box">
      <div class="section-body">
         <fieldset>
            <legend>Locked Accounts</legend>
            <div class="section-body">
               <center>
                  <asp:Button ID="btnUnlock" CssClass="btn" runat="server" Text="Unlock Accounts" OnClick="btnUnlock_Click" AutoPostBack="True" OnClientClick="Confirm()" />
               </center>
            </div>
         </fieldset>
      </div>
   </div>
   <script type="text/javascript">
      function Confirm() {
         var confirm_value = document.createElement("INPUT");
         confirm_value.type = "hidden";
         confirm_value.name = "confirm_value";
         if (confirm("You have unlocked all user accounts.")) {
            confirm_value.value = "Ok";
         }
         document.forms[0].appendChild(confirm_value);
      }
   </script>

</asp:Content>
