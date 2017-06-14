using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    public class WebAdmin : WebUser
    {
        new public UserRoles UserRole { get { return UserRoles.Administrator; } }
    }
}
