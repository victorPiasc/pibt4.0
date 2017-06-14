create or replace 
PROCEDURE WEB_DELETEWEBUSERBYID
(
  Pid In Varchar2,
  pDeletedBy in varchar2
) As
Puserid Varchar2(50);
pWebUserRoleId varchar2(1);
Begin
  Select Userid,Webuserroleid Into Puserid,pWebUserRoleId 
  From Web_Users Where Id=Pid;
  
  Delete From Web_Users
  Where Id=Pid;
 
 if pWebUserRoleId in (1,2,3) then 
  Update Users
  Set 
    Webuserroleid='',
    Updated=Sysdate,
    UpdatedBy=pDeletedBy
  Where Userid=Puserid;
  end if;
  Commit;
End;