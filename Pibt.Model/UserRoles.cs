using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pibt.Model
{
    public enum UserRoles
    {

        /// <summary>
        /// Limited
        /// </summary>
        Limited = 0,

        /// <summary>
        /// Administrator
        /// </summary>
        Administrator = 1,

        /// <summary>
        /// Agent
        /// </summary>
        Agent = 2,

        /// <summary>
        /// Relationship Keeper
        /// </summary>
        RK = 3,

        /// <summary>
        /// Employer
        /// </summary>
        Employer = 4,

        /// <summary>
        /// Employee
        /// </summary>
        Employee = 5,

        /// <summary>
        /// Dependent
        /// </summary>
        Dependent = 6,

        Broker = 7,

        Enroller=8
    }
}