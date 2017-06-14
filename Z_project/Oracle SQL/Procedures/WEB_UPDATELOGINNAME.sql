CREATE OR REPLACE 
PROCEDURE WEB_UpdateLoginName
(
    pLoginName             in  VARCHAR2,
    pNewLoginName        in  VARCHAR2
 )
 AS
BEGIN
   UPDATE web_users 
   SET     
       webName       =   pNewLoginName    
   Where
       UPPER(webName) = upper(pLoginName);
   
    COMMIT;
END;