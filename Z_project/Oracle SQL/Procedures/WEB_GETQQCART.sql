CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETQQCART" (
   pCartid  IN  NUMBER,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT cart,
         employeeName,
         employeeType,
         employeeTypeId,
         male,
         birthdate,
         ROWID, 
         familyId
      FROM web_qqCart     
      WHERE cart=pCartid AND 
         planTypeId=0
      ORDER BY familyId, employeeTypeId, employeeName;
END;
/
