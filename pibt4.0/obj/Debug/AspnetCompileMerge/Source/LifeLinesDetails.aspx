<%@ Page Title="" Language="C#" MasterPageFile="~/NestedBMSMasterPage.master" AutoEventWireup="true"
    CodeBehind="LifelinesDetails.aspx.cs" Inherits="Pibt.LifelinesDetails" %>

<%@ Register Src="UserControl/CtlLeftMenu.ascx" TagName="CtlLeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
    <uc1:CtlLeftMenu ID="CtlLeftMenu1" runat="server" />
    <div class="category-left-links">
        <h1 style="text-align: center">
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
                        <a href="/">Home</a>&nbsp;>&nbsp;<a href="/News.aspx">News</a>&nbsp;>&nbsp;Lifelines</h1>
                </div>
            </div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="customer-info-box">
                <div class="section-body">
                    <h1>
                        Lifelines</h1>
                    <p style="font-size: 18px; font-family: Open Sans;">
                        <%# Eval("PublishedDate","{0:MMM-yyyy}") %>, Volume&nbsp;<%#Eval("VolumeNumber") %>
                    </p>
                    <br />
                    <iframe src="<%# Eval("FilePath") %>" style="width: 930px; height: 750px;"></iframe>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
    <div class="section-title" style="text-align: center;">
    <br />
        <asp:Button ID="BtBack" CssClass="btn" runat="server" Text="Back" Width="52px" OnClick="BtBack_Click"/>
    </div>
    <h2>
        Previous Releases</h2>
    <asp:Repeater ID="rptLifelines" runat="server">
        <ItemTemplate>
            <li style="font-size: medium; font-family: Open Sans, Sans-Serif; margin-bottom: 7px;">
                <a href="/LifelinesDetails.aspx?id=<%#Eval("Id") %>">
                    <%# Eval("PublishedDate","{0:MMM-yyyy}")%>,&nbsp;Volume&nbsp;<%#Eval("VolumeNumber") %>
                </a></li>
        </ItemTemplate>
    </asp:Repeater>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetById"
        TypeName="Pibt.BLL.Lifeline">
        <SelectParameters>
            <asp:QueryStringParameter Name="Id" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PlaceHolderRightSide" runat="server">
</asp:Content>
