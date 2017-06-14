using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pibt.DAL;
using Pibt.Model;
using System.Data;

namespace Pibt.BLL
{
    public class LegalDoc
    {
        public static Model.LegalDoc GetDetails(string id)
        {
            return LegalDocDataAccess.GetDetails(id);
        }
        public static string GetLegalDocDetails(int carrierid, bool onlyHTML)
        {
            return LegalDocDataAccess.GetLegalDocDetails(carrierid, (onlyHTML == true ? 1 : 0));
        }
        public static bool Delete(string id)
        {
            return LegalDocDataAccess.Delete(id);
        }

        public static bool Insert(string description, string legalContentHtml, string legalContent, int carrierId, string updatedBy)
        {
            Model.LegalDoc _legalDoc = new Model.LegalDoc()
            {
                Description = description,
                LegalContentHtml = legalContentHtml,
                LegalContent = legalContent,
                CarrierId = carrierId,
                CreatedBy = updatedBy
            };
            return LegalDocDataAccess.Insert(_legalDoc);
        }

        public static bool Update(string id, string description, string legalContentHtml, string legalContent, int carrierId, string updatedBy)
        {
            Model.LegalDoc _legalDoc = new Model.LegalDoc()
            {
                Id = id,
                Description = description,
                LegalContentHtml = legalContentHtml,
                LegalContent = legalContent,
                CarrierId = carrierId,
                ModifiedBy = updatedBy
            };
            return LegalDocDataAccess.Update(_legalDoc);
        }

        public static DataTable GetList()
        {
            return LegalDocDataAccess.GetList();
        }
    }
}
