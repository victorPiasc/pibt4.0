using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    public class QA
    {
        public string QAId { get; set; }
        public string Question { get; set; }
        public string Answer { get; set; }
        public bool IsTop { get; set; }
        public string KeyWords { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
