<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlTopInfoMenu.ascx.cs"
    Inherits="Pibt.UserControl.CtlTopInfoMenu" %>
<ul class="Logged-view">
    <li>
        <label><%= RoleName %></label><span class="data">#<%= UserId %></span>
    </li>
    <li>
        <label><%= UserName %></label>
    </li>
</ul>
