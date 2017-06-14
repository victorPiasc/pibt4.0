CREATE OR REPLACE PROCEDURE web_getPlanEffectiveDate(
   pEmployerId IN VARCHAR2,
   pDate OUT DATE)
AS
BEGIN
   SELECT NVL(oe2.planEffectiveDate,oe.planEffectiveDate) INTO pDate
   FROM oe_window oe
   LEFT JOIN oe_window oe2 ON
      oe2.employerId=pEmployerId
   WHERE oe.employerId=0;
END;
