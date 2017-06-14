﻿using Pibt.Common;
using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.Admin
{
    public partial class Enrollers : EnrollerAgent
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Utilities.TieButton(Page, txtClue, btnSearch1);
            BLL.Agent.SynAgentToWebUsersTable(Page.User.Identity.Name);
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
            needDataSource(RadGridAgents, txtClue, false);
        }


        protected void RadGridAgents_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                GridDataItem dataItem = (GridDataItem)e.Item;
                string id = dataItem.GetDataKeyValue("Id").ToString();
                string loginName = dataItem.GetDataKeyValue("Loginname").ToString();
                string userId = dataItem.GetDataKeyValue("UserId").ToString();
                bool success = false;
                success = BLL.User.DeleteWebUserAndMembershipUser(id, loginName, Page.User.Identity.Name);
                if (success)
                {
                    BLL.Logger.WriteAuditLog(string.Format("{0} deleted the web agent: {1} #{2}", Page.User.Identity.Name, loginName, userId),
                        EventCode.DeleteAgent);
                }
            }
        }
    }
}