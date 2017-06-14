<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.master" AutoEventWireup="true" CodeBehind="OnlineTutorials.aspx.cs" Inherits="Pibt.OnlineTutorials" %>
<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
   &nbsp; &nbsp  &gt; <span><a href="Register.aspx">Resources & Partners</a></span>  &gt; <span>Tutorials</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
   <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
   <h1>Tutorials</h1>
   <telerik:RadMediaPlayer ID="RadMediaPlayer1" runat="server" ToolbarDocked="false" HDActive="true"
      Height="360px" EnableViewState="false" Width="640px" AutoPlay="True" Skin="MetroTouch">
      <Playlist>
         <telerik:MediaPlayerVideoFile AutoPlay="true" Path="https://www.youtube.com/watch?v=dJ5JrK3tbNo&amp;feature=youtube_gdata" Poster="https://i1.ytimg.com/vi/dJ5JrK3tbNo/0.jpg" StartTime="0" StartVolume="-1" Title="Intro">
         </telerik:MediaPlayerVideoFile>
      </Playlist>
      <PlaylistSettings YouTubePlaylist="PLppME4A0SxgcG3aLwyb_B7bbYTnX5CQ8P" Mode="Buttons" ButtonsTrigger="Hover" Position="VerticalInside" />
   </telerik:RadMediaPlayer>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PlaceHolderRightSide" runat="server">
</asp:Content>
