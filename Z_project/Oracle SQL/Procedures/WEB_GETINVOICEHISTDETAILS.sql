CREATE OR REPLACE PROCEDURE WEB_GETINVOICEHISTDETAILS ( 
   pInvoiceNbr IN VARCHAR2,
   pEmployeeId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN 
   IF pEmployeeId IS NULL THEN
      OPEN v_refcur FOR
         SELECT invoiceNbr,
            employeeId,
            lastName,
            firstName,
            gender,
            birthDate,
            age,
            amountTotal
         FROM web_invoice_v
         WHERE invoiceNbr=pInvoiceNbr;
   ELSE
      OPEN v_refcur FOR
         SELECT invoiceNbr,
            employeeId,
            name,
            gender,
            age,
            chargestatus,
            coverageType,
            planName,
            amountDue
         FROM web_invoiceDetails_v
         WHERE invoiceNbr=pInvoiceNbr AND
            employeeId=pEmployeeId;
   END IF;
END;
/
