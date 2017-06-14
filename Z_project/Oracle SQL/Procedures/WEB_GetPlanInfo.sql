CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETPLANIFO" (
    pEmployerZip           IN NUMBER,
    v_refcur OUT SYS_REFCURSOR
)
AS
   vAgentID       NUMBER;
BEGIN
   SELECT distinct
       CASE WHEN stateCode='GA' THEN 4
            WHEN stateCode<>'CA' THEN 1
                  WHEN county IN('San Louis Obispo','Santa Barbara','Ventura','Los Angeles','Orange','Kern','San Bernardino','Riverside',
                                 'Imperial') THEN 1
                WHEN county='San Diego' THEN 3
                  ELSE 2 END agency
      INTO vAgentID
   FROM newZipCode
   WHERE zipCode=pEmployerZip;


    OPEN v_refcur For
        SELECT DISTINCT
           pt.plantypeid,
           pt.DESCRIPTION ,
           pt.sortSeq
        From
           plans p,
           agencyPlan a,
           planType pt
        WHERE
          p.planTypeId = pt.planTypeId and
          p.planId = a.planID and
          a.agencyId = vAgentID and 
          a.onweb = 'Y' and 
          p.planTypeId <> 7
        order by pt.sortSeq;

END;
/