using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pibt.DAL;
using Pibt.Model;
using System.Data;

namespace Pibt.BLL
{
    public class Documents
    {
        //public static string CreateRegion()
        //{
        //    return DocumentDataAccess.CreateRegion();
        //}

        public static Model.Document GetDetails(string id)
        {
            return DocumentDataAccess.GetDetails(id);
        }
        public static bool Delete(string documentId)
        {
            return DocumentDataAccess.Delete(documentId);
        }

        public static bool Insert(string documentName, int documentTypeId, string documentURL, string keyWords, int sort, string updatedBy)
        {
            Model.Document doc = new Model.Document()
            {
                Name = documentName,
                DocumentTypeId = documentTypeId,
                DocumentURL = documentURL,
                SortId = sort,
                KeyWords = keyWords,
                ModifiedBy = updatedBy
            };
            return DocumentDataAccess.Update(doc);
        }

        public static bool Update(string documentId, string documentName, int documentTypeId, string documentURL, string keyWords, int sort, string updatedBy)
        {
            Model.Document doc = new Model.Document()
            {
                DocumentId = documentId,
                Name = documentName,
                DocumentTypeId = documentTypeId,
                DocumentURL = documentURL,
                SortId = sort,
                KeyWords = keyWords,
                ModifiedBy = updatedBy
            };
            return DocumentDataAccess.Update(doc);
        }

        public static DataTable GetList()
        {
            return DocumentDataAccess.GetList();
        }

        public static DataTable GetTypeList()
        {
            return DocumentDataAccess.GetTypeList(false);
        }

        public static DataTable GetAvailableTypeList()
        {
            return DocumentDataAccess.GetTypeList(true);
        }

        public static DataTable GetListByType(int typeId)
        {
            return DocumentDataAccess.GetListByType(typeId);
        }

        public static DataTable Searching(string keyWord)
        {
            return DocumentDataAccess.Searching(keyWord);
        }

        public static DataTable GetDocType()
        {
            return DocumentDataAccess.GetDocType();
        }
    }
}
