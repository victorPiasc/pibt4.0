CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_getBrokerAgents(
   pBrokerId IN VARCHAR2,
   pRole IN NUMBER, 
   v_refcur OUT SYS_REFCURSOR)
AS 
BEGIN
   OPEN v_refcur FOR 
      SELECT b.*,
         b.firstName||' '||b.lastName fullname,
         CASE WHEN b.manager IS NULL THEN 'MANAGER' ELSE 'AGENT' END status
      FROM brokerAgent b
      WHERE b.brokerId=pBrokerId AND 
         (  pRole=0 OR 
            pRole=1 AND b.manager IS NULL OR 
            pRole=2 AND b.manager IS NOT NULL); 
END;
/
