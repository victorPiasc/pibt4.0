create or replace 
Procedure Web_GetInvoiceHistByEmployee
( Pinvoicenbr In Varchar2,
  PEmployeeId in varchar2,
  V_Refcur Out Sys_Refcursor
  )
As
Begin
    Open V_Refcur For
        Select 
        Invoicenbr, 
        Employeeid, 
        Lastname, 
        FIRSTNAME, 
        Gender, 
        Birthdate, 
        Age, 
        Amounttotal 
        From Web_Invoice_V 
        WHERE (INVOICENBR = PInvoicenbr and EmployeeId=PEmployeeId);
end;