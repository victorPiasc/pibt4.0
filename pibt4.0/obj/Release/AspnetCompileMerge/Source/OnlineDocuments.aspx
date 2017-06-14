<%@ Page Title="" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true"
   CodeBehind="OnlineDocuments.aspx.cs" Inherits="Pibt.OnlineDocuments" %>

<asp:Content ID="Content6" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="contentWrapper">
      <div class="row">
         <div class="column-12">
            <h1>Online Documents</h1>
            <hr>
            <h3 style="font-family: Open Sans;">Below you'll find a list of folders for all the documents available in our library.<br />
               Select or double-click the folder names that are most relevant to what you'd like to find.</h3>
            <br />
               <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
               </telerik:RadAjaxManager>
               <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
               </telerik:RadAjaxLoadingPanel>
               <div class="dontprint">
                   <telerik:RadTabStrip ID="RadTabStrip1" runat="server" Skin="MetroTouch" MultiPageID="RadMultiPage1"
                           ReorderTabsOnSelect="true" Orientation="HorizontalTop" SelectedIndex="0">
                       <Tabs>
                           <telerik:RadTab Text="PIASC">
                           </telerik:RadTab>
                           <telerik:RadTab Text="PIASD">
                           </telerik:RadTab>
                           <telerik:RadTab Text="VMA">
                           </telerik:RadTab>
                           <telerik:RadTab Text="PIAG">
                           </telerik:RadTab>
                       </Tabs>
                   </telerik:RadTabStrip>
                </div>
               <telerik:RadMultiPage runat="server" SelectedIndex="0" ID="RadMultiPage1" CssClass="multiPage">
                  <telerik:RadPageView runat="server" ID="RadPageView3">
                     <div class="customer-info-box" style="margin-top: 15px;">
                        <fieldset style="width: 920px; min-height: 240px;">
                           <telerik:RadTreeView ID="PIASCTreeView" runat="server" OnClientDoubleClick="DoubleClick" OnNodeExpand="TreeView1_NodeExpand" ToolTip='Double-click to expand/collapse'>
                           </telerik:RadTreeView>
                        </fieldset>
                     </div>
                  </telerik:RadPageView>
                  <telerik:RadPageView runat="server" ID="RadPageView4">
                     <div class="customer-info-box" style="margin-top: 15px;">
                        <fieldset style="width: 920px; min-height: 240px;">
                           <telerik:RadTreeView ID="PIASDTreeView" runat="server" OnClientDoubleClick="DoubleClick" OnNodeExpand="TreeView1_NodeExpand" ToolTip='Double-click to expand/collapse'>
                           </telerik:RadTreeView>
                        </fieldset>
                     </div>
                  </telerik:RadPageView>
                  <telerik:RadPageView runat="server" ID="RadPageView5">
                     <div class="customer-info-box" style="margin-top: 15px;">
                        <fieldset style="width: 920px; min-height: 240px;">
                           <%--<legend style="font-family: Open sans;"><span class="glyphicon glyphicon-arrow-down"></span>[Click "<span class="glyphicon glyphicon-play" style="padding-top: 5px;"></span>" to start]</legend>--%>
                           <telerik:RadTreeView ID="VMATreeView" runat="server" OnClientDoubleClick="DoubleClick" OnNodeExpand="TreeView1_NodeExpand" ToolTip='Double-click to expand/collapse'>
                           </telerik:RadTreeView>
                        </fieldset>
                     </div>
                  </telerik:RadPageView>
                  <telerik:RadPageView runat="server" ID="RadPageView2">
                     <div class="customer-info-box" style="margin-top: 15px;">
                        <fieldset style="width: 920px; min-height: 240px;">
                           <%--<legend style="font-family: Open sans;"><span class="glyphicon glyphicon-arrow-down"></span>[Click "<span class="glyphicon glyphicon-play" style="padding-top: 5px;"></span>" to start]</legend>--%>
                           <telerik:RadTreeView ID="PIAGTreeView" runat="server" OnClientDoubleClick="DoubleClick" OnNodeExpand="TreeView1_NodeExpand" ToolTip='Double-click to expand/collapse'>
                           </telerik:RadTreeView>
                        </fieldset>
                     </div>
                  </telerik:RadPageView>
               </telerik:RadMultiPage>
         </div>
      </div>
   </div>
   <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
      <script type="text/javascript">
         function DoubleClick(sender, eventArgs) {
            var node = eventArgs.get_node();
         }

         function treeExpandedAllNodes1() {
            <%--var treeView = $find("<%= GeneralTreeView.ClientID %>");
            var nodes = treeView.get_allNodes();
            for (var i = 0; i < nodes.length; i++) {
               if (nodes[i].get_nodes() != null) {
                  nodes[i].expand();
               }
            }--%>

            var treeView = $find("<%= PIASCTreeView.ClientID %>");
                        var nodes = treeView.get_allNodes();
                        for (var i = 0; i < nodes.length; i++) {
                           if (nodes[i].get_nodes() != null) {
                              nodes[i].expand();
                           }
                        }

                        var treeView = $find("<%= PIASDTreeView.ClientID %>");
                        var nodes = treeView.get_allNodes();
                        for (var i = 0; i < nodes.length; i++) {
                           if (nodes[i].get_nodes() != null) {
                              nodes[i].expand();
                           }
                        }

                        var treeView = $find("<%= VMATreeView.ClientID %>");
                     var nodes = treeView.get_allNodes();
                     for (var i = 0; i < nodes.length; i++) {
                        if (nodes[i].get_nodes() != null) {
                           nodes[i].expand();
                        }
                     }

                     var treeView = $find("<%= PIAGTreeView.ClientID %>");
                     var nodes = treeView.get_allNodes();
                     for (var i = 0; i < nodes.length; i++) {
                        if (nodes[i].get_nodes() != null) {
                           nodes[i].expand();
                        }
                     }
                  }

                  //alert("You clicked " + node.get_text());

                  //window.$ = $telerik.$;
                  //$(document).ready(function () {
                  //   $("~/Img/folder.png").dblclick(imageDoubleClick);
                  //});

                  //function onDoubleClick(sender, e) {
                  //   handleDoubleClick(sender, e.get_nodes());
                  //};

                  //function imageDoubleClick() {
                  //   var tree = null;
                  //   var node = null;
                  //   //find the tree
                  //   $(this).parents().each(function (i, parent) {
                  //      if ($(parent).is(".RadTreeView"))
                  //         tree = $find(parent.id);
                  //   });

                  //   //find the node
                  //   nodeText = this.nextSibling.innerHTML;
                  //   node = tree.findNodeByText(nodeText);

                  //   handleDoubleClick(tree, node);
                  //}

                  //function handleDoubleClick(tree, node) {
                  //   alert(tree.get_id() + "\n" + node.get_text());
                  //}
      </script>
   </telerik:RadCodeBlock>
   <script>
      window.onload = treeExpandedAllNodes1;
   </script>
</asp:Content>
