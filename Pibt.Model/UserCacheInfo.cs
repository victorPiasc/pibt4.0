
namespace Pibt.Model
{
    public class UserCacheInfo
    {
        /// <summary>
        /// Business Object Unique Id
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// Login System Account
        /// </summary>
        public string LoginName { get; set; }

        /// <summary>
        /// Default 0 or NULL;
        /// Administrator|Agent|RK|Broker: [UserId] column of the [Web_Users] table;
        /// Employer|Employee|Dependent: 0;
        /// </summary>
        public string UserId { get; set; }

        /// <summary>
        /// Default 0 or NULL;
        /// Administrator|Agent|RK|Broker: 0;
        /// Employer: [EMPLOYERID] column of the [EMPLOYER] table;
        /// Employee|Dependent: [EMPLOYERID] column of the [MEMBER] table;
        /// </summary>
        public string EmployerId { get; set; }

        /// <summary>
        /// Default 0 or NULL;
        /// Administrator|Employee|Dependent|RK|Broker: 0;
        /// Agent: [ENROLLERID] column of the [ENROLLERINFO] table;
        /// </summary>
        public string AgentId { get; set; }

        /// <summary>
        /// Default 0 or NULL;
        /// Administrator|Employee|Dependent|Agent|Broker: 0;
        /// RK: [CSRID] column of the [CSRINFO] table;
        /// </summary>
        public string RKId { get; set; }

        public string BrokerId { get; set; }

        /// <summary>
        /// Default 0 or NULL;
        /// Administrator|Agent|RK|Employer|Broker: 0;
        /// Employee|Dependent: [EMPLOYEEID] column of the [MEMBER] table;
        /// </summary>
        public string EmployeeId { get; set; }

        /// <summary>
        /// Default 0 or NULL;
        /// Administrator|Agent|RK|Employer|Broker: 0;
        /// Employee|Dependent: [MEMBERID] column of the [MEMBER] table;
        /// </summary>
        public string MemberId { get; set; }

        /// <summary>
        ///  Employer's Agency Id
        /// </summary>
        public string AgencyId { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public UserRoles UserRole { get; set; }

        public UserCacheInfo()
        {

        }

        public UserCacheInfo(string loginName)
        {
            LoginName = loginName;
        }
    }
}