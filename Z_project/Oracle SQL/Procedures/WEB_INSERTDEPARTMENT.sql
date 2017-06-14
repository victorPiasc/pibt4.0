
Create Or Replace 
Procedure Web_InsertDepartment
(
Pemployerid In Varchar2,
Pdeptcode In Varchar2,
pDscription In Varchar2
 )
As
Begin
Insert INTO Department
  (
    DEPTID,  
    EMPLOYERID,
    DEPTCODE,
    DESCRIPTION 
  )
  VALUES
  (
    Deptid_Seq.Nextval,
    Pemployerid,
    Pdeptcode,
    pDscription
  );
 
  commit;
End;
 