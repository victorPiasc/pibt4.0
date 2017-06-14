using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pibt.Employer
{
    public partial class DocumentsLibrary : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(EmployerId))
            {
                DateTime date = BLL.OnlineQuote.oeEnddate(EmployerId);
                foreach (Control c in links.Controls)
                {
                    if (c is HyperLink)
                    {
                        HyperLink l = (HyperLink)c;
                        l.NavigateUrl += (l.NavigateUrl.Contains('?')? "&" :"?")+"erId=" + EmployerId + "&date="+date.ToShortDateString();
                    }
                }
            }
            else
                oops();
        }
    }
}