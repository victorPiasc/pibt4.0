CREATE OR REPLACE PROCEDURE PIA_ADMIN.web_hasValidTime(
   pUserRole IN NUMBER, 
   pUserName IN VARCHAR2, 
   pCount OUT NUMBER)
AS
BEGIN
   CASE WHEN pUserRole=4 THEN--employer
         SELECT COUNT(0) INTO pCount
         FROM web_users w
         JOIN employer er ON
            w.employerId=er.employerId
         WHERE w.webname=pUserName AND 
            TRUNC(SYSDATE)<=NVL(er.endDate, '31-DEC-9999');
      WHEN pUserRole=5 OR pUserRole=6 THEN--employee or dependent
         SELECT COUNT(0) INTO pCount
         FROM web_users w
         JOIN member m ON 
            m.memberId=w.memberId
         JOIN employer er ON 
            m.employerId=er.employerId AND
            TRUNC(SYSDATE)<=NVL(er.endDate, '31-DEC-9999')
         LEFT JOIN memberPlanNoBogus mp ON
            m.memberId=mp.memberId AND 
            TRUNC(SYSDATE)<=NVL(mp.expiryDate, '31-DEC-9999')
         WHERE w.webName=pUserName AND 
            (  mp.memberId IS NOT NULL OR 
               m.employeeType=0 AND TRUNC(SYSDATE)-m.hireDate<=30 OR 
               m.employeeType=1 AND TRUNC(SYSDATE)-m.marriageDate<=30 OR 
               m.employeeType=2 AND TRUNC(SYSDATE)-m.birthDate<=30);--Stephanie:new domestic partners can not log in until proof of registration
      WHEN pUserRole=7 THEN--Broker
         SELECT COUNT(0) INTO pCount
         FROM web_users w
         JOIN broker b ON
            w.brokerId=b.brokerId
         WHERE w.webname=pUserName AND 
            TRUNC(SYSDATE)<=NVL(b.eoExpiry,'31-DEC-9999');
      ELSE--RK,AGENT,ADMIN
         pCount:=1;
   END CASE;
END;
/
