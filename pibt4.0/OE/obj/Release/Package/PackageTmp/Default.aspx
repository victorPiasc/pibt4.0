<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Pibt.Default" %>

<%@ Register Src="UserControl/CtlLogin.ascx" TagName="CtlLogin" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
   <link href="/Styles/mobile.css" rel="stylesheet" />
    <style type="text/css">
        .info-block {
            padding: 0;
        }

        .box {
            width: 1175px;
            margin: 0 0 0 0;
            padding: 0;
            display: inline;
        }

        .box-column {
            width: 283px;
            float: left;
            margin-right: 10px;
        }

            .box-column.last {
                margin-right: 0px;
            }

        #slides {
            display: none;
            margin: -18px 15px 0 -12px;
        }

            #slides .slidesjs-navigation {
                margin-top: 3px;
            }

            #slides .slidesjs-previous {
                margin-right: 5px;
                float: left;
            }

            #slides .slidesjs-next {
                margin-right: 5px;
                float: left;
            }

        .slidesjs-pagination {
            margin: 6px 0 0;
            float: right;
            list-style: none;
        }

            .slidesjs-pagination li {
                float: left;
                margin: 0 1px;
            }

                .slidesjs-pagination li a {
                    display: block;
                    width: 13px;
                    height: 0;
                    padding-top: 13px;
                    background-image: url(img/pagination.png);
                    background-position: 0 0;
                    float: left;
                    overflow: hidden;
                }

                    .slidesjs-pagination li a.active, .slidesjs-pagination li a:hover.active {
                        background-position: 0 -13px;
                    }

                    .slidesjs-pagination li a:hover {
                        background-position: 0 -26px;
                    }

        #slides a:link, #slides a:visited {
            color: #333;
        }

        #slides a:hover, #slides a:active {
            color: #9e2020;
        }

        #slides {
            display: none;
        }

        .container {
            margin: 0 auto;
        }

        .info-block-holder {
            padding: 0px;
            width: 1175px;
        }

        .arrowman-container {
            margin: 0 auto;
        }

         /*unslider*/
      .banner {
         position: relative;
         overflow: auto;
         height: 340px;
         width: 1162px;
      }

         .banner li {
            list-style: none;
         }

         .banner ul li {
            float: left;
         }

      .auto-style3 {
         font-size: medium;
      }

      .btn {
         margin-left: 15px;
      }

       .auto-style4 {
          font-size: small;
       }
    </style>
    <script type="text/javascript">
       //  Find any element starting with a # in the URL
       //  And listen to any click events it fires
       $('a[href^="#"]').click(function () {
          //  Find the target element
          var target = $($(this).attr('href'));

          //  And get its position
          var pos = target.offset(); // fallback to scrolling to top || {left: 0, top: 0};

          //  jQuery will return false if there's no element
          //  and your code will throw errors if it tries to do .offset().left;
          if (pos) {
             //  Scroll the page
             $('html, body').animate({
                scrollTop: pos.top,
                scrollLeft: pos.left
             }, 1000);
          }

          //  Don't let them visit the url, we'll scroll you there
          return false;
       });

       var GoSquared = { acct: 'GSN-396664-U' };
    </script>
    <script type="text/javascript" src="/js/Unslider/unslider.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderMain" runat="server">
 <div class="info-block-holder" style="margin: 0 auto;">
      <%---- Banner Rotator--%>
      <div class="info-block">
 <div class="banner" style="margin: 0 auto; margin-top:-13px; margin-left:-2px;">
  <ul style="list-style: none;">
      <li style="background-image: url('images/customerservice.jpg'); height:350px; margin-left:-28px; ">
        <div class="inner" style="margin-left:650px; margin-top: 45px; width:400px; background-color:#ff9412; opacity: 0.85;"><br />
						<h1 style="text-align:center; font-family: Open Sans; font-size: 30px; color:#fff;">Private Exchange is <br />
                     the Name of the Game</h1>
                  <h2 style="text-align:center; font-family: Open Sans; font-size: 20px; color:#fff;"></h2>
						<a class="btn" href="/onlinedocuments.aspx" style="margin-left: 125px; margin-bottom: 10px; padding-left:10px; font-size:18px; text-decoration: none;">LEARN MORE</a>
					</div></li>
      <li style="background-image: url('images/we-are-innovating.jpg'); height:350px; margin-left: 15px;">
      </li>
      <li style="background-image: url('images/csr.jpg'); height:350px;">				
         <div class="inner" style="margin-left:680px; margin-top: 45px; width:400px; background-color:#eda93f; opacity: 0.8;"><br />
						<h1 style="text-align:center; font-family: Open Sans; font-size: 30px; color:#fff;">Private Exchange is <br />
                     the Name of the Game</h1>
                  <h2 style="text-align:center; font-family: Open Sans; font-size: 20px; color:#fff;"></h2>
						<a class="btn" href="/onlinedocuments.aspx" style="margin-left: 125px; margin-bottom: 10px; font-size:18px; text-decoration: none;">LEARN MORE</a>
					</div></li>
