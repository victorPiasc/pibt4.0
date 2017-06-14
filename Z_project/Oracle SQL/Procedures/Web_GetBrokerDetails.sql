CREATE OR REPLACE PROCEDURE Web_GetBrokerDetails(
   pBrokerId IN  VARCHAR2,
   v_refcur  OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT b.brokerId,
         b.name,
         wu.webName loginName,
         b.eMail,
         b.contact,
         b.phone,
         wu.IsLockout,
         wu.LastLoginIP,
         wu.LastLoginTime,
         wu.Updated,
         wu.UpdatedBy
      FROM broker b
      JOIN web_users wu ON
         b.brokerId=wu.brokerId
      WHERE b.brokerId=pBrokerId;
END;
