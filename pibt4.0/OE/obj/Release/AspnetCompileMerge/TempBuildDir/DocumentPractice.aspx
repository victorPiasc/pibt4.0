<%@ Page Title="" Language="C#" MasterPageFile="~/Content.master" AutoEventWireup="true" CodeBehind="DocumentPractice.aspx.cs" Inherits="Pibt.DocumentPractice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PlaceHolderBreadcrumbs" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="LeftMenuPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="FrameHeaderPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <script type="text/javascript">
                
          //<![CDATA[
        function isOverElement(currentElement, targetId) {
            while (currentElement) {
                if (currentElement.id == targetId)
                    return currentElement;

                currentElement = currentElement.parentNode;
            }

            return null;
        }

        function onDropping(sender, args) {
            var destNode = args.get_destNode();
            var destElement = args.get_htmlElement();

            if (destNode) return;

            if (!destElement) return;
            var priceChecker = isOverElement(destElement, "<%= priceChecker.ClientID%>");
            var grid = isOverElement(destElement, "<%=RadGrid1.ClientID %>");

            if (priceChecker) {
                args.set_htmlElement(priceChecker);
                return;
            }
            else if (grid) {
                args.set_htmlElement(grid);
                return;
            }

            args.set_cancel(true);
        }
                
     //]]>
      
    </script>
    <telerik:RadAjaxManager runat="server" ID="RadAjaxManager1">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadTreeView1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadTreeView1"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadTreeView2"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1"></telerik:AjaxUpdatedControl>
                    <telerik:AjaxUpdatedControl ControlID="priceChecker"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>

    <div>
    <telerik:RadTreeView runat="Server" ID="RadTreeView1" EnableDragAndDrop="true" OnNodeDrop="RadTreeView1_NodeDrop"
                OnClientNodeDropping="onDropping" 
        EnableDragAndDropBetweenNodes="true" Skin="Vista" 
        onnodeclick="RadTreeView1_NodeClick">
                <Nodes>
                    <telerik:RadTreeNode runat="server" Text="Island" Expanded="true" AllowDrag="false"
                        AllowDrop="false">
                        <Nodes>
                            <telerik:RadTreeNode runat="server" Text="Zanzibar" AllowDrag="false">
                                <Nodes>
                                    <telerik:RadTreeNode runat="server" Text="Weekend Package" AllowDrop="false" Value="1999">
                                    </telerik:RadTreeNode>
                                    <telerik:RadTreeNode runat="server" Text="1 Week Package" AllowDrop="false" Value="2999">
                                    </telerik:RadTreeNode>
                                    <telerik:RadTreeNode runat="server" Text="2 Week Package" AllowDrop="false" Value="3999">
                                    </telerik:RadTreeNode>
                                </Nodes>
                            </telerik:RadTreeNode>
                            <telerik:RadTreeNode runat="server" Text="Mauritius" AllowDrag="false">
                                <Nodes>
                                    <telerik:RadTreeNode runat="server" Text="Weekend Package" AllowDrop="false" Value="2999">
                                    </telerik:RadTreeNode>
                                    <telerik:RadTreeNode runat="server" Text="1 Week Package" AllowDrop="false" Value="3999">
                                    </telerik:RadTreeNode>
                                    <telerik:RadTreeNode runat="server" Text="2 Week Package" AllowDrop="false" Value="4999">
                                    </telerik:RadTreeNode>
                                </Nodes>
                            </telerik:RadTreeNode>
                            <telerik:RadTreeNode runat="server" Text="Maldives" Expanded="true" AllowDrag="false">
                                <Nodes>
                                    <telerik:RadTreeNode runat="server" Text="Weekend Package" AllowDrop="false" Value="3999">
                                    </telerik:RadTreeNode>
                                    <telerik:RadTreeNode runat="server" Text="1 Week Package" AllowDrop="false" Value="4999">
                                    </telerik:RadTreeNode>
                                    <telerik:RadTreeNode runat="server" Text="2 Week Package" AllowDrop="false" Value="5999">
                                    </telerik:RadTreeNode>
                                </Nodes>
                            </telerik:RadTreeNode>
                        </Nodes>
                    </telerik:RadTreeNode>
                </Nodes>
            </telerik:RadTreeView>
        </div>
</asp:Content>
