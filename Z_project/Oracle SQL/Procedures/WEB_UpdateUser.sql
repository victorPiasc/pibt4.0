create or replace 
PROCEDURE WEB_UpdateUser
(
Puserid In Varchar2,
pUserName in varchar2,
Pemailaddress In Varchar2,
pUpdatedBy in varchar2)
AS
Begin
  Update Users
  Set Emailaddress=Pemailaddress, 
      Username=Pusername,
      Updated=Sysdate,
      Updatedby=pUpdatedBy
  Where Userid=pUserid;
  Commit;
End;