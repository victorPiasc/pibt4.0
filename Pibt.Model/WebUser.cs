using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Pibt.Model
{
    public abstract class WebUser
    {
        public string UserId { get; set; }
        public UserRoles UserRole { get; set; }
        public string UserName { get; set; }
        public string LoginName { get; set; }
        public bool IsLockout { get; set; }
        public string Updated { get; set; }
        public string UpdatedBy { get; set; }
        public string EmailAddress { get; set; }
        public string LastLoginTime { get; set; }
        public string LastLoginIP { get; set; }
    }
}
