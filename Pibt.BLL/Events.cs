using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pibt.DAL;
using Pibt.Model;
using System.Data;

namespace Pibt.BLL
{
    public class Events
    {
        public static Model.Event GetDetails(string id)
        {
            return EventDataAccess.GetDetails(id);
        }
        public static bool Delete(string eventId)
        {
            return EventDataAccess.Delete(eventId);
        }

        public static bool Insert(string eventName, decimal cost, DateTime eventDate, string location, string keyWords, string eventContent, string updatedBy)
        {
            Model.Event ev = new Model.Event()
            {
                Name = eventName,
                Cost = cost,
                EventDate = eventDate,
                Location = location,
                Content = eventContent,
                KeyWords = keyWords,
                ModifiedBy = updatedBy
            };
            return EventDataAccess.Update(ev);
        }

        public static bool Update(string eventId, string eventName, decimal cost, DateTime eventDate, string location, string keyWords, string eventContent, string updatedBy)
        {
            Model.Event ev = new Model.Event()
            {
                Id = eventId,
                Name = eventName,
                Cost = cost,
                EventDate = eventDate,
                Location = location,
                KeyWords = keyWords,
                Content = eventContent,
                ModifiedBy = updatedBy
            };
            return EventDataAccess.Update(ev);
        }

        public static DataTable GetList()
        {
            return EventDataAccess.GetList(null);
        }

        public static DataTable GetList(int? top)
        {
            return EventDataAccess.GetList(top);
        }

        public static DataTable Searching(string keyWord)
        {
            return EventDataAccess.Searching(keyWord);
        }
    }
}
