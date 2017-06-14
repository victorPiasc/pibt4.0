create or replace 
Procedure Web_GetInvoiceEmployees
( Pinvoicenbr In Varchar2,
  PEmployeeId In Varchar2,
  V_Refcur Out Sys_Refcursor
  )
As
Begin
    Open V_Refcur For
    Select 
    Invoicenbr, 
    Employeeid, 
    Name, 
    Gender, 
    Age, 
    Chargestatus, 
    Coveragetype, 
    Planname, 
    Amountdue 
    From 
    Web_Invoicedetails_V 
        WHERE ((INVOICENBR = Pinvoicenbr) AND (EMPLOYEEID = PEmployeeId));
end;