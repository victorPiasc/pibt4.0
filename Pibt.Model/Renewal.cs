using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    public class Renewal
    {
        public string renewalId { get; set; }
        public int cartId { get; set; }
        public int state { get; set; }
        public string isComplete { get; set; }
        public int contributionId { get; set; }
        public string isPercent { get; set; }
        public string isOverAll { get; set; }
        public string name { get; set; }
        public string title { get; set; }
        public DateTime effectiveDate { get; set; }
    }
}
