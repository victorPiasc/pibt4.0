
  CREATE OR REPLACE FORCE VIEW WEB_INVOICE_V
  AS
  SELECT
   id.invoiceNbr,
   m.employeeId,
   max(m.lastName ) lastname,
   max(m.firstName ) firstname,
   max(DECODE(m.male, 'Y','Male', 'Female')) gender,
   MAX(TO_CHAR(m.birthdate,'MM/DD/YYYY')) birthdate,
   max(id.employeeAge) age,
   sum(id.amount) amountTotal
FROM
   invoiceDetail id,
   plans p,
   member m,
   planType pt,
   changeInStatus cis
WHERE
   id.changeStatusId=cis.statusId AND
   id.employeeId=m.memberId AND
   id.planId=p.planId AND
   p.planTypeId=pt.planTypeId
GROUP BY
  id.invoiceNbr,
  m.employeeId
ORDER BY lastName, firstName