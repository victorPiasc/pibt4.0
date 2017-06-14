CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETPDFORREPORT" (
    pCartId     IN  NUMBER,
    pDate       IN  VARCHAR2,
    pPlanTypeID IN  NUMBER,
    v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT carrierName, planName, benefitName, cssClass, description, sortOrder
      FROM(
         WITH firstCut AS(
            SELECT c.name carrierName,
               p.planName,
               bh.name benefitName,
               bh.cssClass,
               b.description,
               bh.sortOrder
            FROM benefit b
            JOIN benefitHeader bh ON
               b.shortName = bh.shortName
            JOIN plans p ON
               b.planId = p.planId
            JOIN carrier c ON
               p.carrierId = c.carrierId
            WHERE b.planId IN(
                  SELECT planId
                  FROM WEB_QQCOMPARECART
                  WHERE cart=pCartId) AND
                  TO_DATE(pDate,'mm-dd-yyyy') BETWEEN b.effective AND b.effective+365 AND
               p.planTypeId = pPlanTypeId)
          SELECT carrierName,planName, benefitName, cssClass, description, sortOrder
          FROM firstCut
          UNION ALL
          SELECT DISTINCT fc.carrierName,
             fc.planName,
             bh.name benefitName,
             bh.cssClass,
             '' description,
             bh.sortOrder
          FROM firstCut fc
          LEFT JOIN firstCut y ON
             fc.planName=y.planName AND
             MOD(fc.sortOrder, 10)>0 AND
             TRUNC(fc.sortOrder/10)*10=y.sortOrder
          JOIN benefitHeader bh on
             MOD(fc.sortOrder, 10)>0 AND
             TRUNC(fc.sortOrder/10)*10=bh.sortOrder
          WHERE y.sortOrder IS NULL
          UNION ALL
          SELECT DISTINCT fc.carrierName,
             fc.planName,
             bh.name benefitName,
             bh.cssClass,
             '' description,
             bh.sortOrder
          FROM firstCut fc
          LEFT JOIN firstCut y ON
             fc.planName=y.planName AND
             MOD(fc.sortOrder, 100)>0 AND
             TRUNC(fc.sortOrder/100)*100=y.sortOrder
          JOIN benefitHeader bh on
             MOD(fc.sortOrder,100)>0 AND
             TRUNC(fc.sortOrder/100)*100=bh.sortOrder
          WHERE y.sortOrder IS NULL) x
    ORDER BY sortOrder, UPPER(carrierName), UPPER(planName);

END;
/
