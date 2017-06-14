CREATE OR REPLACE VIEW WEB_INVOICEDETAILS_V
AS
   SELECT id.invoicenbr,
         m.employeeId,
         m.lastName || ', ' || m.firstName || ' ' || m.middleName name,
         DECODE (m.male, 'Y', 'Male', 'Female') gender,
         id.employeeAge age,
         cis.descr chargeStatus,
         ptt.type CoverageType,
            DECODE (
               id.buffer,
               NULL, '',
                  '$'
               || SUBSTR (id.buffer, 1, LENGTH (id.buffer) - 3)
               || ','
               || SUBSTR (id.buffer, -3, 3)
               || ' ')
         || DECODE (pt.plantypeid, 7, 'Medical Term Life', p.planName)
            PlanName,
         Id.Amount Amountdue,
         Id.EFFECTIVEDATE,
         m.employeetype
    FROM invoiceDetail id,
         plans p,
         MEMBER m,
         planType pt,
         changeInStatus cis,
         planTierType ptt
   WHERE     id.changeStatusId = cis.statusId
         AND id.employeeId = m.memberId
         AND id.planTierId = ptt.planTierId
         AND id.planId = p.planId
         AND p.planTypeId = pt.planTypeId
   ORDER BY id.invoicenbr,
         m.lastName,
         p.planName,
         ptt.sortSeq;