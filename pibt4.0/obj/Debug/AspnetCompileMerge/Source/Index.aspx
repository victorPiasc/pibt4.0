<%@ Page Title="" Language="C#" MasterPageFile="~/WebsiteWithFooter.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Pibt.Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <link href="js/FlexSlider2/flexslider.css" rel="stylesheet" />
   <link href="js/FlexSlider2/css/responsive.less" rel="stylesheet">
   <script src="js/FlexSlider2/jquery.flexslider-min.js"></script>
   <script>
      <%-- Can also be used with $(document).ready() --%>
      $(window).load(function () {
         $('.flexslider').flexslider({
            animation: "slide",
            <%-- by default slide show speed is 7000 --%>
            slideshowSpeed: 10000
         });
      });
   </script>
   <style>
      .slides li img {
         max-width: 100%;
         height: auto;
      }
   </style>
   <div class="row">
      <div class="column-12">
         <div class="flexslider">
            <ul class="slides">                
                <li>
                   <a href="OnlineQuoteEmployer.aspx "><img src="img/QQ.png" /></a>
               </li> 
               <li>
                   <a href="/NewsDetails.aspx?id=10012"><img src="img/1095-C_Portal.png" /></a>
                </li>                
                <li>                   
                  <img src="/images/banner1.png" />
                </li>
               <li>
                  <img src="/images/banner2.png" />
               </li>
            </ul>
         </div>
      </div>
   </div>
   <div id="contentWrapper">
      <div class="row">
         <div class="column-12">
            <br />
         </div>
      </div>
   </div>
   <style>
     .row p {
         font-family: Open sans;
         font-size: larger;
      }
   </style>
</asp:Content>
