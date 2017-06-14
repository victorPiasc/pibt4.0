CREATE OR REPLACE VIEW web_searchEmployees_v
AS
   SELECT wu.id,
      v.employeeId,
      v.employerId,
      v.name,
      wu.webName loginName,
      DECODE (wu.isLockout, 1, 'true', 'false') "Islockout",
      v.gender,
      v.birthdate,
      v.hireDate,
      v.emailAddress
   FROM web_memberInfoDetails_V v
   LEFT JOIN web_users wu ON 
      v.employeeId = wu.employeeId AND 
      wu.webUserRoleId = 5
   WHERE v.employeeId = v.memberId;