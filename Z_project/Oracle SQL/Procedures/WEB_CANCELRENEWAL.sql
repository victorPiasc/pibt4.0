CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_cancelRenewal(
   pRenewalId VARCHAR2)
AS
BEGIN 
   DELETE FROM web_renewal
   WHERE renewalId=pRenewalId;
   COMMIT;
END;
/
