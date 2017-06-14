CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETOEVTLPLANS" (
   pCartId   IN  NUMBER,
   pOeTypeId IN  VARCHAR2,
   v_refcur  OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT wc.employeeTypeId,
         wc.memberId,
         wc.employeeName,
         f.planId,
         f.planName,
         NVL(efp.insuranceAmount, wc.vtl_insuranceAmount) vtl_insuranceAmount,
         CASE WHEN wc.employeeTypeId=0 THEN f.rates ELSE NVL(f.depRates,0) END rates,
         m.smoker,
         CASE WHEN efp.memberId IS NOT NULL AND f.carrierId<>0 THEN 'Y' ELSE 'N' END hasPlan
      FROM web_qqCart wc
      JOIN member m ON
         wc.memberId=m.memberId
      JOIN findWebRatesReport f ON
         f.cart=wc.cart AND
         wc.employeeTypeId=f.employeeTypeId AND
         f.carrierId NOT IN (0,133) AND
         f.planTypeId=6
      JOIN web_oeCart oc ON
         wc.cart=oc.cart
      LEFT JOIN pairedPlans pp ON
         f.planId=pp.planIdOne
      LEFT JOIN plans p ON
         pp.planIdOne=p.planId
      LEFT JOIN web_enrollerFormPlans efp ON
         oc.oeId=efp.oeId AND
         efp.planId IN ( pp.planIdOne, pp.planIdTwo, f.planId) AND
         m.memberId=efp.memberId AND
         NVL(efp.treasonId,0)=0
      WHERE wc.cart=pCartId AND
         (  pp.planIdOne IS NULL OR
            m.smoker = CASE WHEN UPPER(p.planName) LIKE '%NON%' THEN 'N' ELSE 'Y' END) AND
         (  pOeTypeId IN (1,4) OR
            pOeTypeId=2 AND fn_checkisnewbornandnotplans(m.memberId)='true' OR
            pOeTypeId=5 AND fn_checkIsNewMarryAndNotPlans(m.memberId)='true')
      ORDER BY 1,3;
END;
/
