create or replace 
procedure Web_GetBeneficiaryrelationship
(
  V_Refcur Out Sys_Refcursor
  )
As
Begin
Open V_Refcur  for
Select Relationshipid, Description 
From Beneficiaryrelationship Order By Description;

End;
 