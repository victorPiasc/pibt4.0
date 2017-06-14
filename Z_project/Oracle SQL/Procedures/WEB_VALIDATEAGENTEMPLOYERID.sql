create or replace 
PROCEDURE WEB_ValidateAgentEmployerId
(Pemployerid In Varchar2,
 PagentUserid In Varchar2,
 v_refcur OUT SYS_REFCURSOR )
 AS
BEGIN
   BEGIN
      open v_refcur for 
      SELECT 
         COUNT(1) eeCount 
      From 
         Employer Er,
         Enrollerinfo En        
      Where Er.Enrollerid=En.Enrollerid And
         Er.Employerid = Pemployerid And 
         En.Userid = PagentUserid;
   END;
      
   RETURN; 
END;