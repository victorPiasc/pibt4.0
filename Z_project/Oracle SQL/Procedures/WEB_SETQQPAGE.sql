CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_setQQpage(
   pCartId IN NUMBER,
   v_refcur OUT SYS_REFCURSOR)
AS    
BEGIN
   OPEN v_refcur FOR 
      SELECT CASE WHEN NVL(MAX(ept.contribution),0)=0 THEN 'N' ELSE 'Y' END isOverall,    
         CASE WHEN NVL(MAX(ept.ofBase),'N')='Y' OR MAX(er.ofBase)='Y' THEN 'Y' ELSE 'N' END ofBase, --defaults to N if record exist, but record might not always exist     
         CASE WHEN NVL(MAX(ept.basePlanId),0)=0 THEN 'N' ELSE 'Y' END basePlan,
         CASE WHEN NVL(MAX(er.dollar),0)=0 THEN 'N' ELSE 'Y' END dollar
      FROM web_qqEmployer er 
      LEFT JOIN web_qqEmployerPlanType ept ON 
         er.cart=ept.cart
      WHERE er.cart=pCartId
      GROUP BY er.cart;    
END;
/
