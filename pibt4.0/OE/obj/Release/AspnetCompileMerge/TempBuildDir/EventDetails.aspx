<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.master" AutoEventWireup="true"
    CodeBehind="EventDetails.aspx.cs" Inherits="Pibt.EventDetails" %>

<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
    Events
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
    &gt;<span><a href="/Events.aspx">Events</a></span>&gt;<span>Details</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
    <div class="category-left-links">
        <h1>
            Current Events</h1>
        <ul>
            <asp:Repeater ID="RepeaterEvents" runat="server" DataSourceID="odsCurrentEvents">
                <ItemTemplate>
                    <li><a href="/EventDetails.aspx?id=<%#Eval("EventId") %>">
                        <%#Eval("EventName") %></a></li>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="odsCurrentEvents" runat="server" SelectMethod="GetList"
                TypeName="Pibt.BLL.Events"></asp:ObjectDataSource>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
    <asp:FormView ID="FormView1" BorderStyle="None" runat="server" DataSourceID="ObjectDataSource1">
        <HeaderTemplate>
            <div class="titleRight">
                <div class="titleLeft clear">
                    <h1>
                <input type="button" class="ImgHome" value=" " />
<a href="/">Home</a>&nbsp;>&nbsp;<a href="/Events.aspx">Events</a>&nbsp;>&nbsp;
                        <%# Eval("Name")%>
                    </h1>
                </div>
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <table class="event-list">
                <tr class="event-list-row">
                    <td class="col-month">
                        <div class="month">
                            <%# Eval("EventDate","{0:MMMM}") %>
                        </div>
                        <div class="day">
                            <%# Eval("EventDate","{0:dd}") %>
                        </div>
                    </td>
                    <td align="center" style="width: 100px; border-right-style: dotted; border-right-width: 1px;">
                        <div class="event-number">
                            Event Number</div>
                        <div class="event-name">
                            <%# Eval("Name")%>
                        </div>
                        <div class="line">
                            &nbsp;</div>
                        <div class="event-time">
                            <%# Eval("EventDate","{0:hh:mm tt}") %>
                        </div>
                        <div class="event-cost">
                            Cost:
                            <label class="cost">
                                <%# Eval("Cost","{0:c2}") %></label>
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
                        <%# Eval("Content")%>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDetails"
        TypeName="Pibt.BLL.Events">
        <SelectParameters>
            <asp:QueryStringParameter Name="id" QueryStringField="id" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
      <h3>Comments</h3>
      <div id="disqus_thread"></div>
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'pibtorg'; // required: replace example with your forum shortname

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PlaceHolderRightSide" runat="server">
</asp:Content>
