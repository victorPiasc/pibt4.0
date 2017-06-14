<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlNavigationBar.ascx.cs"
    Inherits="Pibt.UserControl.CtlNavigationBar" %>
<div style="background: none repeat scroll 0 0 #CDCDCD; height:25px;">
<ul id="mainmenu">
    <li style="padding-top:1px;"><a href="/index.aspx"><span><b>Home</b></span></a></li>
    <li style="padding-top:1px;"><a href="/AboutUs.aspx"><span><b>About Us</b> </span></a><span class="caret"></span>
        <div class="drop navy">
            <strong><a href="/aboutus.aspx">Who We Are</a></strong>
            <strong><a href="/Trustees.aspx">Trustees</a></strong>
            <strong><a href="/news.aspx">News</a></strong>
            <strong><a href="/events.aspx">Events</a></strong>
        </div>
    </li>
    <li style="padding-top:1px;"><a href="/OnlineDocuments.aspx"><span><b>Online Documents</b></span></a></li>
    <li style="padding-top:1px;"><a href="#"><span><b>Resources & Partners</b></span></a><span class="caret"></span>
       <div class="drop navy">
          <strong style="text-align: left;"><a href="/QAlist.aspx">FAQ</a></strong>
          <strong style="text-align: left;"><a href="/OMBUDSMAN.aspx">Ombudsman</a></strong>
          <strong style="text-align: left;"><a href="/PrivacyPractices.aspx">Privacy Practices</a></strong>
       </div>
    </li>
    <li style="padding-top:1px;"><a href="/ContactUs.aspx"><span><b>Contact Us</b></span></a><span class="caret"></span>
        <div class="drop navy">
        <strong style="text-align: left;"><a href="/ContactUs.aspx">Contact <%=Pibt.Common.Utilities.Us()%></a></strong>
        </div>
    </li>
</ul>
    </div>
