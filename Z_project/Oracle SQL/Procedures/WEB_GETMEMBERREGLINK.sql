CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getMemberRegLink(
   pUniqueLink IN CHAR,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN 
   OPEN v_refcur FOR 
      SELECT employerId,
         employeeId, 
         memberId, 
         firstName, 
         lastName,
         socSecNbr, 
         eMailAddress 
      FROM member  
      WHERE uniqueLink=pUniqueLink;
END;
/
