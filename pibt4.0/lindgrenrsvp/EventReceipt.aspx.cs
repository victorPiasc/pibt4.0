using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AuthorizeNet.Api.Contracts.V1;
using net.authorize.sample;
using Oracle.DataAccess.Client;
using Oracle.DataAccess.Types;
//using Oracle.ManagedDataAccess.Client;
//using Oracle.ManagedDataAccess.Types;
using System.Net;
using System.Net.Mail;
using System.Reflection;
using Newtonsoft.Json.Linq;
using Microsoft.Office.Interop.Word;
using Pibt.Common;


namespace LouACH
{

    public partial class EventReceipt : System.Web.UI.Page
    {

        public static string apiLoginId;
        public static string transactionKey;

        //public static string apiLoginId1 = Constants.API_LOGIN_ID;
        //public static string transactionKey1 = Constants.TRANSACTION_KEY;
        //public static string apiLoginId2 = Constants.API_LOGIN_ID2;
        //public static string transactionKey2 = Constants.TRANSACTION_KEY2;
        public static string sOutput = "";
        public static creditCardType creditCard;
        public static customerAddressType customerAddress;
        public static string fName = "";
        public static string lName = "";
        public static string gName = "";
        public static string sgName = "";
        public static string Meal = "";
        public static string gMeal = "";
        public static string sgMeal = "";
        public static string sAmountDue = "0.00";
        public static decimal AmountDue = 0.00m;
        public static string TransactionCode = "";
        public static string TransactionMessage = "";
        public static string TransactionMessages = "";
        public static string Address = "";
        public static string City = "";
        public static string State = "";
        public static string Zip = "";
        public static string CC = "";
        public static string CCexpDt = "";
        public static string CCSecNo = "";
        public static string PIASC = "0.00";
        public static string IPM = "0.00";
        public static string PPAC = "0.00";
        public static lineItemType lineItems;
        //public static string connectionString = Constants.CONNECTION_STRING_Local;
        public static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["OracleLiveConnectionString"].ToString();
        public static decimal UnitPrice = 0.00m;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.IsSecureConnection && !Pibt.Common.ApplicationConfiguration.IsTestServer)
                Response.Redirect(Request.Url.AbsoluteUri.ToLower().Replace("http://", "https://"), true);

            Boolean bAuthNet = false;
            Boolean bTest = false;
            //Boolean bTest = true;
            string Item = "";
            //decimal UnitPrice = 0.00m;
            int Account = 1;
            string MerchantID = "";
            string ENDPOINT = "";
            string USERNAME = "";
            string PASSWORD = "";
            int TransactionID = 0;
            TransactionMessages = "";
            string sRegistrationID = Convert.ToString(Session["RegistrationID"]);
            LouACH.Events.Person person = LouACH.DataBaseTransactions.DataBase.GetPerson(sRegistrationID);//new LouACH.Events.Person
            //person=LouACH.DataBaseTransactions.DataBase.GetPerson("");

            customerAddress = new customerAddressType
            {
                firstName = person.PersonfName,  //"John",
                lastName = person.PersonlName,  //"Doe",
                address = Request.Form["txtAddress"],   //"123 My St",
                city = Request.Form["txtCity"],   //"OurTown",
                state = Request.Form["txtState"],
                zip = Request.Form["txtZip"]   //"98004"
            };
            person.PersonAddress = customerAddress.address;
            person.PersonCity = customerAddress.city;
            person.PersonState = customerAddress.state;
            person.PersonZip = customerAddress.zip;

            creditCard = new creditCardType
            {
                cardNumber = Request.Form["txtCC"],   //"4111111111111111",
                expirationDate = Request.Form["txtExpDt"], //"0718",
                cardCode = Request.Form["txtSecNo"]   //"123"
            };
            CC = creditCard.cardNumber;
            sAmountDue = Request.Form["txtAmount"];
            Meal = Request.Form["Meal"];

