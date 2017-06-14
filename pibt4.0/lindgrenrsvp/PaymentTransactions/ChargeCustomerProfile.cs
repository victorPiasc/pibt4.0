﻿using System;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Generic;
using AuthorizeNet.Api.Controllers;
using AuthorizeNet.Api.Contracts.V1;
using AuthorizeNet.Api.Controllers.Bases;

namespace net.authorize.sample
{
    public class ChargeCustomerProfile
    {
        public static ANetApiResponse Run(String ApiLoginID, String ApiTransactionKey, string customerProfileId,
            string customerPaymentProfileId, decimal Amount)
        {
            //Console.WriteLine("Charge Customer Profile");

            ApiOperationBase<ANetApiRequest, ANetApiResponse>.RunEnvironment = AuthorizeNet.Environment.SANDBOX;

            // define the merchant information (authentication / transaction id)
            ApiOperationBase<ANetApiRequest, ANetApiResponse>.MerchantAuthentication = new merchantAuthenticationType()
            {
                name = ApiLoginID,
                ItemElementName = ItemChoiceType.transactionKey,
                Item = ApiTransactionKey
            };

            //create a customer payment profile
            customerProfilePaymentType profileToCharge = new customerProfilePaymentType();
            profileToCharge.customerProfileId = customerProfileId;
            profileToCharge.paymentProfile = new paymentProfile { paymentProfileId = customerPaymentProfileId };

            var transactionRequest = new transactionRequestType
            {
                transactionType = transactionTypeEnum.authCaptureTransaction.ToString(),    // refund type
                amount = Amount,
                profile = profileToCharge
            };

            var request = new createTransactionRequest { transactionRequest = transactionRequest };

            // instantiate the collector that will call the service
            var controller = new createTransactionController(request);
            controller.Execute();

            // get the response from the service (errors contained if any)
            var response = controller.GetApiResponse();

            //validate
            if (response != null)
            {
                if (response.messages.resultCode == messageTypeEnum.Ok)
                {
                    if(response.transactionResponse.messages != null)
                    {
                        //Console.WriteLine("Successfully created transaction with Transaction ID: " + response.transactionResponse.transId);
                        //Console.WriteLine("Response Code: " + response.transactionResponse.responseCode);
                        //Console.WriteLine("Message Code: " + response.transactionResponse.messages[0].code);
                        //Console.WriteLine("Description: " + response.transactionResponse.messages[0].description);
                        //Console.WriteLine("Success, Auth Code : " + response.transactionResponse.authCode);
                        //EventPay.EventMakePayment.sOutput = "Successfully created transaction with Transaction ID: " + response.transactionResponse.transId;
                        //EventPay.EventMakePayment.sOutput = EventPay.EventMakePayment.sOutput + "<p>Description: " + response.transactionResponse.messages[0].description + "</p>";
                        //LouACH.Main.theOutput = LouACH.Main.theOutput + "<p>Transaction ID: " + response.transactionResponse.transId + "</p>";
                        //var result = "";
                        //result = LouACH.DataBaseTransactions.DataBase.WriteTransactionData(response.transactionResponse.transId, Amount, customerPaymentProfileId);
                    }
                    else
                    {
                        //Console.WriteLine("Failed Transaction.");
                        LouACH.Main.theOutput = "Failed Transaction.";
                        if (response.transactionResponse.errors != null)
                        {
                            //Console.WriteLine("Error Code: " + response.transactionResponse.errors[0].errorCode);
                            //Console.WriteLine("Error message: " + response.transactionResponse.errors[0].errorText);
                            LouACH.Main.theOutput = "Error message: " + response.transactionResponse.errors[0].errorText;
                        }
                    }
                }
                else
                {
                    //Console.WriteLine("Failed Transaction.");
                    LouACH.Main.theOutput = "Failed Transaction.";
                    if (response.transactionResponse != null && response.transactionResponse.errors != null)
                    {
                        //Console.WriteLine("Error Code: " + response.transactionResponse.errors[0].errorCode);
                        //Console.WriteLine("Error message: " + response.transactionResponse.errors[0].errorText);
                        LouACH.Main.theOutput = "Error message: " + response.transactionResponse.errors[0].errorText;
                    }
                    else
                    {
                        //Console.WriteLine("Error Code: " + response.messages.message[0].code);
                        //Console.WriteLine("Error message: " + response.messages.message[0].text);
                        LouACH.Main.theOutput = "Error message: " + response.transactionResponse.errors[0].errorText;
                    }
                }
            }
            else
            {
                //Console.WriteLine("Null Response.");
                LouACH.Main.theOutput = "Null Response.";
            }

            return response;
        }
    }
}
