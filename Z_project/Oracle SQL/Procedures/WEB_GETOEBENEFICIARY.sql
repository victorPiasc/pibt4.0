CREATE OR REPLACE PROCEDURE PIA_ADMIN.WEB_GETOEBENEFICIARY(
  pMemberId IN VARCHAR2,
  pPlanTypeId IN NUMBER,
  v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR     
      SELECT b.ROWID rId,
         b.memberid,
         b.planTypeId,
         p.description planTypeName,
         b.firstName,
         b.middleInitial,
         b.lastName,
         b.address,
         b.city,
         b.state,
         b.zip,
         b.percentage,
         b.socSecNbr,
         b.updated,
         b.updatedBy,
         b.relationshipId
      FROM beneficiaries b 
      JOIN plantype p ON
         b.planTypeId=p.planTypeId
      WHERE b.memberId=pMemberId AND 
         b.planTypeId=pPlanTypeId
      ORDER BY b.planTypeId,b.lastName, b.firstName, b.middleInitial;
END;
/
