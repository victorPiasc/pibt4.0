using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Pibt.Model;
using Telerik.Web.UI;

namespace Pibt
{
    public partial class apply : SortaBasePage
    {
        public int cartId  { get { return BLL.OnlineQuote.QQCartId; } }

        public int checkCode 
        { 
            get
            {
                if ( ViewState["checkCode"] == null) 
                    ViewState["checkCode"] = BLL.OnlineQuote.checkPotentialUsers(code);
                return (int)ViewState["checkCode"];
            }
        }

        public BizInfoDetails potentialUser
        {
            get
            {
                object tmp = Session["user"];
                if (tmp == null)
                    Session["user"] = new BizInfoDetails();
                return (BizInfoDetails)Session["user"];
            }
            set { Session["user"] = value; }
        }

        public int pageNum 
        {
            get
            {
                object tmp = Session["page"];
                if (tmp == null)
                    Session["page"] = 1;
                return (int)Session["page"];
            }
            set { Session["page"] = value; }
        }

        public string code
        {
            get
            {
                string tmp = Request["vId"];
                return string.IsNullOrEmpty(tmp) ? "" : tmp;
            }
        }

        public int planCount { get { return BLL.Plan.getEmployerPlanTypes(potentialUser.EmployerId).Rows.Count;} }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(code) || checkCode == 0) //check to see if code exist
                oops();
            if (!IsPostBack)
            {
                int cart = checkCode;
                BLL.OnlineQuote.SetCookie(cart);
                Session["QQ_cartId"] = cart;
                potentialUser = BLL.Employer.getPotentialUser(code, cartId);
                findPage();
            }
            setVariables();
            literal1.Text = "";

        }

        protected void back_Click(object sender, EventArgs e)
        {
            if (pageNum > 0)
            {
                pageNum--;
                back.Visible = pageNum != 1;
                findPage();
            }
        }

        protected void next_Click(object sender, EventArgs e)
        {
            if (!validatePage())
                return;
            if(pageNum<=7)
                pageNum++;
            findPage();
        }

        public void setVariables()
        {
            switch (pageNum)
            {
                case 2:
                    page2.pUser = potentialUser;
                    break;
                case 3:
                    page3.employerId = potentialUser.EmployerId;
                    break;
                case 4:
                    page4.pUser = potentialUser;
                    break;
                case 5:
                    page5.cartId = cartId;
                    page5.display = false;
                    break;
                case 7:
                    page7.pUser = potentialUser;
                    break;
                case 8:
                    page8.pUser = potentialUser;
                    break;
            }
        }

        public void findPage()
        {
            if(!string.IsNullOrEmpty(BLL.User.GetWebUserLoginname(potentialUser.EmployerId, UserRoles.Employer)))
                Response.Redirect("/Login.aspx");

            if (planCount > 0)
                pageNum = 8;

            foreach (Control c in pageControls.Controls)
                c.Visible = c.ID == "page" + pageNum;

            back.Visible = !page1.Visible;
            if(pageNum==7)
                next.Attributes.Add("onclick", "if(! userConfirmation('You are submitting your account information. Next you will register a login name. By continuing you will not be ablet to return to change your account until after everything has been approved. Look over your account information and make sure everything is correct. Do you want to proceed?')) return false;");
            else
                next.Attributes.Remove("onclick");

            switch (pageNum)
            {
                case 2:
                    next.Text = "Continue";
                    page2.pageSetup(potentialUser);
                    break;
                case 3:
                    next.Text = "Continue";
                    page3.pageSetup(potentialUser.EmployerId);
                    break;
                case 4:
                    next.Text = "Continue";
                    page4.pageSetup(potentialUser);
                    RadGrid ee = page4.FindControl("eeGrid") as RadGrid;
                    ScriptManager script = ScriptManager.GetCurrent(this.Page);
                    script.RegisterPostBackControl(ee);
                    break;
                case 5 :
                    next.Text = "Continue";
                    BLL.OnlineQuote.newEmployerQuote(cartId, potentialUser.EmployerId);
                    page5.pageSetup(potentialUser.PhsicalPostCode);
                    break;
                case 6:
                    next.Text = "Continue";
                    page6.pageSetup();
                    break;
                case 7:
                    next.Text = "Finalize";
                    page7.pageSetup(potentialUser);
                    break;
                case 8:
                    next.Text = "Register";
                    page8.pageSetup(potentialUser);
                    break;
            }
        }

        public bool validatePage()
        {
            switch (pageNum)
            {
                case 2:
                    if (page2.validatePage(null))
                    {
                        potentialUser = page2.pUser;
                        return true;
                    }
                    return false;
                case 4:
                    return page4.validatePage();
                case 5:
                    return page5.validatePage();
                case 7:
                    return page7.validatePage();
                case 8:
                    page8.validatePage();
                    return false; //If successful it will redirect to a new page else return validate is false
                default:
                    return true; //page 1, 3, and 6 do not need validations 
            }
        }

        protected void btnUpload_Click1(object sender, EventArgs e)
        {
            string uploadMessage = uploadGeneric(fuCensus, "/UploadFiles/", cartId, 0, potentialUser, false);
            if (!string.IsNullOrEmpty(uploadMessage))
                literal1.Text = Common.Utilities.FormatError(uploadMessage);
            page4.rebind(potentialUser);
        }
    }
}