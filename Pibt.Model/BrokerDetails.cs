namespace Pibt.Model {
    public class BrokerDetails: WebUser {
        public string BrokerId { get; set; }
        public string BrokerName { get; set; }
        new public UserRoles UserRole { get { return UserRoles.Broker; } }
    }
}
