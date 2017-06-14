 
Create Or Replace 
Procedure WEB_GETERENROLLERS
(
pEemployerId in number,
v_refcur OUT SYS_REFCURSOR )
As
pAgencyid number(12,0);
Begin

Select  Agencyid Into Pagencyid  
From Employer Where Employerid=Peemployerid;

  Begin
    open v_refcur for 
    Select
    En.Enrollerid,
    En.Name
    From Enrollerinfo En
    Where En.Active='Y' and En.Agencyid = pAgencyid;
  End;
  Return;
End;