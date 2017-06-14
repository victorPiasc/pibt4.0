<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true"
   CodeBehind="QAList.aspx.cs" Inherits="Pibt.QAList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="contentWrapper">
      <div class="row">
         <div class="column-12">
            <h1>Frequently Asked Questions</h1>
            <hr>
            <asp:ObjectDataSource ID="odsQA" runat="server" SelectMethod="GetList" TypeName="Pibt.BLL.QA"></asp:ObjectDataSource>

                  <asp:Repeater ID="Repeater1" runat="server" DataSourceID="odsQA">
                     <ItemTemplate>
                       <ul runat="server" class="disc">
                        <li><a href="QADetails.aspx?id=<%#Eval("QAId") %>">
                           <%#Eval("Question")%></a></li>
                        </ul>
                        </style>
                     </ItemTemplate>
                  </asp:Repeater>
            </div>
      </div>
   </div>
</asp:Content>
