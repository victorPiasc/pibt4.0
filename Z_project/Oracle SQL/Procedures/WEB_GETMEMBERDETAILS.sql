CREATE OR REPLACE PROCEDURE PIA_ADMIN."WEB_GETMEMBERDETAILS" (
   pMemberId         IN  VARCHAR2,
   cur_MemberDetails OUT SYS_REFCURSOR)
IS
BEGIN

   OPEN cur_MemberDetails FOR
      SELECT m.employerId,
         m.employeeId,
         m.memberId,
         m.lastName || ', ' || m.firstName || ' ' || m.middleName fullName, -- C# should build this on its own
         m.lastName,
         m.firstName,
         m.middleName,
         m.employeeType employeeTypeId,
         DECODE(m.employeeType,0,'Employee',1,'Spouse',2,'Child','Domestic Partner') employeeType,
         m.socSecNbr,
         DECODE(m.male,'Y','Male','Female') gender,
         TO_CHAR(m.birthdate,'MM/DD/YYYY') birthdate, -- C# should be receiving dates (4 lines)
         TO_CHAR(m.marriageDate,'MM/DD/YYYY') marriageDate,
         TO_CHAR(m.hireDate,'MM/DD/YYYY') hireDate,
         m.addressOne,
         m.addressTwo,
         m.city,
         m.state,
         m.zip,
         m.homePhoneNbr,
         m.workPhoneNbr,
         m.mobilePhoneNbr,
         m.eMailAddress,
         m.deptId,
         TO_CHAR(m.adoptionDate,'MM/DD/YYYY') adoptionDate,
         m.handicapped,
         m.maritalStatusId,
         wu.webName loginName,
         wu.isLockout,
         wu.lastLoginIp,
         wu.lastloginTime,
         m.updated,
         m.updatedBy,
         wu.webUserRoleId,
         m.contribution,
         m.contributiondep,
         m.dollar,
         m.dollardep,
         m.periodsperyear,
         m.salaryPerPeriod,
   m.smoker,
   m.hoursWorked
      FROM member m
      LEFT JOIN web_users wu ON
         m.memberId=wu.memberId AND
         wu.webUserRoleId=CASE WHEN m.employeeType=0 THEN '5' ELSE '6' END
      WHERE m.memberId=pMemberId;
END;
/