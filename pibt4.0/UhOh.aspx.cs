using System;
using System.Web;

namespace Pibt {
    public partial class UhOh: System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack)
                HttpContext.Current.ClearError();
        }
    }
}