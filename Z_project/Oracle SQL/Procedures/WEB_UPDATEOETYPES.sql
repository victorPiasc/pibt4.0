
Create Or Replace 
Procedure Web_UpdateOETypes
(
pId In Varchar2,
pDescription In Varchar2,
pUsage In Varchar2
 )
As
Begin
Update Web_Oe_Types
Set   
    Usage=pUsage,
    Description=pDescription
Where  Id=pId;
 
  commit;
End;
 