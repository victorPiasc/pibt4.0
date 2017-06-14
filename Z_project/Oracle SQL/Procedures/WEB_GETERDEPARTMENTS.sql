create or replace 
Procedure Web_GetErDepartments
(
  pEmployerId in varchar2,
 V_Refcur Out Sys_Refcursor
)
as
Begin
Open V_Refcur For
  Select 
  Deptid, 
  Description Name,
  deptcode,
  TO_CHAR(deptcode) ||' | ' || description description
  From Department 
  Where (Employerid = Pemployerid) 
  ORDER BY DESCRIPTION;
end;