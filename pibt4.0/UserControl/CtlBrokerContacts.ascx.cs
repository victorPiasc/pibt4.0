using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.UserControl
{
    public partial class CtlBrokerContacts : BaseUserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Visible)
            {
                System.Data.DataTable dt = null;
                if (dt != null)
                {
                    object[] items = dt.Rows[0].ItemArray;
                    //DataTable dt = BLL.RK.GetPCRK();
                    rkName.Text = isEmpty(items[0], "");
                    rkEmail.Text = isEmpty(items[1], "");
                    rkOffice.Text = isEmpty(items[2], "");
                    rkMobile.Text = isEmpty(items[3], "");

                    phName.Text = isEmpty(items[4], "");
                    phEmail.Text = isEmpty(items[5], "");
                    phOffice.Text = isEmpty(items[6], "");
                    phMobile.Text = isEmpty(items[7], "");

                    pcName.Text = isEmpty(items[8], "");
                    pcEmail.Text = isEmpty(items[9], "");
                    pcOffice.Text = isEmpty(items[10], "");
                    pcMobile.Text = isEmpty(items[11], "");
                }
            }
        }

        public string isEmpty(object tmp, string replace)
        {
            return tmp == null ? replace : tmp.ToString();
        }
    }
}