using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pibt.DAL;
using Pibt.Model;
using System.Data;

namespace Pibt.BLL
{
   public class Password
   {
      public static Model.Password GetDetails(string loginName)
      {
         return PasswordAccess.GetDetails(loginName);
      }
   }
}
