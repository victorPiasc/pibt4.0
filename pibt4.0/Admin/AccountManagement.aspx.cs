using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Admin
{
   public partial class AccountManagement : System.Web.UI.Page
   {
      public bool UnlockAll;
      public bool IsLockedOut;
      protected void Page_Load(object sender, EventArgs e)
      {

      }

      protected void btnUnlock_Click(object sender, EventArgs e)
      {
         BLL.User.UnlockAllUsers(UnlockAll);
         //LockedAccountsGrid.Rebind();

      }
   }
}