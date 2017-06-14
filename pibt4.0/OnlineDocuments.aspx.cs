using System;
using Telerik.Web.UI;
using System.IO;
using Pibt.Common;

namespace Pibt
{
   public partial class OnlineDocuments: SortaBasePage {
      private readonly string[] knownExtensions = new string[] { "aspx", "asmx", "cs", "vb", "xml", "ascx", "doc", "docx", "jpg", "png", "gif", "html", "pdf",
                                                                 "zip" };

      protected override void OnInit(EventArgs e)
      {
         bool IsTestServer = ApplicationConfiguration.IsTestServer;

         if (!Request.IsSecureConnection && !IsTestServer)
         {
            Response.Redirect(Request.Url.AbsoluteUri.ToLower().Replace("http://", "https://"), true);
         }
         base.OnInit(e);
      }

      private void BindTreeToDirectory(string virtualPath, RadTreeNode parentNode)
      {
         string physicalPath = Server.MapPath(virtualPath);
         string[] directories = Directory.GetDirectories(physicalPath);
         foreach (string directory in directories)
         {
            RadTreeNode node = new RadTreeNode(Path.GetFileName(directory));
            node.Value = virtualPath + "/" + Path.GetFileName(directory);
            node.ExpandMode = TreeNodeExpandMode.ServerSideCallBack;
            parentNode.Nodes.Add(node);
         }

         string[] files = Directory.GetFiles(physicalPath);
         foreach (string file in files)
         {
            string url = Request.Url.Host + ":" + Request.Url.Port;
            string fullpath = Path.GetFullPath(file);
            string localpath = fullpath.Substring(30);
            string onlyFileName = Path.GetFileNameWithoutExtension(file);
            RadTreeNode node = new RadTreeNode(Path.GetFileNameWithoutExtension(file));

            string extension = Path.GetExtension(file).ToLower().TrimStart('.');

            if (Array.IndexOf(knownExtensions, extension) > -1)
            {
               node.ImageUrl = "/Img/" + extension + ".png";
            }
            else
            {
               node.ImageUrl = "/Img/unknown.png";
            }
            string pdfsource = "/Documents/" + localpath;
            node.NavigateUrl = pdfsource;
            node.Target = "_blank";

            parentNode.Nodes.Add(node);
         }
      }

      protected void Page_Load(object sender, EventArgs e)
      {
         if (!Page.IsPostBack)
         {
            RadTreeNode rootNode2 = new RadTreeNode();
            rootNode2.Value = "/Documents/PIASC";
            rootNode2.ImageUrl = "/Images/piascs.jpg";
            rootNode2.ExpandMode = TreeNodeExpandMode.ServerSideCallBack;
            PIASCTreeView.Nodes.Add(rootNode2);

            RadTreeNode rootNode3 = new RadTreeNode();
            rootNode3.Value = "/Documents/PIASD";
            rootNode3.ImageUrl = "/Images/piasds.jpg";
            rootNode3.ExpandMode = TreeNodeExpandMode.ServerSideCallBack;
            PIASDTreeView.Nodes.Add(rootNode3);

            RadTreeNode rootNode4 = new RadTreeNode();
            rootNode4.Value = "/Documents/VMA";
            rootNode4.ImageUrl = "/Images/vmalogos.png";
            rootNode4.ExpandMode = TreeNodeExpandMode.ServerSideCallBack;
            VMATreeView.Nodes.Add(rootNode4);

            RadTreeNode rootNode1 = new RadTreeNode();
            rootNode1.Value = "/Documents/PIAG";
            rootNode1.ImageUrl = "/images/piag.jpg";
            rootNode1.ExpandMode = TreeNodeExpandMode.ServerSideCallBack;
            PIAGTreeView.Nodes.Add(rootNode1);
         }
      }

      protected void Page_PreRender(object sender, EventArgs e)
      {
         PIAGTreeView.Nodes[0].Expanded = true;
      }

      protected void TreeView1_NodeExpand(object sender, RadTreeNodeEventArgs e)
      {
            BindTreeToDirectory(e.Node.Value, e.Node);

            if (e.Node.Nodes.Count == 0)
               e.Node.Nodes.Add(new RadTreeNode() { Text = "Node2", ExpandMode = TreeNodeExpandMode.ServerSide });
      }

      protected void TreeView1_NodeClick(object sender, RadTreeNodeEventArgs e)
      {
      }
   }
}