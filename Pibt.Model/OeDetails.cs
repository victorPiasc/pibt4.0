using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Pibt.Model
{
    public class OeDetails
    {
        public string Id { get; set; }
        public string EmployerId { get; set; }
        public string MemberId { get; set; }
        public string TypeId { get; set; }
        public string TypeName { get; set; }
        public bool AcceptedCafeteria { get; set; }
        public bool ReadLegalDoc { get; set; }
        public bool HasSignatrue { get; set; }
        public string Created { get; set; }
        public string CreatedBy { get; set; }
        public string Updated { get; set; }
        public string UpdatedBy { get; set; }
        public string Ip { get; set; }
        public OEStatus Status { get; set; }
        public string TreasonId { get; set; }
        public string SignatureName { get; set; }
    }
}
