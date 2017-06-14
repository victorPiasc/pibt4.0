CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_CHECKDEPTACTIVEPLANS"
(
  pEmployeeId In Varchar2,
  pEmployeeTypId In Varchar2,
  V_Refcur Out Sys_Refcursor
)
As
Begin
   Open V_Refcur For
      Select
         Count(1)
      FROM memberPlanNoBogus mp,
         Member M
      Where
         Mp.memberid=M.memberid and
         Nvl(Mp.Treasonid,0)=0 And
         TRUNC(SYSDATE)<=NVL(mp.expiryDate,'31-dec-9999') AND
         Mp.Employeeid=Pemployeeid And
         M.Employeetype=pEmployeeTypId;
end;
/