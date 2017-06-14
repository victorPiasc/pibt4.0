CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getInvoiceAR(
   pEmployerId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN 
   OPEN v_refcur FOR
      SELECT employerId,
         receivedOn transDate, 
         checkNo lastCheck,
         amount paymentAmt
      FROM arPayment 
      WHERE employerId=pEmployerId
      ORDER by receivedOn desc;    
END;
/
