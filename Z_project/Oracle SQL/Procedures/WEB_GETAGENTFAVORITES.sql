CREATE OR REPLACE PROCEDURE WEB_GETAGENTFAVORITES
(
    pWebUserId IN Varchar2,
    v_refcur OUT Sys_RefCursor 
)
AS
BEGIN
OPEN v_refcur FOR
   SELECT 
      FavoriteId,
      WebUserId, 
      EmployerId, 
      Updated, 
      UpdatedBy
   FROM AgentFavorite
   WHERE WebUserId = pWebUserId;

END;