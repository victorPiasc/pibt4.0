CREATE OR REPLACE PROCEDURE web_getEEActivePlansByPlanId(  
   pMemberId IN VARCHAR2,
   pPlanId IN VARCHAR2,
   v_refcur OUT SYS_REFCURSOR)
AS
   vAgencyId INTEGER;
   vPlanTypeId INTEGER;
   vEmployeeType INTEGER;
BEGIN
    SELECT agencyId,
           plantypeId,
           employeeType
        INTO vAgencyId, vPlanTypeId, vEmployeeType
        FROM web_term_plans_v
        WHERE LAST_DAY(SYSDATE)<expiryDate AND
            memberId=pMemberID AND
            planId=pPlanID;

    CASE WHEN vEmployeeType=0 AND vAgencyId=2 AND vPlanTypeId=1 THEN
            OPEN v_refcur FOR
                SELECT firstName,
                    employeeTypeText employeeType,
                    description,
                    planName,
                    memberPlanId
                FROM web_term_plans_v
                WHERE TRUNC(SYSDATE)<=NVL(expiryDate,'31-DEC-9999') AND
                    planTypeId IN(1,7,10) AND
                    employeeId=pMemberID;
         WHEN vEmployeeType=0 THEN
            OPEN v_refcur FOR
                SELECT firstName,
                    employeeTypeText employeeType,
                    description,
                    planName,
                    memberPlanId
                FROM web_term_plans_v
                WHERE TRUNC(SYSDATE)<=NVL(expirydate,'31-DEC-9999') AND
                     employeeId=pMemberID AND
                     planId=pPlanID;
         ELSE
            OPEN v_refcur FOR
                SELECT firstName,
                    employeeTypeText employeeType,
                    description,
                    planName,
                    memberPlanId
                FROM web_term_plans_v
                WHERE TRUNC(SYSDATE)<=NVL(expirydate,'31-DEC-9999') AND
                     memberId=pMemberID and
                     planId=pPlanID;
    END CASE;
END;
/
