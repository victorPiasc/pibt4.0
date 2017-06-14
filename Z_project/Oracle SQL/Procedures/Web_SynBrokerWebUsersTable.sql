CREATE OR REPLACE PROCEDURE PIA_ADMIN.Web_SynBrokerWebUsersTable(
   pUpdatedBy VARCHAR2)
AS
BEGIN
   INSERT INTO web_users(id, webUserRoleId, brokerId, updated, updatedBy)
      SELECT Web_user_seq.NEXTVAL,
         7,
         b.brokerId,
         SYSDATE,
         pUpdatedBy
      FROM broker b
      LEFT JOIN web_users wu ON
         b.brokerId=wu.brokerId
      WHERE wu.brokerId IS NULL;
   COMMIT;
END;