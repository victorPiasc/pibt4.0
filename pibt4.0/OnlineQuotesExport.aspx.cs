using Pibt.BLL;
using Pibt.Model;
using System;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Pibt
{
    public partial class OnlineQuotesExport: SortaBasePage {
        protected void Page_Load(object sender, EventArgs e)
        {            
            if (urlIsValid())
            {
                eAll.NavigateUrl = exportALL();
            }
            else
            {
                EmployeeList.Visible = false;
                eAll.Visible = false;                
                message.Text = Common.Utilities.FormatError("An error ocurred while trying to process your request. Please go back and try again.");
                message.Visible = true;
            }
        }

        protected void EmployeeList_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            int cartid = BLL.OnlineQuote.QQCartId;
            EmployeeList.DataSource = BLL.OnlineQuote.getEmployeeList(cartid);
        }

        protected void EmployeeList_ItemCreated(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                HyperLink link = new HyperLink();
                link.NavigateUrl = SetURL(item["ROWID"].Text);
                link.Text = item["EMPLOYEENAME"].Text;
                item["EMPLOYEENAME"].Controls.Add(link);
            }
        }

        protected void EmployeeList_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                HyperLink link = new HyperLink();
                link.NavigateUrl = SetURL(item["ROWID"].Text); 
                link.Text = item["EMPLOYEENAME"].Text;
                item["EMPLOYEENAME"].Controls.Add(link);
            }
        }

        protected string SetURL(string rowid)
        {
            
            HttpContext context = HttpContext.Current;
            int cartid = BLL.OnlineQuote.QQCartId;
            if (urlIsValid())
            {
                return string.Format("/download/ExportQuotePdf.aspx?cartid={0}&zip={1}&count={2}&ma={3}&ep={4}&ea={5}&dp={6}&da={7}&ptid={8}&date={9}&rowid={10}&formtype={11}&isPdf={12}", cartid, context.Request.QueryString["zip"], context.Request.QueryString["count"],context.Request.QueryString["ma"], context.Request.QueryString["ep"], context.Request.QueryString["ea"],context.Request.QueryString["dp"], context.Request.QueryString["da"], context.Request.QueryString["ptid"], context.Request.QueryString["date"], rowid,  1,'Y');
            }
            Logger.InsertLog(new WebSiteLog
            {
                LogType = LogType.Error,
                EventCode = EventCode.AppError,
                EventDetails = "Error downloading file at line 66 of OnlineQuotesExport.aspx.cs",
                UserName = !string.IsNullOrEmpty( Page.User.Identity.Name) ? Page.User.Identity.Name : "null",
                FromIP = HttpContext.Current.Request.UserHostAddress
            });

            return "/Oooops.aspx";                
        }

        protected string exportALL()
        {
            HttpContext context = HttpContext.Current;
            int cartid = BLL.OnlineQuote.QQCartId;
            if (urlIsValid())
            {
               return string.Format("/download/ExportQuotePdf.aspx?cartid={0}&zip={1}&count={2}&ma={3}&ep={4}&ea={5}&dp={6}&da={7}&ptid={8}&date={9}&formtype={10}&isPdf={11}", cartid, context.Request.QueryString["zip"], context.Request.QueryString["count"], context.Request.QueryString["ma"], context.Request.QueryString["ep"], context.Request.QueryString["ea"], context.Request.QueryString["dp"], context.Request.QueryString["da"], context.Request.QueryString["ptid"], context.Request.QueryString["date"], 0, 'Y');
            }
            return "/Oooops.aspx";
        }

        protected bool urlIsValid()
        {
            HttpContext context = HttpContext.Current;
            return (!string.IsNullOrEmpty(context.Request.QueryString["zip"]) && !string.IsNullOrEmpty(context.Request.QueryString["count"]) && !string.IsNullOrEmpty(context.Request.QueryString["ma"]) && !string.IsNullOrEmpty(context.Request.QueryString["ep"]) && !string.IsNullOrEmpty(context.Request.QueryString["ea"]) && !string.IsNullOrEmpty(context.Request.QueryString["dp"]) && !string.IsNullOrEmpty(context.Request.QueryString["da"]) && !string.IsNullOrEmpty(context.Request.QueryString["ptid"]) && !string.IsNullOrEmpty(context.Request.QueryString["date"])); 
        }
    }
}