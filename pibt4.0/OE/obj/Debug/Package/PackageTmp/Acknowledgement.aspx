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
         <!-- end column -->
         <div class="column-12">
            <br />
            <%--<p>A gift basket from Your Lollipop Shop is the perfect way to wish someone a Happy Birthday. The special this week includes...</p>--%>
            <p>
             By clicking on the Continue button, you acknowledge that you are an authorized user of this system, 
            containing employee personal and confidential data, and group health insurance plan information, 
            as designated by your broker. You agree that you shall only access data pertaining to those individual 
            employees and/or their dependents as it is necessary to perform your specific job function within your organization. 
            To the extent that your employer (or client, an employer group health plan) maintains separate divisions, 
            you acknowledge that you are solely responsible for ensuring that your access to data contained herein does not exceed 
            the scope of what is minimally necessary for you to perform your particular job function. 
           </p>
                <br/><br/><br/>
         </div>
         <div style="vertical-align:middle">
                <asp:Button ID="btnContinue" class="btn" runat="server" Width="200px"  Text="Continue" OnClick="btnContinue_Click" />
         </div> 
      </div>
      <!-- end column -->
      <!-- end row -->
   </div>
</asp:Content>
