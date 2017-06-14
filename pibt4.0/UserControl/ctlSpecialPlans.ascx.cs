using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt;


namespace Pibt.UserControl
{
    public partial class CtlSpecialPlans : System.Web.UI.UserControl
    {
        public string EmployerId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                odsSpecialPlans.SelectParameters["employerId"].DefaultValue = EmployerId;
            }
        }
    }
}