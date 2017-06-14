CREATE OR REPLACE VIEW WEB_EEACTIVEPLANS_V
AS
   SELECT mp.memberplanid,
         mp.memberid,
         mp.employerid,
         mp.employeeid,
         c.name,
         m.lastName || ', ' || m.firstName || ' ' || m.middleName
            employeeName,
         pt.description,
         p.plantypeid,
         mp.planid,
         P.Planname,
         mp.effectivedate,
         mp.expirydate,
         tr.reason
    FROM memberPlanNoBogus mp,
         carrier c,
         plans p,
         plantype pt,
         treason tr,
         MEMBER m
   WHERE     TRUNC (SYSDATE) BETWEEN mp.effectiveDate AND NVL (mp.expiryDate, '31-Dec-9999')
         AND mp.planid = p.planid
         AND p.carrierid = c.carrierid
         AND p.plantypeid = pt.plantypeid
         AND NVL (mp.treasonid, 0) = tr.treasonid
         AND mp.employeeid = m.memberid
   ORDER BY mp.expirydate DESC, pt.description;
