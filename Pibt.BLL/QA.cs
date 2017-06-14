using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pibt.DAL;
using Pibt.Model;
using System.Data;

namespace Pibt.BLL
{
    public class QA
    {
        public static Model.QA GetDetails(string qaId)
        {
            return QADataAccess.GetDetails(qaId);
        }
        public static bool Delete(string qaId)
        {
            return QADataAccess.Delete(qaId);
        }
        public static bool Update(string qaId, string question, string answer, bool isTop, string keyWords, string updatedBy)
        {
            Model.QA qa = new Model.QA()
            {
                QAId = qaId,
                Question = question,
                Answer = answer,
                IsTop = isTop,
                KeyWords = keyWords,
                ModifiedBy = updatedBy
            };
            return QADataAccess.Update(qa);
        }

        public static bool Insert(string question, string answer, bool isTop, string keyWords, string updatedBy)
        {
            Model.QA qa = new Model.QA()
            {
                Question = question,
                Answer = answer,
                IsTop = isTop,
                KeyWords = keyWords,
                ModifiedBy = updatedBy
            };
            return QADataAccess.Update(qa);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static DataTable GetList()
        {
            return QADataAccess.GetList(false, null);
        }

        public static DataTable GetTopList(int top)
        {
            return QADataAccess.GetList(true, top);
        }

        public static DataTable Searching(string keyWord)
        {
            return QADataAccess.Searching(keyWord);
        }
    }
}
