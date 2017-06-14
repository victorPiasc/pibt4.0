create or replace 
PROCEDURE WEB_ValidateEmployeeId
(pEmployerId in VARCHAR2,
 pEmployeeId in VARCHAR2,
 v_refcur OUT SYS_REFCURSOR )
 AS
BEGIN
   BEGIN
      open v_refcur for 
      SELECT 
         COUNT(1) eeCount 
      FROM 
         member 
      WHERE 
         employerid = pEmployerId AND 
         memberid = pEmployeeId;
   END;
      
   RETURN; 
END;