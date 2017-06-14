CREATE OR REPLACE PROCEDURE web_getAllMembersPlans(
   pMemberId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS 
BEGIN
   OPEN v_refcur FOR 
      SELECT wv.planname,
         pt.description
      FROM web_eeCurrentPlans_v wv
      JOIN plans p ON
         wv.planId = p.planId AND
         p.carrierId <> 0
      JOIN planType pt ON 
         p.planTypeId = pt.planTypeId         
      WHERE memberId = pMemberId;
END;           