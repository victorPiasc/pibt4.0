<%@ Page Title="" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true"
   CodeBehind="Register.aspx.cs" Inherits="Pibt.Register" %>

<asp:Content ID="Content7" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="contentWrapper">
      <div class="row">
         <div class="column-12">
            <h1>Register</h1>
            <hr>
            <center>
               <h2 class="sans">
                  If you already have a <%=Pibt.Common.Utilities.Us()%> Account,<br/>
                  please contact your <%=Pibt.Common.Utilities.Us()%> Relationship Keeper to<br/>
                  register your account for online access.</h2>
               <h2 class="sans">If you are not a member,<a href="/OnlineQuoteEmployer.aspx">Click here</a> to get a quote</h2>
            </center>
         </div>
      </div>
   </div>
</asp:Content>
