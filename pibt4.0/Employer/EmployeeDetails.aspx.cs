using System;
using System.Data;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Pibt.Model;

namespace Pibt.Employer
{
    public partial class EmployeeDetails : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployerId) || string.IsNullOrEmpty(EmployeeId))
                oops();

            if (!IsPostBack)
            {
                LoadRootNodesAndRightDetails(RadTreeView1, TreeNodeExpandMode.ServerSideCallBack);

                string who = CurrentUserInfo.UserRole!=UserRoles.Dependent ? EmployeeId : MemberId;
                FormView_MemberDetials.DataSource = BLL.Employer.GetBizMemberInfo(who);
                RadListViewPlanDetails.DataSource = BLL.Employee.GetMemberPlanDetails(who);

                FormView_MemberDetials.DataBind();
                RadListViewPlanDetails.DataBind();

                if (CurrentUserInfo.UserRole==UserRoles.Dependent || BLL.Employer.GetBizDepNames(EmployeeId).Rows.Count==0)
                    whoBox.Visible = false;
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

        protected void RadTreeView1_NodeClick(object sender, RadTreeNodeEventArgs e)
        {
            FormView_MemberDetials.DataSource = BLL.Employer.GetBizMemberInfo(e.Node.Value);
            FormView_MemberDetials.DataBind();
            RadListViewPlanDetails.DataSource = BLL.Employee.GetMemberPlanDetails(e.Node.Value);
            RadListViewPlanDetails.DataBind();
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

        protected void button_Command(object sender, CommandEventArgs e)
        {            
            switch (e.CommandName)
            {
                case "edit":
                    Response.Redirect("/Employer/EditMemberDetails.aspx" + UrlBuilder((CurrentUserInfo.UserRole != UserRoles.Dependent)? "&mId="+ e.CommandArgument.ToString() : ""));
                    break;
                case "add":
                    if(CurrentUserInfo.UserRole!= UserRoles.Dependent)
                        Response.Redirect("/Employer/AddDependent.aspx" + UrlBuilder(null));
                    break;
                case "OE":
                    if (CurrentUserInfo.UserRole != UserRoles.Dependent)
                        Response.Redirect("/OE/Type.aspx" + UrlBuilder(null));
                    break;
                case "term":
                    if (CurrentUserInfo.UserRole != UserRoles.Dependent)
                        Response.Redirect("/OE/Type.aspx"+ UrlBuilder("&OeTypeId=6"));
                    break;
                default:
                    if (CurrentUserInfo.UserRole != UserRoles.Dependent)
                    {
                        string[] args2 = new string[2];
                        args2 = e.CommandArgument.ToString().Split(';');
                        Session["tmpMemberId"] = args2[0];
                        Response.Redirect("/OE/Type.aspx" + UrlBuilder("&OeTypeId=3&planId=" + args2[1]));
                    }
                    break;
            }
        }
    }
}