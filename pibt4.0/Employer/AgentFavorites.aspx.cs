using Pibt.Model;
using Pibt.UserControl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Employer
{
   public partial class AgentFavorites : BasePage
   {
      protected void Page_Load(object sender, EventArgs e)
      {
          if (!Page.IsPostBack)
          {
              UserCacheInfo userInfo = CurrentUserInfo;
              if (userInfo.UserRole == UserRoles.Agent)
              {
                 if (Request["roletype"] != null)
                    CtlAgentFavorites1.UserRole = Request["roletype"];
                 else
                 CtlAgentFavorites1.UserId = userInfo.AgentId;
                 CtlAgentFavorites1.UserRole = ((int)UserRoles.Agent).ToString();
              }         
          else
          {
              HttpContext.Current.ClearError();
              Response.Redirect("~/Oooops.aspx", false);
              return;
          }
      }

             
          if (CurrentUserInfo.UserRole == Model.UserRoles.Agent)
          {
          }
      }
   }
}