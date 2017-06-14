using Pibt.Model;
using System;

namespace Pibt
{
   public partial class Acknowledgement: SortaBasePage {
      string returnUrl;
      
      protected void Page_Load(object sender, EventArgs e)
      {
          returnUrl =  string.IsNullOrEmpty(Request["returnUrl"]) ? "/default.aspx": Request["returnUrl"];
          if (Page.User.IsInRole("Employee"))
              Response.Redirect (returnUrl);
      }

      protected void btnContinue_Click(object sender, EventArgs e)
      {
          Response.Redirect(returnUrl);
      }
   }
}