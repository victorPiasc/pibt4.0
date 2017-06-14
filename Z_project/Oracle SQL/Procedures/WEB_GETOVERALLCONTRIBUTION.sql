CREATE OR REPLACE PROCEDURE web_getOverallContribution(
   pEmployerId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR 
      SELECT contribution,
         contributionDep
      FROM employer 
      WHERE employerId=pEmployerId;
END;