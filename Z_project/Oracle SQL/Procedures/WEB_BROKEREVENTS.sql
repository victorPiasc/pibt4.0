CREATE OR REPLACE PROCEDURE web_brokerEvents(
   pBrokerId IN VARCHAR2,
   pType IN NUMBER,
   pClue IN VARCHAR2, 
   pMonths IN NUMBER,
   pStartDate IN DATE,
   pEndDate IN DATE, 
   v_refcur OUT SYS_REFCURSOR)
AS
BEGIN
   IF pType = 1 THEN 
      OPEN v_refcur FOR 
         SELECT er.employerId Id, 
            er.name name, 
            er.addressone address, 
            er.city,
            er.state, 
            er.zip zip,
            renewalDate(er.startDate) renewalDate,
            er.mailContact contact, 
            er.phoneNbr, 
            er.mailEmail email      
         FROM employer er
         JOIN brokerEmployer be ON 
            er.employerId=be.employerId AND 
            be.brokerId=pBrokerId
         WHERE er.employerId BETWEEN 1 AND 999999 AND
            (  pMonths <> 4 AND renewalDate(er.startDate) BETWEEN TRUNC(SYSDATE) AND ADD_MONTHS(TRUNC(SYSDATE),pMonths) OR 
               pMonths=4 AND renewalDate(er.startDate) BETWEEN NVL(pStartDate, '01-JAN-0001') AND NVL(pEndDate,'31-DEC-9999')) AND
            (  pClue IS NULL OR
               TO_CHAR(er.employerId)=pClue OR
               UPPER(er.name) LIKE '%'||UPPER(pClue)||'%' OR
               UPPER(er.addressone) LIKE '%'||UPPER(pClue)||'%' )
            ORDER BY 7;
   ELSE 
      OPEN v_refcur FOR 
         SELECT er.cart Id, 
            er.companyName name, 
            er.address address, 
            er.city,
            er.st state, 
            er.zip,
            renewalDate(er.dateSaved) renewalDate,
            er.cname contact, 
            er.phone phoneNbr, 
            er.email      
         FROM web_qqEmployer er 
         JOIN web_users wu ON 
            er.createdBY=wu.webName AND 
            wu.brokerId=pBrokerId
         WHERE (pMonths<>0 AND renewalDate(er.dateSaved) BETWEEN TRUNC(SYSDATE) AND ADD_MONTHS(TRUNC(SYSDATE),pMonths) OR
            pMonths=0 AND renewalDate(er.dateSaved) BETWEEN NVL(pStartDate, '01-JAN-0001') AND NVL(pEndDate,'31-DEC-9999')) AND 
            (  pClue IS NULL OR 
               TO_CHAR(er.Cart)=pClue OR 
               UPPER(er.companyName)=pClue OR 
               UPPER(er.address) LIKE '%'||UPPER(pClue)||'%')
         ORDER BY 7;               
   END IF;                                 
END;    
   