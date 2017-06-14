create or replace 
Procedure WEB_GetMemberratetypes
(
  V_Refcur Out Sys_Refcursor
  )
As
Begin
    Open V_Refcur For
      Select 
      Ratetype, 
      DESCRIPTION
      From Memberratetype 
      ORDER BY RATETYPE;
end;