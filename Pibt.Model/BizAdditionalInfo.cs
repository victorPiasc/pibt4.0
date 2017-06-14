using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    /// <summary>
    /// Wraps employoer biz info details2 
    /// </summary>
    public class BizAdditionalInfo : BizInfoDetails
    {
        public string EnrollerId { get; set; }
        public string Enroller { get; set; }
        public string WaitingPeriodId { get; set; }
        public string WaitingPeriod { get; set; }
        public string TeamLeadId { get; set; }
        public string TeamLead { get; set; }
        public string RKId { get; set; }
        public string RK { get; set; }
        public string TermId { get; set; }
        public string Term { get; set; }
        public string EeContribution { get; set; }
        public string Depcontribution { get; set; }
        public string EeDollar { get; set; }
        public string DepDollar { get; set; }
        public string Taxid { get; set; }
        public string Sic { get; set; }
        public string NatureOfBiz { get; set; }
        public string ofBase { get; set; }
    }
}
