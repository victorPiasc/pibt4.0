create or replace 
Procedure Web_GetEmployeeInvoiceDetails
(
 pEmployeeId In varchar2,
 V_Refcur Out Sys_Refcursor
 )
As
Begin
Open V_Refcur For
Select 
Name, 
Gender, 
Age, 
Chargestatus, 
Coveragetype, 
Planname, 
Amountdue, 
Employeeid 
From Web_Currentinvoicedetails_V 
WHERE (EmployeeId = pEmployeeId);
end;