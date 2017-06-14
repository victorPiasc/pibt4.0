using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pibt.Employer
{
    /// <summary>
    /// Summary description for renewalSign
    /// </summary>
    public class renewalSign : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            if (context.User.Identity.IsAuthenticated)
            {
                string encryptSignatrue = context.Request.QueryString["signatrue"];
                if (!string.IsNullOrEmpty(encryptSignatrue))
                {
                    int signatureId = int.Parse(Common.Utilities.Decrypt(encryptSignatrue));
                    byte[] buffer = BLL.Employer.getSignature(signatureId);
                    context.Response.Clear();
                    context.Response.ContentType = "image/png";
                    context.Response.BinaryWrite(buffer);
                    context.Response.End();
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