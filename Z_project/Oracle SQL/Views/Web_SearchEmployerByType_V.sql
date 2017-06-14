CREATE OR REPLACE FORCE VIEW PIA_ADMIN.WEB_SEARCHEMPLOYERBYTYPE_V AS
SELECT wu.Id,
   e.employerId,
   e.name,
   wu.webName loginName,
   DECODE (wu.webName, NULL, 'false', 'true') "HasWebAccount",
   DECODE (wu.isLockout, 1, 'true', 'false') "Islockout",
   wu.lastloginIp,
   wu.lastloginTime,
   e.addressOne || CASE WHEN e.addressTwo IS NOT NULL THEN ', ' || e.addressTwo END address,
   e.city,
   e.state,
   CASE WHEN LENGTH (e.zip) = 9 THEN SUBSTR (e.zip, 1, 5) || '-' || SUBSTR (e.zip, 6) ELSE e.zip   END
   zip,
   NVL (e.endDate, '31-Dec-9999') endDate,
   e.agencyId,
   csr.csrId, 
   ei.enrollerId
FROM employer e
LEFT JOIN web_users wu ON
   e.employerId = wu.employerId AND
   wu.webUserRoleId = 4
JOIN csrInfo csr ON 
   e.csrId=csr.csrId
LEFT JOIN enrollerInfo ei ON 
   e.enrollerId=ei.enrollerId;