CREATE OR REPLACE PROCEDURE PIA_ADMIN.WEB_GETWEBUSEREMAIL(
   pEmployerid IN  VARCHAR2,
   pEmail OUT VARCHAR2)
AS
BEGIN
   SELECT e.mailemail INTO pEmail
   FROM employer e
   JOIN web_users wu ON
      e.employerid=wu.employerid
   WHERE  e.employerid=pEmployerid AND
      wu.webuserroleid=4 AND 
      TRUNC(SYSDATE) <NVL(e.endDate,'31-Dec-9999');
END;
/
