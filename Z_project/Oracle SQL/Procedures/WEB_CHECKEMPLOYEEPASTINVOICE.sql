CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_checkEmployeePastInvoice(
   pEmployerId IN VARCHAR2, 
   pEmployeeId IN VARCHAR2, 
   pCount OUT NUMBER)
AS 
BEGIN    
   SELECT COUNT(0) INTO pCount
   FROM invoiceDetail
   WHERE employeeId=pEmployeeId AND
      invoiceNbr=(
         SELECT MAX(invoiceNbr) 
         FROM invoiceHeader 
         WHERE employerId=pEmployerId);
END;
/
