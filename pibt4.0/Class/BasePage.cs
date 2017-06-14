using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Pibt.BLL;
using Pibt.Common;
using Pibt.Model;
using Telerik.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace Pibt
{
    public class BasePage : System.Web.UI.Page
    {
        private UserCacheInfo userInfo = null;
        public string EmployerId { get { return Common.Utilities.ToString(ViewState["EmployerId"]); } set { ViewState["EmployerId"] = value; } }
        public string EmployeeId { get { return Common.Utilities.ToString(ViewState["EmployeeId"]); } set { ViewState["EmployeeId"] = value; } }
        public string MemberId { get { return Common.Utilities.ToString(ViewState["MemberId"]); } set { ViewState["MemberId"] = value; } }
        public string BrokerId { get { return Common.Utilities.ToString(ViewState["BrokerId"]); } set { ViewState["BrokerId"] = value; } }
        public string UserId { get { return Common.Utilities.ToString(ViewState["UserId"]); } set { ViewState["UserId"] = value; } }
        public static string disclaimer = "<span id=\"header\" style=\"font-size:13px;\"> Disclaimer</span><p style=\"font-size:12px; color:grey\">The " +
            "information contained in this transmission is confidential, proprietary or privileged and may be subject to protection under the law, including " +
            "the Health Insurance Portability and Accountability Act (HIPAA). This communication, along with any documents, files or attachments, is intended " +
            "only for the use of the addressee and may contain legally privileged and confidential information. If you are not the intended recipient, you are " +
            "hereby notified that any dissemination, distribution, or copying of any information contained in or attached to this communication is strictly " +
            "prohibited. If you have received this message in error, please notify the sender immediately and destroy the original communication and its " +
            "attachments without reading, printing, or saving it in any manner. This communication does not form any contractual obligation on behalf of the " +
            "sender, or the sender's employer, or the employer's parent company, affiliates or subsidiaries.</p>";

        public static void binderLow(GridItemEventArgs e, RadGrid grid, string tip) {
            if (e.Item is GridDataItem) {
                GridDataItem item = e.Item as GridDataItem;
                foreach (GridColumn column in grid.MasterTableView.RenderColumns) {
                    if (column is GridHyperLinkColumn) {
                        (item[column.UniqueName].Controls[0] as HyperLink).ToolTip = tip;
                    }
                }
            } 
        }

        public static void oops(HttpContext current)
        {
            current.ClearError();
            current.Response.Redirect("/Oooops.aspx", true);
        }

        public void oops() {
            oops(HttpContext.Current);
        }

        public void cancelBrokerEmployer(BizInfoDetails er)
        {
            if (!string.IsNullOrEmpty(er.EmployerId))
                BLL.Employer.removeEmployer(int.Parse(er.EmployerId));
            saveForLaterBrokerEmployer();
        }

        public void saveForLaterBrokerEmployer()
        {
            BLL.OnlineQuote.ForceNewCartId(); 
            Session["newEmployer"] = null;
            Response.Redirect("/Default.aspx");
        }

        public void SearchTabs(Control typeList) {
            if (!Page.IsPostBack) {
                bool validated = true;
                if (userInfo.UserRole == UserRoles.Administrator || userInfo.UserRole == UserRoles.RK || userInfo.UserRole == UserRoles.Agent ||
                    userInfo.UserRole == UserRoles.Broker || userInfo.UserRole == UserRoles.Enroller) {
                        if (userInfo.UserRole == UserRoles.Agent || userInfo.UserRole == UserRoles.Enroller)
                            validated = BLL.Employer.GetValidateEnrollerEmployer(EmployerId, userInfo.UserId) || BLL.Employer.GetValidateAgentEmployer(EmployerId, userInfo.UserId);
                    foreach (Control item in typeList.Controls)
                    {
                        if (item is HtmlGenericControl)
                        {
                            HtmlControl li = (HtmlControl)item;
                            foreach(Control cli in li.Controls)
                            {
                                if (cli is LinkButton && validated)
                                {
                                    LinkButton lb = (LinkButton)cli;
                                    lb.PostBackUrl = lb.PostBackUrl + "?erId=" + EmployerId;
                                }
                            }
                        }
                    }
                }
            }
        }

        public void tab_command(Control tabList, string num)
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

        public Model.UserRoles GetLimitedUserRole() {
            switch (CurrentUserInfo.UserRole)
            {
                case Model.UserRoles.Employee:
                    return  Model.UserRoles.Employee;
                case Model.UserRoles.Dependent:
                    return Model.UserRoles.Dependent;
                default:
                    return Model.UserRoles.Employer;
            }
        }

        public UserCacheInfo CurrentUserInfo
        {
            get
            {
                if (userInfo == null)
                    userInfo = (UserCacheInfo)Session["UserCacheInfo"];
                return userInfo;
            }
        }

        public string HostUrl
        {
            get { return string.Format("{0}://{1}", Page.Request.Url.Scheme, Page.Request.Url.Authority); }
        }

        public string UrlBuilder(string extraParams)
        {
            return UrlBuilder(HttpContext.Current.Request, extraParams);
        }

        public static string UrlBuilder(HttpRequest Request, string extraParams)
        {
            string erId = Request["erId"];
            string eeId = Request["eeId"];
            string mId = Request["mId"];
            string OetypeId = Request["OeTypeId"];
            string planid = Request["planId"];
            string uid = Request["uid"];
            string bid = Request["bid"];

            string url = (string.IsNullOrEmpty(uid) ? "" : "&uid=" + uid) + (string.IsNullOrEmpty(bid) ? "" : "&bid=" + bid) + (string.IsNullOrEmpty(erId) ? "" : "&erId=" + erId) + (string.IsNullOrEmpty(eeId) ? "" : "&eeId=" + eeId) + (string.IsNullOrEmpty(mId) ? "" : "&mId=" + mId) + (string.IsNullOrEmpty(OetypeId) ? "" : "&OeTypeId=" + OetypeId) + (string.IsNullOrEmpty(planid) ? "" : "&planId=" + planid) + (string.IsNullOrEmpty(extraParams) ? "" : extraParams);
            if (!string.IsNullOrEmpty(url))
            {
                url = '?' + url.Remove(0, 1);
            }
            return url;
        }

        public void SaveAndExit()
        {
            Session["OEId"] = null;
            Response.Redirect("/Employer/BusinessInfo.aspx" + (string.IsNullOrEmpty(Request["erId"]) ? "" : "?erId=" + Request["erId"]));
            //NOT REACHED
        }

        public void StartOver(string oeId, string updatedBy, string ip)
        {
            if (BLL.EnrollmentForm.startOver(oeId, updatedBy, ip))
                Response.Redirect("/OE/Type.aspx"+ UrlBuilder(null));
            else
                oops();
        }

        public string sessionVal(string sessionId)
        {
            object tmp = Session[sessionId];
            return  tmp == null ? "" : tmp.ToString();
        }

        public int sessionValInt(string sessionId)
        {
            string val = sessionVal(sessionId);
            return string.IsNullOrEmpty(val)? 0 : int.Parse(val);
        }

        protected override void OnLoad(EventArgs e)
        {
            if (!ApplicationConfiguration.IsTestServer)
                Page.ErrorPage = "/UhOh.aspx";
            if (!Page.IsPostBack)
            {
                if (Session["UserCacheInfo"] == null && Page.User.Identity.IsAuthenticated)
                {
                    Session["UserCacheInfo"] = BLL.User.RefreshUserCacheInfo(Page.User.Identity.Name);
                }
            }

            // Check session employerid
            if (Session["UserCacheInfo"] != null)
            {
                UserCacheInfo userInfo = (UserCacheInfo)Session["UserCacheInfo"];
                switch (userInfo.UserRole)
                {
                    case UserRoles.Administrator:
                        UserId = userInfo.UserId;
                        if(!string.IsNullOrEmpty(Request["uId"]))
                            UserId= Request["uId"];
                        if(!string.IsNullOrEmpty(Request["bId"]))
                            BrokerId= Request["bId"];
                        if(!string.IsNullOrEmpty(Request["erId"]))
                            EmployerId = Request["erId"];
                        if(!string.IsNullOrEmpty(Request["eeId"]))
                            EmployeeId= Request["eeId"];
                        if(!string.IsNullOrEmpty(Request["mid"]))
                            MemberId = Request["mid"];
                        break;
                    case UserRoles.Broker:
                        BrokerId = userInfo.BrokerId;
                        if(!string.IsNullOrEmpty(Request["erId"]))
                            EmployerId = Request["erId"];
                        if(!string.IsNullOrEmpty(Request["eeId"]))
                            EmployeeId= Request["eeId"];
                        if(!string.IsNullOrEmpty(Request["mid"]))
                            MemberId = Request["mid"];
                        break;
                    case UserRoles.Agent:
                    case UserRoles.RK:
                    case UserRoles.Enroller:
                        UserId = userInfo.UserRole == UserRoles.Agent ? userInfo.AgentId : userInfo.RKId;//TODO 3 cases yet ternary is being used to assign 1 id
                        if(!string.IsNullOrEmpty(Request["erId"]))
                            EmployerId = Request["erId"];
                        if(!string.IsNullOrEmpty(Request["eeId"]))
                            EmployeeId= Request["eeId"];
                        if(!string.IsNullOrEmpty(Request["mid"]))
                            MemberId = Request["mid"];
                        break;
                    case UserRoles.Employer:
                        EmployerId = userInfo.EmployerId;
                        BrokerId = userInfo.BrokerId;
                        if(!string.IsNullOrEmpty(Request["eeId"]))
                            EmployeeId= Request["eeId"];
                        if(!string.IsNullOrEmpty(Request["mid"]))
                            MemberId = Request["mid"];
                        break;
                    case UserRoles.Employee:
                        EmployeeId = userInfo.EmployeeId;
                        EmployerId = userInfo.EmployerId;
                        if (!string.IsNullOrEmpty(Request["mid"]))
                            MemberId = Request["mid"];
                        break;
                    case UserRoles.Dependent:
                        EmployeeId = userInfo.EmployeeId;
                        EmployerId = userInfo.EmployerId;
                        MemberId = userInfo.MemberId;
                        break;
                    default:
                        oops();
                        //NOT REACHED
                        break;
                }
                if (!string.IsNullOrEmpty(EmployerId) && !validateEmployer(userInfo, EmployerId, EmployeeId, MemberId))
                    oops();
            }
            else
            {
                oops();
            }
            base.OnLoad(e);
        }

        private bool validateEmployer(UserCacheInfo user, string employer, string employee, string member)
        {
            if (!string.IsNullOrEmpty(employee) && !string.IsNullOrEmpty(member) && !BLL.Employer.ValidateDependentId(employee, member))
                return false;// dependent does not belong to employee
            if (!string.IsNullOrEmpty(employee) && !BLL.Employer.ValidateMemberId(employer, employee))
                return false;// employee does not belong to employer
            if (user.UserRole == UserRoles.Enroller)
                return BLL.Employer.GetValidateEnrollerEmployer(employer, user.UserId);// employer belongs to enroller
            if (user.UserRole == UserRoles.Agent || user.UserRole == UserRoles.Administrator && user.AgencyId != "1") 
                return BLL.Employer.GetValidateAgentEmployer(employer, user.UserId);// employer belongs to agent or non PIBT admin
            if (user.UserRole == UserRoles.Broker)
                return BLL.Employer.ValidateBrokerUserId(user.BrokerId, employer); // employer belongs to broker
            if (user.UserRole == UserRoles.RK)
                return BLL.RK.validateEmployerRk(user.RKId, employer);
            if (user.UserRole == UserRoles.Administrator || user.UserRole == UserRoles.Employer || 
                user.UserRole == UserRoles.Employee || user.UserRole == UserRoles.Dependent)
                return true;//if in this role and you passed all the above then you are in the right place. 
            return false;//if you do not belong to any role above some how then you cannot move forward
        }
    }
}