create or replace 
Procedure Web_GetInvoiceHistOtherCharges
( PInvoicenbr In Varchar2,
  V_Refcur Out Sys_Refcursor
  )
As
Begin
    Open V_Refcur For
        Select 
        Invoicenbr, 
        Description, 
        Chargeamount 
        From Archarges 
        WHERE (INVOICENBR = PInvoicenbr);
end;