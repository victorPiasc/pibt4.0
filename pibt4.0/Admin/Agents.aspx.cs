using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Telerik.Web.UI;
using Pibt.Model;
using Pibt.Common;

namespace Pibt.Admin
{
    public partial class Agents : EnrollerAgent
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utilities.TieButton(Page, txtClue, btnSearch1);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            btnSearch(lblGridHeader, RadGridAgents);
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            btnClear(txtClue, lblGridHeader, RadGridAgents);
        }

        protected void RadGridAgents_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            needDataSource(RadGridAgents, txtClue, true);
        }
    }
}