CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_SEARCHEMPLOYERBYTYPE" (
   pUserId       IN  VARCHAR2,
   pUserTypeId   IN  VARCHAR2,
   pSearchTypeId IN  VARCHAR2,
   pClue IN VARCHAR2,
   v_refcur      OUT SYS_REFCURSOR)
AS
   vAgencyId INTEGER;
   vCsrId INTEGER;
   vEnrollerId INTEGER;
BEGIN
   --grab Id to limit user if they are not an admin
   IF pUserTypeId IN ('1','2') THEN
      SELECT agencyId INTO vAgencyId
      FROM users
      WHERE userId=pUserId;
   ELSIF pUserTypeId='3' THEN --Rk
      SELECT csrId INTO vCsrId
      FROM csrInfo csr
      WHERE userId=pUserId;
   ELSIF pUserTypeId='8' THEN
      SELECT enrollerId INTO vEnrollerId
      FROM enrollerInfo
      WHERE userId=pUserId;
   END IF;

   IF pUserTypeID = '7' THEN --When logged in as broker
   OPEN v_refcur FOR
      SELECT wv.*
      FROM Web_SearchEmployerByType_V wv
      JOIN brokerEmployer be ON
         wv.employerID = be.employerId AND
         be.brokerId = pUserId AND
         TRUNC(SYSDATE) BETWEEN be.effective AND NVL(be.expiry, '31-DEC-9999')
      WHERE wv.employerId >=0 AND
         (  pSearchTypeId='5' AND  wv.endDate<TRUNC(SYSDATE) OR
            pSearchTypeId<>'5' AND  wv.endDate>=TRUNC(SYSDATE)) AND 
         (  pSearchTypeId='2' AND  wv.loginName IS NOT NULL OR 
            pSearchTypeId='3' AND  wv.loginName IS NULL OR 
            pSearchTypeId NOT IN ('2','3'))
      ORDER BY wv.name;                  
   ELSE
         OPEN v_refcur FOR 
            SELECT * 
            FROM Web_SearchEmployerByType_V
            WHERE employerId >=0 AND
            (  pSearchTypeId='5' AND endDate<TRUNC(SYSDATE) OR 
               pSearchTypeId<>'5' AND endDate>=TRUNC(SYSDATE)) AND 
            (  pSearchTypeId='2' AND loginName IS NOT NULL OR 
               pSearchTypeId='3' AND loginName IS NULL OR 
               pSearchTypeId NOT IN ('2','3')) AND
            (  csrId=vCsrId OR
               enrollerId=vEnrollerId OR
               pUserTypeId=1 AND vAgencyId=1 OR 
               agencyId=vAgencyId ) AND 
            (  pClue IS NULL OR
               TO_CHAR(employerId)=pClue OR
               UPPER(name) LIKE '%'||UPPER(pClue)||'%' OR
               UPPER(address) LIKE '%'||UPPER(pClue)||'%' OR
               UPPER(loginName) LIKE '%'||UPPER(pClue)||'%')
         ORDER BY name;
   END IF;
END;
/
