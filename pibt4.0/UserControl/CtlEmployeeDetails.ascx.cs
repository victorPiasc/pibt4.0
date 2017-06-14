using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Telerik.Web.UI;
using Pibt.Model;



namespace Pibt.UserControl
{
    public partial class CtlEmployeeDetails : System.Web.UI.UserControl
    {
        public string EmployeeId { get; set; }
        public string EmployerId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadRootNodesAndRightDetails(RadTreeView1, TreeNodeExpandMode.ServerSideCallBack);
            }
        }

        private void LoadRootNodesAndRightDetails(RadTreeView treeView, TreeNodeExpandMode expandMode)
        {
            MemberInfoDetails member = BLL.Employer.GetMemberInfoDetails(EmployeeId);

            RadTreeNode node = new RadTreeNode();
            node.Text = member.Name;
            node.Value = EmployeeId;
            node.ExpandMode = expandMode;
            treeView.Nodes.Add(node);
        }

        protected void RadTreeView1_NodeExpand(object sender, RadTreeNodeEventArgs e)
        {
            PopulateNodeOnDemand(e, TreeNodeExpandMode.ServerSideCallBack);
        }

        private void PopulateNodeOnDemand(RadTreeNodeEventArgs e, TreeNodeExpandMode expandMode)
        {
            DataTable data = BLL.Employer.GetBizDepNames(e.Node.Value);

            foreach (DataRow row in data.Rows)
            {
                RadTreeNode node = new RadTreeNode();
                node.Text = row["depName"].ToString();
                node.Value = row["memberId"].ToString();
                e.Node.Nodes.Add(node);
            }

            e.Node.Expanded = true;
        }

        protected void addDependentButton_Click(object sender, EventArgs e)
        {
            string url = "/Employer/AddDependent.aspx"+BasePage.UrlBuilder(HttpContext.Current.Request, null);
            Response.Redirect(url);
        }

        protected void planEnrollmentButton_Click(object sender, EventArgs e)
        {
            string url = "/OE/Type.aspx" + BasePage.UrlBuilder(HttpContext.Current.Request, null);
            Response.Redirect(url);
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            string url = "/Employer/EmployeeDetails.aspx" + BasePage.UrlBuilder(HttpContext.Current.Request, null);
            Response.Redirect(url);
        }
    }
}