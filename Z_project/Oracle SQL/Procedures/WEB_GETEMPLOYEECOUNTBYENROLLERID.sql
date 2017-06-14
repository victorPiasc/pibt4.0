Create or Replace
Procedure Web_GetEmployeeCountByEnrollerId
(
   pEnrollerid In Varchar2,
   v_refcur Out sys_refcursor
)
As
 Begin
  Open v_refcur For
	select 
	  count(distinct mp.employeeId )
	from
	   employer er,
	   memberplan mp
	where
	  sysdate between er.startdate and nvl(enddate,'31-dec-9999') and
	  sysdate between mp.effectivedate and nvl(expirydate,'31-dec-9999') and
	  mp.employerId = er.employerId and
	  mp.employeeId = mp.memberId and  -- get employee account only
	  er.enrollerid = pEnrollerid;
End;
