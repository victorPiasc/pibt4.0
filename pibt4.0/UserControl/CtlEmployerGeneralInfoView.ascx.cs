using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.UserControl
{
    public partial class CtlEmployerGeneralInfoView : System.Web.UI.UserControl
    {
        public string EmployerId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void odsEmployer_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters[0] = EmployerId;
        }
    }
}