using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Pibt.DAL
{
   public class LifelineDataAccess
   {
      public static DataTable GetById(int Id)
      {
         SqlParameter[] _params = new SqlParameter[]
        {
            new SqlParameter("@Id", SqlDbType.Int)
        };
         _params[0].Value = Id;
         using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"Lifelines_GetById",_params))
         {
            return dt;
         }
      }
   }
}
