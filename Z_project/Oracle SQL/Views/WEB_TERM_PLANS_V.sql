CREATE OR REPLACE VIEW WEB_TERM_PLANS_V
AS
SELECT
     M.Firstname,
     m.employeeid,
     m.employeeType,
	 Decode(employeeType,0,'Employee',1,'Spouse',2,'Child','Domestic Partner') employeeTypeText,
     Mp.Memberplanid,
     mp.memberid,
     p.plantypeid,
     pt.description,
     mp.planid,
     p.planname,
     NVL(mp.expirydate, '31-DEC-9999') expiryDate,
     ap.agencyid
FROM
     memberPlanNoBogus mp,
     plans p,
     plantype pt,
     Treason Tr,
     member m,
     agencyplan ap,
     employer er
WHERE
     mp.expirydate IS NULL AND
     mp.planid = p.planid AND
     p.plantypeid = pt.plantypeid AND
     Nvl(Mp.Treasonid,0) = Tr.Treasonid AND
     ap.planid = mp.planid AND
     er.agencyid = ap.agencyid AND 
     m.employerid = er.employerid AND
     m.memberid=mp.memberid
ORDER BY m.employeeType, p.plantypeid;