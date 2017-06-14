using Pibt.BLL;
using System;
using System.Data;

namespace Pibt.Class
{
    public static class LegalDocuments
    {

        public static string getLegalDocs(String oeId)
        {
            string legalContent;
            // TODO Rewrite as follows:
            // TODO Get both counts into variables
            // TODO If new, do 0, carriers, 997, and 995
            // TODO If drop, do 999
            // TODO If new, do 998
            // TODO Refactor paragraph marks into GetLegalDocDetails
            if (BLL.EnrollmentForm.GetOETerminatePlans(oeId).Rows.Count > 0 && BLL.EnrollmentForm.GetOENewPlans(oeId).Rows.Count > 0)
            {
                legalContent = "<p>" + BLL.LegalDoc.GetLegalDocDetails(0, false) + "</p>";
                using (DataTable dt = EnrollmentForm.GetOEPlansCarriers(oeId))
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        legalContent += "<p>" + BLL.LegalDoc.GetLegalDocDetails(Common.Utilities.ToInt(row["Carrierid"]), false) + "</p>";
                    }
                }
                legalContent += "<p>" + BLL.LegalDoc.GetLegalDocDetails(997, true) + "</p>";
                legalContent += "<p>" + BLL.LegalDoc.GetLegalDocDetails(995, true) + "</p>";
                legalContent += "<p>" + BLL.LegalDoc.GetLegalDocDetails(999, false) + "</p>";
                legalContent += "<p>" + BLL.LegalDoc.GetLegalDocDetails(998, true) + "</p>";
            }
            else if (BLL.EnrollmentForm.GetOENewPlans(oeId).Rows.Count == 0)
            {
                legalContent = "<p>" + BLL.LegalDoc.GetLegalDocDetails(999, false) + "</p>";
            }
            else
            {
                legalContent = "<p>" + BLL.LegalDoc.GetLegalDocDetails(0, false) + "</p>";
                using (DataTable dt = EnrollmentForm.GetOEPlansCarriers(oeId))
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        legalContent += "<p>" + BLL.LegalDoc.GetLegalDocDetails(Common.Utilities.ToInt(row["Carrierid"]), false) + "</p>";
                    }
                }
                legalContent += "<p>" + BLL.LegalDoc.GetLegalDocDetails(997, true) + "</p>";
                legalContent += "<p>" + BLL.LegalDoc.GetLegalDocDetails(995, true) + "</p>";
                legalContent += "<p>" + BLL.LegalDoc.GetLegalDocDetails(998, true) + "</p>";
            }
            return legalContent;
        }
    }
}