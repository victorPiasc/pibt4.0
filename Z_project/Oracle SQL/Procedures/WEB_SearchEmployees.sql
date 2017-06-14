CREATE OR REPLACE PROCEDURE Web_SearchEmployees(
   pEmployerId IN  VARCHAR2,
   pOptionId   IN  VARCHAR2, -- 0=All  1=Active  2=Newhire
   pClue       IN  VARCHAR2,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   CASE pOptionId
      WHEN '0' THEN -- All
         OPEN v_refcur FOR
            SELECT DISTINCT *
            FROM web_searchEmployees_V
            WHERE employerId=pEmployerId AND
               (  pClue IS NULL OR
                  UPPER(name) LIKE '%'||UPPER(pClue)||'%' OR
                  UPPER(loginName) LIKE '%'||UPPER(pClue)||'%' OR
                  TO_CHAR(employeeId)=pClue)
            ORDER BY name;
      WHEN '1' THEN -- Active
         OPEN v_refcur FOR
            SELECT DISTINCT m.*
            FROM web_searchEmployees_V m
            JOIN memberPlanNoBogus mp ON
               m.employeeId=mp.memberId AND
               TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate,'31-Dec-9999')
            WHERE m.employerId=pEmployerId AND
               (  pClue IS NULL OR
                  UPPER(m.name) LIKE '%'||UPPER(pClue)||'%' OR
                  UPPER(m.loginName) LIKE '%'||UPPER(pClue)||'%' OR
                  TO_CHAR(m.employeeId)=pClue)
            ORDER BY m.name;
      ELSE -- Newhire
         OPEN v_refcur FOR
            SELECT DISTINCT v.*
            FROM web_searchEmployees_V v
            JOIN web_memberEffectiveDate_V mv ON
               v.employeeId=mv.memberId AND
               (  TRUNC(SYSDATE)<=mv.HireEffectiveDate OR
                  TRUNC(SYSDATE)<mv.hireDate)
            LEFT JOIN memberPlanNoBogus mp ON
               v.employeeId=mp.memberId
            WHERE v.employerId=pEmployerId AND
               mp.memberId IS NULL AND
               (  pClue IS NULL OR
                  UPPER(v.name) LIKE '%'||UPPER(pClue)||'%' OR
                  UPPER(v.loginName) LIKE '%'||UPPER(pClue)||'%' OR
                  TO_CHAR(v.employeeId)=pClue)
            ORDER BY v.name;
   END CASE;
END;
