<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true"
   CodeBehind="QADetails.aspx.cs" Inherits="Pibt.QADetails" %>


<asp:Content ID="Content7" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="contentWrapper">
      <div class="row">
         <div class="column-12">
            <h1>Frequently Asked Questions</h1>
            <hr>
            <asp:FormView ID="FormView1" BorderStyle="None" runat="server" DataSourceID="ObjectDataSource1">
               <ItemTemplate>
                  <h2>Question</h2>
                  <br />
                  <asp:Label ID="ContentLabel" runat="server" Font-Size="Large" Font-Names="Open Sans" Text='<%# Eval("Question") %>' /><br />
                  <br />
                  <h2>Answer</h2>
                  <asp:Label ID="PublishedDateLabel" runat="server" Font-Size="Large" Font-Names="Open Sans"  Text='<%# Eval("Answer") %>' />
               </ItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDetails"
               TypeName="Pibt.BLL.QA">
               <SelectParameters>
                  <asp:QueryStringParameter Name="qaId" QueryStringField="id" Type="String" />
               </SelectParameters>
            </asp:ObjectDataSource>
            <br />
            <h2>Comments</h2>
            <div id="disqus_thread"></div>
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