<%--   <li style="background-image: url('images/healthcare1.jpg'); height:310px;">
    <div class="inner" style="margin-left:650px; width:400px; background-color:#ff9412;">
						<h1 style="text-align:center; font-family: Open Sans; font-size: 30px; color:#fff;">Private Exchange Is <br />
                     The Name of the Game</h1>
                  <h2 style="text-align:center; font-family: Open Sans; font-size: 20px; color:#fff;">OPEN ENROLLMENT SEASON<br />
                      WILL BEGIN ON OCTOBER 1st, 2014</h2>
						<a class="btn" href="#" style="padding-left:10px; font-size:18px; text-decoration: none;">LEARN MORE</a>
					</div></li>
   </li>--%>
  </ul>
    <br />
         </div>
      </div>
      <%---- Banner Navigator--%>
      <div class="info-block">
         <!-- The HTML -->
<%--         <span><a href="#" class="unslider-arrow prev">&nbsp;&nbsp;<<&nbsp; Previous slide</a></span>&nbsp;&nbsp;&nbsp;
             <span><a href="#" class="unslider-arrow next">Next slide&nbsp;>></a></span>--%>

         <!-- And the JavaScript -->
         <script>
            var unslider = $('.banner').unslider();

            $('.unslider-arrow').click(function () {
               var fn = this.className.split(' ')[1];

               //  Either do unslider.data('unslider').next() or .prev() depending on the className
               unslider.data('unslider')[fn]();
            });
         </script>
  </div>
  </div>
       <%---- Content info here !!--%>
   <br /><br />
     <div>
<%--    <h2>All Products</h2>--%>
    <ul id="products" ></ul>
  </div>
      <div class="info-block-holder" style="margin: 0 auto;">
        <div class="info-block">
           <table style="width: 1160px; margin: 0 auto; padding: 15px 0 15px 0;">
                <tr>
                    <td>
                        <p style="font-size: 20px; font-family: 'Open Sans', Sans-Serif;">
<%--                            <span class="auto-style6" style="font-family: Segoe UI; color:#0072c6; font-weight:900;">Welcome</span> <span class="auto-style3">to</span> 
                           <span class="auto-style7" style="font-family: Segoe UI; color:#0072c6; font-weight:900;">PIBT</span> <span class="auto-style3">--%>
                              <span class="auto-style3">Welcome to PIBT Business Health Plans where we, as a "Private Exchange", provide an alternative to the public exchange or marketplace.</span>
                        </p>
                        <p style="font-size: 20px; font-family: 'Open Sans', Sans-Serif;">
                            <%--<span class="auto-style7" style="font-family: Segoe UI; color:#0072c6; font-weight:900;">PIBT</span>--%> <span class="auto-style3">We can guide and educate you in the selection of plans offered via our valued insurance carrier partners.
                        </span>
                        </p>
                        <p style="font-size: 20px; font-family: 'Open Sans', Sans-Serif;">
                            <%--<span class="auto-style7" style="font-family: Segoe UI; color:#0072c6; font-weight:900;">PIBT</span>,--%> <span class="auto-style3">With many years of experience in the health insurance arena, we have created a "Private Exchange" that is truly "The name of the game"
                           for the best in high quality health insurance. </span>
                        </p>
                        <p style="font-size: 28px; font-family: 'Open Sans', Sans-Serif;">
                            <%--<span class="auto-style7" style="font-family: Segoe UI; color:#0072c6; font-weight:900;">PIBT</span>--%> <span class="auto-style3">We make this available for all companies with 2 or more full-time employees*.
                        </span>
                        </p>
                       <p>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*Full-time employees are those employees who work an average of 30 hours or more per week
                       </p>
                    </td>
                </tr>
            </table>
           <br />
                <%--            <div style="text-align: center; padding-top: 20px;">
                <a href="#">
                    <img src="/images/TClogoonwhite.gif" height="65" alt="" /></a>
            </div>
            </div>--%>
        </div>
    </div>
    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.0.3.min.js"></script>
       <script type="text/javascript">
          var uri = 'api/products';

          $(document).ready(function () {
             // Send an AJAX request
             $.getJSON(uri)
                 .done(function (data) {
                    // On success, 'data' contains a list of products.
                    $.each(data, function (key, item) {
                       // Add a list item for the product.
                       $('<li>', { text: formatItem(item) }).appendTo($('#products'));
                    });
                 });
          });

          function formatItem(item) {
             return item.Name + ': $' + item.Price;
          }

</script>
</asp:Content>

