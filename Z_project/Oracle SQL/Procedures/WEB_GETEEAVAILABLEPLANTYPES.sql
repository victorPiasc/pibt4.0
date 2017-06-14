CREATE OR REPLACE PROCEDURE PIA_ADMIN.Web_GetEEAvailablePlanTypes(
   pEmployeeId IN  VARCHAR2,
   pOeId       IN  VARCHAR2,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      WITH availableMembers AS(
        SELECT m.memberId
         FROM member ee
         LEFT JOIN oe_window w1 ON
            ee.employerId=w1.employerId
         JOIN oe_window w2 ON
            w2.employerId=0
         JOIN member m ON
           ee.employeeId=m.employeeId
         WHERE ee.memberId=TO_NUMBER(pEmployeeId) AND
            (  TRUNC(SYSDATE) BETWEEN NVL(w1.oeFromMonth,w2.oeFromMonth) AND NVL(w1.oeToMonth,w2.oeToMonth) OR
               ee.hireDate>=TRUNC(SYSDATE)-30 OR
               m.employeeType=1/*sp*/ AND m.marriageDate>=TRUNC(SYSDATE)-30 OR
               m.employeeType=2/*kid*/ AND m.birthdate>=TRUNC(SYSDATE)-30)),
      availableTypes AS(
         SELECT DISTINCT cp.planTypeId
            FROM member m
         JOIN web_erCurrentPlans_v cp ON
            m.employerId=cp.employerId
         LEFT JOIN memberPlanNoBogus mp ON
            cp.planid = mp.planId AND
            mp.memberId = TO_NUMBER(pEmployeeId) AND
            TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate, '31-dec-9999')
         WHERE m.memberId=TO_NUMBER(pEmployeeId)AND
         cp.planTypeId NOT IN (5,9)AND 
         cp.carrierId <> 0 AND
         (mp.planId IS NOT NULL OR
          TO_NUMBER(pEmployeeId) IN (SELECT memberId FROM availableMembers)) AND
          (cp.plantypeid NOT IN (6,7,10,11) OR m.hoursworked >= 20)),
      whoIsOnForm AS(
         SELECT am.memberId,
            p.planTypeId
         FROM availableMembers am
         JOIN web_enrollerFormPlans efp ON
            am.memberId=efp.memberId AND
            efp.oeId=TO_NUMBER(pOeId)
                  JOIN plans p ON
            efp.planId=p.planId)
      SELECT at.planTypeId,
         MAX(description) description,
         MAX(sortSeq) sortSeq
      FROM availableMembers am
      CROSS JOIN availableTypes at
      LEFT JOIN whoIsOnForm w ON
         am.memberId=w.memberId AND
         at.planTypeId=w.planTypeId
      JOIN planType pt ON
         at.planTypeId=pt.planTypeId
      WHERE w.memberId IS NULL
      GROUP BY at.planTypeId
      ORDER BY 3;
END;
/
