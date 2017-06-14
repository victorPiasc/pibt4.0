using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    /// <summary>
    /// Wraps employoer biz info details 
    /// </summary>
    public class BizInfoDetails : WebUser
    {
        public string EmployerId { get; set; }
        public string CompanyName { get; set; }
        public string MailingStreetAddress1 { get; set; }
        public string MailingStreetAddress2 { get; set; }
        public string MailingCity { get; set; }
        public string MailingState { get; set; }
        public string MailingPostCode { get; set; }
        public string MailingContact { get; set; }
        public string MailingEmail { get; set; }
        public string PhsicalStreetAddress1 { get; set; }
        public string PhsicalStreetAddress2 { get; set; }
        public string PhsicalCity { get; set; }
        public string PhsicalState { get; set; }
        public string PhsicalPostCode { get; set; }
        public string PhsicalContact { get; set; }
        public string PhsicalEmail { get; set; }
        public string Phonenbr { get; set; }
        public string Faxnbr { get; set; }
        public string AgencyId { get; set; }
        public string AgencyName { get; set; }
        public string StartDate { get; set; }
        public string EndDate { get; set; }
    }
}
