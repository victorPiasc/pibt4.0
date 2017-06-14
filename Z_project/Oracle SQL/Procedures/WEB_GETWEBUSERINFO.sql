CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETWEBUSERINFO" (
  pLoginName IN VARCHAR2,
  v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT wu.userId,
         wu.employerId,
         wu.employeeId,
         wu.memberId,
         wu.brokerId,
         u.agencyId
      FROM web_users wu
      LEFT JOIN users u ON 
         wu.userId=u.userId
      WHERE UPPER(Webname) = UPPER (pLoginName);
END;
/
