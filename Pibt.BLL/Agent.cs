using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Pibt.Model;
using Pibt.DAL;
using System.Data;
using System.Web.Security;
using Pibt.Common;

namespace Pibt.BLL
{
    public class Agent
    {
        /// <summary>
        /// Get Agent Details
        /// </summary>
        /// <param name="userId"></param>
        /// <returns></returns>
        public static DataTable GetAgentFavorites(string WebUserId)
        {
           return AgentDataAccess.GetAgentFavorites(WebUserId);
        }

        public static bool AddToFavorites(string WebUserId, string EmployerId, string UpdatedBy)
        {
           return AgentDataAccess.AddToFavorites(WebUserId, EmployerId, UpdatedBy);
        }

        public static DataTable GetAgentIdByAgentName(string Name)
        {
            using (DataTable dt = AgentDataAccess.GetAgentIdByAgentName(Name))
            {
                return dt;
            }
        }

        public static DataTable GetAgentList()
        {
            using (DataTable dt = AgentDataAccess.GetAgentList())
            {
                return dt;
            }
        }

        public static DataTable GetEnrollerIdbyWebName(string webName)
        {
            using (DataTable dt = AgentDataAccess.GetEnrollerIdbyWebName(webName))
            {
                return dt;
            }
        }

        public static DataTable GetEmployeesByEnrollerId(string enrollerId)
        {
            using (DataTable dt = AgentDataAccess.GetEmployeesByEnrollerId(enrollerId))
            {
                return dt;
            }
        }

        public static AgentDetails GetEnrollerDetails(string userId, bool isAgent)
        {
            return AgentDataAccess.GetEnrollerDetails(userId, isAgent);
        }

        public static DataTable GetEnrollersByErId(int employerId)
        {
            using (DataTable dt = AgentDataAccess.GetEnrollersByErId(employerId))
            {
                return dt;
            }
        }

        /// <summary>
        /// Update Agent
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="userName"></param>
        /// <param name="emailAddress"></param>
        /// <param name="updatedBy"></param>
        /// <returns></returns>
        public static bool UpdateAgent(string userId, string userName, string emailAddress, string updatedBy)
        {
            return AgentDataAccess.UpdateAgent(userId, userName, emailAddress, updatedBy);
        }

        public static DataTable SearchAgents(string clue, bool agent) {
            using (DataTable dt = AgentDataAccess.SearchAgents(clue, agent))
            {
                return dt;
            }
        }

        public static bool SynAgentToWebUsersTable(string updatedBy)
        {
            return AgentDataAccess.SynAgentToWebUsersTable(updatedBy);
        }
    }
}
