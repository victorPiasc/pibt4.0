CREATE OR REPLACE PROCEDURE
(
   pWebUserId in VARCHAR2,
   pEmployerId in VARCHAR2,
   UpdatedBy in VARCHAR2,
   v_refcur out SYS_REFCURSOR
)
AS
BEGIN
   INSERT INTO AgentFavorite
   (SELECT 1,  
    FROM DUAL
    WHERE 
       NOT EXISTS
          (SELECT NULL 
           FROM AgentFavorite 
           WHERE EmployerId = pEmployerId
           AND WebUserId = pWebUserId));
   COMMIT;
END;                                      

