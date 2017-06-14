CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETACTIVEPLANSBYPLANTYPEID"
(  pEmployeeID in  VARCHAR2,
   pPlanTypeId in  VARCHAR2,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   Open V_Refcur For
      Select
         M.Lastname||', '|| M.Firstname||' '|| M.Middlename fullName,
         DECODE(m.employeeType,0,'Employee',1,'Spouse',2,'Child','Domestic Partner') employeeType,
         Mp.Memberplanid,
         mp.memberid,
         c.name,
         pt.description,
         p.plantypeid,
         mp.planid,
         p.planname,
         TO_CHAR(mp.effectiveDate,'MM/DD/YYYY') effectiveDate,
         TO_CHAR(mp.expiryDate,'MM/DD/YYYY') expiryDate,
         tr.reason
      FROM
         memberPlanNoBogus mp,
         carrier c,
         plans p,
         Plantype Pt,
         Treason Tr,
         member m
      Where
         TRUNC(SYSDATE)<NVL(mp.expirydate,'31-dec-9999') AND
         mp.planid = p.planid AND
         p.carrierid = c.carrierid AND
         p.plantypeid = pt.plantypeid AND
         Nvl(Mp.Treasonid,0) = Tr.Treasonid And
         m.memberid=mp.memberid and
         Mp.Employeeid = pEmployeeID and
         p.planTypeId = pPlanTypeId
      ORDER BY
         mp.expirydate desc,
         pt.description;
end;
/
