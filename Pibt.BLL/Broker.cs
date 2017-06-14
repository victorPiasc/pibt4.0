using Pibt.DAL;
using Pibt.Model;
using System;
using System.Data;

namespace Pibt.BLL 
{
    public class Broker 
    {
        public static bool SynBrokerToWebUsersTable(string updatedBy) 
        {
            return BrokerDataAccess.SynBrokerToWebUsersTable(updatedBy);
        }

        public static DataTable SearchBrokers(string clue) 
        {
            using (DataTable dt = BrokerDataAccess.SearchBrokers(clue)) 
            {
                return dt;
            }
        }

        public static BrokerDetails GetBrokerDetails(string brokerId) 
        {
            return BrokerDataAccess.GetBrokerDetails(brokerId);
        }

        public static bool updateBroker(string brokerId, string name, string email)
        {
            return BrokerDataAccess.updateBroker(brokerId, name, email);
        }

        public static DataTable getEmployerList(string brokerId, string clue, string dropDown)
        {
            using (DataTable dt = BrokerDataAccess.getEmployerList(brokerId, clue, dropDown))
            {
                return dt;
            }
        }

        public static bool assignBrokerEmployer(string brokerId, string employerId, DateTime? effective, DateTime? expiry)
        {
            return BrokerDataAccess.assignBrokerEmployer(brokerId, employerId, effective, expiry);
        }

        public static string insertEmployer(string brokerId, BizInfoDetails user, BizAdditionalInfo addl, int partEE)
        {
            return BrokerDataAccess.insertEmployer(brokerId, user, addl, partEE);
        }

        public static bool deleteBrokerEmployer(string brokerId, string employerId)
        {
            return BrokerDataAccess.deleteBrokerEmployer(brokerId, employerId);
        }

        public static int checkExistingBrokerEmployer(string brokerId, string employerId, DateTime? effective, DateTime? expiry)
        {
            return BrokerDataAccess.checkExistingBrokerEmployer(brokerId, employerId, effective, expiry);
        }

        public static DataTable futureRenewals(string brokerId, int type, string clue, DateTime? start, DateTime? end)
        {
            using (DataTable dt = BrokerDataAccess.futureRenewals(brokerId, type, clue, start, end))
            {
                return dt;
            }
        }

        public static DataTable invoiceSnapShot(string brokerId, string clue)
        {
            using (DataTable dt = BrokerDataAccess.invoiceSnapShot(brokerId, clue))
            {
                return dt;
            }
        }

        public static DataTable invoiceHist(string brokerId, string clue)
        {
            using (DataTable dt = BrokerDataAccess.invoiceHist(brokerId, clue))
            {
                return dt;
            }
        }

        public static DataTable commHist(string brokerId, string clue)
        {
            using (DataTable dt = BrokerDataAccess.commHist(brokerId, clue))
            {
                return dt;
            }
        }

        public static DataTable brokerAgents(string brokerId, int role)
        {
            using (DataTable dt = BrokerDataAccess.brokerAgents(brokerId, role))
            {
                return dt;
            }
        }

        public static bool deleteBrokerAgent(string pk)
        {
            return BrokerDataAccess.deleteBrokerAgent(pk);
        }

        public static bool updateBrokerAgent(string pk, string brokerId, string lastname, string firstname, string mi, string license, DateTime? issued, string office, string cell, string email, string manager, string updatedBy)
        {
            return BrokerDataAccess.updateBrokerAgent(pk, brokerId, lastname, firstname, mi, license, issued, office, cell, email, manager, updatedBy);
        }

        public static DataTable savedQuotes(string brokerId)
        {
            using (DataTable dt = BrokerDataAccess.savedQuotes(brokerId))
            {
                return dt;
            }
        }
    }
}
