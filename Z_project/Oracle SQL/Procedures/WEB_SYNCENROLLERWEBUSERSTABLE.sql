CREATE OR REPLACE PROCEDURE web_syncEnrollerWebUsersTable(
   pUpdatedBy VARCHAR2)
AS
BEGIN 

   INSERT INTO web_users(id, webUserRoleId, userId, updated, updatedBy)
   SELECT web_user_Seq.NEXTVAL, 
      u.webUserRoleId, 
      u.userId, 
      SYSDATE, 
      pUpdatedBy
   FROM users u 
   LEFT JOIN web_users wu ON 
      u.userId=wu.userId
   WHERE wu.UserId IS NULL AND 
      u.webUserRoleId IS NOT NULL;
   COMMIT;      
END;
/