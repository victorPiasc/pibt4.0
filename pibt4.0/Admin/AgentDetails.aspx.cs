using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.UserControl;

using Pibt.Model;

namespace Pibt.Admin
{
    public partial class AgentDetails : EnrollerAgentDetails
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadPage(CtlEditAgentDetails1, CtlCreateWebUser1, CtlChangePassword1, RadTabStrip1);
        }

        protected override void CreateChildControls()
        {
            CtlCreateWebUser1.OnCreateFinished += new UserControl.CreateFinished(CtlCreateWebUser1_OnCreateFinished);
            base.CreateChildControls();
        }

        void CtlCreateWebUser1_OnCreateFinished(object sender, CreateWebUserEventArgs e)
        {
            CtlChangePassword1.Visible = true;
            CtlChangePassword1.AspnetUserName = e.NewUserName;
            CtlCreateWebUser1.Visible = false;
            RadTabStrip1.Tabs[1].Text = "Change Password";
        }
    }
}