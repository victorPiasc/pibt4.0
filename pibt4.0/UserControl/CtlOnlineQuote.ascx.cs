using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.UserControl
{
    public partial class CtlOnlineQuote : System.Web.UI.UserControl
    {

        private object _dataItem = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            UserCacheInfo userInfo = null;
            if (Session["UserCacheInfo"] != null)
            {
                 userInfo = (UserCacheInfo)Session["UserCacheInfo"];
                eeSection.Visible = userInfo.UserRole == UserRoles.Administrator;
            }

            string genderValue = (string)DataBinder.Eval(DataItem, "MALE");
            if (!string.IsNullOrEmpty(genderValue))
            {
                ddlGender.Items.FindByValue(genderValue).Selected = true;
            }

            object period = DataBinder.Eval(DataItem, "PERIODSPERYEAR");
            if (period != null)
            {
                tbPeriod.Items.FindByValue(period.ToString()).Selected = true;
            }

            if (DataBinder.Eval(DataItem, "EMPLOYEETYPEID") != null)
            {
                Int16 isEE = (Int16)DataBinder.Eval(DataItem, "EMPLOYEETYPEID");
                eeSection.Visible = userInfo!=null && isEE == 0;
            }
        }

        public object DataItem
        {
            get
            {
                return this._dataItem;
            }
            set
            {
                this._dataItem = value;
            }
        }
    }
}