create or replace 
PROCEDURE WEB_DELETEWEBUSERBYLOGINNAME
(
  Ploginname In Varchar2,
  pDeletedBy in varchar2
) AS
Puserid Varchar2(50);
pWebUserRoleId varchar2(1);
Begin
  Select Userid,Webuserroleid Into Puserid,Pwebuserroleid 
  From Web_Users Where Upper(Webname)=Upper(pLoginName);
  
  Delete From Web_Users
  Where Upper(Webname)=Upper(pLoginName);
  
  if pWebUserRoleId in (1,2,3) then 
  Update Users
  Set 
    Webuserroleid='',
    Updated=Sysdate,
    UpdatedBy=pDeletedBy
  Where Userid=Puserid;
  End If;
  Commit;
End;