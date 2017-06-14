CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETDEPTAVALIBLEPLANSBYTYPE"
(
   Pplantypeid In  Varchar2,
   PEmployeeid In  Varchar2,
   V_Refcur    Out Sys_Refcursor
)
As
Begin
   Open V_Refcur For
      SELECT
         c.name CarrierName,
         mp.planid,
         p.planname
      FROM memberPlanNoBogus mp,
         carrier c,
         plans p,
         treason tr
      WHERE TRUNC(SYSDATE)<=NVL(mp.expiryDate,'31-Dec-9999') AND
         nvl(mp.expirydate,'31-dec-9999') > mp.effectivedate AND
         mp.planid = p.planid AND
         p.carrierid = c.carrierid AND
         p.carrierid <> 0  AND
         p.plantypeid = Pplantypeid AND --Pplantypeid
         NVL(mp.treasonid,0) = tr.treasonid AND
         Mp.Memberid = Pemployeeid  -- pMemberId
      Group By
         c.name,
         Mp.Planid,
         p.planname
      union
      select
         eep.CarrierName,
         pp.planIdTwo,
         p.planname
      from
         pairedPlans pp,
         plans p,
         (  SELECT
               c.name CarrierName,
               mp.planid,
               p.planname
            FROM memberPlanNoBogus mp,
               carrier c,
               plans p,
               treason tr
            WHERE TRUNC(SYSDATE)<=NVL(mp.expiryDate,'31-Dec-9999') AND
               nvl(mp.expirydate,'31-dec-9999') > mp.effectivedate AND
               mp.planid = p.planid AND
               p.carrierid = c.carrierid AND
               p.carrierid <> 0  AND
               p.plantypeid = Pplantypeid AND --Pplantypeid
               NVL(mp.treasonid,0) = tr.treasonid AND
               Mp.Memberid = Pemployeeid  -- pMemberId
            Group By
               c.name,
               Mp.Planid,
               p.planname) eep
      where
         pp.planidOne=eep.planid and
         pp.planIdTwo = p.planid;
end;
/
