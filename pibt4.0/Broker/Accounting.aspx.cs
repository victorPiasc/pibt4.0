using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Pibt.Broker
{
    public partial class Accounting : BasePage
    {
        public int tab
        {
            get
            {
                if (ViewState["tab"] == null)
                    return 1;
                return int.Parse(ViewState["tab"].ToString());
            }
            set
            {
                ViewState["tab"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                load_tabs(tab,pages.Controls);
            page_1.BrokerId = page_2.BrokerId = page_3.BrokerId= BrokerId;
        }

        protected void type_Command(object sender, CommandEventArgs e)
        {
            tab_command(typeList, e.CommandName);
            tab = int.Parse(e.CommandName);
            load_tabs(tab, pages.Controls);
            switch (tab)
            {
                case 1:
                    page_1.refresh();
                    break;
                case 2:
                    page_2.refresh();
                    break;
                case 3:
                    page_3.refresh();
                    break;
            }
        }

        public void load_tabs(int tabNum, ControlCollection c)
        {
            foreach (Control item in c)
                if (!string.IsNullOrEmpty(item.ID))
                    item.Visible = item.ID.Contains("page_" + tabNum);
        }
    }
}