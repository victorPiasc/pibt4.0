<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeBehind="Trustees.aspx.cs" Inherits="Pibt.Trustees" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="contentWrapper">
      <div class="row">
         <div class="column-12">
            <h1>Trustees</h1>
            <hr>
         </div>
         <!-- end column -->

         <div class="row">
            <div class="column-4">
               <span class="auto-style4"><strong>Charles F. Stay</strong></span><br />
               Chairman<br />
                Bert Co.<br />
            </div>
            <div class="column-4">
               <strong>Frank Parks</strong></span><br />
               Trustee<br />
               The Parks Group<br />
            </div>
            <div class="column-4">
               <strong>Charles &quot;Pat&quot; McBride</strong></span><br />
               Trustee<br />
               Envision Printing<br />
            </div>
         </div>
         <div class="row">
            <div class="column-4">
               <strong><span class="auto-style4">Jack Stoughton</span><br class="auto-style4" />
               </strong>Trustee<br />
               Stoughton Printing Co.<br />
            </div>
            <div class="column-4">
               <span class="auto-style4"><strong>Scott Keilholtz</strong></span><br />
               Trustee<br />
               The Rosenthal Group<br />
            </div>
            <div class="column-4">
               <strong><span class="auto-style4">Brad Reimers</span><br class="auto-style4" />
               </strong>Trustee<br />
               SOS Printing<br />
            </div>
         </div>
         <div class="row">
            <div class="column-4">
               <span class="auto-style4"><strong>Charles Cunningham</strong></span><br />
               Trustee<br />
               Prepress Assembly<br />
               </div>
            <div class="column-4">
               <strong><span class="auto-style4">Mickey Rodich</span><br class="auto-style4" />
               </strong>Trustee<br />
               Besumi Printing<br />
            </div>
            <div class="column-4">
               <span class="auto-style4"><strong>Stephen Sprinkel</strong></span><br />
               Trustee<br />
               Sprinkel Media Network<br />
            </div>
         </div>
         <div class="row">
            <div class="column-4">
               <strong><span class="auto-style4">Richard Sevigny</span><br class="auto-style4" />
               </strong>Trustee<br />
               Chromatic<br />
            </div>
            <div class="column-4">
               <span class="auto-style4"><strong>Steve Marienhoff</strong></span><br />
               Trustee<br />
               Adams Press<br />
            </div>
            <div class="column-4">
               <strong><span class="auto-style4">Dennis Martino</span><br class="auto-style4" />
               </strong>Trustee<br />
               Martino-White Printing, Inc.<br />
            </div>
            <div class="column-4">
               <span class="auto-style4"><strong>Jim Joyce</strong></span><br />
               Trustee<br />
              Dual Graphics<br />
            </div>
            <div class="column-4">
               <strong><span class="auto-style4">Chris Cullen</span><br class="auto-style4" />
               </strong>Trustee<br />
               Hillis Printing Company<br />
            </div>
         </div>
      </div>
   </div>
   <!-- end of content wrapper -->
</asp:Content>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderHead" runat="server">
 <style type="text/css">
  .auto-style2 {
   width: 478px;
  }
  .auto-style3 {
   width: 475px;
  }
  .auto-style4 {
   text-decoration: underline;
  }
 </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
  &nbsp; &nbsp&gt; <span><a href="aboutus.aspx">About Us</a></span>&gt; <span>Trustees</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
     <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
 <h1>Trustees</h1>
