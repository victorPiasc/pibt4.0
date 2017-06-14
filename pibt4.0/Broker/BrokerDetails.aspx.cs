using System;
using Pibt.Model;
using Pibt.UserControl;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace Pibt.Broker 
{
    public partial class BrokerDetails : BasePage 
    {
        public int tab
        {
            get
            {
                object tmp = ViewState["tab"];
                if (tmp == null)
                    ViewState["tab"] = 1;
                return (int)ViewState["tab"];
            }
            set { ViewState["tab"] = value; }
        }

        public string loginName
        {
            get
            {
                object tmp = ViewState["loginName"];
                if(tmp==null)
                    ViewState["loginName"] = BLL.User.GetWebUserLoginname(BrokerId, UserRoles.Broker);
                return ViewState["loginName"].ToString();
            }
        }
        protected void Page_Load(object sender, EventArgs e) 
        {
            if(!IsPostBack)
                loadTabs();
            setVariables();
        }

        public void loadTabs()
        {
            foreach (Control item in pages.Controls)
            {
                if (!string.IsNullOrEmpty(item.ID))
                {
                    item.Visible = item.ID.Contains("page_" + tab);
                    if (item.Visible && item.ID.Contains("4"))
                        item.Visible = item.ID.Contains("B") && string.IsNullOrEmpty(loginName) 
                            || !item.ID.Contains("B") && !string.IsNullOrEmpty(loginName);
                }
            }
            setVariables();
        }

        protected void type_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            tab_command(typeList, e.CommandName);
            tab = int.Parse(e.CommandName);
            if (tab == 2)
            {
                page_2.BrokerId = BrokerId;
                page_2.rebind();
            }
            loadTabs();
        }

        public void setVariables()
        {
            if(page_1.Visible)
                page_1.BrokerId = BrokerId;

            if (page_2.Visible)
                page_2.BrokerId = BrokerId;

            if (page_4.Visible || page_4B.Visible)
            {
                if (!string.IsNullOrEmpty(loginName))
                {
                    page_4.UserId = BrokerId;
                    page_4.userName = loginName;
                }
                else
                    page_4B.UserId = BrokerId;
            }
        }

        void CtlCreateWebUser1_OnCreateFinished(object sender, CreateWebUserEventArgs e)
        {
            page_4.Visible = true;
            page_4.AspnetUserName = e.NewUserName;
            page_4B.Visible = false;
        }
    }
}