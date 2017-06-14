using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Pibt.DAL
{
   public class RiskReportDataAccess
   {
       //TODO  is this being used?
      public static DataTable GetById(int Id)
      {
         SqlParameter[] _params = new SqlParameter[]
            {
                new SqlParameter("@Id", SqlDbType.Int)
            };
         _params[0].Value = Id;
         using (DataTable dt = SQLHelper.ExecuteDataTable(SQLHelper.ConnectionString,
                                                         CommandType.StoredProcedure,
                                                         "RiskReports_GetById",
                                                         _params))
         {
            return dt;
         }
      }
   }
}
