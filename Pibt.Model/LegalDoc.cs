using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    public class LegalDoc
    {
        public string Id { get; set; }
        public string Description { get; set; }
        public string LegalContentHtml { get; set; }
        public string LegalContent { get; set; }
        public Int32 CarrierId{ get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