<table style="margin-right: 0px">
 <tr>
  <td class="auto-style2"><span class="auto-style4"><strong>Charles F. Stay</strong></span><br />
   Chairman<br />
   President <a href="http://www.bertco.com">Bert Co.<br /></a>
   18741 Clearview Lane<br />
   Huntington Beach, CA 92648<br /><br />
  </td>
  <td class="auto-style3"><span class="auto-style4"><strong>Arnold Greenfiled</strong></span><br />
   Vice Chairman<br /><a href="http://www.envisioncmyk.com/category">Envision Printing</a><br />
   42 Waterloo Court<br />
   Belmont, CA 94002<br />
   <br />
  </td>
 </tr>
  <tr>
  <td class="auto-style2"><span class="auto-style4"><strong>Charles &quot;Pat&quot; McBride</strong></span><br />
   Trustee<br />
   <a href="http://www.envisioncmyk.com/category">Envision Printing</a><br />
   1266 Kennestone Circle Ste. 105<br />
   Marietta, GA 30066<br /><br />
   </td>
  <td class="auto-style3"><strong><span class="auto-style4">Jack Stoughton</span><br class="auto-style4" />
   </strong>Trustee<br />
   <a href="http://www.stoughtonprinting.com/">Stoughton Printing Co.</a><br />
   130 North Sunset Ave.<br />
   City of Industry, CA 91744<br /><br />
   </td>
 </tr>
  <tr>
  <td class="auto-style2"><span class="auto-style4"><strong>Scott Keilholtz</strong></span><br />
   Trustee<br />
   <a href="http://www.therosenthalgroup.com/">The Rosenthal Group<br /></a>
   427 Anchor Lane #102<br />
   West Sacramento, CA 95605<br /><br />
   </td>
  <td class="auto-style3"><strong><span class="auto-style4">Brad Reimers</span><br class="auto-style4" />
   </strong>Trustee<br />
   <a href="http://sosprint.com/">SOS Printing</a><br />
   8135 Ronson Road<br />
   San Diego, CA 92111-2002<br /><br />
   </td>
 </tr>
  <tr>
  <td class="auto-style2"><span class="auto-style4"><strong>Charles Cunningham</strong></span><br />
   Trustee<br />
   <a href="http://www.prepress.com/">Prepress Assembly</a><br />
   398 11th st. 2nd Floor<br />
   San Francisco, CA 94103<br /><br />
   </td>
  <td class="auto-style3"><strong><span class="auto-style4">Mickey Rodich</span><br class="auto-style4" />
   </strong>Trustee<br />
   Besumi Printing<br />
   32318 Searaven Dr.<br />
   Rancho Palos Verdes, CA 90275<br /><br />
   </td>
 </tr>
  <tr>
  <td class="auto-style2"><span class="auto-style4"><strong>Stephen Sprinkel</strong></span><br />
   Trustee<br />
   <a href="http://www.sprinkelmedia.com/">Sprinkel Media Network</a><br />
   600 Handley Trail<br />
   Emerald Hills, CA 94062<br /><br />
   </td>
  <td class="auto-style3"><strong><span class="auto-style4">Richard Sevigny</span><br class="auto-style4" />
   </strong>Trustee<br />
   Chromatic<br />
   28 Colonial Drive<br />
   Rancho Mirage, CA 92270<br /><br />
   </td>
 </tr>
  <tr>
  <td class="auto-style2"><span class="auto-style4"><strong>Steve Marienhoff</strong></span><br />
   Trustee<br />
   <a href="http://adamspress.net/">Adams Press</a><br />
   PO Box 570187<br />
   Tarzana, CA 91357<br /><br />
   </td>
  <td class="auto-style3"><strong><span class="auto-style4">Dennis Martino</span><br class="auto-style4" />
   </strong>Trustee - GA<br />
   <a href="http://www.martinowhite.com/">Martino-White Printing, Inc.</a><br />
   543 North Central Ave.<br />
   Hapeville, GA 30354<br /><br />
   </td>
 </tr>
  <tr>
  <td class="auto-style2"><span class="auto-style4"><strong>Jim Joyce</strong></span><br />
   Trustee<br />
   CEO<br />
   <a href="http://dualgraphics.com/">Dual Graphics</a><br />
   370 Cliffwood Park Street<br />
   Brea, CA 92821<br /><br />
   </td>
  <td class="auto-style3"><strong><span class="auto-style4">Chris Cullen</span><br class="auto-style4" />
   </strong>Trustee<br />
   Hillis Printing Company<br />
   525 Parrott St.<br />
   San Jose, CA 95112<br />
   <br />
   </td>
 </tr>
</table>
 <style type="text/css">
 .auto-style4 {
  font-family : Open Sans;
  font-size : 16px;
 }
</style>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="PlaceHolderRightSide" runat="server">
</asp:Content>--%>
