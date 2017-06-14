Create Or Replace 
Procedure Web_GetEnterprise
 ( 
 V_Refcur Out Sys_Refcursor
  )
As
Begin
Open V_Refcur For
Select 
Agencyid, 
Description
From Enterprise
order by agencyid;
end;