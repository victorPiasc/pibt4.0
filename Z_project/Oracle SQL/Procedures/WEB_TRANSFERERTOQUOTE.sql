CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_TRANSFERERTOQUOTE" (
   pCartId     NUMBER,
   pEmployerId VARCHAR2)
AS
   vNbrEmployees INTEGER;
   vRenewalDate DATE;
BEGIN
   SELECT nbrEmployees INTO vNbrEmployees
   FROM employer
   WHERE employerid = pEmployerId;

   web_OE_Enddate(pEmployerId, vRenewalDate);

   DELETE FROM web_qqEmployer WHERE cart=pCartId;
   DELETE FROM web_qqCart WHERE cart=pCartId;
   DELETE FROM web_renewalPlans WHERE cart=pCartId;
   DELETE FROM web_qqEmployerPlanType WHERE cart=pCartId;
   COMMIT;

   INSERT INTO web_qqEmployer (cart, companyname, address, city, st, zip, fax, cname, phone, email, isPc, contribution, contributionDep,
      dollar, dollarDep, nbrEmployees, ofBase)
      SELECT pCartId,
         name,
         addressone || ' ' || addresstwo,
         city,
         state,
         billZip,
         faxnbr,
         billcontact,
         phonenbr,
         billemail,
         CASE WHEN agencyId = 5 THEN 'Y' ELSE 'N'END,
         contribution,
         contributionDep,
         dollar,
         dollarDep,
         nbrEmployees,
         ofBase
      FROM employer
      WHERE employerid = pEmployerId;

   INSERT INTO web_qqCart
      SELECT m.lastname || ', ' || m.firstname,
         m.employeetype,
         DECODE(m.employeeType, 0, 'Employee', 2, 'Child', 'Spouse/Domestic Partner'),
         m.male,
         m.birthDate,
         SYSDATE,
         m.contribution,
         m.dollar,
         m.periodsPerYear,
         m.salaryPerPeriod,
         m.employeeId,
         m.contributionDep,
         m.dollarDep,
         null,--I figured it would be easier to add a null instead of listing values (memberId),
         m.employeeId,
         CASE WHEN p.planTypeId=6 THEN mp.insuranceAmount END,
         CASE WHEN p.planTypeId=7 THEN mp.insuranceAmount END,
         p.planTypeId,
       pCartId
      FROM member m
      JOIN memberPlan mp ON
         m.memberId = mp.memberId AND
         TRUNC(vRenewalDate) <= NVL(mp.expiryDate, '31-DEC-9999')
      JOIN plans p ON
         mp.planId=p.planId
      WHERE m.employerid = pEmployerId;

   INSERT INTO web_qqCart
      SELECT MAX(m.lastname || ', ' || m.firstname),
         MAX(m.employeetype),
         DECODE(MAX(m.employeeType), 0, 'Employee', 2, 'Child', 'Spouse/Domestic Partner'),
         MAX(m.male),
         MAX(m.birthDate),
         SYSDATE,
         MAX(m.contribution),
         MAX(m.dollar),
         MAX(m.periodsPerYear),
         MAX(m.salaryPerPeriod),
         MAX(m.employeeId),
         MAX(m.contributionDep),
         MAX(m.dollarDep),
         NULL,--I figured it would be easier to add a null instead of listing values (memberId),
         MAX(m.employeeId),
         MAX(CASE WHEN p.planTypeId=6 THEN mp.insuranceAmount END),
         MAX(CASE WHEN p.planTypeId=7 THEN mp.insuranceAmount END),
         pt.planTypeId,
       pCartId
      FROM planType pt
      LEFT JOIN web_qqCart wc ON
         pt.planTypeId=wc.planTypeId AND
         wc.cart=pCartId
      JOIN member m ON
         m.employerId=pEmployerId
      JOIN memberPlan mp ON
         m.memberId = mp.memberId AND
         TRUNC(vRenewalDate) <= NVL(mp.expiryDate, '31-DEC-9999')
      JOIN plans p ON
         mp.planId=p.planId
      WHERE wc.planTypeId IS NULL
      GROUP BY m.memberId,pt.planTypeId;

   INSERT INTO web_renewalPlans
      SELECT COALESCE(t50.newPlan,ft.newPlan, i.planId),
         p.planTypeId,
       pCartId
      FROM employerPlans i
      LEFT JOIN futureTransfers50_100 t50 ON
         i.planId=t50.oldPlan AND
         vNbrEmployees BETWEEN 50 AND 99
      LEFT JOIN futureTransfer ft ON
         i.planId=ft.oldPlan
      JOIN plans p ON
         p.planId=i.planId
      WHERE employerId=pEmployerId AND
         TRUNC(SYSDATE) BETWEEN NVL(i.startDate,'01-JAN-0001') AND NVL(i.endDate,'31-dec-9999') AND
         p.carrierId>0;
   COMMIT;
END;
/
