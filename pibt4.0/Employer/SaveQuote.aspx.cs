using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt.Employer
{
    public partial class SaveQuote : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void tbSave_Click(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            if (userInfo.UserRole != UserRoles.Dependent && userInfo.UserRole != UserRoles.Employee && userInfo.UserRole!= UserRoles.Employer )
            {               
               RadTextBox txtbox = (RadTextBox) this.LoginViewPageContent.FindControl("tbLabelName");
               if (BLL.OnlineQuote.insertSavedQuote(BLL.OnlineQuote.QQCartId, txtbox.Text, userInfo.LoginName))
               {
                   Response.Redirect("~/Admin/OnlineQuote.aspx");
               }
               else
               {
                   oops();
               }
            }
        }
    }
}