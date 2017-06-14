using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    public class RKDetails : WebUser
    {
        public string RKId { get; set; }
        public string RKName { get; set; }
        public string Extension { get; set; }
        public string Cobrarep { get; set; }
        public string LeaderId { get; set; }
        public string LeaderName { get; set; }
        new public UserRoles UserRole { get { return UserRoles.RK; } }
    }
}
