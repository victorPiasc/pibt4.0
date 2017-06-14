create or replace 
PROCEDURE WEB_LockWebUser
(
  Ploginname In Varchar2,
  pLockout in varchar2,
  pUpdatedBy in varchar2
) As 
Begin
  Update Web_Users 
  Set 
    Islockout = Plockout, 
    Updatedby=Pupdatedby,
    Updated=Sysdate
  where webname=ploginname;
End;