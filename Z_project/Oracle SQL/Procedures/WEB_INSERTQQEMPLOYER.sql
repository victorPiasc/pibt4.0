CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_INSERTQQEMPLOYER" (
   pCartId      NUMBER,
   pCompanyName VARCHAR2,
   pAddress     VARCHAR2,
   pCity        VARCHAR2,
   pSt          VARCHAR2,
   pZip         NUMBER,
   pFax         VARCHAR2,
   pName        VARCHAR2,
   pPhone       VARCHAR2,
   pEmail       VARCHAR2,
   pIsPc        CHAR )
AS
BEGIN
   UPDATE WEB_QQEMPLOYER
      SET companyName = pCompanyName,
         address = pAddress,
         city = pCity,
         st = pSt,
         zip =pZip,
         fax = pFax,
         cName = pName,
         phone = pPhone,
         email = pEmail,
         isPc = pIsPc
      WHERE cart=pCartId;
   IF SQL%ROWCOUNT = 0 THEN
      INSERT INTO web_qqEmployer(cart, companyName, address, city, st, zip, fax, cName, phone, email, isPc)
         VALUES ( pCartId, pCompanyName, pAddress, pCity, pSt, pZip, pFax, pName, pPhone, pEmail, pIsPc);
   END IF;
   COMMIT;
END;
/
