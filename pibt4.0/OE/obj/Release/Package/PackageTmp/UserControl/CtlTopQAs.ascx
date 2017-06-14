<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CtlTopQAs.ascx.cs" Inherits="Pibt.UserControl.CtlTopQAs" %>
<div id="news-box">
    <h1>
        Q & A</h1>
    <ul>
        <asp:Repeater ID="RepeaterQA" runat="server" DataSourceID="odsCurrentQA">
            <ItemTemplate>
                <li><a href="/QADetails.aspx?id=<%#Eval("QAId") %>">
                    <%#Eval("Question") %></a></li>
            </ItemTemplate>
        </asp:Repeater>
        <asp:ObjectDataSource ID="odsCurrentQA" runat="server" SelectMethod="GetTopList" TypeName="Pibt.BLL.QA">
            <SelectParameters>
                <asp:Parameter DefaultValue="3" Name="top" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ul>
    <a class="more" href="/QAList.aspx">View more Q&A...</a>
</div>