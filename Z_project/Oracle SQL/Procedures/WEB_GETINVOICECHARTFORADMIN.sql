create or replace 
Procedure Web_GetinvoicechartForAdmin
 (
 Pagencyid In Varchar2,
 Pcobramember  In Varchar2,
 Pplantypeid In Varchar2,
 Pmonths In Varchar2,
 V_Refcur Out Sys_Refcursor
  )
As
Begin
Open V_Refcur for
 Select 
   to_char(H.Invoicedate,'mm/dd/yyyy') Invoicedate,
   Pt.Description Ptypename,
   H.Amount,
   Id.Employeeid
FROM 
   invoiceDetail id,
   plans p,
   Member M,
   (Select Plantypeid,Description From Plantype
   Where (plantypeid=pPlanTypeId or pPlanTypeId='0')) Pt,
   (Select Invoicenbr,Invoicedate,Amount From Invoiceheader 
   Where (Invoicedate Between Add_Months(Sysdate,0-Pmonths) And Sysdate)) H,
   (Select Employerid From Employer
   Where ( Agencyid=Pagencyid Or Pagencyid='0')
   And ((Pcobramember='True' and Employerid>1000000) or Pcobramember='False')) er
Where  
   H.Invoicenbr=Id.Invoicenbr 
   And Id.Employeeid=M.Memberid
   And M.Employerid=Er.Employerid
   And Id.Planid=P.Planid
   And P.Plantypeid=Pt.Plantypeid 
--Group By 
 --  H.Invoicedate,
   --Pt.Description,
   --H.Amount
ORDER BY
  H.Invoicedate;
end;