using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Pibt
{
   public partial class Lifelines: SortaBasePage {
      protected void Page_Load(object sender, EventArgs e)
      {
         if (!IsPostBack)
         {
            GetLifelines();
         }
      }

      protected void GetLifelines()
      {
         string cs = ConfigurationManager.ConnectionStrings["MaximumASPSqlServer"].ConnectionString;
         SqlConnection con = new SqlConnection(cs);
         SqlDataAdapter da = new SqlDataAdapter("Lifelines_Get", con);

         DataSet ds = new DataSet();
         da.Fill(ds);

         FormView2.DataSource = ds;

         rptLifelines.DataSource = ds;
         rptLifelines.DataBind();
      }
   }
}