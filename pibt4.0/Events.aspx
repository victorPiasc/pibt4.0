<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true"
   CodeBehind="Events.aspx.cs" Inherits="Pibt.Events" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="contentWrapper">
      <div class="row">
         <div class="column-12">
            <h1>Upcoming Events</h1>
            <hr>
         </div>
         <div class="column-12">
                <asp:DataList ID="DataListEvents" CssClass="event-list" BorderWidth="1" BorderStyle="Solid"
            DataSourceID="odsCurrentEvent" runat="server">
            <HeaderTemplate>
                <table>
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="event-list-row">
                    <td class="col-month">
                        <div class="month">
                            <%# Eval("EventDate","{0:MMMM}") %>
                        </div>
                        <div class="day">
                            <%# Eval("EventDate","{0:d}") %>
                        </div>
                    </td>
                    <td align="center" style="width: 100px; border-right-style: dotted; border-right-width: 1px;">
                        <div class="event-number">
                            Event </div>
                        <div class="event-name">
                            <%# Eval("EventName") %>
                        </div>
                        <div class="line">
                            &nbsp;</div>
                        <div class="event-time">
                            <%# Eval("EventDate","{0:h:mm tt}") %>
                        </div>
                        <div class="event-cost">
                            <%# Eval("Cost","{0:c2}").Trim()=="$0.00" ? "No charge" : "Cost: " + Eval("Cost","{0:c2}") %>
                        </div>
                        <div class="line">
                            &nbsp;</div>
                        <div class="event-location">
                            <strong>Location:</strong>
                            <br />
                            <div class="location">
                                <%# Eval("Location") %></div>
                        </div>
                    </td>
                    <td class="event-content">
                        <%# Eval("EventContent") %>
                    </td>
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <tr>
                    <td class="col-month">
                        <div class="month">
                            <%# Eval("EventDate","{0:MMMM}") %>
                        </div>
                        <div class="day">
                            <%# Eval("EventDate","{0:d}") %>
                        </div>
                    </td>
                    <td align="center" style="width: 100px; border-right-style: dotted; border-right-width: 1px;">
                        <div class="event-number">
                            Event</div>
                        <div class="event-name">
                            <%# Eval("EventName") %>
                        </div>
                        <div class="line">
                            &nbsp;</div>
                        <div class="event-time">
                            <%# Eval("EventDate","{0:h:mm tt}") %>
                        </div>
                        <div class="event-cost">
                            <%# Eval("Cost","{0:c2}").Trim()=="$0.00" ? "No charge" : "Cost: " + Eval("Cost","{0:c2}") %>
                        </div>
                        <div class="line">
                            &nbsp;</div>
                        <div class="event-location">
                            <strong>Location:</strong>
                            <br />
                            <div class="location">
                                <%# Eval("Location") %></div>
                        </div>
                    </td>
                    <td class="event-content">
                        <%# Eval("EventContent") %>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <FooterTemplate>
                </table>
                     <asp:Label Visible='<%#bool.Parse((DataListEvents.Items.Count==0).ToString()) %>' runat="server"
                        Text="There are no upcoming events."></asp:Label>
            </FooterTemplate>
        </asp:DataList>
         </div>
      </div>
      <div>
      </div>
   </div>
       <asp:ObjectDataSource ID="odsCurrentEvent" runat="server" SelectMethod="GetList"
        TypeName="Pibt.BLL.Events"></asp:ObjectDataSource>
    <div class="normal-list">
        <h1>
            Current Events</h1>
    </div>
</asp:Content>
