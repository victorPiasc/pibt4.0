<%@ Page Title="" Language="C#" MasterPageFile="~/Website.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Pibt.Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="js/FlexSlider2/flexslider.css" rel="stylesheet" />
    <script src="js/FlexSlider2/jquery.flexslider-min.js"></script>
    <script>
        window.onload = testForPopUp();
        function testForPopUp() {
            var test = window.open("about:blank", "", "directories=no,height=10,width=10,menubar=no,resizable=no,scrollbars=no,status=no,titlebar=no,top=0,location=no");
            if (!test) {
                alert("Popup blocker is turned on. Please turn it off as it may affect pages to open. ")
            }
            test.close();
        }
        $(window).load(function () {
            $('#carousel').flexslider({
                animation: "slide",
                controlNav: true,
                animationLoop: true,
                slideshow: true,
                itemWidth: 156,
                itemMargin: 0,
                minItems: 5,
                slideshowSpeed: 10000,
            });
        });
    </script>
    <script type="text/javascript">
        function showFrame() {
            var frame = document.getElementsByClassName('strife-frame');
            frame[0].style.display = "inline";
        }
    </script>
    <style>
        .slides li img {
            max-width: 100%;
            height: auto;
        }
    </style>
    <div style="height:38px; background:#FFA5A5; ">
        <div style="text-align:center; padding-top:10px;">
            <a href="#" onclick="showFrame();" style="color:#000; font-weight:bold; font-size:18px; text-decoration:underline;">Click here to <b>GET LIFE INSURANCE</b>.</a>
        </div>
        <div style="display:none;">
            <script id="strife" src="https://s3-us-west-2.amazonaws.com/strife/production/strife.js" data-strife-key="4KnlWTmmpDv6FvY_"></script>
        </div>
    </div>
    <div class="row" style="margin-top: 50px;">
        <div class="column-12">
            <table class="table-container" style="width: 100%">
                <tbody>
                    <tr>
                        <td rowspan="3">
                            <div class="shadow">
                                <img src="/images/doctor.png" style="width: 165px;" class="index_img"/>
                            </div>
                        </td>
                        <td colspan="4">
                            <h1 style="font-size: 33px; padding-left: 134px; color: #006DBB; font-weight: bold">Get Connected ...</h1>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <h1 style="font-size: 33px; padding-left: 357px; color: #006DBB; font-weight: bold;">The Power is Yours</h1>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="7" colspan="2">
                            <div style="font-size: 20px; padding-left: 25px; text-align: center;">
                                <span>PIBT is the leading provider of employee benefits<br />
                                    to the California printing industry. We take the confusion out of health insurance and offer<br />
                                    <strong style="font-weight: bold;">Choice, Affordability, and Added Value!</strong></span>
                            </div>
                        </td>
                        <td rowspan="7" colspan="2" style="vertical-align: bottom;">
                            <div class="shadow">
                                <img src="/images/group.png" style="width: 435px" class="index_img"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3">
                            <div class="shadow">
                                <img src="/images/hospital.png" style="width: 165px; height: 110px" class="index_img"/>
                            </div>
                        </td>
                    </tr>
                    <tr></tr>
                    <tr></tr>
                    <tr>
                        <td rowspan="3">
                            <div class="shadow">
                                <img src="images/Pills.png" style="width: 165px;" class="index_img" />
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row" style="text-align: center">
<%--        <div class="column-4">
            <a href="OnlineQuoteEmployer.aspx">
                <img src="/images/calculatorIcon.png" width="85" /><br />
            </a>
            <a href="OnlineQuoteEmployer.aspx" style="font-size: 22px; font-weight: bold; text-decoration: underline;">Quick Quote</a>
        </div>--%>
        <div class="column-6">
            <a href="Login.aspx">
                <img src="images/avatarsER.png" width="85" /><br />
            </a>
            <a href="Login.aspx" style="font-size: 22px; font-weight: bold; text-decoration: underline;">Employer Log-in</a>
        </div>
        <div class="column-6">
            <a href="EELogin.aspx">
                <img src="images/singleAvatarEE.png" width="85" /><br />
            </a>
            <a href="EELogin.aspx" style="font-size: 22px; font-weight: bold; text-decoration: underline;">Employee Log-in</a>
        </div>
    </div>
    <div class="row">
        <div class="column-12" style="padding-top: 40px;">
            <hr />
            <div class="flexslider" id="carousel">
                <ul class="slides">
                    <li>
                        <a href="http://www.tasconline.com" target="_blank">
                            <img src="/images/tasc.png" alt="Tasc" style="padding-top: 28px;" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.piasc.org" target="_blank" class="trusted">
                            <img src="/images/piasc.jpg" id="ftPIASC" alt="PIANC" style="padding-top: 20px;" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.unum.com" target="_blank">
                            <img src="images/CarrierLogos/Unum_logo_1.jpg" style="padding-top: 13px;" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.lhp-ca.com" target="_blank">
                            <img src="/images/CarrierLogos/Landmark_logo_2015.jpg" alt="Landmark" style="padding-top: 14px;" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.blueshieldca.com" target="_blank" class="trusted">
                            <img src="/images/BSC.gif" id="BSC" alt="BSC" style="padding-top: 32px;" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.cigna.com" target="_blank" class="trusted">
                            <img src="/images/cigna.png" id="FtRaster1" alt="Cigna" style="padding-top: 18px;" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.humana.com" target="_blank" class="trusted">
                            <img src="/images/Humana.png" id="Humana" alt="Humana" style="padding-top: 30px;" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.westerndental.com/en-US/for-patients" target="_blank" class="trusted">
                            <img src="/images/CarrierLogos/Western_Dental_Horiz_Logo-Color.jpg" id="ftPIANC1" alt="PIANC" style="padding-top: 27px;" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.coloniallife.com" target="_blank" class="trusted">
                            <img src="/images/coloniallife.png" id="FtRaster" alt="ColonialLife" style="padding-top: 6px;" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.healthnet.com" target="_blank" class="trusted">
                            <img src="/images/healthnet.png" id="healthnet.png" alt="Health Net" style="padding-top: 19px;" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.kaiserpermanente.org" target="_blank" class="trusted">
                            <img src="/images/kaiser.png" id="Kaiser" alt="Kaiser Permanente" style="padding-top: 26px;" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.vsp.com" target="_blank" class="trusted">
                            <img src="/images/VSP.png" id="VSP" alt="VSP" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.mhn.com" target="_blank">
                            <img src="/images/mhn.png" alt="HMN" style="padding-top: 16px;" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://www.eyemed.com" target="_blank" class="trusted">
                            <img src="/images/eyemed.jpg" id="EyeMed" alt="EyeMed" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://piag.org/" target="_blank" class="trusted">
                            <img src="/images/PIAG.jpg" id="PIAG" alt="PIAG" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://main.vma.bz/" target="_blank">
                            <img src="/images/VMAlogo.png" alt="VMA" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                    <li>
                        <a href="http://piasd.org/" target="_blank" class="trusted">
                            <img src="/images/PIASD.jpg" id="PIASD" alt="PIASD" /></a>
                    </li>
                    <li>
                        <img src="images/filler.jpg" />
                    </li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
