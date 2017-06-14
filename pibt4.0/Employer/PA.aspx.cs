using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.BLL;
using Pibt.Model;
using System.Globalization;


namespace Pibt.Employee
{
    public partial class PA : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = CurrentUserInfo;
            if (!IsPostBack)
            {
                //RK Info
                if (Session["UserCacheInfo"] == null)
                {
                    Session["UserCacheInfo"] = BLL.User.RefreshUserCacheInfo(Page.User.Identity.Name);
                }
                UserCacheInfo uInfo = (UserCacheInfo)Session["UserCacheInfo"];
                BizAdditionalInfo _erAddi = BLL.Employer.GetBizInfoDetails2(uInfo.EmployerId);
                Model.RKDetails rk = BLL.RK.GetRKDetailsById(_erAddi.RKId);
                if (rk != null)
                    lblRK.Text = _erAddi.RK.Substring(0, _erAddi.RK.Length - 9) + "<br/> (323)728-9500 Ext. " + rk.Extension + " " + string.Format("<br/><a href='mailto:{0}'>{0}</a>", rk.EmailAddress);
                else
                    lblRK.Visible = false;

                if (EnrollmentForm.CheckOEWindowByErId(EmployerId))
                {
                    //Get PA effective date
                    DateTime dt;
                    if (EnrollmentForm.GetCurrentPA(EmployerId, out dt))
                    {
                        LabelResults.Text = "Your Participation Agreement begins on: " + dt.ToShortDateString()
                                          + "<br/><br/><br/> Thank you for your business!<br/><br/><br/> ";
                    }
                    else
                    {
                        LabelResults.Text = "<font color=red>Your Participation Agreement has expired.<br /> <br /> <br /> Please Contact Your Relationship Keeper to renew your Participation Agreement. </font> <br /> <br /> <br />";
                    }
                }

                else
                {
                    LabelResults.Text = "<font color=red>Participation Agreement is only available during open enrollment.<br /> <br /> <br />If you have any questions, <br /><br />please Contact Your Relationship Keeper </font> <br /> <br />";
                }
            }

        }
    }
}