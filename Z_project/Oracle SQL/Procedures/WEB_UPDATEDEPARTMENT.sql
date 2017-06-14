
Create Or Replace 
Procedure Web_UpdateDepartment
(
pDEPTID in varchar2,
Pemployerid In Varchar2,
Pdeptcode In Varchar2,
pDscription In Varchar2
 )
As
Begin
Update Department
Set   
    Employerid=Pemployerid,
    Deptcode=Pdeptcode,
    Description=Pdscription
Where  Deptid=pDEPTID;
 
  commit;
End;
 