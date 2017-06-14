
  CREATE OR REPLACE FORCE VIEW WEB_CURRENTINVOICEDETAILS_V 
  AS
  SELECT 
   cin.employerId,
   m.employeeId,
   m.lastName || ', ' || m.firstName || ' ' || m.middleName name,
   DECODE(m.male, 'Y','Male', 'Female') gender,
   id.employeeAge age,
   cis.descr chargeStatus,
   ptt.webDescription CoverageType,
   DECODE(id.buffer,NULL,'','$'||substr(id.buffer,1,(length(id.buffer)-3))||','||substr(id.buffer,-3,3)||' ')||
   Decode(Pt.Plantypeid,7,'Medical Term Life', P.Planname) Planname,
   Id.Amount Amountdue,
   m.MemberId,
   ptt.sortSeq
FROM 
   invoiceDetail id,
   plans p,
   member m,
   planType pt,
   changeInStatus cis,
   planTierType ptt,
   web_currentInvoiceNbr_v cin
WHERE 
   id.invoiceNbr=cin.invoiceNbr AND
   id.changeStatusId=cis.statusId AND
   id.employeeId=m.memberId AND
    id.planTierId=ptt.planTierId AND
   id.planId=p.planId AND
   p.planTypeId=pt.planTypeId
ORDER BY
  p.planName,ptt.sortSeq;
 
