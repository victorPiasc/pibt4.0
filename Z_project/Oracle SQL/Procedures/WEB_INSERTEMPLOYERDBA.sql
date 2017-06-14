Create Or Replace 
Procedure Web_InsertEmployerDBA
(
  Pemployerid In Varchar2,
  pDbaname In Varchar2
  )
As
varCount number(1,0);
Begin
Select Count(1) Into Varcount From Employerdba 
Where Employerid=Pemployerid And Dbaname=pDbaname;
if Varcount=0 then
INSERT INTO EMPLOYERDBA
  (EMPLOYERID, DBANAME
  ) VALUES
  (Pemployerid, pDbaname
  );
End If;
End;