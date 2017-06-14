create or replace 
PROCEDURE WEB_GetOtherChargeByEmployer
(
  PemployerId In Varchar2,
  V_Refcur Out Sys_Refcursor
) As 
Begin
Open V_Refcur for
  Select 
  Employerid, 
  Description, 
  Chargeamount 
  From Web_Currentothercharge_V 
  WHERE (EMPLOYERID = PemployerId);
End;