<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlNavigationBar.ascx.cs"
    Inherits="Pibt.UserControl.CtlNavigationBar" %>
<ul id="mainmenu">
<%--<li class="navlogo" style="margin-left: -7px; padding-top:2px;">
        <img src="/img/navlogo.png" height="33px" width="105px" alt="logo"/>
   </li>--%>
    <li style="padding-top:1px; margin-left: -12px;"><a href="/index.aspx"><span><b>Home</b></span></a></li>
    <li style="padding-top:1px;"><a href="/AboutUs.aspx"><span><b>About Us</b> </span></a><span class="caret"></span>
        <div class="drop navy">
            <strong><a href="/aboutus.aspx">Who We Are</a></strong>
            <strong><a href="/Trustees.aspx">Trustees</a></strong>
            <strong><a href="/news.aspx">News</a></strong>
            <strong><a href="/events.aspx">Events</a></strong>
        </div>
    </li>
    <li style="padding-top:1px; margin-left: -3px;"><a href="/OnlineDocuments.aspx"><span><b>Online Documents</b></span></a></li>
    <li style="padding-top:1px;"><a href="#"><span><b>Resources & Partners</b></span></a><span class="caret"></span>
       <div class="drop navy">
          <strong style="text-align: left;"><a href="/QAlist.aspx">FAQ</a></strong>
          <strong style="text-align: left;"><a href="/OMBUDSMAN.aspx">OMBUDSMAN</a></strong>
          <strong style="text-align: left;"><a href="/PrivacyPractices.aspx">Privacy Practices</a></strong>
       </div>
    </li>
    <li style="padding-top:1px;"><a href="/ContactUs.aspx"><span><b>Contact Us</b></span></a><span class="caret"></span>
        <div class="drop navy">
        <strong style="text-align: left;"><a href="/ContactUs.aspx">Contact PIBT</a></strong>
        </div>
    </li>  
    <div class="col-lg-3" style="float: right; ">
    <div class="input-group">
<%--      <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Action <span class="caret" style="margin-bottom:15px;" ></span></button>
        <ul class="dropdown-menu" role="menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li class="divider"></li>
           <li><a href="#">Separated link</a></li>
        </ul>
      </div><!-- /btn-group -->--%>
      <%--<input type="text" id="keywords" name="keywords" class="form-control" placeholder="Search" style="margin-top:1.45px;" />--%>
       <%--<telerik:RadTextBox  ID="keywords" runat="server" class="form-control" Height="34px" CssClass="keywords"></telerik:RadTextBox>--%>
             <%--<span class="input-group-btn" style="margin-top:-7px;">--%>
           <%--<asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-default" style="margin-top:1.3px;" CausesValidation="false" OnClick="LinkButton1_Click"><span class="glyphicon glyphicon-search"></span></asp:LinkButton></span>--%>
           <%--<button class="btn btn-default" style="margin-top:1.3px;" id="Submit1" name="Submit1" type="submit"><span class="glyphicon glyphicon-search"></span></button>--%>
    </div><!-- /input-group -->
  </div><!-- /.col-lg-6 -->
<%--           <asp:LoginView ID="LoginView" runat="server">
    <AnonymousTemplate>
    <a href="/login.aspx" style="background:none !important;"><span><b>Sign In</b></span></a>
    </AnonymousTemplate>
    <LoggedInTemplate>
     <a href="/default.aspx" style="background:none !important;">
     <span style="margin-left: 20px;"><b>Welcome, <%=Page.User.Identity.Name %></b>
   </span></a>
    </LoggedInTemplate>
    </asp:LoginView>--%>
    <span>
    </span>
    </li>
</ul>
<style>
.keywords {
   margin-top: 5px;
   margin-right: -13px;
}

.caret
{
   margin-top: 14px;
}
</style>
<script>
   function searchbtnclick() {
      window.location.href = 'http://pibt.org/search.aspx';
      
      $('#Submit1').click(function () {
         win.location.href = 'http://www.google.com';
      });
   }

   function searchclick() {
      var input = document.getElementById('keywords'),
          keywords = input.value;
      if (keyword == null) {

      }

   }
</script>
