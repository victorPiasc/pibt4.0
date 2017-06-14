using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt
{
    public partial class EnrollerAgent:BasePage
    {

        protected void binder(object sender, GridItemEventArgs e)
        {
            binderLow(e, (RadGrid)sender, "View this agent");
        }

        protected void btnSearch(Label header, RadGrid grid )
        {
            if (Page.IsValid)
            {
                header.Text = "Search Results";
                grid.Rebind();
            }
        }

        protected void btnClear(TextBox clue, Label header, RadGrid grid)
        {
            clue.Text = "";
            header.Text = "";
            grid.Rebind();
        }

        protected void needDataSource(RadGrid grid, TextBox clue, bool isAgent)
        {
            grid.DataSource = BLL.Agent.SearchAgents(clue.Text, isAgent);
        }
    }
}