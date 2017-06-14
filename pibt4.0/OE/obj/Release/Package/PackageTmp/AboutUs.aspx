<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Pibt.WhoWeAre" %>

<%--<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>--%>
<%--<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>--%>
<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
    &nbsp;&nbsp; &gt; &nbsp;&nbsp;About Us
</asp:Content>--%>
<%--<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>--%>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="contentWrapper">
      <div class="row">
         <div class="column-12">
            <h1>Who We Are</h1>
            <hr>
         </div>
         <!-- end column -->
         <div class="column-12">
            PIBT is a new name for a familiar friend.  Since 1989, PIBT has been providing outstanding products and services to thousands of member companies. Now, as of January 1, 2014, we have enlarged 
     our arena of service and are able to provide quality healthcare benefits efficiently and effectively for companies in the printing industry.
     With the current health insurance benefits in a constant state of flux, PIBT is able to reliably offer "The true benefit of benefits." That is Choice,
     Affordability and Added Value.
            <br />
            <%--<p>A gift basket from Your Lollipop Shop is the perfect way to wish someone a Happy Birthday. The special this week includes...</p>--%>
            <ul class="disc">
               <li><strong>Choice</strong>: PIBT offers over 80 different choices of medical group plans from three of the top carriers: Blue Shield, Health Net
     and Kaiser Permanente.  In addition to medical plans, PIBT also offers employers the option of adding dental, vision, mental-health and chiropractic coverage to their company's
     package of plan options for their employees.</li>
               <li><strong>Affordability</strong>: PIBT premiums have always been competitive, being based on thousands of enrollees participating in our group health plans.  Our premiums are for a full 12-month period, beginning in December of each year.</li>
               <li><strong>Added Value</strong>: Our experienced Team Leads help employers in navigating the many details in selecting health care plans for their employees, and 
     in resolving escalated benefits issues.  Our talented Relationship Keepers are dedicated to assist our individual members in better understanding their coverage, answering questions and explaining plan details.  
     In addition, PIBT handles COBRA administration for our members at no additional cost.</li>
            </ul>
            <br/><br/><br/>
         </div>
      </div>
      <!-- end column -->
      <!-- end row -->
   </div>
   <!-- end of content wrapper -->


</asp:Content>
<%--<asp:Content ID="Content6" ContentPlaceHolderID="PlaceHolderRightSide" runat="server">
</asp:Content>--%>
