CREATE OR REPLACE PROCEDURE PIA_ADMIN.WEB_INSERTWEBUSER(
   pWebUserRoleId IN VARCHAR2,
   pWebName       IN VARCHAR2,
   pUserId        IN VARCHAR2,
   pEmployerId    IN VARCHAR2,
   pEmployeeId    IN VARCHAR2,
   pMemberId      IN VARCHAR2,
   pBrokerId      IN VARCHAR2,
   pUpdatedBy     IN VARCHAR2)
AS
   varNewWebUserId Integer;
   varCount Integer;
BEGIN
   varNewWebUserId := 0;
   varCount := 0;
   -- Check if current user exists in BMS web_users table.
   -- For admin, agent, rk, enroller web account
   CASE 
      WHEN pWebUserRoleId IN(1,2,3,8) THEN
         SELECT COUNT(1) INTO varCount
         FROM web_users
         WHERE webUserRoleId = pWebUserRoleId AND
            userid = pUserId;
            
         IF varCount > 0 THEN
            SELECT id INTO varNewWebUserId
            FROM web_users
            WHERE webUserRoleId = pWebUserRoleId AND
               Userid = pUserId;
         END IF;
      WHEN pWebUserRoleId = 4 THEN
         SELECT COUNT(1) INTO varCount
         FROM web_users
         WHERE webUserRoleId = pWebUserRoleId AND
            employerid = pEmployerId;                               -- For employer

         IF varCount > 0 THEN
            SELECT id INTO varNewWebUserId
            FROM web_users
            WHERE webUserRoleId = pWebUserRoleId AND
               employerid = pEmployerId;
         END IF;
      WHEN pWebUserRoleId IN (5,6) THEN
         SELECT COUNT(1) INTO varCount
         FROM web_users
         WHERE webUserRoleId = pWebUserRoleId AND
            memberid = pMemberId;                                       -- For employee , dependent

         IF varCount > 0 THEN
            SELECT id INTO varNewWebUserId
            FROM web_users
            WHERE webUserRoleId = pWebUserRoleId AND
               memberid = pMemberId;
         END IF;
      WHEN pWebUserRoleId = 7 THEN
         SELECT COUNT(1) INTO varCount 
         FROM web_users
         WHERE webUserRoleId = pWebUserRoleId AND 
            brokerId = pBrokerId;
            
         IF varCount > 0 THEN 
            SELECT id INTO varNewWebUserId
            FROM web_users
            WHERE webUserRoleId = pWebUserRoleId AND 
               brokerId = pBrokerID;
         END IF;                 
   END CASE;

                                                                 --IF   current user exists in BMS web_users table
   IF varNewWebUserId > 0 THEN                                   --THEN update web_users info
      UPDATE web_users
      SET webname = pWebName,
         updated = SYSDATE,
         updatedBy = pUpdatedBy
      WHERE id = varNewWebUserId;
   ELSE                                                       --ELSE insert current user info into web_users table
      SELECT web_user_seq.NEXTVAL
      INTO varNewWebUserId
      FROM dual;

      INSERT INTO  web_users(id, webUserRoleId, webName, userId, employerId, employeeId, memberId, brokerId, updated, updatedBy)
       VALUES (  varNewWebUserId, pWebUserRoleId, pWebName, pUserId, pEmployerId, pEmployeeId, pMemberId, pBrokerId, SYSDATE, pUpdatedBy );
   END IF;

   -- For admin, agent, rk web account, we need update BMS users table info too.
   IF pWebUserRoleId IN (1,2,3) THEN
        UPDATE users
        Set webUserRoleId=pWebUserRoleId,
           updated=SYSDATE,
           updatedBy=pUpdatedBy
        WHERE userId=pUserId;
   END IF;

   COMMIT;

END;
/