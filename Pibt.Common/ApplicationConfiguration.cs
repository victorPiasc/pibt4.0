using System;
using System.Configuration;


/// <summary>
/// Repository for www.add-zone.com configuration settings
/// </summary>

namespace Pibt.Common
{
    public static class ApplicationConfiguration
    {
        // Caches the connection string
        private readonly static string dbConnectionString;
        // Caches the data provider name 
        private readonly static string dbProviderName;
        // Store the name of your shop
        private readonly static string siteName;

        // Caches the SQL connection string
        private readonly static string dbSqlConnectionString;
        // Caches the SQL data provider name 
        private readonly static string dbSqlProviderName;
        // online plan quick quote cart persistance 
        private readonly static int cartPersistDays;




        static ApplicationConfiguration()
        {

            dbConnectionString = ConfigurationManager.ConnectionStrings["OracleLiveConnectionString"].ConnectionString;
            dbProviderName = ConfigurationManager.ConnectionStrings["OracleLiveConnectionString"].ProviderName;

            dbSqlConnectionString = ConfigurationManager.ConnectionStrings["MaximumASPSqlServer"].ConnectionString;
            dbSqlProviderName = ConfigurationManager.ConnectionStrings["MaximumASPSqlServer"].ProviderName;

            siteName = ConfigurationManager.AppSettings["SiteName"];
            cartPersistDays = Int32.Parse(ConfigurationManager.AppSettings["CartPersistDays"]);
        }

        public static string Get(string key)
        {
            return ConfigurationManager.AppSettings.Get(key);
        }


        // Returns the connection string for the BalloonShop database
        public static string DbConnectionString
        {
            get
            {
                return dbConnectionString;
            }
        }

        // Returns the connection string for the BalloonShop database
        public static string DbSqlConnectionString
        {
            get
            {
                return dbSqlConnectionString;
            }
        }

        // Returns the data provider name
        public static string DbProviderName
        {
            get
            {
                return dbProviderName;
            }
        }

        // Returns the data provider name
        public static string DbSqlProviderName
        {
            get
            {
                return dbSqlProviderName;
            }
        }


        // Returns the address of the mail server
        public static string MailServer
        {
            get
            {
                return ConfigurationManager.AppSettings["MailServer"];
            }
        }

        // Returns the address of the system mail sender
        public static string SystemMailSender
        {
            get
            {
                return ConfigurationManager.AppSettings["SystemMailSender"];
            }
        }

        // Send error log emails?
        public static bool EnableErrorLogEmail
        {
            get
            {
                return bool.Parse(ConfigurationManager.AppSettings["EnableErrorLogEmail"]);
            }
        }

        public static string CustomerServiceEmail
        {
            get
            {
                return ConfigurationManager.AppSettings["CustomerServiceEmail"];
            }
        }

        // Returns the email address where to send error reports
        public static string ErrorLogEmail
        {
            get
            {
                return ConfigurationManager.AppSettings["ErrorLogEmail"];
            }
        }

        // Returns the email address where to send error reports
        public static string SupplierEmail
        {
            get
            {
                return ConfigurationManager.AppSettings["SupplierEmail"];
            }
        }

        // Returns the length of product descriptions in products lists
        public static string SiteName
        {
            get
            {
                return siteName;
            }
        }

        // Returns the site type: live or test
        public static bool IsTestServer
        {
           get
           {
              return bool.Parse(ConfigurationManager.AppSettings["IsTestServer"]);
           }
        }
        // Returns the number of days for shopping cart expiration
        public static int CartPersistDays
        {
            get
            {
                return cartPersistDays;
            }
        }

    }
}