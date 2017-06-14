using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pibt.DAL;
using Pibt.Model;
using System.Data;
using System.Text.RegularExpressions;

namespace Pibt.BLL
{
    public class News
    {

        public static DataTable GetListBySortSeq(string sortSeq)
        {
           return NewsDataAccess.GetListBySortSeq(sortSeq);
        }

        public static Model.News GetDetails(string newsId)
        {
            return NewsDataAccess.GetDetails(newsId);
        }
        public static bool Delete(string newsId)
        {
            return NewsDataAccess.Delete(newsId);
        }
        public static bool Update(string newsId, string newsTitle, DateTime newsDate, DateTime startDate, DateTime endDate, string newsContent, string keyWords, string updatedBy, string priorityLevel)
        {
            Model.News news = new Model.News()
            {
                Id = newsId,
                Content = newsContent,
                ModifiedBy = updatedBy,
                PublishedDate = newsDate,
                StartDate = startDate,
                EndDate = endDate,                
                KeyWords = keyWords,
                Title = newsTitle,
                SortSeq = priorityLevel
            };
            return NewsDataAccess.Update(news);
        }

        public static bool Insert(string newsTitle, DateTime newsDate, DateTime startDate, DateTime endDate, string newsContent, string keyWords, string updatedBy, string priorityLevel)
        {
            Model.News news = new Model.News()
            {
                Content = newsContent,
                ModifiedBy = updatedBy,
                PublishedDate = newsDate,
                StartDate = startDate,
                EndDate = endDate,
                KeyWords = keyWords,
                Title = newsTitle,
                SortSeq = priorityLevel
            };
            return NewsDataAccess.Update(news);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static DataTable GetList()
        {
            return NewsDataAccess.GetList(null);
        }

        public static DataTable GetList(int? top)
        {
            return NewsDataAccess.GetList(top);
        }

        public static DataTable Searching(string keyWord)
        {
            return NewsDataAccess.Searching(keyWord);
        }
    }
}