            if (Request.Form["GuestName"] != "")
            {
                gName = Request.Form["GuestName"];
                gMeal = Request.Form["GuestMeal"];
                sgName = " and " + gName;
                sgMeal = " and " + gMeal;
                sAmountDue = Request.Form["txtAmount"];                 //200.00m;
            }
            OracleDataReader dr;
            string queryString = "Select * FROM EVENT_TRANSACTIONS where RegistrationID = " + sRegistrationID;
            using (OracleConnection connection = new OracleConnection(connectionString))
            using (OracleCommand command = new OracleCommand(queryString, connection))
            {
                command.Connection.Open();
                dr = command.ExecuteReader();
                while (dr.Read())
                {
                    Item = dr.GetString(5);
                    object tranTmp = dr.GetValue(0);
                    TransactionID = int.Parse(tranTmp.ToString());
                    //TransactionID = dr.GetInt32(0);
                    UnitPrice = dr.GetDecimal(4);
                    lineItems = new lineItemType { itemId = "1", name = Item, quantity = 1, unitPrice = UnitPrice };


                    object tmp = dr.GetOracleValue(6);
                    string tmp2 = tmp.ToString(); ;
                    Account = int.Parse(tmp2);
                    //Account = dr.GetInt32(6);
                    if (bAuthNet)
                    {  //AutherizeNet
                        switch (Account)
                        {

                            case 1:
                                apiLoginId = Constants.API_LOGIN_ID;
                                transactionKey = Constants.TRANSACTION_KEY;
                                break;
                            case 2:
                                //transactionKey = Constants.TRANSACTION_KEY;
                                apiLoginId = Constants.API_LOGIN_ID2;
                                transactionKey = Constants.TRANSACTION_KEY2;
                                break;
                        }

                        var response = net.authorize.sample.ChargeCreditCard.Run(apiLoginId, transactionKey, Decimal.ToInt32(UnitPrice));
                        TransactionMessages = TransactionMessages + "<br/>" + Item + "-" + UnitPrice.ToString("C") + "<br/>&nbsp;&nbsp;" + TransactionMessage;
                    }
                    else
                    {
                        //CardConnect
                        if (bTest)
                        {
                            switch (Account)
                            {
                                case 1:
                                    MerchantID = "496160873888";  //"496226287886";
                                    ENDPOINT = "https://fts.cardconnect.com:6443/cardconnect/rest";
                                    USERNAME = "testing";  //"internat";  
                                    PASSWORD = "testing123";  //"Tf2#LrEE@LZ5"; 
                                    //email_send(sRegistrationID, person, Account);
                                    break;
                                case 2:
                                    MerchantID = "496160873888";
                                    ENDPOINT = "https://fts.cardconnect.com:6443/cardconnect/rest";
                                    USERNAME = "testing";
                                    PASSWORD = "testing123";
                                    //email_send(sRegistrationID, person, Account);
                                    break;
                                case 3:
                                    MerchantID = "496160873888";
                                    ENDPOINT = "https://fts.cardconnect.com:6443/cardconnect/rest";
                                    USERNAME = "testing";
                                    PASSWORD = "testing123";
                                    //email_send(sRegistrationID, person, Account);
                                    break;
                                case 4:
                                    MerchantID = "496160873888";
                                    ENDPOINT = "https://fts.cardconnect.com:6443/cardconnect/rest";
                                    USERNAME = "testing";
                                    PASSWORD = "testing123";
                                    //email_send(sRegistrationID, person, Account);
                                    break;
                            }
                        }
                        else
                        {
                            switch (Account)
                            {
                                case 1:
                                    MerchantID = "496226279883";//"496226287886";
                                    ENDPOINT = "https://fts.cardconnect.com:8443/cardconnect/rest";
                                    USERNAME = "piaioscs";  //guest $200
                                    PASSWORD = "xVejN!@r6K7y";
                                    break;
                                case 2:
                                    MerchantID = "496226266880"; // "496226268886";
                                    ENDPOINT = "https://fts.cardconnect.com:8443/cardconnect/rest";
                                    USERNAME = "raisegai"; //Raise
                                    PASSWORD = "3w7b!@MyWhHj";
                                    break;
                                case 3:
                                    MerchantID = "496226287886";//"496226282887";
                                    ENDPOINT = "https://fts.cardconnect.com:8443/cardconnect/rest";
                                    USERNAME = "internat"; //Museum
                                    PASSWORD = "Tf2#LrEE@LZ5";
                                    break;
                                case 4:
                                    MerchantID = "496226284883"; //"496226284883";
                                    ENDPOINT = "https://fts.cardconnect.com:8443/cardconnect/rest";
                                    USERNAME = "printpac"; //Print Pac
                                    PASSWORD = "jS#0I4v7I!pw";
                                    break;
                            }
                        }
                        int price = Decimal.ToInt32(UnitPrice) * 100;
                        var response = authTransaction(price, MerchantID, ENDPOINT, USERNAME, PASSWORD, customerAddress, creditCard);
                        TransactionMessages = TransactionMessages + "<br/>" + Item + "-" + UnitPrice.ToString("C") + "<br/>&nbsp;&nbsp;" + response;
                        LouACH.DataBaseTransactions.DataBase.UpdateTransactions(Convert.ToString(TransactionID), response);
                        if (response.Substring(0, 1) == "A")
                            email_send(sRegistrationID, person, Account, Decimal.ToInt32(UnitPrice), Meal, gMeal, gName);
                        else
                        {
                            TransactionMessages = "Payment not accepted. <a href=\"EventMakePayment.aspx\">Click here</a> to re-enter credit card information.";
                            break;
                        }
                    }
                }
                if (!TransactionMessages.Contains("Payment not accepted."))
                {
                    string subject = "New RSVP for: " + person.PersonfName + " " + person.PersonlName;
                    string body = person.PersonfName + " " + person.PersonlName + "</br>" +
                    "  " + Meal + "</br></br>" +
                    (!string.IsNullOrWhiteSpace(gName)
                        ? "" + gName + "</br>  " + gMeal + "</br></br>"
                        : "") +
                    "  "+person.PersonEMail+"</br></br>" +
                    TransactionMessages;
                    //Utilities.SendMail("OnlineHelpDesk@piasc.org", "stephanie@piasc.org", subject, body);
                    Utilities.SendMail("OnlineHelpDesk@piasc.org", "Socorro@piasc.org", subject, body);
                }
                command.Connection.Close();
            }
            //email_send(sRegistrationID,person,Account);
        }


        public void email_send(string regID, LouACH.Events.Person person, int Account, Decimal Amount, string meal, string gmeal, string gname)
        {
            System.Net.Mail.Attachment[] attachments = new Attachment[1];
            string LetterPath = "";
            string LetterSentPath = "";
            string LetterPDF = "";
            if (Account != 1)
            {
                Microsoft.Office.Interop.Word.Application appWord = new Microsoft.Office.Interop.Word.Application();
                //wordDocument = appWord.Documents.Open(@"D:\CGC\LouASC\PrintPACSampleLetter.docx", ReadOnly: false);

                Microsoft.Office.Interop.Word.Document aDoc = null;                
                switch (Account)
                {
                    //case 1:
                    //    //LetterPath = @"D:\CGC\LouASC\Letters\PrintPACSampleLetter.docx";
                    //    break;
                    case 2:
                        //LetterPath = @"D:\CGC\LouASC\Letters\RAISE.docx";
                        //LetterSentPath = @"D:\CGC\LouASC\LettersSent\RAISE" + regID + ".docx";
                        //LetterPDF = @"D:\CGC\LouASC\LettersSent\RAISE" + regID + ".pdf";
                        LetterPath = Server.MapPath(@"\lindgrenrsvp\Letters\RAISE.docx");
                        LetterSentPath = Server.MapPath(@"\lindgrenrsvp\LettersSent\RAISE" + regID + ".docx");
                        LetterPDF = Server.MapPath(@"\lindgrenrsvp\LettersSent\RAISE" + regID + ".pdf");
                        break;
                    case 3:
                        //LetterPath = @"D:\CGC\LouASC\Letters\Museum.docx";
                        //LetterSentPath = @"D:\CGC\LouASC\LettersSent\Museum" + regID + ".docx";
                        //LetterPDF=@"D:\CGC\LouASC\LettersSent\Museum" + regID + ".pdf";
                        LetterPath = Server.MapPath(@"\lindgrenrsvp\Letters\Museum.docx");
                        LetterSentPath = Server.MapPath(@"\lindgrenrsvp\LettersSent\Museum" + regID + ".docx");
                        LetterPDF = Server.MapPath(@"\lindgrenrsvp\LettersSent\Museum" + regID + ".pdf");
                        break;

                    case 4:
                        //LetterPath = @"D:\CGC\LouASC\Letters\PrintPAC.docx";
                        //LetterSentPath = @"D:\CGC\LouASC\LettersSent\PrintPAC" + regID + ".docx";
                        //LetterPDF = @"D:\CGC\LouASC\LettersSent\PrintPAC" + regID + ".pdf";
                        LetterPath = Server.MapPath(@"\lindgrenrsvp\Letters\PrintPAC.docx");
                        LetterSentPath = Server.MapPath(@"\lindgrenrsvp\LettersSent\PrintPAC" + regID + ".docx");
                        LetterPDF = Server.MapPath(@"\lindgrenrsvp\LettersSent\PrintPAC" + regID + ".pdf");
                        break;
                }
               
                System.IO.File.Copy(LetterPath, LetterSentPath);

                //object filename = @"D:\CGC\LouASC\PrintPACLetter" + regID + ".docx";
                object filename = LetterSentPath;
                object missing = Missing.Value;
                object readOnly = false;
                object isVisible = false;
                object theDate = DateTime.Now.ToString("MMM dd, yyyy");
                object theName = person.PersonfName + " " + person.PersonlName;
                object theAddress = person.PersonAddress;
                object theCityStateZip = person.PersonCity + " , " + person.PersonState + " " + person.PersonZip;
                object firstName = person.PersonfName;
                object theCompany = person.PersonCompany;
                object theAmount = Amount.ToString("C");

                //  make visible Word application
                //appWord.Visible = true;
                //  open Word document named temp.doc
                aDoc = appWord.Documents.Open(ref filename, ref missing,
                        ref readOnly, ref missing, ref missing, ref missing,
                        ref missing, ref missing, ref missing, ref missing,
                        ref missing, ref isVisible, ref missing, ref missing,
                        ref missing, ref missing);
                aDoc.Activate();
                //  Call FindAndReplace()function for each change
                this.FindAndReplace(appWord, "<DATE>", theDate);
                this.FindAndReplace(appWord, "<FIRST LAST>", theName);
                this.FindAndReplace(appWord, "<ADDRESS>", theAddress);
                this.FindAndReplace(appWord, "<CITY ST ZIP>", theCityStateZip);
                this.FindAndReplace(appWord, "<COMPANY>", theCompany);
                this.FindAndReplace(appWord, "<FIRST NAME>", firstName);
                this.FindAndReplace(appWord, "<AMOUNT>", theAmount);
                //  save temp.doc after modified

                aDoc.Save();
                aDoc.ExportAsFixedFormat(LetterPDF, WdExportFormat.wdExportFormatPDF);
                attachments[0] = new System.Net.Mail.Attachment(LetterPDF);
                aDoc.Close(false);
                appWord.Quit(false);
            }

            //var client = new System.Net.Mail.SmtpClient("smtp.gmail.com", 587);
            //client.EnableSsl = true;
            //client.UseDefaultCredentials = false;
            //client.Credentials = new System.Net.NetworkCredential("hargood060442@gmail.com", "060442Hsg");


            //try
            //{
            //    // Create instance of message
            //    System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();

            //    // Add receiver
            //    message.To.Add(person.PersonEMail);

            //    // Set sender
            //    // In this case the same as the username
            //    message.From = new System.Net.Mail.MailAddress("hargood060442@gmail.com");

            //    // Set subject
            //    message.Subject = "Thanks";

            //    // Set body of message
            //    message.Body = "Thank you for the donation";

            //    System.Net.Mail.Attachment attachment;
            //    attachment = new System.Net.Mail.Attachment(LetterPDF);
            //    message.Attachments.Add(attachment);

            //    // Send the message
            //    client.Send(message);

            //    // Clean up
            //    message = null;
            //}
            //catch (Exception e)
            //{
            //    Console.WriteLine("Could not send e-mail. Exception caught: " + e);
            //}
            string subject = "Bob Lindgren's Retirement Dinner", body = "";
            switch (Account)
            {
                case 1:
                    subject += " RSVP "+(!string.IsNullOrWhiteSpace(gname) ? "$200 charge" : "");
                    body = "Thank you for registering to attend Bob Lindgen's Retirement Dinner. Below are the details of your reservation.</br></br>" +
                        "  " + person.PersonfName + " " + person.PersonlName + "</br>" +
                        "  " + meal + "</br></br>" +
                        (!string.IsNullOrWhiteSpace(gname) 
                            ? "  " + gname + "</br>  " + gmeal + "</br></br>" 
                            : "" ) +
                        "  June 16, 2016, 5:00 pm</br></br>" +
                        "  The Jonathan Club </br>" +
                        "  545 South Figueroa Street</br>" +
                        "  Los Angeles, CA 90071</br>" +
                        "<a href=\"https://www.pibt.org/lindgrenrsvp/club.html\">Website</a></br></br>" +
                       
                        "  We look forward to having you join us.</br></br>";
                    break;
                case 2:
                    subject += " RAISE Donation";
                    body = "Thank you for generous donation to the R.A.I.S.E. Foundation. Your contribution will allow us to continue making a significant difference in graphic communications programs. </br></br>" +
                      "<a href=\"http://www.piasc.org/raise\" >www.piasc.org/raise</a></br></br>" +
                      "  Please find your donation receipt attached</br></br>" +
                      " We look forward to having you join us.</br></br>";
                    break;
                case 3:
                    subject += " International Print Museum Donation";
                    body = "Thank you for generous donation to the International Printing Museum Foundation. Your financial support helps the Printing Museum with its continuing efforts to preserve the important heritage of printing and the use of its resources for education through many programs. </br></br>" +
                      "<a href=\"http://www.printmuseum.org/\">http://www.printmuseum.org</a></br></br>" +
                      "  Please find your donation receipt attached</br></br>" +
                      "  We look forward to having you join us.</br></br>";
                    break;
                case 4:
                    subject += " Print PAC Donation";
                    body = "  Thank you for generous donation to the California PrintPAC —the political action committee of our industry’s statewide government affairs office.</br></br>" +
                        "<a href=\"http://www.printpaconline.org/\">http://www.printpaconline.org</a></br></br>" +
                     "  Please find your donation receipt attached</br></br>" +
                      "  We look forward to having you join us.</br></br>";
                    break;
            }
            body += "Socorro Garcia</br>" +
                        "Executive Assistant to the President/CEO</br>" +
                        "Printing Industries Association Inc., of Southern California</br>" +
                        "5800 S. Eastern Avenue #400</br>" +
                        "Los Angeles, CA 90040</br>" +
                        "Tel: 323-728-9500 Ext. 229</br>" +
                        "Fax: 323-358-2968</br>" +
                        "Website: <a href=\"http://www.piasc.org\">www.piasc.org</a>";

            if (Account != 1)
                Utilities.SendMail("OnlineHelpDesk@piasc.org", person.PersonEMail, "", "", subject, body, attachments);
            else
                Utilities.SendMail("OnlineHelpDesk@piasc.org", person.PersonEMail, subject, body);
            //System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            //SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
            //mail.From = new MailAddress("hargood060442@gmail.com");
            //mail.To.Add("hgoodman@cgc-intl.com");
            //mail.Subject = "Test Mail - 1";
            //mail.Body = "mail with attachment";

            //System.Net.Mail.Attachment attachment;
            //attachment = new System.Net.Mail.Attachment("D:\\HSG\\GPa.txt");
            //mail.Attachments.Add(attachment);

            ////SmtpClient client = new SmtpClient(SmtpServer.Port);
            //// Credentials are necessary if the server requires the client 
            //// to authenticate before it will send e-mail on the client's behalf.
            ////client.Credentials = CredentialCache.DefaultNetworkCredentials;


            //SmtpServer.Port = 587;
            //SmtpServer.Credentials = new System.Net.NetworkCredential("hargood060442@gmail.com", "060442Hsg");
            //SmtpServer.EnableSsl = true;

            //SmtpServer.Send(mail);

        }
        private void FindAndReplace(Microsoft.Office.Interop.Word.Application wordApp, object findText, object replaceText)
        {
            object matchCase = true;
            object matchWholeWord = true;
            object matchWildCards = false;
            object matchSoundsLike = false;
            object matchAllWordForms = false;
            object forward = true;
            object format = false;
            object matchKashida = false;
            object matchDiacritics = false;
            object matchAlefHamza = false;
            object matchControl = false;
            object read_only = false;
            object visible = true;
            object replace = 2;
            object wrap = 1;
            wordApp.Selection.Find.Execute(ref findText, ref matchCase,
                ref matchWholeWord, ref matchWildCards, ref matchSoundsLike,
                ref matchAllWordForms, ref forward, ref wrap, ref format,
                ref replaceText, ref replace, ref matchKashida,
                        ref matchDiacritics,
                ref matchAlefHamza, ref matchControl);
        }
        /**
* Authorize Transaction REST Example
* @return
*/
        public static String authTransaction(int Amount, string merchID, string ENDPOINT, string USERNAME, string PASSWORD, customerAddressType customerAddress, creditCardType creditCard)
        {
            //Console.WriteLine("Authorization Request");

            // Create Authorization Transaction request
            JObject request = new JObject();
            // Merchant ID
            request.Add("merchid", merchID);  //  496226287886   496160873888  496400000840                // Card Type
            //request.Add("accttype", "VI");
            // Card Number
            request.Add("account", creditCard.cardNumber);
            // Card Expiry
            request.Add("expiry", creditCard.expirationDate);
            // Card CCV2
            request.Add("cvv2", creditCard.cardCode);
            // Transaction amount
            request.Add("amount", Convert.ToString(Amount));
            // Transaction currency
            request.Add("currency", "USD");
            // Order ID
            request.Add("orderid", "12345");
            // Cardholder Name
            request.Add("name", customerAddress.firstName + " " + customerAddress.lastName);
            // Cardholder Address
            request.Add("Street", customerAddress.address);
            // Cardholder City
            request.Add("city", customerAddress.city);
            // Cardholder State
            request.Add("region", customerAddress.state);
            // Cardholder Country
            request.Add("country", "US");
            // Cardholder Zip-Code
            request.Add("postal", customerAddress.zip);
            // Return a token for this card number
            request.Add("tokenize", "Y");
            //Capture fund 
            request.Add("capture", "Y");

            // Create the REST client
            CardConnectRestClientExample.CardConnectRestClient client = new CardConnectRestClientExample.CardConnectRestClient(ENDPOINT, USERNAME, PASSWORD);

            // Send an AuthTransaction request
            JObject response = client.authorizeTransaction(request);


            //foreach (var x in response)
            //{


            //    String key = x.Key;
            //    JToken value = x.Value;
            //    Console.WriteLine(key + ": " + value.ToString());
            //}

            return (String)response.GetValue("resptext") + "  (Transaction ID: " + response.GetValue("retref") + ")";
        }

    }
}
;