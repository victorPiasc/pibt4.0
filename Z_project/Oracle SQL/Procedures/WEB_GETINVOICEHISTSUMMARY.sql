CREATE OR REPLACE PROCEDURE web_getInvoiceHistSummary(
   pInvoiceNbr IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT invoiceNbr,
         invoiceDate,
         employerId,
         totalAmountDue,
         dueDate,
         totalInvoiceAmount,
         otherChargeAmount
      FROM web_invoiceSummary_v
      WHERE (invoiceNbr = pInvoiceNbr);
END;
/
