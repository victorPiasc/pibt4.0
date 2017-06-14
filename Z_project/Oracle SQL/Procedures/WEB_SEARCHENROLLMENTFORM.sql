CREATE OR REPLACE PROCEDURE web_searchEnrollmentForm(  
  pEmployerId IN VARCHAR2,
  pMemberId IN VARCHAR2,
  pStatusId IN VARCHAR2,
  pDateRangeStart IN DATE,
  pDateRangeEnd IN DATE,
  pTypeId IN VARCHAR2,
  v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   OPEN v_refcur FOR
      SELECT oe.id,
         oe.employerId,
         er.name companyName,
         oe.memberId,
         m.firstName||' '||m.lastName memberName,
         oe.typeId,
         t.description typeName,
         oe.updated,
         oe.updatedBy,
         oe.updatedIp,
         oe.Status statusid,
         oe.created,
         DECODE(oe.Signatrue, 'Y','true','false') Signatrue,
         s.description status
      FROM web_oe oe
      JOIN web_oe_types t ON
         oe.typeid = t.id AND 
         t.active=1
      JOIN web_oeStatus s ON 
         oe.status=s.id
      JOIN employer er ON
         oe.employerId=er.employerId
      JOIN member m ON
         oe.memberId=m.memberId
      WHERE (oe.status=pStatusId OR pStatusId IS NULL) AND 
         (oe.typeId=pTypeId OR pTypeId IS NULL) AND
         (oe.employerId=pEmployerId OR pEmployerid IS NULL) AND
         (oe.memberId=pMemberId OR pMemberId IS NULL) AND 
         oe.updated BETWEEN NVL(pDateRangeStart,'31-dec-1900') AND NVL(pDateRangeEnd,'31-dec-9999')
    ORDER BY updated DESC;
END;
/