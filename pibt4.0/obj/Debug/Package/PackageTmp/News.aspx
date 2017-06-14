<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true"
   CodeBehind="News.aspx.cs" Inherits="Pibt.News" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <script type="text/javascript" src="js/bootstrap.min.js"></script>
   <asp:ObjectDataSource ID="odsCurrentNews" runat="server" SelectMethod="GetList" TypeName="Pibt.BLL.News"></asp:ObjectDataSource>
   <asp:ObjectDataSource ID="odsCurrentNewsHigh" runat="server" SelectMethod="GetListBySortSeq" TypeName="Pibt.BLL.News">
      <SelectParameters>
         <asp:Parameter Name="sortSeq" DefaultValue="0" />
      </SelectParameters>
   </asp:ObjectDataSource>
   <asp:ObjectDataSource ID="odsCurrentNewsMedium" runat="server" SelectMethod="GetListBySortSeq" TypeName="Pibt.BLL.News">
      <SelectParameters>
         <asp:Parameter Name="sortSeq" DefaultValue="1" />
      </SelectParameters>
   </asp:ObjectDataSource>

      <div id="contentWrapper">
      <div class="row">
         <div class="column-12">
            <h1>News</h1>
            <hr>
            </div></div>
               <div class="row">
         <div class="column-12">
            <asp:ListView ID="ListView2" runat="server" DataSourceID="odsCurrentNewsHigh">
               <ItemTemplate>
                  <div class="row" style="border-top: 1px solid gray; margin-left:1px; border-color:#909090"">
                  <div class="col-md-12" style="background-color: #eeeeee;">
                     <h3><a href="NewsDetails.aspx?id=<%#Eval("NewsId") %>" style="font-family: Open Sans; font-size:1.2em; text-decoration:none; color: #3d3d3d;">
                        <%#Eval("NewsTitle") %></a></h3>
                     <p style="font-size: 1em; font-family: Open Sans;"><%#Eval("NEWSDATE","{0:MMM d, yyyy}")%></p>
                     <p>
                        <a class="btn btn-default" href="NewsDetails.aspx?id=<%#Eval("NewsId") %>">Read this &raquo;</a>
                     </p>
                 <%--<li style="font-size: 1em; font-family: Open sans; padding:10px;"><a href="NewsDetails.aspx?id=<%#Eval("NewsId") %>" style="font-size: 1.5em; font-family: Open Sans; color: #3d3d3d;">
                     <%#Eval("NewsTitle") %></a><br />
                     <p style="font-size: 1em; font-family: Open Sans;"><%#Eval("NEWSDATE","{0:MMM d, yyyy}")%></p>
                  </li>--%>
                  </div></div>
                  <%--<p class="NewsContent"><%#Eval("NewsContent").ToString().Substring(0,400) %></p></li><br /><br />--%>
               </ItemTemplate>
               <AlternatingItemTemplate>
                  <div class="row" style="border-top: 1px solid gray; margin-left:1px; border-color:#909090">
                  <div class="col-md-12">
                     <h3><a href="NewsDetails.aspx?id=<%#Eval("NewsId") %>" style="font-family: Open Sans; font-size:1.2em; text-decoration:none; color: #3d3d3d;">
                        <%#Eval("NewsTitle") %></a></h3>
                     <p style="font-size: 1em; font-family: Open Sans;"><%#Eval("NEWSDATE","{0:MMM d, yyyy}")%></p>
                     <p>
                        <a class="btn btn-default" href="NewsDetails.aspx?id=<%#Eval("NewsId") %>">Read this &raquo;</a>
                     </p>
                     <p></p>
                  </div></div>
               </AlternatingItemTemplate>
            </asp:ListView>
            <asp:ListView ID="ListView3" runat="server" DataSourceID="odsCurrentNewsMedium" style="margin-top:10px;">
               <ItemTemplate>
                  <div class="col-md-4" style="background-color:#eeeeee; border-top: 1px solid gray; border-color:#909090">
                     <h4><a href="NewsDetails.aspx?id=<%# Eval("NewsId") %>" style="font-family: Open Sans; color: #3d3d3d; font-size: 1.2em; text-decoration:none;">
                        <%# Eval("NewsTitle") %></a></h4>
                     <p>
                        <%# Eval("NEWSDATE","{0:MMM d, yyyy}") %>
                     </p>
                     <p>
                        <a class="btn btn-default" href="NewsDetails.aspx?id=<%#Eval("NewsId") %>">Read this &raquo;</a>
                     </p>
                  </div>
               </ItemTemplate>
               <AlternatingItemTemplate> 
                  <div class="col-md-4" style="border-top: 1px solid gray; border-color:#909090">
                     <h4><a href="NewsDetails.aspx?id=<%#Eval("NewsId") %>" style="font-family: Open Sans; color: #3d3d3d; font-size: 1.2em; text-decoration:none;">
                        <%#Eval("NewsTitle") %></a></h4>
                     <p>
                        <%#Eval("NEWSDATE","{0:MMM d, yyyy}")%>
                     </p>
                     <p>
                        <a class="btn btn-default" href="NewsDetails.aspx?id=<%#Eval("NewsId") %>">Read this &raquo;</a>
                     </p>
                  </div>
               </AlternatingItemTemplate>
            </asp:ListView>
            </div>
      </div>
   </div>

      <script type="text/javascript">
         $(document).ready(function () {
            var heights = $(".col-md-4").map(function () {
               return $(this).height();
            }).get(),

            maxHeight = Math.max.apply(null, heights);
            $(".col-md-4").height(maxHeight);
         });
   </script>
</asp:Content>

