CREATE OR REPLACE PROCEDURE WEB_GETEMPLOYEEACTIVEPLANS(  
   pEmployeeID IN  VARCHAR2,
   v_refcur    OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT
         M.Firstname,
         DECODE(m.employeeType,0,'Employee',1,'Spouse',2,'Child','Domestic Partner') employeeType,
         Mp.Memberplanid,
         mp.memberid,
         c.name,
         pt.description,
         p.plantypeid,
         mp.planid,
         p.planname,
         TO_CHAR(mp.effectivedate,'MM/DD/YYYY') effectiveDate,
         TO_CHAR(mp.expirydate,'MM/DD/YYYY') expiryDate
      FROM memberPlanNoBogus mp
      JOIN member m ON
         m.memberid=mp.memberid
      JOIN plans p ON
         mp.planid = p.planid
      JOIN carrier c ON
         p.carrierid = c.carrierid
      JOIN planType pt ON
         p.plantypeid = pt.plantypeid
      WHERE TRUNC(SYSDATE)<=NVL(mp.expiryDate,'31-Dec-9999') AND
         mp.Employeeid = pEmployeeId AND 
         NVL(mp.treasonId,0)=0
      ORDER BY m.employeeType, p.planTypeId;
END;
/