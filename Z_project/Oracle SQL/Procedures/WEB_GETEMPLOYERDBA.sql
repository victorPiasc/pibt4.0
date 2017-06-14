create or replace 
PROCEDURE WEB_GETEMPLOYERDBA
(
  pEmployerId IN VARCHAR2  
, V_Refcur Out Sys_Refcursor
) AS 
BEGIN
  Open V_Refcur For 
    Select
      rowid,
      Employerid,
      Dbaname
    From Employerdba
    Where Employerid=Pemployerid;
END;