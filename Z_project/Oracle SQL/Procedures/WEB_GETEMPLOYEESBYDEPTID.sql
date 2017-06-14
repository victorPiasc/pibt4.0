Create Or Replace 
Procedure Web_GetEmployeesByDeptId
(
 pDeptId in varchar2,
 V_Refcur Out Sys_Refcursor
)
as
Begin
Open V_Refcur For
  Select 
  Memberid
  From Member 
  Where (Deptid = Pdeptid) 
  and Employeetype=0
  ORDER BY Firstname;
End;
 