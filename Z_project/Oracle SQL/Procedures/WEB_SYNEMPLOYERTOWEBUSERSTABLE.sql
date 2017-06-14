CREATE OR REPLACE PROCEDURE PIA_ADMIN.Web_SynEmployerToWebUsersTable(
   pWebUserRoleId VARCHAR2,
   pUserId        VARCHAR2,
   pUpdatedBy     VARCHAR2)
AS
BEGIN
   INSERT INTO web_users(id, webUserRoleId, employerId, updated, updatedBy)
      SELECT web_user_seq.NEXTVAL,
	     4,
         e.employerId,
		 SYSDATE,
		 pUpdatedBy
      FROM employer e
	  LEFT JOIN web_users wu ON
		 e.employerId=wu.employerId AND
		 wu.webUserRoleId=4
	  WHERE wu.employerId IS NULL;
   COMMIT;
END;
/