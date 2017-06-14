CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_SEARCHEEACTIVEPLANS"
(
   PemployerId    Varchar2,
   PemployeeId    Varchar2,
   Pusername      Varchar2,
   PplanName      Varchar2,
   pEffectiveDate date,
   Pexpirydate    Date,
   pPlanId        varchar2,
   v_refcur       OUT SYS_REFCURSOR)
AS
Begin
   open v_refcur for
      SELECT
         wev.MEMBERPLANID,
         wev.MEMBERID,
         wev.EMPLOYERID,
         wev.EMPLOYEEID,
         wev.NAME carrierName,
         wev.employeeName,
         m.lastName||', '|| m.firstName||' '|| m.middleName MemberName,
         wev.PLANID,
         wev.PLANNAME,
         wev.PLANTYPEID,
         wev.DESCRIPTION plantype,
         wev.EFFECTIVEDATE,
         wev.EXPIRYDATE,
         wev.REASON,
         Decode(m.EmployeeType,0,'Employee',1,'Spouse',2,'Child',3,'Domestic Partner',' ') employeeType
      From Web_Eeactiveplans_V Wev
      Left Join Member M
         on wev.MEMBERID=M.Memberid
      Where wev.EMPLOYERID= PemployerId
         and (Instr(Upper(wev.EMPLOYEEID),Upper(PemployeeId))=1 Or PemployeeId Is Null)
         and (Instr(Upper(wev.PLANID),Upper(pPlanId))=1 Or pPlanId Is Null)
         And (instr(Upper(wev.PLANNAME),Upper(PplanName))=1 Or PplanName Is Null)
         And (Instr(Upper(wev.employeeName),Upper(Pusername))=1 Or Pusername Is Null)
         And (Trunc(nvl(pEffectiveDate,'31-dec-9999'),'mm')=wev.EFFECTIVEDATE or pEffectiveDate is null)
         And (Last_Day(Nvl(Pexpirydate,'31-dec-9999'))=Nvl(Wev.Expirydate,'31-dec-9999') Or Pexpirydate Is Null)
         and TRUNC(SYSDATE)<=Nvl(Pexpirydate,'31-dec-9999')
      order by m.EmployeeType;
End;
/