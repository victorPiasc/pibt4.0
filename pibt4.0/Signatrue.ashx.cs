using Pibt.BLL;
using Pibt.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pibt
{
    /// <summary>
    /// Summary description for Signatrue
    /// </summary>
    public class Signatrue : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            if (context.User.Identity.IsAuthenticated)
            {
                try
                {
                    string encryptSignatrue = context.Request.QueryString["signatrue"];
                    if (!string.IsNullOrEmpty(encryptSignatrue))
                    {
                        string decryptSignatrue = Common.Utilities.Decrypt(encryptSignatrue);
                        int signatureId = int.Parse(decryptSignatrue.ToLower().Replace("signatrue", ""));
                        byte[] buffer = BLL.Employer.getSignature(signatureId);
                            //BLL.EnrollmentForm.GetSignatrue(decryptSignatrue.ToLower().Replace("signatrue", ""));
                        context.Response.Clear();
                        context.Response.ContentType = "image/png";
                        context.Response.BinaryWrite(buffer);
                        context.Response.End();
                    }
                }
                catch (Exception ex)
                {
                    Logger.InsertLog(new WebSiteLog
                    {
                        LogType = LogType.Error,
                        EventCode = EventCode.AppError,
                        EventDetails = ex.Message,
                        UserName = context.User.Identity.Name,
                        FromIP = HttpContext.Current.Request.UserHostAddress
                    });
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}