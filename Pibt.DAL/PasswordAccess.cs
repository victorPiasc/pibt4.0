using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using Oracle.DataAccess.Client;
using Pibt.Model;
using Pibt.Common;
using System.Data.Common;
using System.Data.SqlClient;

namespace Pibt.DAL
{
   public class PasswordAccess
   {
      public static Password GetDetails(string loginName)
      {
         SqlParameter[] _params = new SqlParameter[]
        {
            new SqlParameter("@loginName", SqlDbType.NVarChar)
        };
         _params[0].Value = loginName;
         Password _pw = null;
         using (DataTable dt = SQLHelper.ExecuteDataTable(CommandType.StoredProcedure,"Web_PWrecovery",_params))
         {
            if (dt.Rows.Count > 0)
            {
               DataRow dr = dt.Rows[0];
               _pw = new Password()
               {
                  password = Utilities.ToString(dr["password"]),
                  emailAddress = Utilities.ToString(dr["emailAddress"]),
               };
            }
         }
         return _pw;
      }
   }
}
