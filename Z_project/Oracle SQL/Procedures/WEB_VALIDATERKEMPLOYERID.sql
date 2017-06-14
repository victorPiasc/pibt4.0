create or replace 
PROCEDURE WEB_ValidateRKEmployerId
(Pemployerid In Varchar2,
 PRKUserid In Varchar2,
 v_refcur OUT SYS_REFCURSOR )
 AS
BEGIN
   BEGIN
      open v_refcur for 
      SELECT 
         COUNT(1) eeCount 
      From 
         Employer Er,
       Csrinfo Csr      
      Where Er.Csrid=Csr.Csrid And
         Er.Employerid = Pemployerid And 
         Csr.Userid = PRKUserid;
   END;
      
   RETURN; 
END;