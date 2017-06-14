using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Pibt
{
   public partial class RiskReportDetails : System.Web.UI.Page
   {
      protected void Page_Load(object sender, EventArgs e)
      {
         if (!IsPostBack)
         {
            GetRiskReports();
         }
      }

      protected void BtBack_Click(object sender, EventArgs e)
      {
         Response.Redirect("~/RiskReport.aspx");
      }

      protected void GetRiskReports()
      {

         string cs = ConfigurationManager.ConnectionStrings["MaximumASPSqlServer"].ConnectionString;
         SqlConnection con = new SqlConnection(cs);
         SqlDataAdapter da = new SqlDataAdapter("RiskReports_Get", con);

         DataSet ds = new DataSet();
         da.Fill(ds);

         rptRiskReports.DataSource = ds;
         rptRiskReports.DataBind();
      }

      protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
      {

      }

      protected void rptRiskReports_ItemCommand(object source, RepeaterCommandEventArgs e)
      {

      }
   }
}