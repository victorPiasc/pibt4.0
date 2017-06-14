using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    public class WebSiteLog
    {
        public long LogId { get; set; }
        public string UserName { get; set; }
        public DateTime EventTime { get; set; }
        public EventCode EventCode { get; set; }
        public LogType LogType { get; set; }
        public string FromIP { get; set; }
        public string EventDetails { get; set; }
    }

}
