﻿CREATE or REPLACE 
PROCEDURE WEB_GETEMPLOYEESBYENROLLERID
(
 pEnrollerID IN VARCHAR2,
 v_refcur OUT SYS_REFCURSOR
)
AS
  BEGIN
  	   OPEN v_refcur FOR
	   SELECT 
		EnrollerId,
		Name
		FROM ENROLLERINFO

   END;