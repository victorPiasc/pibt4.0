CREATE OR REPLACE PROCEDURE PIA_ADMIN.WEB_GETOELIFECOVERAGE
(   poeId IN VARCHAR2,
    v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
   SELECT DISTINCT oec.oeId, 
      oec.planTypeId, 
      oec.description, 
      oec.rateBasis
   FROM web_oeLifeCoverage_v oec
   JOIN web_enrollerFormPlans_v efp ON
      oec.oeId = efp.oeId AND
      oec.planId = efp.planId
   WHERE oec.oeId = poeId AND
      efp.memberId = efp.employeeid;
END;
/
