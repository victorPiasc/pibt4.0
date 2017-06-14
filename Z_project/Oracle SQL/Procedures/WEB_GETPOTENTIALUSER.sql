CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getPotentialUser(
   pCode IN VARCHAR2,
   pCart IN NUMBER,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR 
      SELECT er.employerId,
         er.name, 
         er.billAddressOne, 
         er.billAddressTwo, 
         er.billCity, 
         er.billState, 
         er.billZip, 
         er.addressOne, 
         er.addressTwo,
         er.city, 
         er.state, 
         er.zip,
         er.phoneNbr,
         er.agencyId,
         er.mailContact, 
         er.mailEmail, 
         er.faxNbr,
         er.startDate
      FROM web_qqEmployer wu 
      JOIN employer er ON 
         wu.employerId=er.employerId 
      WHERE wu.validationCode=pCode AND 
         wu.cart=pCart;   
END;
/
