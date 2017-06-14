Create Or Replace 
Procedure Web_UpdateEmployerDBA
(
  Prowid In Varchar2,
  Pemployerid In Varchar2,
  pDbaname In Varchar2
  )
As
varCount number(1,0);
Begin
Select Count(1) Into Varcount From Employerdba 
Where Employerid=Pemployerid And Dbaname=Pdbaname;
if Varcount=0 then
  Update Employerdba 
  Set Employerid = Pemployerid ,
      DBANAME = pDbaname 
  Where Rowid = Prowid;
End if;
End;