<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.Master" AutoEventWireup="true"
    CodeBehind="Search.aspx.cs" Inherits="Pibt.Search" %>

<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Search
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
    &nbsp&nbsp&gt;<span style="width:100%">Search Result</span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MiddlePlaceHolder" runat="server">
       <div class="titleRight">
        <div class="titleLeft clear">
            <h1>
            <input type="button" class="ImgHome" value=" " />
                <a href="/">Home</a>&nbsp;>&nbsp;Search Result             
            </h1>
        </div>
    </div>
<%--    <table summary="content table" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div class="titleRight">
                    <div class="titleLeft clear">
                        <h1>
                            Searching Result
                        </h1>
                    </div>
                </div>
                <br />
            </td>
        </tr>
    </table>--%>
    <div class="clear">
    </div>
   <asp:Panel ID="Panel" runat="server" DefaultButton="btnSearch" style="margin-top:10px;">
    <table style="width: 100%">
        <tr>
            <td style="width: 250px">
                <asp:DropDownList ID="ddlTypes" runat="server" CssClass="form-control" Width="200">
                    <asp:ListItem Text="All" Value="-1"></asp:ListItem>
                    <asp:ListItem Text="News" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Documents" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Q &amp; A" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="width: 400px; margin-left:30px;">
                <asp:TextBox ID="tbSearchKeyWord" Width="600" CssClass="form-control" runat="server" MaxLength="256"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnSearch" CssClass="btn" runat="server" Width="150" Text="Search" style="margin-left:9px; margin-top:-1.3px;" OnClick="btnSearch_Click" />
            </td>
        </tr>
    </table>
    </asp:Panel>
    <div class="clear">
    </div>
    <asp:Panel ID="PanelNews" runat="server" CssClass="normal-list">
        <h1>
            News</h1>
        <ul id="sub-menu">
            <asp:Repeater ID="rptCurrentNews" runat="server" DataSourceID="odsCurrentNews" OnItemCommand="rptCurrentNews_ItemCommand">
                <ItemTemplate>
                    <li><a href="/NewsDetails.aspx?id=<%#Eval("NewsId") %>" style="font-family:Open Sans;">
                        <%#Eval("NewsTitle") %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%#Eval("NEWSDATE","{0:MMM d, yyyy}")%></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <asp:ObjectDataSource ID="odsCurrentNews" runat="server" SelectMethod="Searching"
            TypeName="Pibt.BLL.News" onselecting="odsCurrentNews_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbSearchKeyWord" Name="keyWord" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </asp:Panel>
    <asp:Panel ID="PanelDocuments" runat="server" CssClass="normal-list">
        <h1>
            Documents</h1>
        <ul id="Ul1">
            <asp:Repeater ID="rptDocuments" runat="server" DataSourceID="odsDocuments">
                <ItemTemplate>
                    <li><a href="/documents/<%#Eval("DocumentURL")%>" style="font-family:Open Sans;">
                        <%#Eval("DocumentName")%></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <asp:ObjectDataSource ID="odsDocuments" runat="server" SelectMethod="Searching" 
            TypeName="Pibt.BLL.Documents" onselecting="odsDocuments_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbSearchKeyWord" Name="keyWord" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </asp:Panel>
    <asp:Panel ID="PanelQA" runat="server" CssClass="normal-list">
        <h1>
            Q&A</h1>
        <ul id="Ul2">
            <asp:Repeater ID="rptQA" runat="server" DataSourceID="odsCurrentQA">
                <ItemTemplate>
                    <li><a href="QADetails.aspx?id=<%#Eval("QAId") %>" style="font-family:Open Sans;">
                        <%#Eval("Question")%></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        <asp:ObjectDataSource ID="odsCurrentQA" runat="server" SelectMethod="Searching" 
            TypeName="Pibt.BLL.QA" onselecting="odsCurrentQA_Selecting">
            <SelectParameters>
                <asp:ControlParameter ControlID="tbSearchKeyWord" Name="keyWord" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </asp:Panel>
    <h3>
        <asp:Label ID="lblMsg" runat="server"></asp:Label></h3>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PlaceHolderRightSide" runat="server">
</asp:Content>
