using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    public class Event
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public DateTime EventDate { get; set; }
        public string EventTime { get; set; }
        public decimal Cost { get; set; }
        public string Location { get; set; }
        public string Content { get; set; }
        public string KeyWords { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
