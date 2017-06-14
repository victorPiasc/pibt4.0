CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETEMPLOYERINVOICEHIST" (
   pEmployerid IN  NUMBER,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT ih.invoiceNbr,
         MAX(ih.invoiceDate) invoiceDate,
         SUM(id.amount) totalInvoiceAmount,
         MAX(ih.denormAmt)-SUM(id.amount) otherChargeAmount,
		 MAX(ih.denormAmt) totalAmountDue
      FROM InvoiceHeader ih
      JOIN InvoiceDetail id ON
         ih.invoiceNbr=id.invoiceNbr
      WHERE ih.employerId=pEmployerid AND
         ih.invoiceDate>=ADD_MONTHS(TRUNC(SYSDATE,'MM'),-24)
      GROUP BY ih.invoiceNbr
      ORDER BY 1 DESC;
END;
/
