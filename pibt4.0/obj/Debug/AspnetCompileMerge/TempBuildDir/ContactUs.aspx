<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true"
   CodeBehind="ContactUs.aspx.cs" Inherits="Pibt.ContactUs" %>

<%@ Register Src="UserControl/ctlContactUs.ascx" TagName="ctlContactUs" TagPrefix="uc2" %>

<asp:Content ID="Content3" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="contentWrapper">
      <div class="row">
         <div class="column-12">
            <h1>Contact Us</h1>
            <hr>
         </div>
      </div>
      <div class="row">
         <div class="column-6">
            <h2>How can we help you?</h2>
            <ul class="disc">
               <li>Address: 5800 S. Eastern Ave Suite 400 Los Angeles, CA 90040</li>
               <li>Phone: (800) 449-4898 / (323) 728-9500</li>
               <li>Fax: (323) 271-0138</li>
               <li>E-mail: OnlineHelpDesk@piasc.org</li>
               <li>Website:<asp:Literal ID="webURL" runat="server"></asp:Literal></li>
               <li>Hours of Operation:
                    <ul>
                       <li>Monday-Thursday 8:30 am to 5:00 pm</li>
                       <li>Friday   8:30 am to 4:00 pm</li>
                       <li>Saturday-Sunday Closed</li>
                    </ul>

               </li>
            </ul>
         </div>
          <div class="column-6">
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
            </telerik:RadAjaxLoadingPanel>
            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
               <uc2:ctlContactUs ID="ctlContactUs1" runat="server" />
            </telerik:RadAjaxPanel>
         </div>
         </div>
      <div class="row">
         <div class="column-12">
            <div class="gmap">
               <iframe height="280" width="100%" frameborder="0" scrolling="no" marginheight="0"
                  marginwidth="0" src="https://maps.google.com/maps?f=d&amp;source=s_d&amp;saddr=Printing+Industries+Association,+Inc.+of+Southern+California,+Printing+Industries+Association,+Inc.+of+Southern+California,+Suite+400,+5800+S+Eastern+Ave,+Commerce,+CA+90040&amp;daddr=&amp;hl=en&amp;geocode=CV-KpmrOdMHiFZKUBgIdL_70-ClP4z3Vis7CgDHPTa53l-dj4Q&amp;aq=&amp;sll=33.98548,-118.16164&amp;sspn=0.012028,0.021029&amp;t=m&amp;mra=pd&amp;ie=UTF8&amp;ll=33.985485,-118.16165&amp;spn=0.006295,0.007592&amp;output=embed"></iframe>
            </div>
         </div>
         <div class="column-">
            <%--<telerik:RadTileList runat="server" ID="RadTileList2" Height="480px" Width="100%"
               ScrollingMode="None" TileRows="3" SelectionMode="Single" EnableDragAndDrop="false"
               Style="margin: 0 auto;">
               <Groups>
                  <telerik:TileGroup>
                     <telerik:RadIconTile runat="server" Name="Editor" NavigateUrl="https://maps.google.com/maps?f=d&amp;source=embed&amp;saddr=Printing+Industries+Association,+Inc.+of+Southern+California,+Printing+Industries+Association,+Inc.+of+Southern+California,+Suite+400,+5800+S+Eastern+Ave,+Commerce,+CA+90040&amp;daddr=&amp;hl=en&amp;geocode=CV-KpmrOdMHiFZKUBgIdL_70-ClP4z3Vis7CgDHPTa53l-dj4Q&amp;aq=&amp;sll=33.98548,-118.16164&amp;sspn=0.012028,0.021029&amp;t=m&amp;mra=pd&amp;ie=UTF8&amp;ll=33.985485,-118.16165&amp;spn=0.006295,0.007592"
                        Target="_blank" Shape="Wide" ImageUrl="/images/map.png" BackColor="#33bee5">
                        <Title Text="Address"></Title>
                        <PeekTemplate>
                           <div style="background-color: #33bee5; padding: 20px; font-size: 18px; font-family: 'Open Sans', Sans-Serif;" class="wideContent font18">
                              <b>Street Address</b>
                              <br />
                              5800 S.Eastern Ave, Suite 400,
                            <br />
                              Los Angeles, CA 90040
                           </div>
                        </PeekTemplate>
                        <PeekTemplateSettings Animation="Slide" ShowInterval="5000" CloseDelay="6000" AnimationDuration="2000"
                           ShowPeekTemplateOnMouseOver="true" HidePeekTemplateOnMouseOut="true" Easing="easeOutExpo" />
                     </telerik:RadIconTile>
                     <telerik:RadIconTile Name="Grid" NavigateUrl="" runat="server"
                        Target="_blank" Shape="Square" ImageUrl="/img/phone.png" BackColor="#f87813">
                        <Title Text="Phone Number"></Title>
                        <PeekTemplate>
                           <div style="background-color: #f87813; padding: 15px; font-size: 15px; font-family: 'Open Sans', Sans-Serif" class="wideContent font18">
                              <br />
                              (323) 728-9500<br />
                              (800) 449-4898<br />
                              (Outside So. Cal)
                           </div>
                        </PeekTemplate>
                        <PeekTemplateSettings CloseDelay="6000" ShowInterval="3000" AnimationDuration="2000"
                           Animation="Fade" HidePeekTemplateOnMouseOut="true" ShowPeekTemplateOnMouseOver="true" />
                     </telerik:RadIconTile>
                     <telerik:RadIconTile Name="TreeView" runat="server"
                        Target="_blank" Shape="Square" ImageUrl="/img/fax.png" BackColor="#5cb85c">
                        <Title Text="Fax Number"></Title>
                        <PeekTemplate>
                           <div style="background-color: #5cb85c; color: #FFFFFF; padding: 15px; font-size: 15px; font-family: 'Open Sans', Sans-Serif;"
                              class="wideContent font18">
                              <br />
                              <b>Fax Number</b>
                              <br />
                              (323) 271-0138
                           </div>
                        </PeekTemplate>
                        <PeekTemplateSettings Animation="fade" CloseDelay="5000" AnimationDuration="2000"
                           ShowInterval="3000" ShowPeekTemplateOnMouseOver="true" HidePeekTemplateOnMouseOut="true" />
                        <PeekTemplateSettings />
                     </telerik:RadIconTile>
                     <telerik:RadIconTile Name="ListView" NavigateUrl="" runat="server"
                        Target="_blank" Shape="Wide" ImageUrl="/img/email2.png" BackColor="#d9534f">
                        <Title Text="Email"></Title>
                        <PeekTemplate>
                           <div style="background-color: #d9534f; padding: 20px; font-size: 18px; font-family: 'Open Sans', Sans-Serif;" class="wideContent font18">
                              <b>Email Address</b>
                              <br />
                              webmaster@piasc.org
                           </div>
                        </PeekTemplate>
                        <PeekTemplateSettings Animation="Fade" CloseDelay="7000" AnimationDuration="2000"
                           ShowInterval="4000" ShowPeekTemplateOnMouseOver="true" HidePeekTemplateOnMouseOut="true" />
                        <PeekTemplateSettings />
                     </telerik:RadIconTile>
                  </telerik:TileGroup>
               </Groups>
            </telerik:RadTileList>--%>
         </div>
      </div>
   </div>
</asp:Content>
