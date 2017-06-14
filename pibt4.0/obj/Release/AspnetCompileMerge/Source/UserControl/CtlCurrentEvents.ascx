<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlCurrentEvents.ascx.cs"
    Inherits="Pibt.UserControl.CtlCurrentEvents" %>
<div id="calendar">
    <h1>
        Events</h1>
    <ul class="calendar">
        <asp:Repeater ID="RepeaterEvents" runat="server" DataSourceID="odsCurrentEvents">
            <ItemTemplate>
                <li><a href="/EventDetails.aspx?id=<%#Eval("EventId") %>">
                    <%#Eval("EVENTDATE","{0:MM/dd/yyyy}")%>&nbsp;&nbsp;<%#Eval("EVENTNAME")%></a></li>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="odsCurrentEvents" runat="server" SelectMethod="GetList"
            TypeName="Pibt.BLL.Events">
            <SelectParameters>
                <asp:Parameter DefaultValue="6" Name="top" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ul>
    <a class="more" href="/Events.aspx">View more events...</a>
    <p></p>
    <p class="click">
    <a href="/Events.aspx">Click here for full size calendar</a></p>
</div>

