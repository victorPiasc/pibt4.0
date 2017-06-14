CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_CHECKEEACTIVEPLANBYTYPE"
(  Pemployeeid In Varchar2,
   pPlanType in varchar2,
   v_refcur OUT SYS_REFCURSOR )
AS
BEGIN
   open v_refcur for
      Select
         count(1) planCount
      FROM memberPlanNoBogus mp,
         Plans P
      Where Mp.Planid=P.Planid
         AND TRUNC(SYSDATE) BETWEEN mp.effectiveDate AND NVL(mp.expiryDate,'31-Dec-9999')
         And Mp.Employeeid=Pemployeeid
         and P.Plantypeid=Pplantype;
END;
/