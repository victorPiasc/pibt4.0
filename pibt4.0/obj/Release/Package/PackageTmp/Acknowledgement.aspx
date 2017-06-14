<%@ Page Title="" Language="C#" MasterPageFile="~/WebSite.Master" AutoEventWireup="true" CodeBehind="Acknowledgement.aspx.cs" Inherits="Pibt.Acknowledgement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div id="contentWrapper">
      <div class="row">
         <div class="column-12">
            <h1>Acknowledgement</h1>
            <hr>
         </div>
         <div class="column-12">
            <br />
            <p>
             By clicking on the <span style="font-weight:bold;">Continue</span> button below, you acknowledge that you are an authorized representative of the company and, as such, you are authorized to administer your company’s group health insurance plan information including confidential employee data.  You agree that you will only access this confidential data for the sole purpose of administering the company’s group health insurance plan through our portal.  Further, you agree, at a minimum, to protect your company information available through the portal in a manner consistent with how you protect other confidential company information. 
           </p>
                <br/><br/><br/>
         </div>
         <div style="vertical-align:middle">
                <asp:Button ID="btnContinue" class="btn" runat="server" Width="200px"  Text="Continue" OnClick="btnContinue_Click" />
         </div> 
      </div>
   </div>
</asp:Content>
