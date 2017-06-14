CREATE OR REPLACE PROCEDURE web_getPlanTypesFromBill(
   pEmployerId IN VARCHAR2, 
   v_refcur OUT SYS_REFCURSOR)
AS
   vInvoiceNbr INTEGER;
BEGIN 
   SELECT MAX(invoiceNbr) INTO vInvoiceNbr
   FROM invoiceHeader 
   WHERE employerId=pEmployerId;
   
   OPEN v_refcur FOR
      SELECT DISTINCT p.planTypeId
      FROM invoiceDetail i
      JOIN plans p ON
         i.planId=p.planId
      WHERE i.invoiceNbr=vInvoiceNbr;
END;
   