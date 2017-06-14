using System;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Pibt.Admin
{
    public partial class DocumentLibrary: SortaBasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetTreeViewItems();
                GridView1.DataBind();
            }
            Response.Write(TreeView1.SelectedValue);
        }

        protected void GetTreeViewItems()
        {
            string cs = ConfigurationManager.ConnectionStrings["MaximumASPSQLServer"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter("Documents_GetDocumentTreeView", con);

            DataSet ds = new DataSet();
            da.Fill(ds);

            ds.Relations.Add("ChildRows", ds.Tables[0].Columns["DocumentTypeId"], ds.Tables[0].Columns["ParentId"]);

            foreach (DataRow level1DataRow in ds.Tables[0].Rows)
            {
                if (string.IsNullOrEmpty(level1DataRow["ParentId"].ToString()))
                {
                    TreeNode parentTreeNode = new TreeNode();
                    parentTreeNode.Text = level1DataRow["DocumentTypeName"].ToString();
                    parentTreeNode.Value = level1DataRow["DocumentTypeId"].ToString();

                    //Call Recursive function
                    GetChildRows(level1DataRow, parentTreeNode);
                    TreeView1.Nodes.Add(parentTreeNode);
                    TreeView1.CollapseAll();
                }
            }
        }

        protected void GetChildRows(DataRow dataRow, TreeNode treeNode)
        {
            DataRow[] childRows = dataRow.GetChildRows("ChildRows");
            foreach (DataRow childRow in childRows)
            {
                TreeNode childTreeNode = new TreeNode();
                childTreeNode.Text = childRow["DocumentTypeName"].ToString();
                childTreeNode.Value = childRow["DocumentTypeId"].ToString();
                treeNode.ChildNodes.Add(childTreeNode);
                if (childRow.GetChildRows("ChildRows").Length > 0)
                {
                    GetChildRows(childRow, childTreeNode);
                }
            }
        }

        protected void AddCategoryButton_Click(object sender, EventArgs e)
        {
            AddCategory();
            Response.Redirect("/Admin/DocumentLibrary.aspx");
        }

        protected void AddCategory()
        {
            string cs = ConfigurationManager.ConnectionStrings["MaximumASPSQLServer"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd = new SqlCommand("Documents_AddCategory", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@ParentId", SqlDbType.Int)).Value = TreeView1.SelectedValue;
            cmd.Parameters.Add(new SqlParameter("@DocumentTypeName", SqlDbType.NVarChar)).Value = NodeNameTextbBox.Text;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            string savePath = "~/Documents/" + DocumentUpload.FileName;
            DocumentUpload.SaveAs(Server.MapPath(savePath));
            SaveFileInfo(DocumentNameTextBox.Text, savePath, int.Parse(TreeView1.SelectedValue));
            lblMessage.Text = "File Uploaded Successfully.";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            GridView1.DataBind();
        }

        protected void SaveFileInfo(string DocumentName, string DocumentURL, int DocumentTypeId)
        {
            string savePath = "~/Documents/" + DocumentUpload.FileName;
            string constr = ConfigurationManager.ConnectionStrings["MaximumASPSQLServer"].ConnectionString;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand("Documents_UploadDocument", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@DocumentName", SqlDbType.NVarChar)).Value = DocumentNameTextBox.Text;
            cmd.Parameters.Add(new SqlParameter("@DocumentURL", SqlDbType.NVarChar)).Value = savePath;
            cmd.Parameters.Add(new SqlParameter("@DocumentTypeId", SqlDbType.Int)).Value = int.Parse(TreeView1.SelectedValue);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}