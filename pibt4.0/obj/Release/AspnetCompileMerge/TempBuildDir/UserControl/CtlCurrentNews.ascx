<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlCurrentNews.ascx.cs"
    Inherits="Pibt.UserControl.CtlCurrentNews" %>
<div id="news-box">
    <h1>
        Current News</h1>
    <ul>
        <asp:Repeater ID="RepeaterNews" runat="server" DataSourceID="odsCurrentNews">
            <ItemTemplate>
                <li><a href="/NewsDetails.aspx?id=<%#Eval("NewsId") %>">
                    <%#Eval("NewsTitle") %></a></li>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="odsCurrentNews" runat="server" SelectMethod="GetList" TypeName="Pibt.BLL.News">
            <SelectParameters>
                <asp:Parameter DefaultValue="6" Name="top" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ul>
    <a class="more" href="/News.aspx">View more news...</a>
</div>
