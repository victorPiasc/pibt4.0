CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_ENROLLMENTPDFPLANS" (
   pEmployerId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
   vEffectiveDate DATE;
BEGIN
   web_OE_Enddate(pEmployerId, vEffectiveDate);

   OPEN v_refcur FOR
      WITH firstCut AS(
         SELECT p.planid,
            p.planName,
            pt.description,
            pt.planTypeId,
            p.carrierId
         FROM employerPlans ep
         JOIN plans p ON
            ep.planId=p.planId
         JOIN planType pt ON
            p.planTypeId=pt.planTypeId
         WHERE ep.employerId=pEmployerId AND
            p.planTypeId NOT IN(5,9) AND
            TRUNC(vEffectiveDate) BETWEEN NVL(ep.startDate,'01-JAN-0001') AND NVL(ep.endDate, '31-DEC-9999'))
      SELECT planId,
         planName,
         description,
         planTypeId,
         carrierId
      FROM firstCut
      UNION
      SELECT p.planId,
         p.planName,
         pt.description,
         pt.planTypeId,
         p.carrierId
      FROM firstCut fc
      JOIN plans p ON
         fc.planTypeId=p.planTypeId AND
         p.carrierId=0 AND
         p.subPlanTypeID=0
      JOIN planType pt ON
         p.planTypeId=pt.planTypeId
      WHERE p.planId<>0
      ORDER BY planTypeId, carrierId desc;
END;
/
