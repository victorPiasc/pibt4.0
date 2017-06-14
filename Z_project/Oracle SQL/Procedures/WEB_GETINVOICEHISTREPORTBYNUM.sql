Create Or Replace 
Procedure Web_GetInvoiceHistReportByNum
( Pinvoicenbr In Varchar2,
  V_Refcur Out Sys_Refcursor
  )
As
Begin
 Open V_Refcur For
      Select 
      Invoicenbr, 
      Employeeid,
      Case When Employeetype=0 Then Name
      else '' end Name, 
      Gender, 
      Age, 
      Chargestatus, 
      Coveragetype, 
      Planname, 
      Amountdue,
      Effectivedate
      From Web_Invoicedetails_V 
      Where Invoicenbr = Pinvoicenbr
      order by Name;
end;