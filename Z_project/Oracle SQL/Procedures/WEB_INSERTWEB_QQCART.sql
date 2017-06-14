CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_INSERTWEB_QQCART" (
   pCartid          NUMBER,
   pEmployeename    VARCHAR2,
   pEmployeetypeid  NUMBER,
   pEmployeetype    VARCHAR2,
   pMale            CHAR,
   pBirthdate       DATE,
   pFamilyId        VARCHAR2,
   pContribution    NUMBER,
   pContributionDep NUMBER,
   pPeriod          NUMBER,
   pSalary          NUMBER)
AS
BEGIN
   FOR i IN 0..11 LOOP
      INSERT INTO WEB_QQCart(CART, EMPLOYEENAME, EMPLOYEETYPEID, EMPLOYEETYPE, MALE, BIRTHDATE, CREATEDDATE, FAMILYID, CONTRIBUTION, CONTRIBUTIONDEP, PERIODSPERYEAR,
           SALARYPERPERIOD, planTypeId)
         VALUES(pCartid,pEmployeename,pEmployeetypeid,pEmployeetype,pMale,pBirthdate,SYSDATE,pFamilyId,pContribution,pContributionDep,pPeriod,pSalary, i);
   END LOOP;
   COMMIT;
END;
/
