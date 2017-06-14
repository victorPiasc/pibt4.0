CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_TRANSFERQUOTEFOROE" (
   pCartId     NUMBER,
   pEmployerId VARCHAR2)
AS
BEGIN
   DELETE FROM web_qqEmployer WHERE cart=pCartId;
   DELETE FROM web_qqEmployerPlanType WHERE cart=pCartId;
 
   INSERT INTO web_qqEmployer (cart, companyname, address, city, st, zip, fax, cname, phone, email, isPc, contribution, contributionDep,
         dollar, dollarDep, employerid, nbrEmployees, ofBase)
      SELECT pCartId,
         name,
         addressone || ' ' || addresstwo,
         city,
         state,
         billZip,
         faxnbr,
         billcontact,
         phonenbr,
         billemail,
         CASE WHEN agencyId = 5 THEN 'Y' ELSE 'N'END,
         contribution,
         contributionDep,
         dollar,
         dollarDep,
         employerId,
         nbrEmployees,
         ofBase
      FROM employer
      WHERE employerid = pEmployerId;
   COMMIT;

   INSERT INTO web_qqEmployerPlanType
      SELECT planTypeId,
         contribution,
         contributionDep,
         ofBase,
         baseplanId,
       pCartId
      FROM employerPlanType
      WHERE employerId = pEmployerId;
   COMMIT;
END;
/
