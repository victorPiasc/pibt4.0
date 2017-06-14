using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    public class AgentDetails : WebUser
    {
        public string AgentId { get; set; }
        new public UserRoles UserRole { get { return UserRoles.Agent; } }
    }
}
