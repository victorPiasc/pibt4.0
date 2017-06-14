using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.UserControl
{
   public partial class CtlAgentFavorites : System.Web.UI.UserControl
   {
       public string UserId
       {
          get { return ViewState["UserId"].ToString(); }
          set { ViewState["UserId"] = value; }
       }
      
       public string UserRole
       {
          get { return ViewState["UserRole"].ToString(); }
          set { ViewState["UserRole"] = value; }
       }
      
       protected void Page_Load(object sender, EventArgs e)
       {
      
       }
   }
}