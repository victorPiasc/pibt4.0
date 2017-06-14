<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true"
    CodeBehind="NewsDetails.aspx.cs" Inherits="Pibt.NewsDetails" %>

<asp:Content ID="Content7" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contentWrapper">
        <div class="row">
            <div class="column-12">
                <h1>News</h1>
                <hr>
                <asp:FormView ID="FormView1" BorderStyle="None" runat="server" DataSourceID="ObjectDataSource1">
                    <ItemTemplate>
                        <div class="customer-info-box">
                            <div class="section-body">
                                <p style="font-family: Open Sans; font-size: medium;">
                                    <%# Eval("PublishedDate","{0:MMM d, yyyy}") %>
                                </p>
                                <br />
                                <p style="font-family: Open Sans;"><%# Eval("Content") %> </p>
                            </div>
                        </div>
                        <div style="text-align: center;">
                            <asp:Button runat="server" ID="BackButton" CssClass="btn" Text="Back" OnClick="BackButton_Click" />
                        </div>
                    </ItemTemplate>
                </asp:FormView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDetails" TypeName="Pibt.BLL.News">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="newsId" QueryStringField="id" Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>
            </div>
        </div>
    </div>
</asp:Content>
