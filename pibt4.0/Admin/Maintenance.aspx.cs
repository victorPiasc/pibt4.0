using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Common;
using Pibt.Model;

namespace Pibt.Admin
{
    public partial class Maintenance : BasePage
    {
        bool isOff = false;

        protected void Page_Load(object sender, EventArgs e)
        { 
            isOff = BLL.User.SysIsMaintenance();
            btnCloseSite.Text = isOff ? "Allow logins" : "Disallow logins";
        }

        protected void btnCloseSite_Click(object sender, EventArgs e)
        {
            if (BLL.User.ChangeWebSiteStatus(!isOff))
            {
                if (!isOff)
                {
                    btnCloseSite.Text = "Allow logins";
                    BLL.Logger.WriteAuditLog("Disallow logins", Model.EventCode.MaintainWebSite);
                }
                else
                {
                    btnCloseSite.Text = "Disallow logins";
                    BLL.Logger.WriteAuditLog("Allow logins", Model.EventCode.MaintainWebSite);
                }
            }
        }
    }
}