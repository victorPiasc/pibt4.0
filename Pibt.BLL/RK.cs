using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pibt.DAL;
using Pibt.Model;
using System.Data;

namespace Pibt.BLL
{
    public class RK
    {
        /// <summary>
        /// Get RK Details
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static RKDetails GetRKDetails(string userId)
        {
            return RKDataAccess.GetRKDetails(userId, null);
        }

        public static RKDetails GetRKDetailsById(string rkId)
        {
            return RKDataAccess.GetRKDetails(null, rkId);
        }

       public static DataTable SearchRKs(string clue) {
            using (DataTable dt = RKDataAccess.SearchRKs(clue)) {
                return dt;
            }
        }

        public static bool SynRKToWebUsersTable(string updatedBy)
        {
            return RKDataAccess.SynRKToWebUsersTable(updatedBy);
        }

        public static Model.News GetDetails(string newsId)
        {
           return NewsDataAccess.GetDetails(newsId);
        }

        public static bool Delete(string memoId)
        {
           return NewsDataAccess.Delete(memoId);
        }

        public static bool Update(string memoId, string memoTitle, DateTime memoDate, string memoContent, string keyWords, string updatedBy)
        {
           Model.News news = new Model.News()
           {
              Id = memoId,
              Content = memoContent,
              ModifiedBy = updatedBy,
              PublishedDate = memoDate,
              KeyWords = keyWords,
              Title = memoTitle
           };
           return NewsDataAccess.Update(news);
        }

        public static bool Insert(string memoTitle, DateTime memoDate, string memoContent, string keyWords, string updatedBy)
        {
           Model.News memo = new Model.News()
           {
              Content = memoContent,
              ModifiedBy = updatedBy,
              PublishedDate = memoDate,
              KeyWords = keyWords,
              Title = memoTitle
           };
           return NewsDataAccess.Update(memo);
        }

        public static bool validateEmployerRk(string userId, string employerId)
        {
            return RKDataAccess.validateEmployerRk(userId, employerId);
        }
    }
}
