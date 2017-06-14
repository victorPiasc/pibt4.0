CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_CHECKEMPLOYEEHASPLAN"
(
    pMemberId IN VARCHAR2,
    pPlanId IN  VARCHAR2,
    v_refcur OUT SYS_REFCURSOR
)
AS
BEGIN
   OPEN v_refcur for
      select count(1)
      FROM memberPlanNoBogus
      where memberid=pMemberId and
         planid=pPlanId and
         TRUNC(SYSDATE)<=NVL(expiryDate,'31-Dec-9999');
END;
/