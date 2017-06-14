using System;
using Pibt.Common;
using Pibt.BLL;
using System.Web;
using Pibt.Model;

namespace Pibt
{
    public partial class Oooops : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                HttpContext.Current.ClearError();
            }
        }
    }
}