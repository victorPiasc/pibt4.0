CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_OEPLANSPAGECHECK" (
   pOeId IN VARCHAR2,
   pEmployerId IN VARCHAR2,
   pOeType IN NUMBER,
   pErrorNum OUT NUMBER)
AS
   vCount INTEGER;
   vRtnMsg VARCHAR2(5);
BEGIN
   --Checks to make sure only one spouse exist
   pErrorNum:=0;
   SELECT COUNT(DISTINCT w.memberId) INTO vCount
   FROM web_enrollerFormPlans w
   JOIN member m ON
      w.memberId=m.memberId
   WHERE w.oeId=pOeId AND
      m.employeeType IN(1,3);

   IF vCount>1 THEN
     pErrorNum:=1;
     RETURN;
   END IF;

   --if Open Enrollment or new hire, checks to make sure all plans have been selected
   IF pOeType IN (1,4) THEN
      SELECT SUM(CASE WHEN MAX(fp.planId) IS NULL THEN 1 ELSE 0 END) INTO vCount
      FROM employerPlans ep
      JOIN plans p ON
         ep.planId=p.planId AND
         p.planTypeId NOT IN (5,6,9) AND 
       (p.carrierId>0 OR UPPER(p.planName) LIKE '%DECLIN%')
      LEFT JOIN web_enrollerFormPlans fp ON
         ep.planId=fp.planId AND
         fp.oeId=pOeId AND
         fp.employeeId=fp.memberId AND
         NVL(fp.treasonId,0)=0
      WHERE ep.employerId=pEmployerId AND
         TRUNC(SYSDATE) BETWEEN NVL(ep.startDate,'01-jan-0001') AND NVL(ep.endDate,'31-DEC-9999')
      GROUP BY p.planTypeId;

      IF vCount>0 THEN
         pErrorNum:=2;
         RETURN;
      END IF;
   END IF;

   web_checkOeAgencyPINCPlans(pOeId, vRtnMsg);
   IF vRtnMsg='false' THEN
      pErrorNum:=3;
   END IF;
END;
/
