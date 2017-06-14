CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_insertEmployer(
   pCart IN NUMBER,
   pName IN VARCHAR2, 
   pAddress IN VARCHAR2,
   pCity IN VARCHAR2,
   pState IN VARCHAR2,
   pZip IN VARCHAR2,
   pMaddress IN VARCHAR2,
   pMcity IN VARCHAR2, 
   pMstate IN VARCHAR2, 
   pMzip IN VARCHAR2,
   pPhoneNbr IN VARCHAR2, 
   pFax IN VARCHAR2, 
   pContact IN VARCHAR2, 
   pCemail IN VARCHAR2,
   pTaxId IN VARCHAR2,
   pSic IN VARCHAR2,  
   pWaitingPeriodId IN VARCHAR2,
   pPartEE IN NUMBER,
   pEmployerId OUT NUMBER)
AS
   vCsrId INTEGER;
   vAgencyId INTEGER;
   vEnrollerId INTEGER;
   vTypeId INTEGER;
   vIsPc CHAR(1);
   vNbrEmployees INTEGER;
   vFirst DATE;
BEGIN
   SELECT isPC, employerId INTO  vIsPc, pEmployerId
   FROM web_qqEmployer
   WHERE cart=pCart;
   
   SELECT COUNT(*) INTO vNbrEmployees --temp employee count 
   FROM web_qqCart 
   WHERE cart=pCart AND 
      employeeTypeId=0;
   IF vIsPc='N' THEN  
      SELECT NVL(MAX(CASE WHEN stateCode='GA' THEN 4 --get agency
        WHEN stateCode<>'CA' THEN 1
        WHEN county IN('San Louis Obispo','Santa Barbara','Ventura','Los Angeles','Orange','Kern','San Bernardino',
          'Riverside','Imperial') THEN 1
        WHEN county='San Diego' THEN 3
        ELSE 2 END),1) INTO vAgencyId
      FROM newZipCode
      WHERE zipCode=pZip;
   ELSE 
      vAgencyId := 5;
   END IF;


   SELECT MAX(enrollerId) INTO vEnrollerId --get enrollerId
   FROM enrollerInfo 
   WHERE agencyId=vAgencyId AND 
      UPPER(name) LIKE '%HOUSE%';
   IF vEnrollerId IS NULL THEN 
      SELECT MAX(enrollerId) INTO vEnrollerId 
     FROM enrollerInfo
     WHERE agencyId=vAgencyId;
   END IF;
             
   SELECT NVL(MAX(csrId),382) INTO vCsrId --set csrId
   FROM csrInfo 
   WHERE active='Y' AND 
      CASE WHEN vAgencyId=4 THEN 'I' --Georgia
         WHEN vNbrEmployees >39 THEN 'U' --Major accounts
         WHEN REGEXP_LIKE(UPPER(SUBSTR(pName,1,1)), '[^[:alpha:]]') THEN 'A' --Name starts with number or symbol 
         ELSE UPPER(SUBSTR(pName,1,1)) END BETWEEN startL AND endL;
   
   vTypeId:= CASE WHEN vIsPc='Y' THEN 2 ELSE 1 END; --typeId: association-1 pc-2

   IF pEmployerId IS NULL THEN
      SELECT -employerProforma_SEQ.NEXTVAL INTO pEmployerId FROM DUAL;      
      vFirst:= CASE WHEN TRUNC(SYSDATE)=TRUNC(SYSDATE,'MM') THEN TRUNC(SYSDATE) ELSE LAST_DAY(TRUNC(SYSDATE))+1 END;  
             
      INSERT INTO EMPLOYER(employerId, name, addressOne, city, state, zip, billAddressOne,
         billCity, billState, billZip, enrollerId, csrId, termId, agencyId, 
         suppressMtlCheck, createdBy, createdDate, typeId, employerGroup, waitingPeriodId, NbrEmployees, taxId, 
         sic, mailContact, mailEmail, phoneNbr, startDate)
      VALUES(pEmployerId, pName, pMaddress, pMcity, pMstate, pMzip, pAddress, pCity, pState, 
         pZip, vEnrollerId, vCsrId, 1,  vAgencyId, 'Y', pEmployerId, 
         SYSDATE, vTypeId, pEmployerId, pWaitingPeriodId, vNbrEmployees, pTaxId, 
         pSic, pContact, pCemail, pPhoneNbr, vFirst);
      
      INSERT INTO nbrEmpHist (employerId, inYear, nbrEmployees, addressOne, city, state, zip, updatedBy, updated, pk) 
      VALUES(pEmployerId, TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')), vNbrEmployees, pAddress, pCity, pState, pZip,
         pEmployerId, SYSDATE, nbrEmpHist_SEQ.NEXTVAL);      
      
      INSERT INTO nbrEmpHistReported
      VALUES(pEmployerId, TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')), vNbrEmployees,'N', pEmployerId, SYSDATE, pPartEE, nbrEmpHistReported_seq.NEXTVAL);
   
      UPDATE web_qqEmployer
         SET employerId=pEmployerId
      WHERE cart=pCart;
      
      COMMIT;
      RETURN;
   END IF;
   
   UPDATE EMPLOYER 
   SET name = pName,
      addressOne = pMaddress,
      city = pMcity,
      state = pMstate,
      zip = pMzip,
      billAddressOne = pAddress,
      billCity = pCity,
      billState = pState,  
      billZip = pZip,
      mailContact = pContact,
      mailEmail = pCemail,
      updatedBy = pEmployerId,
      phoneNbr = pPhoneNbr,     
      updated = SYSDATE, 
      waitingPeriodId = pWaitingPeriodId,
      taxId = pTaxId, 
      sic = pSic
   WHERE employerId=pEmployerId;      
   COMMIT;
END;
/
