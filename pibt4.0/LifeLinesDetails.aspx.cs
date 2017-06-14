using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace Pibt
{
   public partial class LifelinesDetails: SortaBasePage {
      protected void Page_Load(object sender, EventArgs e)
      {
         if (!IsPostBack)
         {
            GetLifelines();
         }
      }

      protected void BtBack_Click(object sender, EventArgs e)
      {
         Response.Redirect("~/lifelines.aspx");
      }

      protected void GetLifelines()
      {
         string cs = ConfigurationManager.ConnectionStrings["MaximumASPSqlServer"].ConnectionString;
         SqlConnection con = new SqlConnection(cs);
         SqlDataAdapter da = new SqlDataAdapter("Lifelines_Get", con);

         DataSet ds = new DataSet();
         da.Fill(ds);

         rptLifelines.DataSource = ds;
         rptLifelines.DataBind();
      }
   }
}