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
               <%--<img src="images/pibtred.png" height="50" alt="" /><br />
               <br />--%>
               <p style="font-family: Open Sans; font-size: medium;">
                  <%# Eval("PublishedDate","{0:MMM d, yyyy}") %>
               </p>
               <br />
               <p style="font-family: Open Sans;"><%# Eval("Content") %> </p>
            </div>
         </div>
         <div style="text-align: center;">
         <asp:Button runat="server" ID="BackButton" CssClass="btn" Text="Previous" OnClick="BackButton_Click" />
         </div>
      </ItemTemplate>
   </asp:FormView>
   <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDetails"
      TypeName="Pibt.BLL.News">
      <SelectParameters>
         <asp:QueryStringParameter Name="newsId" QueryStringField="id" Type="String" />
      </SelectParameters>
   </asp:ObjectDataSource>
   <h3>Comments</h3>
   <fieldset>
      <div id="disqus_thread"></div>
   </fieldset>
   <script type="text/javascript">
      /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
      var disqus_shortname = 'pibtorg'; // required: replace example with your forum shortname

      /* * * DON'T EDIT BELOW THIS LINE * * */
      (function () {
         var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
         dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
         (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
      })();
   </script>
   <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
            </div>
      </div>
   </div>
</asp:Content>

