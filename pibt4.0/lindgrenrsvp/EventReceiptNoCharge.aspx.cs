using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pibt.Common;

namespace LouACH
{
    public partial class EventReceiptNoCharge : System.Web.UI.Page
    {
        public static string fName = "";
        public static string lName = "";
        public static string Meal = "";
 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection && !Pibt.Common.ApplicationConfiguration.IsTestServer)
                Response.Redirect(Request.Url.AbsoluteUri.ToLower().Replace("http://", "https://"), true);

            fName = LouACH.RegistrationPay.person.PersonfName;
            lName = LouACH.RegistrationPay.person.PersonlName;
            Meal = LouACH.RegistrationPay.registration.LineItems;

            string subject = "New RSVP for: " + fName + " " + lName + "No charge";
            string body = fName + " " + lName + "</br>" +
            "  " + Meal + "</br></br>"+
            "  " + LouACH.RegistrationPay.person.PersonEMail;
            //Utilities.SendMail("OnlineHelpDesk@piasc.org", "stephanie@piasc.org", subject, body);
            Utilities.SendMail("OnlineHelpDesk@piasc.org", "Socorro@piasc.org", subject, body);

            subject = "Bob Lindgren's Retirement Dinner";
            body = "";
            subject += " RSVP ";
            body = "Thank you for registering to attend Bob Lindgen's Retirement Dinner. Below are the details of your reservation.</br></br>" +
                "  " + fName + " " + lName + "</br>" +
                "  " + Meal + "</br></br>" +
                "  June 16, 2016, 5:00 pm</br></br>" +
                "  The Jonathan Club </br>" +
                "  545 South Figueroa Street</br>" +
                "  Los Angeles, CA 90071</br>" +
                "<a href=\"https://www.pibt.org/lindgrenrsvp/club.html\">Website</a></br></br>" +

                "  We look forward to having you join us.</br></br>"+
                "Socorro Garcia</br>" +
                        "Executive Assistant to the President/CEO</br>" +
                        "Printing Industries Association Inc., of Southern California</br>" +
                        "5800 S. Eastern Avenue #400</br>" +
                        "Los Angeles, CA 90040</br>" +
                        "Tel: 323-728-9500 Ext. 229</br>" +
                        "Fax: 323-358-2968</br>" +
                        "Website: <a href=\"http://www.piasc.org\">www.piasc.org</a>";
            Utilities.SendMail("OnlineHelpDesk@piasc.org", LouACH.RegistrationPay.person.PersonEMail, subject, body);

        }

        string response = LouACH.DataBaseTransactions.DataBase.WriteEventTransactionDataNoCharge(LouACH.RegistrationPay.registration);

        }
    }
