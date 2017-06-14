CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_ACTONRENEWALPLANS" (
   pCart     NUMBER,
   pUser     VARCHAR2,
   pEmployer NUMBER,
   pDate     DATE)
AS
BEGIN
   --Remove plans where effective date is greater than expirydate
   DELETE FROM employerPlans
   WHERE epId IN(
         SELECT ep.epId
         FROM employerPlans ep
         LEFT JOIN web_renewalPlans rp ON
            rp.cart=pCart AND
            ep.planId=rp.planId
         WHERE ep.employerId=pEmployer AND
            pDate BETWEEN NVL(ep.startDate,'01-jan-0001') AND NVL(ep.endDate,'31-Dec-9999') AND
            rp.cart IS NULL) AND
      endDate<startDate;

   -- If it appeared before, but not now, shorten existing
   UPDATE employerPlans
      SET endDate = pDate-1,
         updatedBy = pUser,
         updated = SYSDATE
      WHERE epId IN(
         SELECT ep.epId
         FROM employerPlans ep
         LEFT JOIN web_renewalPlans rp ON
            rp.cart=pCart AND
            ep.planId=rp.planId
         WHERE ep.employerId=pEmployer AND
            pDate BETWEEN NVL(ep.startDate,'01-jan-0001') AND NVL(ep.endDate,'31-Dec-9999') AND
            rp.cart IS NULL) AND
            planId NOT IN(
               SELECT planId
               FROM plans
               WHERE carrierId=0);

   -- If it appeared as terminated, and is available now, extend
   UPDATE employerPlans
      SET endDate = NULL,
         updatedBy = pUser,
         updated = SYSDATE
      WHERE epId IN(
         SELECT ep.epId
         FROM employerPlans ep
         JOIN web_renewalPlans rp ON
            rp.cart=pCart AND
            ep.planId=rp.planId
         WHERE ep.employerId=pEmployer AND
            ep.endDate=pDate-1);

   -- If it did not appear, add it to the list
   INSERT INTO employerPlans(epId,employerId,planId,enrollerId,startDate,updatedBy,updated)
      SELECT employerPlans_seq.NEXTVAL,
         pEmployer,
         rp.planId,
         e.enrollerId,
         pDate,
         pUser,
         SYSDATE
      FROM web_renewalPlans rp
      JOIN employer e ON
         e.employerId=pEmployer
      LEFT JOIN employerPlans ep ON
         pDate BETWEEN NVL(ep.startDate,'01-jan-0001') AND NVL(ep.endDate,'31-Dec-9999') AND
         rp.planId=ep.planId AND
         ep.employerId=e.employerId
      WHERE rp.cart=pCart AND
         ep.planId IS NULL;

   --Update declinations plans if they exist
   UPDATE employerPlans
   SET endDate=NULL,
      updatedBy = pUser,
      updated = SYSDATE
   WHERE rowId IN(
      SELECT DISTINCT ep.rowId
      FROM employerPlans ep
      JOIN plans p ON
         ep.planId=p.planId AND
         p.carrierId=0
      LEFT JOIN web_renewalPlans rp ON
         p.planTypeId=rp.planTypeId AND
         rp.cart=pCart
      WHERE ep.employerId=pEmployer AND
         TRUNC(SYSDATE)>NVL(ep.endDate,'31-DEC-9999') AND
         rp.planTypeId IS NOT NULL);

   --Update declinations plans that are not needed anymore
   UPDATE employerPlans
   SET endDate=pDate-1,
      updatedBy = pUser,
      updated = SYSDATE
   WHERE employerId=pEmployer AND
      planId IN (
         SELECT planId
         FROM plans
         WHERE carrierId=0 AND
            planTypeId IN (
               WITH curPt AS(
                  SELECT DISTINCT p.planTypeId
                  FROM employerPlans ep
                  JOIN plans p ON
                     ep.planId=p.planId
                  WHERE ep.employerId=pEmployer AND
                  TRUNC(SYSDATE) BETWEEN NVL(ep.startDate,'01-jan-0001') AND NVL(ep.endDate, '31-DEC-9999'))
               SELECT DISTINCT cp.planTypeId
               FROM curPt cp
               LEFT JOIN web_renewalPlans rp ON
                  rp.planTypeId=cp.planTypeId AND
                  rp.cart=pCart
               WHERE rp.planTypeId IS NULL ));

   --Add declination plans for new plantypes
   INSERT INTO employerPlans(epId,employerId,planId,enrollerId,startDate,updatedBy,updated)
      SELECT employerPlans_seq.NEXTVAL,
         pEmployer,
         p.planId,
         e.enrollerId,
         pDate,
         pUser,
         SYSDATE
      FROM plans p
      JOIN employer e ON
         e.employerId=pEmployer
      WHERE p.carrierId=0 AND
         UPPER(p.planName) LIKE '%DECLINATION%' AND
         p.planTypeId IN (
            WITH curPt AS(
               SELECT DISTINCT p.planTypeId
               FROM employerPlans ep
               JOIN plans p ON
                  ep.planId=p.planId
               WHERE ep.employerId=pEmployer AND
               TRUNC(SYSDATE) BETWEEN NVL(ep.startDate,'01-jan-0001') AND NVL(ep.endDate, '31-DEC-9999'))
            SELECT DISTINCT rp.planTypeId
            FROM web_renewalPlans rp
            LEFT JOIN curPt cp ON
               rp.planTypeId=cp.planTypeId
            WHERE rp.cart=pCart AND
            cp.planTypeId IS NULL);

   --update the employer contribution and dollar
   UPDATE employer
      SET(contribution, contributionDep, dollar, dollarDep, updatedBy, updated) =
      (  SELECT NVL(contribution,0),
            NVL(contributionDep,0),
            NVL(dollar,0),
            NVL(dollarDep,0),
            pUser,
            SYSDATE
         FROM web_qqEmployer
         WHERE cart=pCart)
      WHERE employerId=pEmployer;

   --update contributions per plan type where they match
   UPDATE employerPlanType ept
   SET(contribution, contributionDep, ofBase, basePlanId)=(
      SELECT MAX(contribution),
         MAX(contributionDep),
         NVL(MAX(ofBase),'N'),
         MAX(basePlanId)
      FROM web_qqEmployerPlanType wpt
      WHERE cart=pCart AND
         ept.planTypeId=wpt.planTypeId)
   WHERE employerId=pEmployer;

   --insert new employer plan types
   INSERT INTO employerPlanType
      SELECT pEmployer,
         wpt.planTypeId,
         wpt.contribution,
         wpt.contributionDep,
         SYSDATE,
         wpt.ofBase,
         wpt.basePlanId
      FROM web_qqEmployerPlanType wpt
      LEFT JOIN employerPlanType ept ON
         ept.employerId=pEmployer AND
         wpt.planTypeId=ept.planTypeId
      WHERE  wpt.cart=pCart AND
         ept.planTypeId IS NULL;

   UPDATE participationAgreement
   SET expiry=ADD_MONTHS(TRUNC(SYSDATE,'YY'),11)+30,
      updatedBy=pUser,
      updated=SYSDATE
   WHERE TRUNC(SYSDATE) BETWEEN effective and expiry AND 
      employerId=pEmployer;

   INSERT INTO participationAgreement
   VALUES(pEmployer, /*effective */ ADD_MONTHS(TRUNC(SYSDATE,'YY'),12),
      /*expiry*/'31-DEC-9999', pUser, SYSDATE, pa_SEQ.NEXTVAL );
   COMMIT;

END;
/
