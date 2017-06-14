CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETMEMBERPLANDETAILS"
(  pMemberID in  VARCHAR2,
   v_refcur  OUT SYS_REFCURSOR)
AS
BEGIN
   open v_refcur for
      SELECT
         mp.memberid,
         c.name,
         pt.description,
         p.plantypeid,
         mp.planid,
         p.planname,
         TO_CHAR(mp.effectiveDate,'MM/DD/YYYY') effectiveDate,
         TO_CHAR(mp.expiryDate,'MM/DD/YYYY') expiryDate,
         tr.reason,
         TO_CHAR(SYSDATE,'MM/DD/YYYY') lastChanged,
         CASE WHEN mp.expiryDate IS NULL THEN 'style="display:none;"' END dateHider,
         CASE WHEN mp.expiryDate IS NOT NULL THEN 'style="display:none;"' END buttonHider
      FROM
         memberPlanNoBogus mp,
         carrier c,
         plans p,
         plantype pt,
         treason tr
      WHERE TRUNC(SYSDATE)<=NVL(ADD_MONTHS(mp.expiryDate,6),'31-Dec-9999') AND
         NVL(mp.expiryDate,'31-Dec-9999')>mp.effectiveDate AND
         mp.planid = p.planid AND
         p.carrierid = c.carrierid AND
         p.plantypeid = pt.plantypeid AND
         NVL(mp.treasonid,0) = tr.treasonid AND
         mp.memberid = pMemberID
      ORDER BY mp.expiryDate DESC, p.planTypeId;
END;
/