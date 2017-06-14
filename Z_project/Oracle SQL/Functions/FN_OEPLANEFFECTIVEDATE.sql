CREATE OR REPLACE FUNCTION PIA_ADMIN."FN_OEPLANEFFECTIVEDATE"(
   pMemberId   VARCHAR2,
   pEmployerId VARCHAR2,
   pOETypeId   NUMBER)
RETURN DATE AS
   vReturn DATE;
BEGIN
   CASE pOETypeId WHEN 4 THEN
      SELECT MAX(planEffectiveDate) INTO vReturn
        FROM oe_window
        WHERE employerId=pEmployerId AND
           TRUNC(SYSDATE) BETWEEN oeFromMonth AND oeToMonth;
      IF vReturn IS NULL THEN
         SELECT MAX(planEffectiveDate) INTO vReturn
            FROM oe_window
            WHERE employerId=0 AND
               TRUNC(SYSDATE) BETWEEN oeFromMonth AND oeToMonth;
      END IF;
   WHEN 3 THEN
      vReturn := ADD_MONTHS(TRUNC(SYSDATE,'MM'),1);
   ELSE
      SELECT CASE pOETypeId WHEN 1 THEN hireEffectiveDate
                            WHEN 2 THEN bornEffectiveDate
                            WHEN 5 THEN marryEffectiveDate END INTO vReturn
         FROM web_memberEffectiveDate_v
         WHERE memberId=pMemberId;
   END CASE;
   RETURN vReturn;
END;
/