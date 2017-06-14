using Pibt.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Pibt.BLL
{
   public class Lifeline
   {
      public static DataTable GetById(int Id)
      {
         return LifelineDataAccess.GetById(Id);
      }
   }
}
