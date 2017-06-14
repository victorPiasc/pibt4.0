CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getAllMembers(
   pEmployerId IN VARCHAR2, 
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR 
      SELECT memberId, 
         employeeId, 
         firstname, 
         lastname, 
         employeeType,
         birthdate, 
         DECODE(employeeType, '0','Employee','1', 'Spouse','2', 'Child','Domestic Partner') description, 
         socSecNbr, 
         marriageDate, 
         hireDate, 
         hoursWorked,
         emailaddress,        
         smoker, 
         hoursWorked, 
         male
      FROM member 
      WHERE employerId=pEmployerId
      ORDER BY 2,5,4,3,6; 
END;
/
