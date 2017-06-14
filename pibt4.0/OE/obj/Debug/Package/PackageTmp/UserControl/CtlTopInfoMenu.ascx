<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlTopInfoMenu.ascx.cs"
    Inherits="Pibt.UserControl.CtlTopInfoMenu" %>
<ul class="Logged-view">
    <li style="margin-top:-10px;">
        <img width="175" height="100" id="imgCalulator" src="/images/magnify.png" alt="MagnifyingGlass" />
    </li>
    <li>
        <label>
            Welcome!</label><span class="data"><%= Page.User.Identity.Name %></span></li>
    <li>
        <label>
            <%= RoleName %></label><span class="data">#<%= UserId %></span></li>
    <li>
        <label>
            <%= UserName %></label></li>
    <li>
        <label>
            Last Login Time:</label><div class="data"><%= LastLoginTime %></div></li>
            <li>
        <label>
            Last Login From:</label><div class="data"><%= LastLoginIP %></div></li>
</ul>
