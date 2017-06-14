using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                tbSearchKeyWord.Text = Request.Form["Keywords"];
                rptCurrentNews.DataBind();
                rptDocuments.DataBind();
                rptQA.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            rptCurrentNews.DataBind();
            rptDocuments.DataBind();
            rptQA.DataBind();
        }

        protected override void OnPreRender(EventArgs e)
        {
            PanelNews.Visible = rptCurrentNews.Items.Count != 0;
            PanelDocuments.Visible = rptDocuments.Items.Count != 0;
            PanelQA.Visible = rptQA.Items.Count != 0;
            if (!PanelNews.Visible && !PanelDocuments.Visible && !PanelQA.Visible)
            {
                lblMsg.Text = "No search results.";
            }
            else
            {
                lblMsg.Text = "";
            }
            base.OnPreRender(e);
        }

        protected void odsCurrentNews_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            if (ddlTypes.SelectedValue != "-1" && ddlTypes.SelectedValue != "0")
            {
                e.Cancel = true;
            }
        }

        protected void odsDocuments_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            if (ddlTypes.SelectedValue != "-1" && ddlTypes.SelectedValue != "1")
            {
                e.Cancel = true;
            }
        }

        protected void odsCurrentQA_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            if (ddlTypes.SelectedValue != "-1" && ddlTypes.SelectedValue != "2")
            {
                e.Cancel = true;
            }
        }

        protected void rptCurrentNews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void SearchByFileName(string[] args)
        {
           if (ddlTypes.SelectedValue == "-1" || ddlTypes.SelectedValue == "1")
           {

           }
           string partialName = tbSearchKeyWord.Text;

           DirectoryInfo hdDirectoryInWhichToSearch = new DirectoryInfo(@"/documents/");
           FileInfo[] filesInDir = hdDirectoryInWhichToSearch.GetFiles("*" + partialName + "*.*");

           foreach (FileInfo foundFile in filesInDir)
           {
              string fullName = foundFile.FullName;
           }
        }

    }
}