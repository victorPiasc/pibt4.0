CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_deleteEnrollerFormPlans (
   pOeId IN VARCHAR2,
   pPlanId IN VARCHAR2 )
AS
   vPlanTypeId INTEGER;
   vAgencyId INTEGER;
BEGIN

   SELECT planTypeId INTO vPlanTypeId FROM plans WHERE planId=pPlanId;

   SELECT er.agencyID INTO vAgencyId
   FROM web_oe wo
   JOIN employer er ON
      wo.employerId=er.employerId
   WHERE wo.id=pOeId;

   /* Delete all records with same plantype.
   * Removes all plans that are being terminated on from as well 
   */
   DELETE FROM web_enrollerFormPlans 
   WHERE ROWID IN (
      SELECT efp.ROWID 
      FROM web_enrollerFormPlans efp 
      JOIN plans p ON 
         efp.planId=p.planId
      WHERE efp.oeId =pOeId AND 
         (p.planTypeId=vPlanTypeId OR 
            vPlanTypeId=1 AND vAgencyId=2 AND p.planTypeId=7));
   COMMIT;
END;
/
