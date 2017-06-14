using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Pibt
{
    public class BaseUserControl : System.Web.UI.UserControl
    {
        public void oops()
        {
            Response.Redirect("/Oooops.aspx", true);
        }

        public static void tab_command(Control tabList, string num)
        {
            foreach (Control item in tabList.Controls)
            {
                if (item is HtmlGenericControl)
                {
                    HtmlControl li = (HtmlControl)item;
                    string className = li.Attributes["class"].ToString();
                    li.Attributes.Add("class", item.ID.Equals("l" + num) ? "selected" : className.Replace("selected", ""));
                }
            }
        }
    }
}