using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Model;

namespace Pibt
{
    public partial class NestedBMSMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnInit(EventArgs e)
        {
            if(!Common.ApplicationConfiguration.IsTestServer)
                if (!Request.IsSecureConnection)
                    Response.Redirect(Request.Url.AbsoluteUri.ToLower().Replace("http://", "https://"), true);
            base.OnInit(e);
        }
    }
}