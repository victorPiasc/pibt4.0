CREATE OR REPLACE PROCEDURE web_insertBrokerEmployer(
   pBrokerId IN VARCHAR2,
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
   pEmployerId IN OUT NUMBER)
AS
   vCsrId INTEGER;
   vFirst DATE;   
BEGIN 

   SELECT NVL(MAX(csrId),382) INTO vCsrId --set csrId
      FROM csrInfo 
      WHERE active='Y' AND 
         CASE WHEN REGEXP_LIKE(UPPER(SUBSTR(pName,1,1)), '[^[:alpha:]]') THEN 'A' --Name starts with number or symbol 
            ELSE UPPER(SUBSTR(pName,1,1)) END BETWEEN startL AND endL;
            
   IF pEmployerId IS NULL THEN
      SELECT -employerProforma_SEQ.NEXTVAL INTO pEmployerId FROM DUAL;      
      vFirst:= CASE WHEN TRUNC(SYSDATE)=TRUNC(SYSDATE,'MM') THEN TRUNC(SYSDATE) ELSE LAST_DAY(TRUNC(SYSDATE))+1 END;  
             
      INSERT INTO EMPLOYER(employerId, name, addressOne, city, state, zip, billAddressOne,
         billCity, billState, billZip, csrId, termId, agencyId, 
         suppressMtlCheck, createdBy, createdDate, typeId, employerGroup, waitingPeriodId, NbrEmployees, taxId, 
         sic, mailContact, mailEmail, phoneNbr, startDate)
      VALUES(pEmployerId, pName, pMaddress, pMcity, pMstate, pMzip, pAddress, pCity, pState, 
         pZip, vCsrId, 1,  5, 'Y', pEmployerId, SYSDATE, 2, pEmployerId, pWaitingPeriodId, 0, pTaxId, 
         pSic, pContact, pCemail, pPhoneNbr, vFirst);
      
      INSERT INTO nbrEmpHist (employerId, inYear, nbrEmployees, addressOne, city, state, zip, updatedBy, updated, pk) 
      VALUES(pEmployerId, TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')), 0, pAddress, pCity, pState, pZip,
         pEmployerId, SYSDATE, nbrEmpHist_SEQ.NEXTVAL);      
      
      INSERT INTO nbrEmpHistReported
      VALUES(pEmployerId, TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')), 0,'N', pEmployerId, SYSDATE, pPartEE, nbrEmpHistReported_seq.NEXTVAL);
      
      INSERT INTO brokerEmployer(brokerEmployerId, brokerId, employerId, effective)
         VALUES(brokerEmployer_seq.NEXTVAL, pBrokerId, pEmployerId, vFirst);      
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