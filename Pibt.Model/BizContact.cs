using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    /// <summary>
    /// Wraps employoer Contact info details 
    /// </summary>
    public class BizContact
    {
        public string Id { get; set; }
        public string EmployerId { get; set; }
        public string Title { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public string BizPhone1 { get; set; }
        public string BizExt1 { get; set; }
        public string BizPhone2 { get; set; }
        public string BizExt2 { get; set; }
        public string Mobile { get; set; }
        public string Email2 { get; set; }
        public string Assistant { get; set; }
        public string Notes { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedTime { get; set; }
    }
}
