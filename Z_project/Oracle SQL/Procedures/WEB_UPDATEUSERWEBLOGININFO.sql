CREATE OR REPLACE PROCEDURE web_updateUserWebLoginInfo(
   pLoginName IN VARCHAR2,
   pLoginIp IN VARCHAR2) 
AS
BEGIN
  UPDATE web_users
  SET lastLoginIp = pLoginIp, 
     lastLoginTime = SYSDATE
  WHERE webname = pLoginName;
  
  COMMIT;
End;
/
