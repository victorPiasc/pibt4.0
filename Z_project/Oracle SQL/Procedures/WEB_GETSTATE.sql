create or replace 
Procedure Web_Getstate
(
 V_Refcur Out Sys_Refcursor
)
as
Begin
Open V_Refcur For
  Select 
    Stateid, 
    Name 
  From State 
  ORDER BY NAME;
end;